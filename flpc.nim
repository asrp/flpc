# import hotcodereloading
import strutils
import tables
import sequtils, sugar
import strformat
from bitops import bitand, bitor
from algorithm import reversed
import strformat
import options
import macros
from os import sleep, paramCount, paramStr, fileExists
import re
when defined(with_py_opt):
  import nimpy
  import nimpy / py_lib
# import nimprof

macro debugp(args: varargs[untyped]): untyped =
  result = nnkStmtList.newTree()
  for n in args:
    result.add newCall("write", newIdentNode("stdout"), newLit(n.repr))
    result.add newCall("write", newIdentNode("stdout"), newLit(": "))
    result.add newCall("writeLine", newIdentNode("stdout"), n)

macro defVal(p: untyped): untyped =
  result = p
  result[^1].insert(0, quote do: result = NoValue)

const
  LENGTH* = -1
  TL* = 3
  TL_MAX = (1 shl TL) - 1
  MAX_NUM_STRINGS = 1000000
  EMPTY_STR = ""
  EMPTY_MEM = 0
  MAX_CALL_STACK_LEN = 10000

type
  ElemType* = enum Int, Str, Pointer, Prim, Special, PyObj, BadData6, BadData7
  #ElemType* = enum Int, Str, Pointer, Prim
  #SpecialValue = enum BadSpecial, None, Sep, UnnamedString, NoValue, FileSep
  Elem = int
  PosMapEntry = object
    start*: int
    filename*: string
    source_start*: int
    source_end*: int
  DStackElem = object
    name*: Elem
    data*: Elem
  Global = object
    memory*: seq[Elem]
    memory_hint*: seq[Elem]
    pos_map*: seq[PosMapEntry]
    positions*: seq[PosMapEntry]
    call_stack*: seq[int]
    prev_call_stack*: array[0..MAX_CALL_STACK_LEN, int]
    data_stack*: seq[DStackElem]
    input_stack*: seq[Elem]
    #name_stack*: seq[Elem]
    strings*: array[0..MAX_NUM_STRINGS, string]
    strings_raw_length*: int
    when defined(with_py_opt):
      py_object*: seq[PyObject]
    else:
      py_object*: seq[int]
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
    pick_cache*: Table[int, int]
    profile*: bool
  Pos = tuple[start: int, endd: int]
  PrimProc = proc (): Elem # {.gcsafe, locks: 0.}

var
  g* = Global()
  last_pos: Pos
  indices*: Table[string, int]
  specials*: Table[int, string]

let NilPos = PosMapEntry(source_start: -1,
                         source_end: -1,
                         filename: "",
                         start: -1)

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

proc fPyObj*(i: int): Elem =
  return makeElem(PyObj, i)

const
  True = fInt(1)
  False = fInt(0)

proc bp*()
proc frepr*(elem: Elem): string
proc step*()
proc ftype*(elem: Elem): ElemType {.inline}
proc value*(elem: Elem): int {.inline}

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

var specials_compile_time{.compiletime.}: Table[int,string]
proc fSpecial(value:int):Elem =
  #specials[value] = name
  makeElem(Special, value)
#proc fSpecial*(i: int, name: string): Elem =
#  specials[-i] = name
#  return makeElem(Special, -i)

const
  AlwaysStop = -1 # debugger_waitlen
  None = fSpecial(-1)
  Sep = fSpecial(-2)
  UnnamedString = fSpecial(-3)
  NoValue = fSpecial(-4) # No return value, only used internally.
  FileSep = fSpecial(-5)
  DSSep = DStackElem(name: Sep, data: Sep)
specials_compile_time[-1] = "None"
specials_compile_time[-2] = "Sep"
specials_compile_time[-3] = "UnnamedString"
specials_compile_time[-4] = "NoValue"
specials_compile_time[-5] = "FileSep"
specials = specials_compile_time
#let DSFileSep = DStackElem(name: FileSep, data: FileSep)

proc print_stack*(start: int): Elem
proc print_stack*(start: BackwardsIndex): Elem
proc print_state*()
proc print_full_state*()
proc print_data_stack*(start: BackwardsIndex)
proc print_data_stack*(start: int)
proc print_data_stack*()
proc print_mem*()
proc print_mem*(index: int)
proc mem_str*(frame: int): string
proc func_call*(elem: Elem)

var primitives: seq[PrimProc]
var primitive_names: seq[string]

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
      #performCodeReload()
      echo "Not implemented anymore"
      discard
    elif inp == "bt":
      print_state()
      echo $getStackTrace()
      echo "step ", g.steps
    elif inp == "full":
      print_full_state()
      echo $getStackTrace()
      echo "step ", g.steps
    elif inp == "cs":
      echo "call_stack: ", g.call_stack
      echo "prev_call:  ", g.prev_call_stack[0..<g.call_stack.len]
    elif inp == "ds":
      print_data_stack()
    elif inp == "v":
      g.debug = not g.debug
      debugp g.debug
    elif inp == "st":
      echo $getStackTrace()
    elif inp == "pr":
      g.profile = not g.profile
    elif inp.startswith("mem "):
      inp.split()[1].parseInt.print_mem
    elif inp == "mem":
      echo "names_get_end ", indices["names_get_end"]
      echo "functions_end ", indices["functions_end"]
      print_mem()
    elif inp.startswith("pos "):
      echo g.positions[inp.split()[1].parseInt]
    elif inp == "hello":
      echo "hello"
    elif inp == "" or inp == "c":
      break
    else:
      echo fmt"Unknown bp command: {inp}"

