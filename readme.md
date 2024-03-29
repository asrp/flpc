# Forth Lisp Python Continuum

*(Preview version. Even more of a code dump than usual. Should still run. Please report any issues.)*

The Forth Lisp Python Continuum is a language made under the following incorrect assumption.

> Python is Lisp with syntactic sugar and Lisp is Forth with syntactic sugar.

## Highlights

- Almost all of Flpc is written in Flpc itself and defined at runtime. This means almost everything is modifiable at runtime using `rebind:` including the loop for reading input, compiling functions, looking up names and `rebind:` itself!
- Alter the Flpc syntax by writing only in Flpc! [1]
- Mix and match. Make your code as Forthy, Lispy or Pythonic as you like.
- Low LoC count (relatively) to easily modify the boot sequence for your needs.
- Save and load state (save not yet implemented).

[1] The first time around, the description of the syntax change has to be written in the old Flpc of course.

## Syntax

All of the of the following are equivalent in (the default syntax of) Flpc. Python-like syntax

    fib <- fun[i]:
        if i < 3:
            return(1)
        return(fib(x - 1) + fib(x - 2))

Lisp-like syntax

    bind("fib" fun([i]
                   [if(<(i 3) [return(1)])
                    return(+(fib(-(i 1)) fib(-(i 2))))]))

Forth-like syntax

    bind("fib" ["i" assign_() i 3 <() [1 return()] if()
                i 1 -() fib() i 2 -() fib() +() return()])

More Forth-like syntax

    F'
    [ 1 return2 ] bind: base-case
    [ newfunc1 assign: i
      pick: i pushi: 3 < pushf: base-case if
      pick: i 1 - fib pick: i 2 - fib + return1
      ] bind: fib
    'F

or just

    F'
    [ pick1 pushi: 3 < [ drop1 1 return ] if
      pick1 1 - fib pick2 - fib + s21 drop1 return ] bind: fib
    'F

Or anything *in between*. For example, Lisp with sweet expressions:

    bind("fib" fun([i]
                   [if(i < 3 [return(1)])
                    return(fib(i - 1) + fib(i - 2))]))

Eventually, the grammar itself will be modifiable at runtime (needs the Flpc compiler written in Flpc to be complete for that).

With the use optional linters to enforce the style combination of your choosing (not yet implemented or designed).

For technical reasons, all of the above need to be prepended with the line (this is because of the recursive call).

    bind("fib" ["Dummy"])

## Running

Run FlpcPython programs precompiled to FlpcForth with

    nim c --gc:orc -d:danger flpc.nim
    ./flpc precompiled/interpreter.f

(or one of `precompiled/self.f`, `precompiled/flpc-gen.f`, `precompiled/compiler.f`, ). Tested with Nim Compiler Version 1.4.6.

Recompile `.f` files with

    python compiler.py <list of sources> -o <output file>

