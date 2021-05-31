#[ import nimpy

let pyos = pyImport("os")
let pysys = nimpy.pyImport("sys")
echo pysys.version
discard pysys.path.add(pyos.getcwd())

let pymod = nimpy.pyImport("pymod")
# discard pymod.bp(0) ]#

import hotcodereloading
import strutils
import tables
import sequtils, sugar
import strformat
from bitops import bitand, bitor
from algorithm import reversed
import strformat
import options
import macros
from os import sleep, paramCount, paramStr
# import nimprof

macro debugp(args: varargs[untyped]): untyped =
  result = nnkStmtList.newTree()
  for n in args:
    result.add newCall("write", newIdentNode("stdout"), newLit(n.repr))
    result.add newCall("write", newIdentNode("stdout"), newLit(": "))
    result.add newCall("writeLine", newIdentNode("stdout"), n)

const
  LENGTH* = -1
  TL* = 3
  TL_MAX = (1 shl TL) - 1
  MAX_NUM_STRINGS = 10000
  EMPTY_STR = ""
  EMPTY_MEM = 0
  MAX_CALL_STACK_LEN = 1000

type
  ElemType* = enum Int, Str, Pointer, Prim, Special
  #ElemType* = enum Int, Str, Pointer, Prim
  Elem = int
  PosMapEntry = object
    start*: int
    filename*: string
    source_start*: int
    source_end*: int
  Position = object
    start*: int
    endd*: int
    filename*: string
    source*: int
  DStackElem = object
    name*: Elem
    data*: Elem
  Global = object
    memory*: seq[Elem]
    memory_hint*: seq[Elem]
    pos_map*: seq[PosMapEntry]
    positions*: seq[Position]
    call_stack*: seq[int]
    prev_call_stack*: array[0..MAX_CALL_STACK_LEN, int]
    data_stack*: seq[DStackElem]
    input_stack*: seq[Elem]
    #name_stack*: seq[Elem]
    strings*: array[0..MAX_NUM_STRINGS, string]
    strings_raw_length*: int
    files*: seq[File]
    input*: File
    output*: File
    input_index*: int
    input_filename*: string
    stdin_buffer: seq[string]
    from_input*: int
    start_stack_len*: int
    steps*: int
    debug*: bool
    error_handler*: Elem
    f_memoizer*: Table[(string, int, int), (int, int)]
    debugger_waitlen*: int
    debug_function*: Elem
    debugger_skip*: Elem
  Pos = tuple[start: int, endd: int]
  PrimProc = proc (): Elem # {.gcsafe, locks: 0.}

var
  g* = Global()
  last_pos: Pos
  indices*: Table[string, int]
  specials*: Table[int, string]

proc makeElem(ftype: ElemType, value: int): Elem =
  return int(ftype) + (value shl TL)

proc fInt*(i: int): Elem =
  return makeElem(Int, i)

proc fInt*(i: bool): Elem =
  return makeElem(Int, int(i))

proc fPrim*(i: int): Elem =
  return makeElem(Prim, i)

proc fPointer*(i: int): Elem =
  return makeElem(Pointer, i)

const
  True = fInt(1)
  False = fInt(0)

proc bp*()
proc frepr*(elem: Elem): string
proc step*()

proc parseElem(s: string): Elem =
  ## Parses old elem into new Elem
  var i = s.parseInt
  let OLD_TL = 2
  let OLD_TL_MAX = (1 shl OLD_TL) - 1
  var old_value = i shr OLD_TL
  var old_type = ElemType(i and OLD_TL_MAX)
  if old_type == Pointer and old_value < 0:
    echo "Negative pointer ", old_value
    bp()
  else:
    return makeElem(old_type, old_value)
    
proc fSpecial*(i: int, name: string): Elem =
  specials[-i] = name
  return makeElem(Special, -i)

let AlwaysStop = -1 # debugger_waitlen
let None = fSpecial(1, "None")
let Sep = fSpecial(2, "Sep")
let NoValue = fSpecial(4, "NoValue") # No return value, only used internally.
let FileSep = fSpecial(5, "FileSep")
let DSSep = DStackElem(name: Sep, data: Sep)
#let DSFileSep = DStackElem(name: FileSep, data: FileSep)

# Should all be converted back to Special
#let None = fPointer(-1)
#let Sep = fPointer(-2)
#let NoValue = fPointer(-4) # No return value, only used internally.
#let FileSep = fPointer(-5)
let UnnamedString = fSpecial(3, "UnnamedString")
#let UnnamedString = ""

proc print_stack*(start: int): Elem
proc print_stack*(start: BackwardsIndex): Elem
proc print_state*()
proc print_data_stack*(start: BackwardsIndex)
proc print_data_stack*(start: int)
proc print_data_stack*()
proc print_mem*()
proc mem_str*(frame: int): string
proc func_call*(elem: Elem)

proc stdout_write(s: string) =
  when defined(c):
    stdout.write s
  else:
    echo s

proc fout_write(s: string) =
  when defined(c):
    g.output.write s
  else:
    echo s

proc read_input_line: string =
  when defined(c):
    return readLine(stdin)
  else:
    # TODO: fix this
    return ""

proc bp*() =
  #echo $getStackTrace()
  while true:
    stdout_write("bp> ")
    var inp = read_input_line()
    if inp == "reload" or inp == "r":
      performCodeReload()
    elif inp == "bt":
      discard print_stack(0)
      print_state()
      echo $getStackTrace()
      echo "step ", g.steps
    elif inp == "st":
      echo $getStackTrace()
    elif inp.startswith("mem "):
      var index = inp.split()[1].parseInt
      stdout_write(g.memory[index-10..<index].map(x => x.frepr).join(" "))
      stdout_write(" \e[91m")
      stdout_write(g.memory[index].frepr)
      stdout_write(" \e[0m")
      stdout_write(g.memory[index+1..index+10].map(x => x.frepr).join(" "))
      stdout_write("\n")
    elif inp == "mem":
      echo "names_get_end ", indices["names_get_end"]
      echo "functions_end ", indices["functions_end"]
      print_mem()
    elif inp == "hello":
      echo "hello"
    elif inp == "":
      break

proc f_bp(): Elem =
  echo "Breakpoint hit"
  bp()
  return NoValue

proc error(msg: string) =
  echo msg
  bp()
  raise newException(Exception, msg)

proc fassert(cond: bool) =
  if not cond:
    error($cond)

proc ds_add(elem: Elem) =
  g.data_stack.add(DStackElem(name: UnnamedString, data: elem))