proc bp*(message: string) =
  echo message
  bp()

proc f_bp(): Elem {.defVal} =
  echo "Breakpoint hit"
  bp()

proc error(msg: string) =
  echo msg
  bp()
  raise newException(Exception, msg)

proc fassert(cond: bool) =
  if not cond:
    error($cond)

proc ds_add(elem: Elem) {.inline} =
  g.data_stack.add(DStackElem(name: UnnamedString, data: elem))

proc ds_pop(): Elem {.inline} =
  when not defined(ds_pop_check):
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
  #if elem.ftype != t:
  #   error(fmt"Wrong type {elem.ftype} != {t}")
  assert(elem.ftype == t)
  return elem.value

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
      if elem.value != -1 and elem.value < primitive_names.len: # Parse issue with Specials
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
    of PyObj:
      return fmt"<pyobj {g.py_object[elem.value]}>"
    else:
      return elem.repr

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
    of PyObj:
      return $g.py_object[elem.value]
    else:
      return elem.repr

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

proc f_error(): Elem {.defVal} =
  echo fmt"Runtime error: {g.data_stack[^1].data.frepr}"
  error("Runtime error raised. Ran the error primitive.")

proc inner_stdin_next_token(): string =
  if g.stdin_buffer.len == 0:
    stdout_write("> ")
    g.stdin_buffer = stdin.readLine().splitWhitespace().reversed()
  #if (scanf("%s", input_buffer) == EOF) {_error("EOF reached");}
  return g.stdin_buffer.pop()

proc next_token*(f: File): string =
  if f == stdin:
    return inner_stdin_next_token()
  let start = getFilePos(f)
  var buffer = newString(2048)
  var read: int
  try:
    read = f.readChars(buffer, 0, 30)
  except EOFError:
    return ""
  var token = buffer[0..<read].strip(trailing=false)
  if not token.anyIt(it.isSpaceAscii):
    setFilePos(f, start)
    try:
      read = f.readChars(buffer, 0, buffer.len)
    except EOFError:
      return ""
    token = buffer[0..<read].strip(trailing=false)
  let leading = read - token.len
  token = token.split(maxSplit = 1)[0]
  setFilePos(f, start + token.len + leading)
  #debugp token
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

template input_pos(): int =
  if g.input == stdin: 0 else: int(g.input.getFilePos())
  
proc input_next_token(): Elem {.defVal} =
  last_pos[0] = input_pos()
  let token = next_token(g.input)
  # EOF
  if token == "":
    last_pos[1] = input_pos()
    # Bad because we're effectively assuming only input_loop call this.
    discard g.call_stack.pop()
    discard g.call_stack.pop()
  else:
    last_pos[1] = input_pos()
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

# TODO: Replace this with binary search!
proc pos_map_index(forth_index: int): int =
  for i, pm in g.pos_map.pairs:
    if forth_index < pm.start:
      return i - 1
  return -1
  #error("Position in source not found. Is this the right pos_map.txt for the input file?")

proc inner_print_frame(frame: int, context: int) =
  if frame == Sep:
    stdout_write("  ---------\n")
    return
  if frame > g.positions.len:
    stdout_write(fmt"Unknown frame {frame}\n")
    return
  var pos = g.positions[frame]
  if pos.start == None or pos.start < 0 or pos.source_start < 0 or pos.filename == "":
    stdout_write("  Unknown position \e[92m" & $frame & "\e[0m\n    ")
    print_mem(frame)
    stdout_write("\n")
    return
  var source = readFile(pos.filename)
  let first = search(source, "\n"[0], pos.source_start, context, -1)
  let first_line = source[0..first].countLines + 1
  let last = search(source, "\n"[0], pos.source_end, context - 1, 1)
  stdout_write("  In file \e[92m" & pos.filename & "\e[0m line " & $first_line )
  stdout_write(" function \e[92m(" & g.memory[frame].frepr & ")\e[0m")
  stdout_write(source[first..<pos.source_start])
  stdout_write("\e[91m")
  stdout_write(source[pos.source_start..<pos.source_end])
  stdout_write("\e[0m")
  stdout_write(source[pos.source_end..<last])
  stdout_write("\n")

proc print_stack*(start: int): Elem {.defVal} =
  var i: int
  for j, i_frame in g.call_stack[start..^1].pairs:
    i = start + j
    var frame = if g.prev_call_stack[i] != 0: g.prev_call_stack[i] else: g.call_stack[i]
    stdout_write($i)
    inner_print_frame(frame, 1)

proc print_stack*(start: BackwardsIndex): Elem {.defVal} =
  discard print_stack(max(0, g.call_stack.len - int(start)))

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
  # echo len(raw_line), " ", line[1].parseInt * 2
  #assert(len(raw_line) == line[1].parseInt * 2)
  length = line[1].parseInt
  for i in countup(0, length - 1):
    g.positions.add(PosMapEntry(source_start: raw_line[2*i],
                                source_end: raw_line[2*i+1],
                                filename: "lib/boot.flpc",
                                start: 0)) # Wrong value here. Need to change init_mem.dat
  for i in countup(length, g.memory.len - 1):
    g.positions.add(NilPos)

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
  indices["init_primitive_names_len"] = primitive_names . len
  primitives = newSeqWith[PrimProc](len(primitive_names), f_error.PrimProc)

  # echo "indice type ", indices.type, " ", indices["names_get"].type

