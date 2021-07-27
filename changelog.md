This file lists backwards incompatible changes. If this becomes heavily used, migration scripts will be offered.

# Changes

## Mid April 2021

- Call stack use explicit separators to delimit function calls. `newfunc`/`return` changed drastically as a result.

## April 2021

- Reversed order of args of `memory.set` so it matches other `. set` functions.
- Break `inline` into two functions: `fast_fun` for unchecked args and `local_fun` for checked args.
- String representation: Only strings following `push:` in FlpcForth have underscores interpreted as spaces. (Previously, this was the case for all strings, including FlpcPython!)

## June 2021

- String replace spaces with "\s" and leave underscores alone. To avoid an unnecessary escape. Also use "\_" instead of "\s".

## July 2021

- `pos_map.txt` no longer contains its own length as an integer on the second line.
- `pos_map.txt` is replaced by a `.f.pos_map` file next to the `.f` file. E.g., `precompiled/compiler.f.pos_map`.
