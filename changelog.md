This file lists backwards incompatible changes. If this becomes heavily used, migration scripts will be offered.

# Changes

## April 2021

- Reversed order of args of `memory.set` so it matches other `. set` functions.
- Break `inline` into two functions: `fast_fun` for unchecked args and `local_fun` for checked args.
- String representation: Only strings following `push:` in FlpcForth have underscores interpreted as spaces. (Previously, this was the case for all strings, including FlpcPython!)
