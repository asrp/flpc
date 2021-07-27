import sys
from pymetaterp.boot_compiled import match, Node
from pymetaterp import python_compiled
from pymetaterp.util import simple_wrap_tree
from pymetaterp import boot_tree, boot_grammar
from pdb import set_trace as bp
import argparse

grammar = open("grammar/flpc.grammar").read()
grammar += r"""
SAME_INDENT = hspaces:s ?(self.indentation[-1] == (len(s) if s != None else 0))
INDENT = ~~(NEWLINE hspaces:s) !(self.indentation.append(len(s) if s != None else 0))
DEDENT = !(self.indentation.pop())
"""

def parse(source):
    return python_compiled.match(lang_tree, source)

def to_list(value):
    return value if isinstance(value, list) else\
           [] if value is None else\
           [value]

# multi_block_call = (block_call["if"] block_call["else"] | block_call[expr])*
def simplify(root):
    if not hasattr(root, "name"):
        return root
    elif root.name in ["func_call", "block_call"]:
        output = Node(root[0][0], simplify(root[1]))
    elif root.name == "infix":
        output = root[0]
        for i in range(2, len(root), 2):
            output = Node(root[i-1][0], [simplify(output), simplify(root[i])])
            output.pos = root[i].pos
    elif root.name == "multi_block_call":
        children = [simplify(child) for child in root]
        # transition = [("if", "else")]
        transition = [("if", "else"), ("if", "elif"), ("elif", "elif"), ("elif", "else")]
        # Everything not listed above is a single block.
        prev = group = None
        groups = []
        for child in children:
            # print prev, child.name, (prev, child.name) in transition
            if (prev, child.name) in transition:
                group.append(child)
            else:
                if group:
                    groups.append(group)
                group = [child]
            prev = child.name
        groups.append(group)
        out = []
        for group in groups:
            name = "-".join([child.name for child in group])
            # Ugly hack!
            if "-elif" in name:
                name = "multi-if"
            out.append(Node(name, [gc for child in group for gc in child]))
            out[-1].pos = (group[0].pos[0], group[-1].pos[-1])
        if len(out) > 1:
            output = Node("suite", out)
        else:
            output = out[0]
    elif root.name in ["suite"] and len(root) == 1:
        output = simplify(root[0])
    elif root.name in ["suite"]:
        output = Node(root.name, [simplify(child) for child in root
                                  if type(child) != Node or child.name != "EMPTY_LINE"])
    elif len(root) == 1 and type(root[0]) == Node and root[0].name == "exprs":
        assert(root.name == "parameters")
        return [simplify(child) for child in to_list(root[0].children)]
    elif root.name == "parameters":
        return [simplify(child) for child in to_list(root.children)]
    else:
        output = Node(root.name, [simplify(child) for child in root])
    output.pos = root.pos
    return output

class FList(list):
    def __init__(self, lst, pos=None):
        list.__init__(self, lst)
        self.pos = pos

class FQuote(list):
    def __init__(self, lst, pos=None):
        list.__init__(self, lst)
        self.pos = pos

class FComment:
    def __init__(self, value, pos=None):
        self.value = tuple(value)
        self.pos = pos
    def __repr__(self):
        return repr(self.value)
    def __nonzero__(self):
        return bool(self.value)

class FCall:
    def __init__(self, s, pos=None):
        self.str = s
        self.pos = pos
    def __repr__(self):
        return self.str

class FStr:
    def __init__(self, s, pos=None):
        assert(type(s) == str)
        self.str = s
        self.pos = pos
    def __str__(self):
        return self.str
    def __repr__(self):
        return repr(self.str)

def flatten(lst):
    for elem in lst:
        if isinstance(elem, FList):
            for subelem in elem:
                yield subelem
        else:
            yield elem

def escape_str(s):
    return s.replace(" ", "\\_")