# Need multiple pos maps, one per .f file open.
# Unless we are *sure* all of one file is compiled before the otehrs.
proc load_pos_map() =
  if not fileExists(g.input_filename & ".pos_map"):
    echo "Position map " & g.input_filename & ".pos_map not found. Running file without a map."
    return
  let file = open(g.input_filename & ".pos_map")
  discard file.readLine().split()[1..^1] # var filenames =
  g.pos_map = @[]
  var buffer: string
  while file.readLine(buffer):
    var line = buffer.split()
    g.pos_map.add(PosMapEntry(start: line[0].parseInt,
                              filename: line[1],
                              source_start: line[2].parseInt,
                              source_end: line[3].parseInt))

## Begin primitives

proc call(): Elem {.defVal} =
  let val: Elem = ds_pop()
  assert(val.ftype == Prim or val.value > 4)
  func_call(val)

proc call_from_input(): Elem {.defVal} =
  g.from_input = g.call_stack.len
  return call()

var names = {"f_error": fPrim(0)}.toTable
# Should be replaced by actual lookup function written to memory
# Maybe just straight up write the hashtable?
proc names_get_prim() =
  #ds_add_sep()
  func_call(fPointer(indices["names_get"]))

proc repeat(): Elem {.defVal} =
  g.call_stack[^1] -= 3
  func_call(ds_pop())

proc repeat_if(): Elem {.defVal} =
  var f_block = ds_pop().value
  if g.data_stack[^1].data == False:
    discard ds_pop()
  else:
    g.call_stack[^1] -= 3
    g.call_stack.add(f_block)

proc f_return(): Elem {.defVal} =
  discard g.call_stack.pop()

proc inner_string_unescape(index: Elem): Elem

proc push(): Elem {.defVal} =
  if g.call_stack.len != g.from_input:
    g.call_stack[^1] += 1
    return g.memory[g.call_stack[^1] - 1]
  else:
    #return input_next_token()
    return inner_string_unescape(input_next_token())

proc f_hash(): Elem {.defVal} =
  return fInt(ds_pop().nim_string.hash)

proc next_token2(): Elem {.defVal} =
  if g.call_stack.len != g.from_input + 1:
    g.call_stack[^2] += 1
    return g.memory[g.call_stack[^2] - 1]
  else:
    return input_next_token()

proc next_command(): Elem {.defVal} =
  if g.call_stack.len != g.from_input:
    g.call_stack[^1] += 1
    return g.memory[g.call_stack[^1] - 1]
  else:
    return input_next_token()

proc pushi(): Elem {.defVal} =
  return fInt(next_command().nim_string.parseInt)

proc int_to_str(): Elem {.defVal} = return string_new($ds_pop().value)
proc to_str(): Elem {.defVal} =
  var elem = ds_pop()
  let etype = elem.ftype
  case etype
    of Int:
      return string_new($elem.value)
    of Str:
      return elem
    of Prim:
      return string_new(primitive_names[elem.value])
    else:
      error("Should not call to_str with a pointer.")
proc newfunc(n: int): Elem {.defVal} =
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

proc f_newfunc(): Elem {.defVal} =
  return newfunc(ds_pop().value)

proc inner_assign(name: Elem): Elem {.defVal} =
  assert(name.ftype == Str)
  for i in countup(1, g.data_stack.len):
    if g.data_stack[^i].name == UnnamedString:
      g.data_stack[^i].name = name
      return NoValue
    elif g.data_stack[^i].name == Sep:
      break
  error(fmt"Can't assign {name.frepr}. All var after separator already named.")

proc assign(): Elem {.defVal} =
  return inner_assign(next_command())

proc assign2(): Elem {.defVal} =
  return inner_assign(ds_pop())

proc newfunc0(): Elem {.defVal} = return newfunc(0)
proc newfunc1(): Elem {.defVal} = return newfunc(1)
proc newfunc2(): Elem {.defVal} = return newfunc(2)
proc newfunc3(): Elem {.defVal} = return newfunc(3)

proc pick1(): Elem {.defVal} = return g.data_stack[^1].data
proc drop1(): Elem {.defVal} = discard ds_pop()

proc equal(): Elem {.defVal} =
  return fInt(ds_pop() == ds_pop())

proc local_pick(name: Elem): Elem =
  for i in countdown(g.data_stack.len - 1, 0):
    #for elem in g.data_stack.reversed():
    let elem = g.data_stack[i]
    if elem.name == Sep:
      break
    elif elem.name == name:
      when defined(opt_pick):
        var mem_index = g.prev_call_stack[g.call_stack.len - 1]
        var count = g.data_stack.len - i
        assert(g.memory[mem_index].frepr == "<prim pick:>")
        g.memory[mem_index] = fPrim(indices["opt.pickn"])
        g.memory[mem_index + 1] = fInt(count)
      #[
      if not (mem_index in g.pick_cache):
        g.pick_cache[mem_index] = count
      if g.pick_cache[mem_index] != count:
        debugp g.pick_cache[mem_index], count
        debugp g.call_stack[^1].mem_str
        debugp g.prev_call_stack[g.call_stack.len - 1].mem_str
        bp()
        g.pick_cache[mem_index] = count
      ]#
      return elem.data
  return NoValue