`compiler.py` depends on [pymetaterp](https://github.com/asrp/pymetaterp). Install it with `pip install -r requirements.txt`.

The existing precompiled files were created with

    python compiler.py lib/stage{0,1{a,b,b2,b3,c,d},3{a,b}}.flpc lib/flpc_grammar.flpc lib/stage{6{a,b},7a2,7a}.flpc -o precompiled/interpreter.f
    python compiler.py lib/stage{0,1{a,b,b2,b3,c,d},3{a,b}}.flpc lib/flpc_grammar.flpc lib/stage6{a,b}.flpc -o precompiled/compiler.f
    python compiler.py lib/stage{0,1{a,b,b2,b3,c,d}}.flpc lib/grammar.flpc lib/stage{2,3a}.flpc test/stage3-test.flpc -o precompiled/flpc-gen.f
    python compiler.py lib/stage{0,1{a,b,b2,b3,c,d},3{a,b}}.flpc lib/flpc_grammar.flpc lib/stage6{a,b}.flpc test/self.flpc -o precompiled/self.f

To run tests (in `test/`), compile up to the needed test and append the test.

    python compiler.py lib/stage{0,1{a,b,c}} test/stage1c-test.flpc -o precompiled/test.f

See Bootstrapping Sequence to get an idea of combinations that may work.

## Bootstrapping sequence

Almost everything is modifiable at runtime using `rebind:` including the loop for reading input, compiling functions, looking up names and `rebind:` itself!

This is a long list but the size of each file is relatively small.

- **boot.flpc**: Preloaded into memory (instead of at runtime) by reading the file `init_memory.dat` (a text file despite the name). Contains the REPL and compilation loop. `init_memory.dat` also contains `names.get` which implicitly represents the function names dictionary.
- **stage0.flpc**: Defines `bind:`, `rebind:` and the debugger.
- **stage1a.flpc**: Basic object system (`boot_obj`, `boot_array`, `boot_dict`)
- **objects.flpc** (was `stage1b.flpc`): Object system (abandoned and unused for now; runs but is too slow without some kind of caching)
- **stage1b.flpc**: Hashtable class
- **stage1b2.flpc**: Replace function name resolution `names.get` with hashtable lookups. Rewire existing name map.
- **stage1b3.flpc**: Replace class attribute lookup `obj . attrib` with hashtable lookups. Rewire existing `attrib`s.
- **stage1c.flpc**: More objects: `resizable` arrays, `node` and `Input` for reading files (unfortunately all in the style of the basic object system instead of the intended one from stage1b)
- **stage1d.flpc**: Semantics for nodes of a grammar
- **grammar.flpc**: Rules of a grammar parsing grammar
- **stage2.flpc**: Use the grammar parsing grammar to parse flpc.grammar into a grammar tree
- **stage3a.flpc**: Generate FlpcPython from the grammar tree in stage2. Can generate the content of `flpc_grammar.flpc` (by adding the content of `stage1-test.flpc`).
- **stage3b.flpc**: Defines some semantics and trickier rules for a Flpc parsing grammar.
- **flpc_grammar.flpc**: Rules of a FlpcPython parsing grammar.
- **stage4.flpc**: Parses a FlpcPython source file (by default `stage1.flpc`; change the hard-coded value for a different file) into its Abstract Syntax Tree.
- **stage5.flpc**: Pretty-prints the AST from stage4.
- **stage6a.flpc**: Missing language features for implementing `compiler.py`: loops, list comprehension, string manipulation, some classes.
- **stage6b.flpc**: Rest of the compiler. More or less a direct translation of `compiler.py` to FLPC.
- **stage7a.flpc**: Starts a FlpcPython interpreter and triple quote.
- **stage7a2.flpc**: Objects using hashtable for method lookup.
- **stage7a3.flpc**: Python FFI. See `test/pyexec.flpc` for sample usage.
- **stage7a4.flpc**: Other helpers. Currently contains easier dictionary creation (see `test/make_dict.flpc`).
- **stage7b.flpc**: Compiled and run by the compiler from stages 1-6.

## What's next?

Its not clear what should go first, both as the next thing to write *and* the next thing to run in the boot sequence. (In fact, maybe the current boot sequence should be reordered).

- **Flpc AST to FlpcForth compiler. COMPLETE** This is the most obvious as it would remove the need for `compiler.py` (so the only remaining source file in the project that is not Flpc would be `flpc.c`). However, competing with that are
- **Garbage collection.** If the concatenation of all `stage1*.flpc` files are compiled, it takes up millions of memory cells. A number of those could be reclaimed.
- **Caching mechanism.** This woud let us use the actual intended object system (hopefully its fast enough!) and replaces `names.get` with the method of an actual dictionary (as in `stage1b.flpc`). Binding and rebinding would be much easier and we can maybe also replace the memoizer.
- **Modules.** We can't keep adding new features (like syscalls) as primitives. Ideally, they'd be referenced by name in some module system.
- **Nested FlpcForth parser.** The number of auto-generated functions is pretty high and makes it a bit unreadable. Maybe this should even come right after the debugger (stage0).
- **Direct Flpc AST interpreter** Maybe with an interpreter, we won't need the compiler (except at the very beginning). Everything can be rebound at runtime anyways.
- **Foreign function interface. Early prototype COMPLETE** We probably don't want to reimplement everything (at least, not at first). Is there some language we can connect to and just use its functions as primitives?

## Debugging

Hopefully these will also help with determining what some of the undocumented functions do with just some trial.

### printstate

`ps` or `printstate` prints the formatted debug stack, formatted call_stack and next command.

![Example stack trace](stack.png)

Each element of the data stack is printed as `<name>: <value>`, except for separators which are shown as `-----` (five dashes).

`print_stack` prints only the stack portion.

### debugger

Once `debugger` is defined, enters the debugger. Special commands are

- `s` step (step into)
- `n` next (step over)
- `r` return (step until return)
- `l` prints stack, same as `ps`

Other commands are run (added to the call stack) with control resuming after the command is finished.

`rebind:` either `debugger_inner` or `debugger` for the debugger to behave differently.

### tprint

Typed print. Prints (and consumes) the top of the data stack. The value is formatted according to its type.

### mpr

Prints the function-end separated memory with one character representing each cell.

### debugging primitives

    gcc -gdwarf-2 -g3 flpc_all.c -o flpc
    gdb ./flpc
    (gdb) b _error
    (gdb) b bp
    (gdb) r <input-file>

`call ps()` and `p cstring(input_next_token())` should help determine the program state when a breakpoint or error is reached.

## Primitives

The end of the C source contains a complete list (starting from `int (*primitives[])(void) = ...`)

- Integer and arithmetic operations `+ - * 0 1 pushi:`
- Boolean operations `|| &&`
- Memory and stack access `memory.set memory.get memory.append push: pushf: functions_end functions_end.increase`
- Stack shuffling and naming `assign: pick: check: pick1 s21 shuffle: newfuncX returnX return_no_valueX`
- Very basic branch and loop `if if-else repeat repeat_if return_if`
- Display and debugging `print print_state mpr`
- stdin reading `input.next_token next_token2`
- File read [1] `file_open fd_*`
- File write `set_output`
- String manipulation (*) `is_str is_alpha string_equal char_between str_join sub_str int_to_str`
- Memoizer helper [2] `memoizer_get memoizer_set memoizer_reset`

[1] Should be in a module. But there's no module system yet.
[2] Should be defined using other primitives instead

Most everything else is defined at runtime and can be `rebind:` (once `rebind:` itself is defined).

TODO: document this more

## Other things to try

- Generate the content of `flpc_grammar.flpc` and `grammar.flpc`
- Write some FlpcPython, compile it using `compiler.py` and run it.

## Interpreter

To document.

## Boot object model

To document.