proc ds_pop(): Elem =
  var elem = g.data_stack[^1]
  if elem.name == Sep or elem.name == FileSep:
    error("Popping empty data stack!\n")
  return g.data_stack.pop().data

proc ds_add_sep() =
  g.data_stack.add(DStackElem(name: Sep, data: Sep))

proc ds_pop_sep() =
  var name = g.data_stack.pop().name
  assert(name == Sep)

proc ftype*(elem: Elem): ElemType =
  return ElemType(elem and TL_MAX)

proc value*(elem: Elem): int =
  return elem shr TL

proc tvalue*(elem: Elem, t: ElemType): int =
  assert(elem.ftype == t)
  return elem.value

var primitives: seq[PrimProc]
var primitive_names: seq[string]
#seq[auto] = @[f_error, input_next_token]

proc fstr*(elem: Elem): string

proc frepr*(elem: Elem): string =
  let etype = elem.ftype
  case etype
    of Pointer:
      let memhint = if g.memory_hint[elem.value] != None:
                      " " & g.memory_hint[elem.value].fstr
                    else:
                      ""
      return fmt"<mem {elem.value}{memhint}>"
    of Prim:
      if elem.value != -1: # Parse issue with Specials
        return fmt"<prim {primitive_names[elem.value]}>"
      else:
        return fmt"<prim {elem.value}>"
    of Int:
      return fmt"<int {elem.value}>"
    of Str:
      return fmt"<str {g.strings[elem.value]}>"
    of Special:
      if specials.contains(elem.value):
        return fmt"<{specials[elem.value]}>"
      else:
        return fmt"<special {elem.value}>"

proc frepr*(elem: DStackElem): string =
  if elem.name == Sep:
    return "-----"
  elif elem.data == FileSep:
    return "---File---"
  elif elem.name == UnnamedString:
    return ":" & elem.data.frepr
  else:
    assert(elem.name.ftype == Str)
    return fmt"{g.strings[elem.name.value]}: {elem.data.frepr}"

proc frepr*[T](a: var seq[T]): string =
  return a.map(x => x.frepr).join(", ")

proc nim_string(i: Elem): string =
  assert(i.ftype == Str)
  return g.strings[i.value]

proc fstr*(elem: Elem): string =
  let etype = elem.ftype
  case etype
    of Pointer:
      return elem.frepr
    of Prim:
      return elem.frepr
    of Int:
      return $elem.value
    of Str:
      return nim_string(elem)
    of Special:
      return specials.getOrDefault(elem.value, elem.frepr)

proc print*[T](a: var seq[T]) =
  # Hack!
  if a == g.call_stack:
    echo a
  else:
    echo a.frepr

proc print*(elem: Elem) =
  echo elem.frepr

proc printstr*[T](a: var seq[T]) =
  # Hack!
  if a == g.call_stack:
    fout_write($a)
  else:
    fout_write(a.fstr)

proc printstr*(elem: Elem) =
  fout_write(elem.fstr)

proc incr_top*[T](a: var seq[T], diff: int = 1) =
  a[^1] += diff

proc f_error(): Elem =
  echo fmt"Runtime error: {g.data_stack[^1].data.frepr}"
  error("Runtime error raised. Ran the error primitive.")
  return NoValue

proc next_token*(f: File): string =
  let start = getFilePos(f)
  var buffer = newString(2048)
  var read = f.readChars(buffer, 0, buffer.len)
  var token = buffer[0..<read].strip(trailing=false)
  let leading = read - token.len + 1
  token = token.split()[0]
  setFilePos(f, start + len(token) + leading)

  #echo "read token: ", token, " ", start, " ", getFilePos(g.input), " ", read, " ", buffer[0..100]
  #bp()
  return token

proc inner_string_hash(s: string, length: int): int =
  var h = 5381;
  for i in countup(0, length-1):
    # Need to leave room for TL so keeping only the lower 29 bits
    h = bitand((((h shl 5) + h) + ord(s[i])), ((1 shl (32 - TL - 1)) - 1)) # h * 33 + s[i] */}
  assert(h >= 0)
  return h

proc hash*(s: string): int =
  return inner_string_hash(s, len(s))

proc hash_index[I, T](arr: var array[I, T], key: string, start: int, length: int): int =
  var i = start mod length
  var reset = false
  while true:
    if (arr[i] == EMPTY_STR or arr[i] == key): return i
    i += 1
    if i >= length:
      i = 0
      if reset:
        error("strings full!")
      reset = true

proc string_new(source: string): Elem =
  var h_index = hash_index(g.strings, source, source.hash, MAX_NUM_STRINGS);
  #var h_index = g.strings_raw_length
  if (g.strings[h_index] == EMPTY_STR):
    g.strings[h_index] = source
    g.strings_raw_length += 1
  return makeElem(Str, h_index)

proc input_next_token(): Elem =
  when defined(c):
    if g.input == stdin:
      stdout_write("> ")
  last_pos[0] = int(g.input.getFilePos())
  let token = next_token(g.input)
  # Todo: Check EOF with actual EOF
  if token == "":
    last_pos[1] = int(g.input.getFilePos())
    # Bad because we're effectively assuming only input_loop call this.
    discard g.call_stack.pop()
    discard g.call_stack.pop()
    return NoValue
  else:
    last_pos[1] = int(getFilePos(g.input))
    return string_new(token)

proc search(source: string, c: char, start:int, init_count:int=1, dir:int=1): int =
  #echo "search ", start, " count ", init_count, " ", dir
  var index = start
  var count = init_count + 1
  while true:
    if count <= 0 or index + dir <= 0 or index + dir >= len(source):
      return index
    index += dir
    if source[index] == c:
      count -= 1

proc pos_map_index(forth_index: int): int =
  for i, pm in g.pos_map.pairs:
    if forth_index < pm.start:
      return i - 1
  error("Position in source not found")

proc inner_print_frame(frame: Elem, context: int) =
  if frame == Sep:
    stdout_write("  ---------\n")
    return
  if frame > g.positions.len:
    stdout_write(fmt"Unknown frame {frame}\n")
    return
  var pos = g.positions[frame]
  if pos.start == None or pos.start < 0:
    stdout_write("  Unknown position \e[92m")
    if frame < 4 or ((frame and TL_MAX) > 4) or frame.ftype != Pointer:
      stdout_write($frame)
    else:
      frame.print()
    stdout_write("\e[0m\n");
    # _print_mem(frame);}
    return
  var fpos = if pos.filename == "<boot>":
    PosMapEntry(start: pos.start,
                filename: "lib/boot.flpc",
                source_start: pos.start,
                source_end: pos.endd)
    else:
      g.pos_map[pos_map_index(pos.start + 1)]

  var source = readFile(fpos.filename)
  let first = search(source, "\n"[0], fpos.source_start, context, -1)
  let first_line = 0
  let last = search(source, "\n"[0], fpos.source_end, context - 1, 1)
  stdout_write("  In file \e[92m" & fpos.filename & "\e[0m line " & $first_line )
  stdout_write(" function \e[92m(" & g.memory[frame].frepr & ")\e[0m")
  stdout_write(source[first..<fpos.source_start])
  stdout_write("\e[91m")
  stdout_write(source[fpos.source_start..<fpos.source_end])
  stdout_write("\e[0m")
  stdout_write(source[fpos.source_end..<last])
  stdout_write("\n")