proc pick(): Elem {.defVal} =
  var name = next_command()
  let res = local_pick(name)
  if res != NoValue:
    return res
  ds_add(name)
  when defined(opt_pick):
    if g.call_stack.len != g.from_input:
      var mem_index = g.prev_call_stack[g.call_stack.len - 1]
      g.memory[mem_index] = fPrim(indices["opt.names_get"])
      #debugp g.call_stack[^1].mem_str
      #debugp g.prev_call_stack[g.call_stack.len - 1].mem_str
      #bp()
  names_get_prim()

proc opt_pickn(): Elem {.defVal} =
  assert(g.call_stack.len != g.from_input)
  g.call_stack[^1] += 1
  var n = g.memory[g.call_stack[^1] - 1].value
  return g.data_stack[^n].data

proc opt_names_get(): Elem {.defVal} =
  assert(g.call_stack.len != g.from_input)
  g.call_stack[^1] += 1
  let name = g.memory[g.call_stack[^1] - 1]
  ds_add(name)
  #debugp g.call_stack[^1].mem_str
  #bp()
  names_get_prim()

proc string_equal(): Elem {.defVal} =
  return equal()

proc return_no_value(): Elem {.defVal} =
  while g.data_stack[^1].name != Sep:
    discard ds_pop()
  while g.input_stack.pop() != Sep: discard
  while g.call_stack.pop() != Sep: discard
  discard g.input_stack.pop()
  ds_pop_sep()

proc func_return(): Elem {.defVal} =
  var ret_val = ds_pop()
  discard return_no_value()
  return ret_val

# TODO: rename this
proc func_return_two(): Elem {.defVal} =
  var val1 = ds_pop()
  var val2 = ds_pop()
  discard return_no_value()
  ds_add(val2)
  return val1

proc return_if(): Elem {.defVal} =
  var value = ds_pop();
  if ds_pop() == True:
    discard return_no_value()
    return value

proc memory_len(): Elem {.defVal} = return fInt(g.memory.len)

proc f_Pointer(): Elem {.defVal} = return fPointer(ds_pop().value)

proc mempos_append(): Elem {.defVal} =
  let pm_index = pos_map_index(last_pos[0].int + 1)
  g.positions.add(if pm_index > -1: g.pos_map[pm_index] else: NilPos)
  g.memory.add(ds_pop())
  g.memory_hint.add(None)

proc f_if(): Elem {.defVal} =
  var index = ds_pop()
  if ds_pop() == True:
    func_call(index)

proc if_else(): Elem {.defVal} =
  var false_index = ds_pop()
  var true_index = ds_pop()
  if ds_pop() == True:
    func_call(true_index)
  else:
    func_call(false_index)

proc check(): Elem {.defVal} =
  var command = next_command()
  if not g.data_stack[^1].name == command:
    error("Failed check:")

proc func_end(): Elem {.defVal} =
  discard g.call_stack.pop()

proc functions_end(): Elem {.defVal} =
  return fPointer(indices["functions_end"])

proc s21(): Elem {.defVal} =
  var v1 = ds_pop(); var v2 = ds_pop(); ds_add(v1); return v2
proc s4127(): Elem {.defVal} =
  var a = ds_pop(); var b = ds_pop(); discard ds_pop(); var d = ds_pop()
  discard ds_pop(); discard ds_pop()
  ds_add(b); ds_add(a); return d

proc memory_get(): Elem {.defVal} =
  return g.memory[tvalue(ds_pop(), Pointer)]

proc memory_set(): Elem {.defVal} =
  var x = ds_pop(); var i = ds_pop().value
  if i < g.memory.len:
    g.memory[i] = x
  elif i == g.memory.len:
    g.memory.add(x)
    g.positions.add(NilPos)
    g.memory_hint.add(None)
  else:
    error("Setting index greater than memory length")

proc memory_append(): Elem {.defVal} =
  g.memory.add(ds_pop())
  g.positions.add(NilPos)
  g.memory_hint.add(None)
  assert(g.memory.len == g.positions.len)

proc functions_end_increase(): Elem {.defVal} = indices["functions_end"] += 1
proc functions_end_decrease(): Elem {.defVal} = indices["functions_end"] -= 1

const
  flpcforth_to_flpcpython_repl = @[("\\_", " ")]
  flpcpython_to_flpcforth_repl = @[(" ", "\\_")]
  flpcforth_to_nim_repl = @[("\\_", " ")] & "0\0 u_ n\n r\r t\t q\" \\\\ (( ))".split(" ").map(r => ("\\" & $r[0], $r[1]))
  nim_to_flpcpython_repl = @[("\0", "\\0")] & "\nn \rr \tt \"q \\\\".split(" ").map(r => ($r[0], "\\" & $r[1]))
  nim_to_flpcforth_repl = @[(" ", "\\_"), ("\0", "\\0")] & "\nn \rr \tt \"q \\\\".split(" ").map(r => ($r[0], "\\" & $r[1]))

proc inner_string_unescape(index: Elem): Elem =
  assert(index.ftype == Str)
  let s = g.strings[index.value]
  return string_new(s.multiReplace(flpcforth_to_nim_repl))

proc string_unescape(): Elem {.defVal} =
  return inner_string_unescape(ds_pop())

proc f_print(): Elem {.defVal} =
  var elem = ds_pop()
  elem.printstr()

# TODO: (re)implement these
# Maybe after fixing how escaping works?
proc printraw(): Elem {.defVal} =
  ds_pop().printstr()
proc string_repr(s: Elem): string =
  return nim_string(s)
proc printrepr(): Elem {.defVal} =
  fout_write("\"")
  fout_write(nim_string(ds_pop()).multiReplace(nim_to_flpcpython_repl))
  fout_write("\"")
