import sys
from pymetaterp.boot_compiled import match, Node
from pymetaterp import python_compiled
from pymetaterp.util import simple_wrap_tree
from pymetaterp import boot_tree, boot_grammar
from pdb import set_trace as bp

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
        output.pos = root[0].pos
        for i in range(2, len(root), 2):
            output = Node(root[i-1][0], [simplify(output), simplify(root[i])])
            output.pos = root[i].pos
    elif root.name == "multi_block_call":
        children = [simplify(child) for child in root]
        transition = [("if", "else")] #, ("if", "elif"), ("elif", "else"),
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

class FCall:
    def __init__(self, s, pos=None):
        self.str = s
        self.pos = pos
    def __repr__(self):
        return self.str

def flatten(lst):
    for elem in lst:
        if isinstance(elem, FList):
            for subelem in elem:
                yield subelem
        else:
            yield elem

def to_forth(root):
    if not isinstance(root, Node):
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
        return FList([FCall("pick:", root.pos), to_forth(root[0][0])], root.pos)
    elif root.name == "NAME":
        return to_forth(root[0])
    elif root.name == "name_quote":
        return FList([FCall("check:", root.pos), to_forth(root[0][0])], root.pos)
    elif root.name == "STRING":
        return FList([FCall("push:", root.pos), to_forth(root[0])], root.pos)
    elif root.name == "NUMBER":
        if 0 <= int(root[0]) < 3:
            return to_forth(root[0])
        return FList([FCall("pushi:", root.pos), to_forth(root[0])], root.pos)
    elif root.name == "forth":
        return FList([FCall(child[0], child.pos) for child in root], root.pos)
    elif root.name == "assign":
        output = to_forth(root[1])
        if not isinstance(output, FList):
            output = FList([output], pos=root[1].pos)
        output.append(FList([n for child in reversed(root[0])
                             for n in [FCall("assign:", child.pos),
                                       to_forth(child[0])]], root[0].pos))
        return output
    elif root.name == "bind":
        output = to_forth(root[1])
        if not isinstance(output, FList):
            output = FList([output], pos=root[1].pos)
        if len(root[1]) > 0 and getattr(root[1][0], 'name', None) in ["simple_quote", "quote"]:
            if root[1].name not in ["inline", "class"]:
                decl = FList([FCall("newfunc%s" % len(root[1][0][0]), root[0].pos)])
            else:
                decl = FList([], root.pos)
            names = output[0].value if root[1][0].name == "simple_quote"\
                    else output[0][1::2]
            for name in reversed(names):
                decl.append(FCall("assign:", root[1][0].pos))
                decl.append(name)
            output[1].insert(0, decl)
            output.inline = (root[1].name == "inline")
            if not output.inline and output[0]:
                if str(output[1][-1]) not in ["return", "lookup_error"]:
                    output[1].append(FCall("return_no_value"))
        else:
            # Forth only body
            output.inline = True
        output.append(FCall("bind:", root.pos))
        output.append(to_forth(root[0][0]))
        return output
    elif root.name == "comment":
        children = list(flatten(to_forth(child) for child in root))
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
                        root[1].name]
        return FList(list(flatten(children)), root.pos)
    elif root.name == "infix":
        bp() # Shouldn't happen anymore
        children = list(flatten(to_forth(child) for child in [root[0], root[2]]))
        return FList(children + [FCall(root[1][0], root[1].pos)], root.pos)
    elif root.name == "return":
        pass
    elif root.name in ["fun", "grammar", "exprsp"]:
        children = list(flatten(to_forth(child) for child in root))
        return FList(children)
    children = list(flatten(to_forth(child) for child in root))
    return FList(children + [FCall(root.name, root.pos)], root.pos)

def write_sep(value):
    if value != "\n":
        if g.last_value == "\n" and value != "]":
            output_stream.write("\n")
            output_stream.write(" " * (g.nesting))
        output_stream.write("%s " % value)
    g.last_value = value

escaped = {repr(x)[1:-1]:x for x in "\t\n\r\\"} #\'\"
escaped.update({"\\s": " ", "\(": "(", "\)": ")"})

def write_string_body(root, depth):
    if isinstance(root, FList):
        g.nesting += 1
        for child in root:
            write_string_body(child, depth)
        g.nesting -= 1
        write_sep("\n")
    elif isinstance(root, FQuote):
        write_sep("pushf:")
        write_sep(root.func_name)
    elif isinstance(root, FCall):
        if str(root) in ["return", "return_two"]:
            write_sep("%s%s" % (root, depth))
        else:
            write_sep(str(root))
    elif isinstance(root, str):
        write_sep(root)
    elif isinstance(root, FComment):
        pass
    elif root is None:
        pass
    else:
        bp()

def write_blocks(root, prefix="", depth=1, nesting=0):
    # Bad!! And almost unused since reset by write_string_body
    g.nesting = nesting
    if isinstance(root, (FList, FQuote)):
        for child in root:
            write_blocks(child, prefix, depth + isinstance(child, FQuote), nesting + 1)
        g.nesting = nesting
        write_sep("\n")
    if isinstance(root, FQuote):
        if not hasattr(root, "func_name"):
            root.func_name = "autogen%s" % g.func_count
            g.func_count += 1
        g.nesting = 0
        write_sep("[")
        g.nesting = 1
        for child in root:
            write_string_body(child, depth)
        write_sep("]")
        g.nesting = nesting
        if root.func_name.startswith("autogen"):
            [write_sep(c) for c in ["bind:", root.func_name, "\n"]]

def write_suite(root, prefix=""):
    for child in root:
        if isinstance(child, FComment):
            continue
        if isinstance(child, FList) and len(child) > 1 and str(child[-2]) == "bind:":
            if str(child[-3]) == "class":
                # Skip FQuote to avoid writing a function
                write_suite(list(child[-4]), child[-1] + ".")
            else:
                body = child[0] if len(child) == 3 else child[1]
                if isinstance(body, (str, FCall)):
                    # Also need non-string version
                    write_string_body(child, 0)
                    write_sep("\n")
                    continue
                assert(len(child) == 4 or len(child) == 5 and str(child[-3]) in ["inline", "func"])
                body.func_name = (prefix + child[-1]).replace("_colon", ":")
                write_blocks(body, prefix)
                [write_sep(c) for c in ["bind:" if body.func_name not in g.written\
                                        else "rebind:",
                                        body.func_name, "\n"]]

                if body.func_name not in g.written:
                    g.written.append(body.func_name)
        elif isinstance(child, FList):
            g.nesting = 0
            write_string_body(child, 0)
            write_sep("\n")

class Global(object):
    pass

g = Global()
            
if __name__ == "__main__":
    output_stream = sys.stdout
    g.func_count = 0
    g.last_value = ""
    g.nesting = 0
    g.written = []
    t1 = list(simple_wrap_tree(boot_tree.tree))
    t2 = match(t1, boot_grammar.bootstrap + boot_grammar.extra + boot_grammar.diff)
    lang_tree = match(t2, grammar + boot_grammar.extra)

    for filename in sys.argv[1:]:
        write_suite(to_forth(simplify(parse(open(filename).read()))))