proc print_stack*(start: int): Elem =
  var i: int
  for j, i_frame in g.call_stack[start..^1].pairs:
    i = start + j
    var frame = if g.prev_call_stack[i] != 0: g.prev_call_stack[i] else: g.call_stack[i]
    stdout_write($i)
    inner_print_frame(frame, 1)
  return NoValue

proc print_stack*(start: BackwardsIndex): Elem =
  print_stack(max(0, g.call_stack.len - int(start)))

proc load_all*() =
  var file = open("init_memory.dat")
  var line = file.readLine().split()
  # var title: string, input_buffer: string, entries: int
  assert(line[0] == "#memory" and line.len == 3)
  var length = line[1].parseInt
  var entries = line[2].parseInt
  g.memory = file.readLine().split().map(parseElem)
  g.memory.setLen(length)
  assert(g.memory.len == length)

  line = file.readLine().split()
  assert(line[0] == "#positions" and line.len == 2)
  #assert(length == line[1].parseInt)
  var raw_line = file.readLine().split().map(parseInt)
  echo len(raw_line), " ", line[1].parseInt * 2
  #assert(len(raw_line) == line[1].parseInt * 2)
  length = line[1].parseInt
  for i in countup(0, length - 1):
    g.positions.add(Position(start: raw_line[2*i],
                             endd: raw_line[2*i+1],
                             filename: "<boot>",
                             source: 0))
  for i in countup(length, g.memory.len - 1):
    g.positions.add(Position(start: -1,
                             endd: -1,
                             filename: "",
                             source: -1))

  for i in countup(0, g.memory.len - 1):
    g.memory_hint.add(None)

  line = file.readLine().split()
  assert(line[0] == "#strings" and line.len == 2)
  entries = line[1].parseInt
  #g.strings[0 .. entries - 1] = file.readLine().split()
  var init_strings = file.readLine().split().map(s => string_new(s))

  # Hack to replaced sequential strings with hash table based strings
  for i, cell in g.memory.mpairs:
    if cell.ftype == Str:
      g.memory[i] = init_strings[cell.value]

  line = file.readLine().split()
  assert(line[0] == "#indices" and line.len == 4)
  indices["functions_end"] = line[1].parseInt
  indices["names_get"] = line[2].parseInt
  indices["names_get_end"] = g.memory.len
  indices["run"] = line[3].parseInt

  line = file.readLine().split()
  assert(line[0] == "#names" and line.len == 2)
  entries = line[1].parseInt
  primitive_names = file.readLine().split()
  primitives = newSeqWith[PrimProc](len(primitive_names), f_error.PrimProc)

  echo "indice type ", indices.type, " ", indices["names_get"].type

  # TODO: read pos_map.txt
  file = open("pos_map.txt")
  var filenames = file.readLine().split()[1..^1]
  var sources: seq[string]
  for filename in filenames:
    sources.add(readFile(filename))
  length = file.readLine().parseInt
  var buffer: string
  while file.readLine(buffer):
    line = buffer.split()
    g.pos_map.add(PosMapEntry(start: line[0].parseInt,
                              filename: line[1],
                              source_start: line[2].parseInt,
                              source_end: line[3].parseInt))

## Begin primitives

proc call(): Elem =
  let val: Elem = ds_pop()
  assert(val.ftype == Prim or val.value > 4)
  func_call(val)
  return NoValue

proc call_from_input(): Elem =
  g.from_input = g.call_stack.len
  return call()

var names = {"f_error": fPrim(0)}.toTable
# Should be replaced by actual lookup function written to memory
# Maybe just straight up write the hashtable?
proc names_get_prim() =
  #ds_add_sep()
  func_call(fPointer(indices["names_get"]))

proc repeat(): Elem =
  g.call_stack.incr_top(-3)
  func_call(ds_pop())
  return NoValue

proc repeat_if(): Elem =
  var f_block = ds_pop().value
  if g.data_stack[^1].data == False:
    discard ds_pop()
  else:
    g.call_stack[^1] -= 3
    g.call_stack.add(f_block)
  return NoValue;

proc f_return(): Elem =
  discard g.call_stack.pop()
  return NoValue

proc inner_string_unescape(index: Elem): Elem

proc push(): Elem =
  if g.call_stack.len != g.from_input:
    g.call_stack.incr_top()
    return g.memory[g.call_stack[^1] - 1]
  else:
    #return input_next_token()
    return inner_string_unescape(input_next_token())

proc f_hash(): Elem =
  return fInt(ds_pop().nim_string.hash)

proc next_token2(): Elem =
  if g.call_stack.len != g.from_input + 1:
    g.call_stack[^2] += 1
    return g.memory[g.call_stack[^2] - 1]
  else:
    return input_next_token()
    #return inner_string_unescape(input_next_token())

proc next_command(): Elem =
  if g.call_stack.len != g.from_input:
    g.call_stack.incr_top()
    return g.memory[g.call_stack[^1] - 1]
  else:
    return input_next_token()

proc pushi(): Elem =
  return fInt(next_command().nim_string.parseInt)

proc int_to_str(): Elem = return string_new($ds_pop().value)
proc newfunc(n: int): Elem =
  g.input_stack.add(fInt(g.call_stack.len))
  g.input_stack.add(Sep)
  g.data_stack.insert(DSSep, g.data_stack.len - n)
  #for elem in mitems(g.data_stack[^n..^1]):
  for i in countup(g.data_stack.len - n, g.data_stack.len - 1):
    g.input_stack.add(g.data_stack[i].data)
    g.data_stack[i].name = UnnamedString
  var frame = g.call_stack.pop()
  g.call_stack.add(Sep)
  g.call_stack.add(frame)
  g.prev_call_stack[g.call_stack.len - 1] = g.prev_call_stack[g.call_stack.len - 2]
  g.prev_call_stack[g.call_stack.len - 2] = Sep
  return NoValue

proc f_newfunc(): Elem =
  return newfunc(ds_pop().value)