proc printspace(): Elem {.defVal} = fout_write(" ")
proc printeol(): Elem {.defVal} = fout_write("\n")

proc error_handler_set(): Elem {.defVal} =
  g.error_handler = ds_pop()
  assert(g.error_handler.ftype == Prim or g.error_handler.ftype == Pointer)

proc one(): Elem {.defVal} = return fInt(1)
proc zero(): Elem {.defVal} = return fInt(0)
proc two(): Elem {.defVal} = return fInt(2)
proc f_None(): Elem {.defVal} = return None

proc sub(): Elem {.defVal} =
  var v = ds_pop(); return ds_pop() - v
proc add(): Elem {.defVal} = return ds_pop() + ds_pop()
proc f_mod(): Elem {.defVal} =
  var v1 = ds_pop(); var v2 = ds_pop()
  return fInt(v2.tvalue(Int) mod v1.tvalue(Int))
proc intdiv(): Elem {.defVal} =
  var v1 = ds_pop(); var v2 = ds_pop()
  return fInt(int(v2.tvalue(Int) / v1.tvalue(Int)))
proc greater(): Elem {.defVal} = return fInt(int(ds_pop() < ds_pop()))
proc less(): Elem {.defVal} =
  # https://github.com/nim-lang/Nim/issues/10425
  var v1 = ds_pop()
  return fInt(int(v1 > ds_pop()))
proc bin_or(): Elem {.defVal} =
  var v1 = ds_pop(); var v2 = ds_pop();
  return fInt(bitor(v2.tvalue(Int), v1.tvalue(Int)))
proc bin_and(): Elem {.defVal} =
  var v1 = ds_pop(); var v2 = ds_pop();
  return fInt(bitand(v2.tvalue(Int), v1.tvalue(Int)))
proc f_not(): Elem {.defVal} =
  return fInt(int(not bool(ds_pop().value)))

proc is_str(): Elem {.defVal} =
  return fInt(ds_pop().ftype == Str)

proc is_basic(): Elem {.defVal} =
  var elem = ds_pop()
  return fInt(elem.ftype == Str or elem.ftype() == Int or
              elem.ftype() == Prim or
              elem == None or elem == NoValue)

# Should return a string or something instead?
proc type_of(): Elem {.defVal} =
  var elem = ds_pop()
  return fInt(int(elem.ftype))

proc memory_hint_get(): Elem {.defVal} = return g.memory_hint[ds_pop().value]
proc memory_hint_set(): Elem {.defVal} =
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

proc shuffle(): Elem {.defVal} =
  shuffle_string(nim_string(ds_pop()))

proc unimpl(): Elem {.defVal} =
  echo "Unimplemented"

#int _isspace(char c) {return (c == ' ' || c == '\n' || c == '\r' || c == '\t');}
proc is_alpha(): Elem {.defVal} =
  return ds_pop().nim_string.allIt(it.isAlphaAscii).fInt

proc char_between(): Elem {.defVal} =
  var c = nim_string(ds_pop())
  var e = nim_string(ds_pop())
  var s = nim_string(ds_pop())
  return fInt(c[0] >= s[0] and c[0] <= e[0])

proc str_join(): Elem {.defVal} =
  var length = ds_pop().value
  var arr = ds_pop().value
  return g.memory[arr..<arr + length].map(s => nim_string(s)).join("").string_new

proc sub_str(): Elem {.defVal} =
  var endd = ds_pop().tvalue(Int)
  var start = ds_pop().tvalue(Int)
  return ds_pop().nim_string[start..<endd].string_new

proc str_len(): Elem {.defVal} =
  var fs = ds_pop()
  if (fs.ftype == Pointer and g.memory[fs.value] == False): return False
  return fInt(fs.nim_string.len)

proc str_endswith(): Elem {.defVal} =
  var fs2 = ds_pop().nim_string
  var fs1 = ds_pop().nim_string
  return fInt(fs2.endswith(fs1))

proc set_output(): Elem {.defVal} = 
  var file_num = ds_pop()
  if file_num == None:
    g.output = stdout
  else:
    g.output = g.files[file_num.tvalue(Int)]

proc continue_from_file(): Elem {.defVal} =
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

# Switch future input stream to a (new) file.
proc run_file(filename: string) =
  g.input_filename = filename
  stdout_write(fmt"Running from file {g.input_filename}" & "\n")
  load_pos_map()
  g.files.add(open(g.input_filename))
  g.input = g.files[^1]
  g.input_index = g.files.len - 1
  #fread(&file_source, FILE_BUFFER_SIZE, 1, input);
  #fseek(input, 0, SEEK_SET);}

proc current_input_file(): Elem {.defVal} =
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

proc debugger() =
  assert(g.debugger_waitlen == AlwaysStop or g.debugger_waitlen == NoValue or g.debugger_waitlen >= 0)
  # NoValue means don't ever break
  # AlwaysStop means always break
  if g.debugger_waitlen == AlwaysStop or g.debugger_waitlen >= g.call_stack.len:
    if g.debugger_skip == True:
      g.debugger_skip = False
      echo fmt"new g.debugger_waitlen: {g.debugger_waitlen}"
      return
    g.debugger_waitlen = 0
    g.prev_call_stack[g.call_stack.len - 1] = g.call_stack[^1]
    func_call(g.debug_function)