def to_forth(root):
    if not isinstance(root, Node):
        bp() # Shouldn't happen anymore either
        return root
    if root.name == "suite":
        return FList([to_forth(child) for child in root], root.pos)
    elif root.name == "quote":
        return FQuote(list(flatten(to_forth(child) for child in root)), root.pos)
    elif root.name == "simple_quote":
        assert(len(root) == 1 and root[0].name == "names")
        children = list(flatten(to_forth(child) for child in root))
        return FComment(children[:-1], root.pos)
    elif root.name == "variable":
        return FList([FCall("pick:", root.pos), to_forth(root[0])], root.pos)
    elif root.name == "NAME":
        return FStr(root[0], pos=root.pos)
    elif root.name == "name_quote":
        return FList([FCall("check:", root.pos), to_forth(root[0])], root.pos)
    elif root.name == "STRING":
        return FList([FCall("push:", root.pos), FStr(escape_str(root[0]), pos=root.pos)], root.pos)
    elif root.name == "NUMBER":
        if 0 <= int(root[0]) < 3:
            return FStr(root[0], pos=root.pos)
        return FList([FCall("pushi:", root.pos), FStr(root[0], pos=root.pos)], root.pos)
    elif root.name == "forth_line":
        return FList([FCall(child[0], child.pos) for child in root], root.pos)
    elif root.name == "forth":
        return FList([to_forth(child) for child in root], root.pos)
    elif root.name == "assign":
        output = to_forth(root[1])
        if not isinstance(output, FList):
            output = FList([output], pos=root[1].pos)
        output.append(FList([n for child in reversed(root[0])
                             for n in [FCall("assign:", child.pos),
                                       to_forth(child)]], root[0].pos))
        return output
    elif root.name in ["fun", "inline", "local_fun", "fast_fun"]:
        children = list(flatten(to_forth(child) for child in root))
        assert(len(children) == 2)
        names = children[0].value if root[0].name == "simple_quote"\
                else children[0][1::2]
        if root.name == "fun":
            if len(names) < 4:
                decl = FList([FCall("newfunc%s" % len(names), root[0].pos)])
            else:
                decl = FList([FCall("pushi:", root[0].pos),
                              FCall(str(len(names)), root[0].pos),
                              FCall("newfunc", root[0].pos)])
        elif root.name == "local_fun":
            decl = FList([FCall("pushi:", root[0].pos),
                          FCall(str(len(names)), root[0].pos),
                          FCall("remove_top_names", root[0].pos)])
        else: # inline, fast_fun
            decl = FList([], root[0].pos)
        if root.name != "fast_fun":
            for name in reversed(names):
                decl.append(FCall("assign:", root[0].pos))
                decl.append(name)
        # Could instead replace children[0]?
        output = FQuote([decl, FList(children[1])], root.pos)
        if root.name == "fun": # and children[0]:
            # Doesn't work properly now that we want to preserve lines!
            # Trying to use flatten but not sure its always right.
            if str(list(flatten(output[1]))[-1]) not in ["return", "lookup_error"]:
                output[1].append(FCall("return_no_value",
                                         pos=(output[1][-1].pos[1],
                                              output[1][-1].pos[1])))
        return output
    elif root.name == "bind":
        output = to_forth(root[1])
        if not isinstance(output, FList):
            output = FList([output], pos=root[1].pos)
        output.append(FCall("bind:", root.pos))
        output.append(to_forth(root[0][0]))
        return output
    elif root.name == "comment":
        children = list(flatten(FStr(child, pos=root.pos) for child in root))
        return FComment(children, root.pos)
    elif root.name == ".": # getattr
        if root[1].name == "variable":
            children = [to_forth(root[0]),
                        FCall("attr:", root.pos),
                        to_forth(root[1][0])]
        else:
            children = [to_forth(child) for child in root[1]] +\
                       [to_forth(root[0]),
                        FCall("attr_call:", root.pos),
                        FStr(escape_str(root[1].name), root.pos)]
        return FList(list(flatten(children)), root.pos)
    elif root.name == "infix":
        bp() # Shouldn't happen anymore
        children = list(flatten(to_forth(child) for child in [root[0], root[2]]))
        return FList(children + [FCall(root[1][0], root[1].pos)], root.pos)
    elif root.name == "return":
        pass
    elif root.name == "multi-if":
        # Should quote conditions
        # Need to handle else clause
        # children = list(flatten(to_forth(child) for child in reversed(root)))
        def wrap(i, child):
            return Node("quote", child, child.pos) if i % 2 else child
        children = list(flatten(to_forth(wrap(i, child))
                        for i, child in enumerate(reversed(root))))
        return FList(children + [FCall("pushi:", root.pos),
                                 FStr(str(len(root)/2), pos=root.pos),
                                 FCall(root.name, root.pos)], root.pos)
    elif root.name in ["grammar", "exprsp"]:
        children = list(flatten(to_forth(child) for child in root))
        return FList(children)
    children = list(flatten(to_forth(child) for child in root))
    return FList(children + [FCall(root.name, root.pos)], root.pos)

def write_sep(value, pos=None):
    global output_stream_pos
    if value != "\n":
        start = output_stream_pos
        if g.last_value == "\n" and value not in ["return_no_value", "]"]:
            output_stream.write("\n")
            output_stream.write(" " * (g.nesting))
            output_stream_pos += len("\n" + " " * g.nesting)
        #if str(value) == "bp":
        #    bp()
        output_stream.write("%s " % value)
        output_stream_pos += len("%s " % value)
        if pos:
            pos_map[(start, output_stream_pos)] = (filename,) + tuple(pos)
    g.last_value = value

escaped = {repr(x)[1:-1]:x for x in "\t\n\r\\"} #\'\"
escaped.update({"\\s": " ", "\(": "(", "\)": ")"})