proc inner_assign(name: Elem): Elem =
  assert(name.ftype == Str)
  for i in countup(1, g.data_stack.len):
    if g.data_stack[^i].name == UnnamedString:
      g.data_stack[^i].name = name
      return NoValue
    elif g.data_stack[^i].name == Sep:
      break
  error(fmt"Can't assign {name.frepr}. All var after separator already named.")

proc assign(): Elem =
  return inner_assign(next_command())

proc assign2(): Elem =
  return inner_assign(ds_pop())

proc newfunc0(): Elem = return newfunc(0)
proc newfunc1(): Elem = return newfunc(1)
proc newfunc2(): Elem = return newfunc(2)
proc newfunc3(): Elem = return newfunc(3)

proc pick1(): Elem = return g.data_stack[^1].data
proc drop1(): Elem = discard ds_pop(); return NoValue

proc equal(): Elem =
  return fInt(ds_pop() == ds_pop())

proc pick(): Elem =
  var name = next_command()
  for i in countdown(g.data_stack.len - 1, 0):
    #for elem in g.data_stack.reversed():
    let elem = g.data_stack[i]
    if elem.name == Sep:
      break
    elif elem.name == name:
      return elem.data
  ds_add(name)
  names_get_prim()
  return NoValue

proc string_equal(): Elem =
  return equal()

proc return_no_value(): Elem =
  while g.data_stack[^1].name != Sep:
    discard ds_pop()
  while g.input_stack.pop() != Sep: discard
  while g.call_stack.pop() != Sep: discard
  discard g.input_stack.pop()
  ds_pop_sep()
  return NoValue

proc func_return(): Elem =
  var ret_val = ds_pop()
  discard return_no_value()
  return ret_val

# TODO: rename this
proc func_return_two(): Elem =
  var val1 = ds_pop()
  var val2 = ds_pop()
  discard return_no_value()
  ds_add(val2)
  return val1

proc return_if(): Elem =
  var index = ds_pop();
  if ds_pop() == True:
    discard return_no_value()
    return index
  return NoValue

proc memory_len(): Elem = return fInt(g.memory.len)

proc f_Pointer(): Elem = return fPointer(ds_pop().value)

proc mempos_append(): Elem =
  # TODO: filename should be input filename?
  g.positions.add(Position(start: last_pos[0].int,
                           endd: last_pos[1].int,
                           filename: "",
                           source: 1))
  g.memory.add(ds_pop())
  g.memory_hint.add(None)
  return NoValue

proc f_if(): Elem =
  var index = ds_pop()
  if ds_pop() == True:
    func_call(index)
  return NoValue

proc if_else(): Elem =
  var false_index = ds_pop()
  var true_index = ds_pop()
  if ds_pop() == True:
    func_call(true_index)
  else:
    func_call(false_index)
  return NoValue;

proc check(): Elem =
  var command = next_command()
  if not g.data_stack[^1].name == command:
    error("Failed check:")
  return NoValue

proc func_end(): Elem =
  discard g.call_stack.pop()
  return NoValue

proc functions_end(): Elem =
  return fPointer(indices["functions_end"])

proc s21(): Elem =
  var v1 = ds_pop(); var v2 = ds_pop(); ds_add(v1); return v2
proc s4127(): Elem =
  var a = ds_pop(); var b = ds_pop(); discard ds_pop(); var d = ds_pop()
  discard ds_pop(); discard ds_pop()
  ds_add(b); ds_add(a); return d

proc memory_get(): Elem =
  return g.memory[ds_pop().value]

proc memory_set(): Elem =
  var x = ds_pop(); var i = ds_pop().value
  if i < g.memory.len:
    g.memory[i] = x
  elif i == g.memory.len:
    g.memory.add(x)
    g.positions.add(Position(start: -1,
                             endd: -1,
                             filename: "",
                             source: -1))
    g.memory_hint.add(None)
  else:
    error("Setting index greater than memory length")
  return NoValue

proc memory_append(): Elem =
  g.memory.add(ds_pop())
  g.positions.add(Position(start: -1,
                           endd: -1,
                           filename: "",
                           source: -1))
  g.memory_hint.add(None)
  assert(g.memory.len == g.positions.len)
  return NoValue

proc functions_end_increase(): Elem = indices["functions_end"] += 1; return NoValue
proc functions_end_decrease(): Elem = indices["functions_end"] -= 1; return NoValue

const
  unescape_repl = @[("_", " "), ("\\s", " ")] & "0\0 u_ n\n r\r t\t q\" \\\\ (( ))".split(" ").map(r => ("\\" & $r[0], $r[1]))
  escape_repl = @[(" ", "_"), ("\0", "\\0")] & "_u \nn \rr \tt \"q \\\\".split(" ").map(r => ($r[0], "\\" & $r[1]))

proc inner_string_unescape(index: Elem): Elem =
  assert(index.ftype == Str)
  let s = g.strings[index.value]
  return string_new(s.multiReplace(unescape_repl))

proc string_unescape(): Elem =
  return inner_string_unescape(ds_pop())

proc f_print(): Elem =
  var elem = ds_pop()
  elem.printstr()
  return NoValue

# TODO: (re)implement these
# Maybe after fixing how escaping works?
proc printraw(): Elem =
  ds_pop().printstr(); return NoValue
proc printrepr(): Elem =
  ds_pop().print(); return NoValue
proc printspace(): Elem = fout_write(" "); return NoValue
proc printeol(): Elem = fout_write("\n"); return NoValue

proc error_handler_set(): Elem =
  g.error_handler = ds_pop()
  assert(g.error_handler.ftype == Prim or g.error_handler.ftype == Pointer)
  return NoValue

proc one(): Elem = return fInt(1)
proc zero(): Elem = return fInt(0)
proc two(): Elem = return fInt(2)
proc f_None(): Elem = return None

proc sub(): Elem =
  var v = ds_pop(); return ds_pop() - v
proc add(): Elem = return ds_pop() + ds_pop()
proc f_mod(): Elem =
  var v1 = ds_pop(); var v2 = ds_pop()
  return fInt(v2.tvalue(Int) mod v1.tvalue(Int))
proc intdiv(): Elem =
  var v1 = ds_pop(); var v2 = ds_pop()
  return fInt(int(v2.tvalue(Int) / v1.tvalue(Int)))
proc greater(): Elem = return fInt(int(ds_pop() < ds_pop()))
proc less(): Elem =
  # https://github.com/nim-lang/Nim/issues/10425
  var v1 = ds_pop()
  return fInt(int(v1 > ds_pop()))