proc main_loop*() =
  # int func;
  when defined(flpc_profile):
    var prof_file = open("profile.txt", fmWrite)
  while g.call_stack.len > g.start_stack_len:
    when defined(flpc_profile):
      #prof_file.write($g.call_stack)
      if g.profile:
        prof_file.write(g.call_stack.map(x => $x).join(" "))
        prof_file.write("\n")
    debugger()
    step()

proc switch_input_file(): Elem {.defVal} = 
  var filename = nim_string(ds_pop())
  run_file(filename)
  g.start_stack_len = g.call_stack.len
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

proc stdin_next_token(): Elem {.defVal} =
  return unescape_string_new(inner_stdin_next_token())

# Doesn't play nicely with stdin_next_token because of buffering
proc stdin_next_line(): Elem {.defVal} =
  return string_new(stdin.readLine)

proc inner_remove_top_names(n: int): Elem {.defVal} =
  for i in countup(1, n):
    g.data_stack[^i].name = UnnamedString

proc remove_top_names(): Elem {.defVal} =
  return inner_remove_top_names(ds_pop().value)

proc fd_position(): Elem {.defVal} =
  var fd = g.files[ds_pop().value]
  return fInt(int(getFilePos(fd)))

proc fd_position_set(): Elem {.defVal} =
  var index = ds_pop().value
  g.files[ds_pop().value].setFilePos(index)

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
proc fd_startswith(): Elem {.defVal} =
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

proc fd_next_token(): Elem {.defVal} =
  var fd = g.files[ds_pop().value]
  if not fd.skip_whitespace():
    return None
  return string_new(next_token(fd))

proc fd_next_char(): Elem {.defVal} =
  var fd = g.files[ds_pop().value]
  try:
    return string_new($fd.readChar())
  except EOFError:
    return None

proc fd_next_line(): Elem {.defVal} =
  var fd = g.files[ds_pop().value]
  try:
    return string_new(fd.readLine())
  except EOFError:
    return None

# Not strictly needed since we have set_output
proc fd_write(): Elem {.defVal} =
  var fd = g.files[ds_pop().value]
  fd.write(nim_string(ds_pop()))
  fd.flushFile()

proc fd_flush(): Elem {.defVal} =
  var fd = g.files[ds_pop().value]
  fd.flushFile()

proc fd_ended(): Elem {.defVal} =
  var fd = g.files[ds_pop().value]
  return fInt(fd.endOfFile)

var mode_table = {"r": fmRead, "w": fmWrite, "a": fmAppend}.toTable
# TODO: Maybe remove open_at?
proc inner_file_open_at(index: int): Elem {.defVal} =
  var filename = nim_string(ds_pop())
  var mode = nim_string(ds_pop())
  var mode_val = mode_table[mode]
  g.files[index] = open(filename, mode_val)
  #if (files.files[index] == NULL) {
  #  printf("Error opening file %s\n", buf);
  #  _error("Error opening file");}
  return fInt(index)

proc file_open_at(): Elem {.defVal} =
  return inner_file_open_at(ds_pop().value)

proc file_open(): Elem {.defVal} =
  var filename = nim_string(ds_pop())
  var mode = nim_string(ds_pop())
  var mode_val = mode_table[mode]
  g.files.add(open(filename, mode_val))
  return fInt(g.files.len - 1)

proc file_close(): Elem {.defVal} =
  g.files[ds_pop().value].close()

proc memoizer_get(): Elem {.defVal} =
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

proc memoizer_set(): Elem {.defVal} =
  var v2 = ds_pop()
  var v1 = ds_pop()
  var k3 = g.memory[ds_pop().tvalue(Pointer)].tvalue(Int)
  var k2 = ds_pop().tvalue(Int)
  var name = nim_string(ds_pop())
  #debugp (name, k2, k3), (v1.frepr, v2.frepr)
  g.f_memoizer[(name, k2, k3)] = (v1, v2)

proc memoizer_reset(): Elem {.defVal} =
  g.f_memoizer = initTable[(string, int, int), (int, int)]()

proc c_infinity(): Elem {.defVal} = return fInt(1000)
proc call_stack_len(): Elem {.defVal} = return fInt(g.call_stack.len)
# TODO: parametrize?
proc f_call_stack_top(): Elem {.defVal} = return fInt(g.call_stack[^1])
proc call_stack_top2(): Elem {.defVal} = return fInt(g.call_stack[^2])

proc debugger_waitlen_set(): Elem {.defVal} =
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

proc debug_function_set(): Elem {.defVal} =
  g.debug_function = ds_pop().value

proc f_print_state(): Elem {.defVal} =
  print_state()

proc msleep(): Elem {.defVal} =
  sleep(ds_pop().value)

proc input_next_triple_quote(): Elem {.defVal} =
  let f = g.input
  let start = getFilePos(f)
  var buffer = newString(2048)
  var read = f.readChars(buffer, 0, buffer.len)
  var token = buffer[1..<read]
  let leading = read - token.len
  token = token.split("'''", 1)[0]
  setFilePos(f, start + token.len + leading + 3)
  # Remove last char for balance ''' foo '''
  return string_new(token[0..^2])

proc triple_quote(): Elem {.defVal} =
  if g.call_stack.len != g.from_input:
    g.call_stack[^1] += 1
    return g.memory[g.call_stack[^1] - 1]
  else:
    return input_next_triple_quote()

proc print_frame(): Elem {.defVal} =
  var i = ds_pop().value
  var context = ds_pop().value
  # Bad: should probably be a different function.
  var raw_memory_location = ds_pop()
  var frame = if raw_memory_location == True:
                i
              elif g.prev_call_stack[i] != 0:
                g.prev_call_stack[i]
              else:
                g.call_stack[i]
  inner_print_frame(frame, context)