def write_string_body(root, depth):
    if isinstance(root, FList):
        g.nesting += 1
        for child in root:
            write_string_body(child, depth)
        g.nesting -= 1
        write_sep("\n", pos=root.pos)
    elif isinstance(root, FQuote):
        write_sep("pushf:", pos=root.pos)
        write_sep(root.func_name, pos=root.pos)
    elif isinstance(root, FCall):
        if str(root) in ["return", "return_two"]:
            write_sep("func_%s" % root, pos=root.pos)
        else:
            write_sep(str(root), pos=root.pos)
    elif isinstance(root, FStr):
        write_sep(root.str, pos=root.pos)
    elif isinstance(root, FComment):
        pass
    elif root is None:
        pass
    else:
        bp()

def write_blocks(root, depth=1, nesting=0):
    # Bad!! And almost unused since reset by write_string_body
    g.nesting = nesting
    if isinstance(root, (FList, FQuote)):
        for child in root:
            write_blocks(child, depth + isinstance(child, FQuote), nesting + 1)
        g.nesting = nesting
        write_sep("\n")
    if isinstance(root, FQuote):
        if not hasattr(root, "func_name"):
            root.func_name = "autogen%s" % g.func_count
            g.func_count += 1
        g.nesting = 0
        write_sep("[", pos=root.pos)
        g.nesting = 1
        for child in root:
            write_string_body(child, depth)
        write_sep("]", pos=root.pos)
        g.nesting = nesting
        if root.func_name.startswith("autogen"):
            [write_sep(c, pos=root.pos) for c in ["bind:", root.func_name, "\n"]]

def write_suite(root, prefix="", ns=False):
    for child in root:
        if isinstance(child, FComment):
            continue
        if isinstance(child, FList) and len(child) > 1 and str(child[-2]) == "bind:":
            if str(child[-3]) == "class":
                # Skip FQuote to avoid writing a function
                write_suite(list(child[-4]), "%s." % child[-1])
            elif str(child[-3]) == "ns_class":
                # Wrong place. Should be added before write_*
                for token in ["pushi:", "100", "hashtable", "bind:", "current_ns"]:
                    write_sep(token, root.pos)
                write_sep("\n")
                write_suite(list(child[-4]), ns=True)
                # Wrong place. Should be added before write_*
                for token in ["push:", child[-1], "new_ns_class"]:
                    write_sep(token, root.pos)
                write_sep("\n")
            else:
                body = child[0] if len(child) == 3 else child[1]
                if isinstance(body, (FStr, FCall)):
                    # Also need non-string version
                    write_string_body(child, 0)
                    write_sep("\n")
                    continue
                # assert(len(child) == 4 or len(child) == 5 and str(child[-3]) in ["inline", "func"])
                assert(len(child) == 3)
                body.func_name = (prefix + child[-1].str).replace("_colon", ":")
                write_blocks(body)
                if ns:
                    write_sep("ns_bind:", body.pos)
                elif body.func_name not in g.written:
                    g.written.append(body.func_name)
                    write_sep("bind:", body.pos)
                else:
                    write_sep("rebind:", body.pos)
                write_sep(body.func_name)
                write_sep("\n")
        elif isinstance(child, FList):
            g.nesting = 0
            write_string_body(child, 0)
            write_sep("\n")
        else:
            import pdb; pdb.set_trace()

class Global(object):
    pass

g = Global()
            
if __name__ == "__main__":
    time_log = open("time.log", "w")
    output_stream_pos = 0
    pos_map = {}
    g.func_count = 0
    g.last_value = ""
    g.nesting = 0
    g.written = []
    t1 = list(simple_wrap_tree(boot_tree.tree))
    t2 = match(t1, boot_grammar.bootstrap + boot_grammar.extra + boot_grammar.diff)
    lang_tree = match(t2, grammar + boot_grammar.extra)

    parser = argparse.ArgumentParser()
    parser.add_argument('inputs', nargs='*')
    parser.add_argument('-o', '--output')
    args = parser.parse_args()
    output_stream = open(args.output, "w") if args.output else sys.stdout
    pos_map_filename = args.output + ".pos_map" if args.output else "pos_map.txt"

    header = "push: Generated_from_" + "_".join(sys.argv[1:]) + " print"
    output_stream.write(header + "\n")
    output_stream_pos += len(header)
    import time
    start_time = time.time()
    for filename in args.inputs:
        # g.filename = filename
        parsed = parse(open(filename).read())
        if python_compiled.g.input.position+1 != len(python_compiled.g.input.source):
            inp = python_compiled.g.input
            sys.stderr.write("Warning: %s stopped parsing at character %s: %s\n" %
                             (filename, inp.position, inp.source[inp.position: inp.position + 100]))
        time_log.write(str((filename, "parse", time.time() - start_time)) + "\n")
        write_suite(to_forth(simplify(parsed)))
        time_log.write(str((filename, "all", time.time() - start_time)) + "\n")
    open(pos_map_filename, "w").write("%s %s\n" % (len(sys.argv[1:]), " ".join(sys.argv[1:])) +\
                                   # "%s\n" % len(pos_map) +\
        "\n".join(" ".join(map(str, (key[0],) + pos_map[key]))
                  for key in sorted(pos_map.keys())))