proc bin_or(): Elem =
  var v1 = ds_pop(); var v2 = ds_pop();
  return fInt(bitor(v2.tvalue(Int), v1.tvalue(Int)))
proc bin_and(): Elem =
  var v1 = ds_pop(); var v2 = ds_pop();
  return fInt(bitand(v2.tvalue(Int), v1.tvalue(Int)))
proc f_not(): Elem =
  return fInt(int(not bool(ds_pop().value)))

proc is_str(): Elem =
  return fInt(ds_pop().ftype == Str)

proc is_basic(): Elem =
  var elem = ds_pop()
  return fInt(elem.ftype == Str or elem.ftype() == Int or
              elem.ftype() == Prim or
              elem == None or elem == NoValue)

# Should return a string or something instead?
proc type_of(): Elem =
  var elem = ds_pop()
  return fInt(int(elem.ftype))

proc memory_hint_get(): Elem = return g.memory_hint[ds_pop().value]
proc memory_hint_set(): Elem =
  var index = ds_pop()
  var x = ds_pop()
  var i = index.value
  if index.ftype != Pointer:
    stdout_write(fmt"Not setting memory hint to non-pointer {index.frepr}" & "\n")
  elif index == None:
    stdout_write("Not setting memory hint None\n")
  elif i < g.memory_hint.len:
    g.memory_hint[i] = x
  elif i == g.memory_hint.len:
    g.memory_hint.add(x)
  else:
    echo i, " ", x.frepr, " ", g.memory_hint.len, " ", g.memory.len
    error("Setting index greater than memory hint length")
  return NoValue;

proc shuffle_string(s: string) =
  var data_stack_copy: seq[Elem]
  let ord0 = 48
  var arr: seq[int] = s.map(c => ord(c) - ord0)
  var l = s.len
  var m = max(arr)
  if m == arr[^1]:
    m -= 1
    l -= 1
  if m > 9: error("Shuffling index above 9!\n")
  for i in countup(0, m - 1):
    data_stack_copy.add(ds_pop())
  for i in countup(0, l - 1):
    ds_add(data_stack_copy[arr[l - 1 - i] - 1])

proc shuffle(): Elem =
  shuffle_string(nim_string(ds_pop()))
  return NoValue

proc unimpl(): Elem =
  echo "Unimplemented"
  return NoValue

#int _isspace(char c) {return (c == ' ' || c == '\n' || c == '\r' || c == '\t');}
proc is_alpha(): Elem =
  return ds_pop().nim_string.allIt(it.isAlphaAscii).fInt

proc char_between(): Elem =
  var c = nim_string(ds_pop())
  var e = nim_string(ds_pop())
  var s = nim_string(ds_pop())
  return fInt(c[0] >= s[0] and c[0] <= e[0])

proc str_join(): Elem =
  var length = ds_pop().value
  var arr = ds_pop().value
  return g.memory[arr..<arr + length].map(s => nim_string(s)).join("").string_new

proc sub_str(): Elem =
  var endd = ds_pop().tvalue(Int)
  var start = ds_pop().tvalue(Int)
  return ds_pop().nim_string[start..<endd].string_new

proc str_len(): Elem =
  var fs = ds_pop()
  if (fs.ftype == Pointer and g.memory[fs.value] == False): return False
  return fInt(fs.nim_string.len)

proc str_endswith(): Elem =
  var fs2 = ds_pop().nim_string
  var fs1 = ds_pop().nim_string
  return fInt(fs2.endswith(fs1))

proc set_output(): Elem = 
  var file_num = ds_pop()
  if file_num == None:
    g.output = stdout
  else:
    g.output = g.files[file_num.tvalue(Int)]
  return NoValue

proc continue_from_file(): Elem =
  var top = ds_pop()
  assert(top == FileSep)

  g.input_index = ds_pop().value
  g.input_filename = nim_string(ds_pop())
  stdout_write(fmt"Continuing from file {g.input_filename}" & "\n")
  g.input = g.files[g.input_index]
  if g.input != stdin:
    discard
    #var pos = getFilePos(input)
    #setFilePos(input, 0)
    #readChars(&file_source, FILE_BUFFER_SIZE, 1, input);
    #fseek(input, pos, SEEK_SET);}
  return NoValue

# Switch future input stream to a (new) file.
proc run_file(filename: string) =
  g.input_filename = filename
  stdout_write(fmt"Running from file {g.input_filename}" & "\n")
  g.files.add(open(g.input_filename))
  g.input = g.files[^1]
  g.input_index = g.files.len - 1
  #fread(&file_source, FILE_BUFFER_SIZE, 1, input);
  #fseek(input, 0, SEEK_SET);}

proc current_input_file(): Elem =
  # Save previous file into onto stack. To be used by continue_from_file
  # Should possibly make this into primitives.
  var filename_to_run = ds_pop() # Should possibly be someone else's responsability.
  ds_add(string_new(g.input_filename))
  discard inner_assign(string_new("input_filename"))
  ds_add(fInt(g.input_index))
  discard inner_assign(string_new("input_file_index"))
  ds_add(fInt(g.from_input))
  discard inner_assign(string_new("from_input"))
  ds_add(fInt(g.start_stack_len))
  discard inner_assign(string_new("start_stack_len"))
  ds_add(FileSep)
  ds_add(filename_to_run)
  return NoValue

proc debugger() =
  assert(g.debugger_waitlen == AlwaysStop or g.debugger_waitlen == NoValue or g.debugger_waitlen >= 0)
  # NoValue means don't ever break
  # None means always break
  if g.debugger_waitlen == AlwaysStop or g.debugger_waitlen >= g.call_stack.len:
    if g.debugger_skip == True:
      g.debugger_skip = False
      echo fmt"*** new g.debugger_waitlen: {g.debugger_waitlen}"
      return
    g.debugger_waitlen = 0
    g.prev_call_stack[g.call_stack.len - 1] = g.call_stack[^1]
    func_call(g.debug_function)

proc main_loop*() =
  # int func;
  # FILE* prof_file;
  # prof_file = fopen("profile.txt", "w");
  while g.call_stack.len > g.start_stack_len:
    debugger()
    step()