proc str_next_token(): Elem {.defVal} =
  # Consumes spaces at the beginning, then returns all characters
  # up to the next space of end of string.
  var fs = nim_string(ds_pop())
  var start = ds_pop().value
  fs = fs[start..^1].strip(trailing=false)
  var res = fs.splitWhitespace()[0]
  ds_add(fInt(res.len))
  return string_new(res)

proc str_to_int(): Elem {.defVal} =
  var val = ds_pop()
  if val.ftype == Str:
    return fInt(val.nim_string.parseInt)
  else:
    error("int() can't handle non-Strings yet.")

## Untested

proc f_print_mem(): Elem {.defVal} =
  var val = ds_pop().tvalue(Pointer)
  stdout_write(mem_str(g.call_stack[^1]))

proc local_call_stack(): Elem {.defVal} =
  for elem in g.call_stack.reversed():
    if elem == Sep: return NoValue
    ds_add(fInt(elem))

proc load_call_stack(): Elem {.defVal} =
  var skip = ds_pop().value
  var l = ds_pop().value
  var arr = ds_pop().value
  # Still need to fix input_stack
  g.input_stack.add(fInt(g.call_stack.len))
  g.input_stack.add(Sep)
  #g.local_stack.add(Sep)
  ds_add_sep()
  g.call_stack.add(Sep)
  for i in countup(0, l-1-skip):
    g.call_stack.add(g.memory[arr + i].value)

proc rewind(): Elem {.defVal} =
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

# Unused?
proc lookup_error(): Elem {.defVal} =
  print_state()
  error("Lookup_error")

# Unused?
proc prm(): Elem {.defVal} =
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

proc string_escape(): Elem {.defVal} =
  var s = nim_string(ds_pop())
  return string_new(s.multiReplace(flpcpython_to_flpcforth_repl))

proc all_data_stack_pick(): Elem {.defVal} =
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

proc primitive_name(): Elem {.defVal} =
  #echo "Adding ", primitive_names[g.data_stack[^1].data.value]
  return string_new(primitive_names[ds_pop().value])

proc f_Prim(): Elem = fPrim(ds_pop().value)

proc primitives_len(): Elem = fInt(primitives.len)

# This doesn't work. Need relative indentation.
proc replace_indent(s: string, indent: int): string =
  let bounds = s.findBounds(re"\n(\s*)")
  let prefix_len = bounds.last - bounds.first
  bp()
  return s.replace("\n" & " ".repeat(prefix_len), "\n" & " ".repeat(2 * indent))

proc print_indented(): Elem {.defVal} =
  echo replace_indent(nim_string(ds_pop()), ds_pop().tvalue(Int))

## Optimization

# Should maybe just rename this "repeat_if5" or something?
#proc opt_simple_for(): Elem {.defVal} =
proc repeat5_if(): Elem {.defVal} =
  let cond = ds_pop()
  if cond != False:
    g.call_stack[^1] -= 5

proc opt_incr(): Elem {.defVal} =
  g.data_stack[^1].data += 1 shl TL
  #g.data_stack[^1].name = UnnamedString
  let endd = local_pick(indices["string_end"]).tvalue(Int)
  return fInt(g.data_stack[^1].data.value < endd)

when not defined(with_py_opt):
  proc use_py_opt(): Elem {.defVal} =
    return False
  proc no_py_opt(): Elem {.defVal} =
    error("Cannot call this primitive. Python opt disabled.")

  proc py_parse(): Elem {.defVal} = return no_py_opt()
  proc py_len(): Elem {.defVal} = return no_py_opt()
  proc py_get(): Elem {.defVal} = return no_py_opt()
  proc py_convert(): Elem {.defVal} = return no_py_opt()
  proc py_name(): Elem {.defVal} = return no_py_opt()
  proc py_pos(): Elem {.defVal} = return no_py_opt()

when defined(with_py_opt):
  # Need to generalize this line
  pyInitLibPath("/usr/lib/python2.7/config/libpython2.7.so")
  let pyos = pyImport("os")
  let pysys = nimpy.pyImport("sys")
  discard pysys.path.append(pyos.getcwd())
  let pymod = nimpy.pyImport("pymod")

  proc use_py_opt(): Elem {.defVal} =
    return True

  proc pyobj_new(o: PyObject): Elem {.defVal} =
    g.py_object.add(o)
    return fPyObj(g.py_object.len - 1)

  proc py_parse(): Elem {.defVal} =
    let s = ds_pop()
    return pyobj_new(pymod.parse(nim_string(s)))

  proc py_len(): Elem {.defVal} =
    let v = g.py_object[ds_pop().tValue(PyObj)]
    return fInt(pymod.length(v).to(int))

  proc py_get(): Elem {.defVal} =
    let i = ds_pop().tValue(Int)
    let v = g.py_object[ds_pop().tValue(PyObj)]
    return pyobj_new(pymod.get(v, i))

  proc inner_py_convert(elem: PyObject): Elem =
    let elem_py_type = pymod.pytype(elem).to(string)
    case elem_py_type
      of "str": ds_add(string_new(elem.to(string)))
      of "int": ds_add(fInt(elem.to(int)))
      of "Node": ds_add(pyobj_new(elem))
      else:
        error "Unknown child type " & pymod.pytype(elem).to(string)
    return string_new(elem_py_type)

  proc py_convert(): Elem {.defVal} =
    # Pushes type, flpc_value onto the stack
    let elem = g.py_object[ds_pop().tValue(PyObj)]
    return inner_py_convert(elem)

  proc py_name(): Elem {.defVal} =
    let v = g.py_object[ds_pop().tValue(PyObj)]
    return string_new(pymod.name(v).to(string))

  proc py_pos(): Elem {.defVal} =
    let v = g.py_object[ds_pop().tValue(PyObj)]
    let pos = pymod.pos(v)
    ds_add(fInt(pos[0].to(int)))
    return fInt(pos[1].to(int))

## End primitives

proc func_call*(elem: Elem) =
  if g.debug:
    #if g.call_stack[^1] > indices["functions_end"] or g.call_stack[^1] < indices["names_get"]:
    stdout_write(fmt"*** Running {elem.frepr}" & "\n")
  case elem.ftype
    of Pointer:
      g.call_stack.add(elem.value)
      g.prev_call_stack[g.call_stack.len - 1] = g.call_stack[^1]
      #g.call_stack.add(elem.value)
      #g.prev_call_stack[g.call_stack.len - 1] = g.call_stack[^1]
    of Prim:
      # Uncomment to pre-emptively check
      # if primitives[elem.value] == f_error: # and primitive_names[elem.value] != "error":
      #   echo "Not yet implemented: " & primitive_names[elem.value]
      let res = primitives[elem.value]()
      if res != NoValue:
        # g.data_stack.add(DStackElem(name: UnnamedString, data: res))
        ds_add(res)
    else:
      error("Cannot call " & elem.frepr)

proc step*() =
  g.steps += 1
  assert(g.call_stack.len > 0)
  g.prev_call_stack[g.call_stack.len - 1] = g.call_stack[^1]
  g.call_stack[^1] += 1
  g.memory[g.call_stack[^1] - 1].func_call()

proc mem_str*(frame: int): string =
  result = ""
  for j in countup(max(0, frame - 5), min(g.memory.len - 1, frame + 5)):
    if frame == j: result &= "\e[91m"
    result &= g.memory[j].frepr
    if frame == j: result &= "\e[0m"
    result &= " "
  result &= "\n"

proc print_mem*() =
  stdout_write(mem_str(g.call_stack[^1]))

proc print_mem*(index: int) =
  let start = max(0, index-10)
  stdout_write(g.memory[start..<index].map(x => x.frepr).join(" "))
  stdout_write(" \e[91m")
  stdout_write(g.memory[index].frepr)
  stdout_write(" \e[0m")
  stdout_write(g.memory[index+1..index+10].map(x => x.frepr).join(" "))
  stdout_write("\n")

proc print_data_stack*(start: int) =
  echo "\n  " & g.data_stack[start..^1].reversed().map(x => x.frepr).join("\n  ")

proc print_data_stack*(start: BackwardsIndex) =
  print_data_stack(max(0, g.data_stack.len - int(start)))
proc print_data_stack*() =
  print_data_stack(0)

proc clamped_range[T](a: T, start: int, endd: int): T =
  return a[start.clamp(0, a.len - 1)..<endd.clamp(0, a.len - 1)]

proc print_input_state*() =
  if g.input == stdin:
    stdout_write "Input: <stdin>" & $g.stdin_buffer & "\n"
    return
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
  stdout_write "data_stack: "
  print_data_stack()
  stdout_write "call_stack: "
  g.call_stack.print()
  stdout_write "prev_call_stack: "
  echo g.prev_call_stack[0..<g.call_stack.len]

proc add_primitive(name: string, p: PrimProc) =
  let index = primitive_names.find(name)
  if index == -1:
    primitive_names.add(name)
    primitives.add(p)
  else:
    primitives[index] = p

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
  echo specials
  echo "spec.repr ", Sep.frepr, " ", UnnamedString.frepr, " ", Sep.ftype, " ", None.frepr
  echo "names_get_end ", indices["names_get_end"]
  echo "functions_end ", indices["functions_end"]
  echo "primitives: ", len(primitives)
  echo "primitive_names: ", len(primitive_names)
  echo "init_primitive_names_len ", indices["init_primitive_names_len"]
  debugp(primitives.filter(x => x != f_error).len)
  for (name, fun) in zip(primitive_names, primitives):
    if fun == f_error:
      echo name
  echo "strings: ", len(g.strings)
  indices["string_end"] = string_new("end")
  echo "foo\n  bar".replace(re"\n\s*", "\n" & " ".repeat(10))
  let found = "foo\n  bar".findBounds(re"\n(\s*)")
  echo found.last - found.first
  # bp()

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
    f_hash, int_to_str, to_str,
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
    primitive_name, f_Prim, "primitives.len",
    repeat5_if, "opt.incr",
    print_indented,
    use_py_opt, py_get, py_len, py_convert, py_name, py_parse, py_pos,
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
  add_primitive("opt.pickn", opt_pickn)
  indices["opt.pickn"] = primitives.len - 1
  add_primitive("opt.names_get", opt_names_get)
  indices["opt.names_get"] = primitives.len - 1
  # ./flpc precompiled/self.f
  if paramCount() > 0:
    run_file(paramStr(1))
  else:
    # Todo: get this working with token readers.
    echo "Running from stdin"
    g.input_filename = "<stdin>"
    g.input = stdin

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
  # run_once()
  print_state()
  main_loop()
  echo "Done executing. Step: ", g.steps
  bp()

main()