proc switch_input_file(): Elem = 
  var filename = nim_string(ds_pop())
  run_file(filename)
  g.start_stack_len = g.call_stack.len;
  g.call_stack.add(0)
  # Not sure if nested main loop is needed.
  # Currently used as indicator when we run out of input
  main_loop()

  # Problem: we're actually using the returned values for something in the debugger...
  # Need to pull these values out and shift the entire stacck down.
  # Shift every element down two. Ugly but works.
  # Could we move this to run_file to avoid these problems?
  # But then start_stack_len and from_input would be temporarily wrong...
  var from_input_str = string_new("from_input")
  var start_stack_len_str = string_new("start_stack_len")
  assert(g.data_stack.len > 0)
  for i in countup(1, g.data_stack.len - 1):
    if g.data_stack[^i].name == Sep:
      break
    elif g.data_stack[^i].name == from_input_str:
      g.from_input = g.data_stack[^i].data.value
      g.start_stack_len = g.data_stack[^(i-1)].data.value
      g.data_stack.delete(g.data_stack.len - i)
      g.data_stack.delete(g.data_stack.len - (i-1))
      return NoValue
  error("Connot find from_input when done evaluating a file.")

proc unescape_string_new(source: string): Elem =
  return inner_string_unescape(string_new(source))

proc stdin_next_token(): Elem =
  if g.stdin_buffer.len == 0:
    g.stdin_buffer = stdin.readLine().splitWhitespace().reversed()
  #if (scanf("%s", input_buffer) == EOF) {_error("EOF reached");}
  return unescape_string_new(g.stdin_buffer.pop())

proc stdin_next_line(): Elem =
  return string_new(stdin.readLine)

proc inner_remove_top_names(n: int): Elem =
  for i in countup(1, n):
    g.data_stack[^i].name = UnnamedString
  return NoValue

proc remove_top_names(): Elem =
  return inner_remove_top_names(ds_pop().value)

proc fd_position(): Elem =
  var fd = g.files[ds_pop().value]
  return fInt(int(getFilePos(fd)))

proc fd_position_set(): Elem =
  var index = ds_pop().value
  g.files[ds_pop().value].setFilePos(index)
  return NoValue

proc skip_whitespace(fd: File): bool =
  var c: char = ' '
  while isSpaceAscii(c):
    try:
      c = fd.readChar()
    except EOFError:
      return false
  fd.setFilePos(fd.getFilePos() - 1)
  return true

# TODO: make these better
proc fd_startswith(): Elem =
  var fd = g.files[ds_pop().value]
  var fs = ds_pop()
  var s = nim_string(fs)
  #echo "startswith ", fd.getFilePos(), " ", s
  #bp()
  if not fd.skip_whitespace():
    return None
  #return fInt(fd.startswith(s))
  var c: char = ' '
  for schar in s:
    try:
      c = fd.readChar()
    except EOFError:
      return None
    if c != schar:
      return None
  return fs

proc fd_next_token(): Elem =
  var fd = g.files[ds_pop().value]
  if not fd.skip_whitespace():
    return None
  return string_new(next_token(fd))

proc fd_next_char(): Elem =
  var fd = g.files[ds_pop().value]
  try:
    return string_new($fd.readChar())
  except EOFError:
    return None

proc fd_next_line(): Elem =
  var fd = g.files[ds_pop().value]
  return string_new(fd.readLine())

# Not strictly needed since we have set_output
proc fd_write(): Elem =
  var fd = g.files[ds_pop().value]
  fd.write(nim_string(ds_pop()))
  fd.flushFile()
  return NoValue

proc fd_flush(): Elem =
  var fd = g.files[ds_pop().value]
  fd.flushFile()
  return NoValue

proc fd_ended(): Elem =
  var fd = g.files[ds_pop().value]
  return fInt(fd.endOfFile)

var mode_table = {"r": fmRead, "w": fmWrite}.toTable
# TODO: Maybe remove open_at?
proc inner_file_open_at(index: int): Elem =
  var filename = nim_string(ds_pop())
  var mode = nim_string(ds_pop())
  var mode_val = mode_table[mode]
  g.files[index] = open(filename, mode_val)
  #if (files.files[index] == NULL) {
  #  printf("Error opening file %s\n", buf);
  #  _error("Error opening file");}
  return fInt(index)

proc file_open_at(): Elem =
  return inner_file_open_at(ds_pop().value)

proc file_open(): Elem =
  var filename = nim_string(ds_pop())
  var mode = nim_string(ds_pop())
  var mode_val = mode_table[mode]
  g.files.add(open(filename, mode_val))
  return fInt(g.files.len - 1)

proc file_close(): Elem =
  g.files[ds_pop().value].close()
  return NoValue

proc memoizer_get(): Elem =
  # This is a heuristic that is wrong in general.
  # Should extract values as a tuple instead.
  var k3 = g.memory[ds_pop().tvalue(Pointer)].tvalue(Int)
  var k2 = ds_pop().tvalue(Int)
  var name = nim_string(ds_pop())
  # Uncomment to disable memoizer
  # ds_add(None); ds_add(None)
  # return False
  # Result is the same but side effect isn't.
  #debugp (name, k2, k3), (name, k2, k3) in g.f_memoizer
  if name == "INDENT" or name == "DEDENT" or name == "SAME_INDENT":
    ds_add(None); ds_add(None)
    return False
  elif (name, k2, k3) in g.f_memoizer:
    ds_add(g.f_memoizer[(name, k2, k3)][0]); ds_add(g.f_memoizer[(name, k2, k3)][1])
    return True
  ds_add(None); ds_add(None)
  return False

proc memoizer_set(): Elem =
  var v2 = ds_pop()
  var v1 = ds_pop()
  var k3 = g.memory[ds_pop().tvalue(Pointer)].tvalue(Int)
  var k2 = ds_pop().tvalue(Int)
  var name = nim_string(ds_pop())
  #debugp (name, k2, k3), (v1.frepr, v2.frepr)
  g.f_memoizer[(name, k2, k3)] = (v1, v2)
  return NoValue

proc memoizer_reset(): Elem =
  g.f_memoizer = initTable[(string, int, int), (int, int)]()
  return NoValue

proc c_infinity(): Elem = return fInt(1000)
proc call_stack_len(): Elem = return fInt(g.call_stack.len)
# TODO: parametrize?
proc f_call_stack_top(): Elem = return fInt(g.call_stack[^1])
proc call_stack_top2(): Elem = return fInt(g.call_stack[^2])

proc debugger_waitlen_set(): Elem =
  g.debugger_waitlen = ds_pop()
  # Hack for setting None
  if g.debugger_waitlen == None:
    g.debugger_waitlen = AlwaysStop
  else:
    g.debugger_waitlen = g.debugger_waitlen.value
  debugp g.debugger_waitlen
  g.debugger_skip = True
  if g.debug_function == None:
    # Todo: Make this more generic. Hard coded value here is a hack!
    g.debug_function = g.memory[g.call_stack[g.call_stack.len-3] - 1]
  discard return_no_value()
  return NoValue

proc debug_function_set(): Elem =
  g.debug_function = ds_pop().value
  return NoValue

proc f_print_state(): Elem =
  print_state()
  return NoValue

## Untested

proc msleep(): Elem =
  sleep(ds_pop().value)
  return NoValue

proc input_next_triple_quote(): Elem =
  let f = g.input
  let start = getFilePos(f)
  var buffer = newString(2048)
  var read = f.readChars(buffer, 0, buffer.len)
  var token = buffer[0..<read].strip(trailing=false)
  let leading = read - token.len + 1
  token = token.split("'''", 1)[0]
  setFilePos(f, start + len(token) + leading + 3)
  return string_new(token)

proc triple_quote(): Elem =
  if g.call_stack.len != g.from_input:
    g.call_stack[^1] += 1
    return g.memory[g.call_stack[^1] - 1]
  else:
    return input_next_triple_quote()

proc print_frame(): Elem =
  var i = ds_pop().value
  var context = ds_pop().value
  # Bad: should probably be a different function.
  var raw_memory_location = ds_pop().value
  var frame = if raw_memory_location == True:
                i
              elif g.prev_call_stack[i] != 0:
                g.prev_call_stack[i]
              else:
                g.call_stack[i]
  stdout_write($i)
  inner_print_frame(frame, context)
  return NoValue

proc f_print_mem(): Elem =
  var val = ds_pop().tvalue(Pointer)
  stdout_write(mem_str(g.call_stack[^1]))
  return NoValue

proc local_call_stack(): Elem =
  for elem in g.call_stack.reversed():
    if elem == Sep: return NoValue
    ds_add(fInt(elem))

proc load_call_stack(): Elem =
  var skip = ds_pop().value
  var l = ds_pop().value
  var arr = ds_pop().value
  # Still need to fix input_stack
  g.input_stack.add(fInt(g.call_stack.len))
  g.input_stack.add(Sep)
  #g.local_stack.add(Sep)
  ds_add_sep()
  g.call_stack.add(Sep)
  for i in countdown(l-1-skip, 0):
    g.call_stack.add(g.memory[arr + i].value)

proc rewind(): Elem =
  var num_calls = ds_pop().value
  var input_stack_length = 0
  # Do we need a way to rewind non-full function calls?
  for i in countup(0, num_calls-1):
    input_stack_length = g.input_stack.len
    discard return_no_value()
  var call_stack_length = g.input_stack[^1].tvalue(Int)
  # Bad! Abusing the fact that popped input stack (from return_no_value())
  # doesn't actually erase the values.
  for i in countup(g.input_stack.len + 2, input_stack_length - 1):
    ds_add(g.input_stack[i])
  g.call_stack = g.call_stack[0..<call_stack_length]
  #while g.call_stack.len >= call_stack_length:
  #  discard g.call_stack.pop()
  # Call function again. Unfortunately, prev_call_stack temporarily has the wrong value.
  g.call_stack[^1] = g.prev_call_stack[g.call_stack.len - 1]
  return NoValue

proc str_next_token(): Elem =
  # Consumes spaces at the beginning, then returns all characters
  # up to the next space of end of string.
  var fs = nim_string(ds_pop())
  var start = ds_pop().value
  fs = fs[start..^1].strip(trailing=false)
  var res = fs.splitWhitespace()[0]
  ds_add(fInt(res.len))
  return string_new(res)

# Unused?
proc lookup_error(): Elem =
  print_state()
  error("Lookup_error")

proc str_to_int(): Elem =
  var val = ds_pop()
  if val.ftype == Str:
    return fInt(val.nim_string.parseInt)
  else:
    error("int() can't handle non-Strings yet.")

# Unused?
proc prm(): Elem =
  for elem in g.memory:
    var compact = if elem == None:
                    "."
                  elif elem.ftype == Pointer:
                    $(elem.value / 100)
                  elif elem.ftype == Prim:
                    var s = primitive_names[elem.value]
                    if s[0] == ']':
                      "\n"
                    else:
                      s[0..0]
                  elif elem.ftype == Str:
                    "'"
                  else:
                    "i"
    stdout_write(compact)
  stdout_write("\n")

proc string_escape(): Elem =
  var s = nim_string(ds_pop())
  return string_new(s.multiReplace(escape_repl))

proc all_data_stack_pick(): Elem =
  var name = ds_pop()
  var count = ds_pop().tvalue(Int)
  #(string_equal_(local_stack[i], name) == True){
  for elem in g.data_stack.reversed():
    if elem.name == name:
      if count == 0:
        return elem.data
      else:
        count -= 1
  bp()
  return None

## End primitives

proc func_call*(elem: Elem) =
  if g.debug:
    stdout_write("*** Running ")
    elem.print()
    #stdout_write(" " & $getFilePos(g.input) & "\n")
    stdout_write("\n")
  case elem.ftype
    of Pointer:
      g.call_stack.add(elem.value)
      g.prev_call_stack[g.call_stack.len - 1] = g.call_stack[^1]
    of Prim:
      if primitives[elem.value] == f_error: # and primitive_names[elem.value] != "error":
        echo "Not yet implemented: " & primitive_names[elem.value]
      let res = primitives[elem.value]()
      if res != NoValue:
        ds_add(res)
    else:
      error("Cannot call " & $elem)

proc step*() =
  g.steps += 1
  assert(g.call_stack.len > 0)
  g.prev_call_stack[g.call_stack.len - 1] = g.call_stack[^1]
  g.call_stack.incr_top()
  g.memory[g.call_stack[^1] - 1].func_call()

proc mem_str*(frame: int): string =
  result = ""
  for j in countup(max(0, frame - 5), max(g.memory.len - 1, frame + 5)):
    if frame == j: result &= "\e[91m"
    result &= g.memory[frame + j].frepr
    if frame == j: result &= "\e[0m"
    result &= " "
  result &= "\n"

proc print_mem*() =
  stdout_write(mem_str(g.call_stack[^1]))
  #echo g.memory[indices["names_get"]..<indices["functions_end"]].map(x => x.frepr).join(" ")
  #for i in countup(indices["names_get"] - 2, indices["functions_end"]-1, 7):
  #  stdout_write(" " & g.memory[i].frepr)

proc print_data_stack*(start: int) =
  echo "\n  " & g.data_stack[start..^1].reversed.map(x => x.frepr).join("\n  ")
proc print_data_stack*(start: BackwardsIndex) =
  print_data_stack(max(0, g.data_stack.len - int(start)))
proc print_data_stack*() =
  print_data_stack(g.data_stack.len)

proc clamped_range[T](a: T, start: int, endd: int): T =
  return a[start.clamp(0, a.len - 1)..<endd.clamp(0, a.len - 1)]

proc print_input_state*() =
  let l = 30
  var file_source = readFile(g.input_filename)
  stdout_write "Input: " & file_source.clamped_range(last_pos[0]-l, last_pos[0])
  stdout_write "\e[91m" & file_source.clamped_range(last_pos[0], last_pos[1]) & "\e[0m"
  stdout_write file_source.clamped_range(last_pos[1], last_pos[1] + l) & "\n"

proc print_state*() =
  echo "memory: " & $g.memory.len
  echo "strings: " & $g.strings_raw_length
  print_input_state()
  discard print_stack(^6)
  stdout_write "data_stack: "
  print_data_stack(^6)

proc print_full_state*() =
  discard print_stack(0)
  print_input_state()
  echo "memory: " & $g.memory.len
  echo "strings: " & $g.strings_raw_length
  #echo g.memory[0..indices["names_get"]-1].map(x => x.frepr).join(", ")
  #echo g.memory[indices["names_get_end"]..g.memory[LENGTH]-1].map(x => x.frepr).join(", ")
  #g.memory[0..indices["names_get"] - 1].print()
  stdout_write "data_stack: "
  print_data_stack()
  stdout_write "call_stack: "
  g.call_stack.print()
  stdout_write "prev_call_stack: "
  echo g.prev_call_stack[0..<g.call_stack.len]

proc add_primitive(name: string, p: PrimProc) =
  primitives[primitive_names.find(name)] = p

macro m_add_primitive(name: untyped): untyped =
  result = nnkStmtList.newTree()
  var func_name = ($name).replace(".", "_")
  func_name.removeSuffix(':')
  echo func_name
  var f_func_name = $name
  result.add newCall("add_primitive", newLit(f_func_name),
                     newDotExpr(newIdentNode(func_name), newIdentNode("PrimProc")))

macro m_add_primitives(names: varargs[untyped]): untyped =
  result = nnkStmtList.newTree()
  for name in names:
    var func_name = ($name).replace(".", "_").replace("-", "_")
    func_name.removeSuffix(':')
    var f_func_name = $name
    f_func_name.removePrefix("f_")
    #echo "Adding ", f_func_name, " ", func_name
    result.add newCall("add_primitive", newLit(f_func_name),
                       newDotExpr(newIdentNode(func_name), newIdentNode("PrimProc")))

macro m_add_extra_primitives(names: varargs[untyped]): untyped =
  result = nnkStmtList.newTree()
  for name in names:
    var func_name = ($name).split()[1].replace(".", "_").replace("-", "_")
    func_name.removeSuffix(':')
    var f_func_name = ($name).split()[0]
    f_func_name.removePrefix("f_")
    #echo "Adding ", f_func_name, " ", func_name
    result.add newCall("add_primitive", newLit(f_func_name),
                       newDotExpr(newIdentNode(func_name), newIdentNode("PrimProc")))

proc run_once*() =
  echo "spec.repr ", Sep.frepr, " ", UnnamedString.frepr, " ", Sep.ftype
  echo "names_get_end ", indices["names_get_end"]
  echo "functions_end ", indices["functions_end"]
  echo "primitives: ", len(primitives)
  echo "primitive_names: ", len(primitive_names)
  debugp(primitives.filter(x => x != f_error).len)
  for (name, fun) in zip(primitive_names, primitives):
    if fun == f_error:
      echo name
  echo "strings: ", len(g.strings)
  debugp(unescape_repl)
  #g.output = open("output.txt", fmWrite)
  #bp()
  
proc init*() =
  g.output = stdout
  g.debug_function = None
  g.call_stack.add(0)
  ds_add_sep()
  #add_primitive("error", f_error.PrimProc)
  #add_primitive("names_get_prim", names_get_prim.PrimProc)
  m_add_primitives(
    f_error, "input.next_token", call_from_input, repeat, repeat_if, f_return,
    "push:", "assign:", "check:", assign2, next_token2,
    f_newfunc, newfunc0, newfunc1, newfunc2, newfunc3,
    pick1, "pick:", drop1,
    string_equal, return_if,
    "memory.get", "memory.set", "memory.len", "memory.append",
    f_Pointer,
    mempos_append,
    f_if, "if-else",
    return_no_value, func_return, func_return_two, "functions.end",
    s21, s4127,
    "functions.end.increase", "functions.end.decrease",
    string_unescape, f_print,
    error_handler_set,
    f_None,
    is_str, is_basic, type_of, f_not,
    call,
    printraw, printspace, printeol, printrepr,
    f_error,
    "pushi:",
    f_hash, int_to_str,
    "memory_hint.get", "memory_hint.set",
    f_bp,
    shuffle,
    str_join, sub_str, str_len, str_endswith,
    set_output,
    continue_from_file, current_input_file, switch_input_file,
    "stdin.next_line", "stdin.next_token",
    remove_top_names,
    "file.open_at", "file.open", "file.close",
    "memoizer.get", "memoizer.set", "memoizer.reset",
    fd_position, fd_position_set, fd_startswith, fd_next_token, fd_next_char,
    fd_next_line, fd_write, fd_flush, fd_ended,
    "c.infinity", "call_stack.len",
    char_between, is_alpha,
    debugger_waitlen_set, debug_function_set, f_print_state,
    msleep,
    # Unused?
    functions_end, "input.next_triple_quote", print_frame, f_print_mem,
    local_call_stack, load_call_stack, rewind,
    "call_stack.top2", # f_call_stack_top,
    str_next_token, lookup_error, prm, string_escape,
    all_data_stack_pick,
  )
  m_add_extra_primitives(
    "] func_end", "0 zero", "1 one", "2 two",
    "+ add", "- sub", "/ intdiv", "mod f_mod",
    "> greater", "< less", "== equal",
    "|| bin_or", "&& bin_and",
    "pushf: next_command",
    "int str_to_int",
    "cache_slot unimpl", "load_state unimpl", "save_state unimpl", "load unimpl", "save unimpl", "names.set unimpl",
    "''' triple_quote",
    # Unused?
    "_cheat_dict.new unimpl", "_cheat_dict.get unimpl", "_cheat_dict.set unimpl",
    #"repr unimpl"
  )
  # ./flpc precompiled/self.f
  run_file(paramStr(1))

var running*: bool

proc ctrlc() {.noconv.} =
  echo "Ctrl+C fired!"
  running = false
  echo "step ", g.steps
  print_state()
  return

proc main() =
  #setControlCHook(ctrlc)
  running = true
  load_all()
  init()
  run_once()
  print_state()
  main_loop()
  echo "Done executing. Step: ", g.steps
  bp()

main()
