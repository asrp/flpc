[ input.next_token functions.add ] input.next_token bind: functions.add 
[ newfunc1 assign: func 
  input.next_token names.get assign: location 
  push: ] names.get pick: location 1 + memory.set 
  memory.set 
 return_no_value ] bind: rebind: 
[ newfunc0 
 input.next_token return1 ] bind: pushn: 
[ 
 print_state ] bind: ps 
[ None return3 ] bind: autogen0 
[ call_stack.len pushi: 4 - return3 ] bind: autogen1 
[ call_stack.len pushi: 5 - return3 ] bind: autogen2 
[ 0 return3 ] bind: autogen3 
[ print_state ] bind: autogen4 
[ print_state ] bind: autogen5 
[ push: Running_ print 
  pick: name print 
  check: name names.get call ] bind: autogen6 
[ push: (dbg)_ print 
  stdin.next_token assign: name 
   pick: name push: s string_equal pushf: autogen0 if 
   pick: name push: n string_equal pushf: autogen1 if 
   pick: name push: r string_equal pushf: autogen2 if 
   pick: name push: c string_equal pushf: autogen3 if 
   pick: name push: i string_equal pushf: autogen4 if 
   pick: name push: l string_equal pushf: autogen5 if 
   pick: name push: i string_equal not pushf: autogen6 if ] bind: autogen7 
[ newfunc0 
 pushf: autogen7 repeat return_no_value ] bind: debugger_inner 
[ newfunc0 
  print_state 
  debugger_inner debugger_waitlen_set 
 return_no_value ] bind: debugger 
[ 
 pushf: push: memory.append memory.append memory.append pushf: ] memory.append memory.len pushi: 4 - Pointer ] bind: closure 
 push: ] names.get bind: end_of_func 
 1 bind: True 
 0 bind: False 
 pick: False bind: lookup_print 
[ assign: self 
  next_token2 assign: name 
  s21 assign: self assign: name 
  pick: self pick: self 1 - memory.get call ] bind: attr: 
[ assign: self 
  next_token2 assign: name 
  check: name pick: self pick: self pick: self 1 - memory.get call call ] bind: attr_call: 
[ newfunc3 assign: searcher assign: receiver assign: name 
 push: Lookup_error error return_no_value ] bind: nullobj.attrib 
[ newfunc2 assign: parent assign: attrib 
  check: parent memory.append 
  check: attrib memory.append 
  push: ] names.get memory.append 
  memory.len 1 - Pointer return1 
 return_no_value ] bind: subclass 
 pick: nullobj.attrib None subclass bind: nullobj 
[ push: Lookup_error error ] bind: autogen8 
[ newfunc3 assign: searcher assign: receiver assign: name 
  pick: name push: parent string_equal pick: receiver 2 - memory.get return_if 
  pick: searcher attr: parent assign: parent 
  pick: parent pick: nullobj == pushf: autogen8 if 
  pick: name pick: receiver pick: parent pick1 assign: parent_copy 
  check: parent_copy 1 - memory.get call return1 
 return_no_value ] bind: instance_attrib 
[ newfunc1 assign: self 
  push: Boot_object_at_ return1 
 return_no_value ] bind: minobj.str 
[ newfunc1 assign: parent 
 pick: instance_attrib pick: parent subclass return1 ] bind: minobj.instance 
[ newfunc3 assign: searcher assign: receiver assign: name 
 push: Dummy_function_should_not_be_called error return_no_value ] bind: minobj.attrib 
[ push: Boot_looking_up_ print 
  pick: name print 
  printeol ] bind: autogen9 
[ newfunc3 assign: searcher assign: receiver assign: name 
  pick: lookup_print pushf: autogen9 if 
  pick: name push: attrib_raw string_equal pick: receiver 1 - return_if 
  pick: name push: attrib string_equal pick: minobj.attrib return_if 
  pick: name push: instance string_equal pick: minobj.instance return_if 
  pick: name push: subclass string_equal pick: subclass return_if 
  pick: name push: str string_equal pick: minobj.str return_if 
  pick: name push: type string_equal push: minobj return_if 
  pick: name pick: receiver pick: searcher instance_attrib return1 
 return_no_value ] rebind: minobj.attrib 
 pick: minobj.attrib pick: nullobj subclass bind: boot_obj 
[ 0 memory.append 
  check: i 1 - assign: i ] bind: autogen10 
[ newfunc1 assign: i 
 pushf: autogen10 repeat_if return_no_value ] bind: memory.extend 
[ pick: value print ] bind: autogen11 
[ pick: value attr_call: print ] bind: autogen12 
[ newfunc1 assign: value 
 pick: value is_basic pushf: autogen11 pushf: autogen12 if-else return_no_value ] bind: tprint 
[ newfunc2 assign: self assign: length 
  pick: boot_obj minobj.instance assign: new_obj 
  pick: self pick: new_obj 2 - memory.set 
  pick: length pick: new_obj memory.set 
  pick: length memory.extend 
  push: ] names.get memory.append 
  pick: new_obj return1 
 return_no_value ] bind: boot_array.instance 
[ push: Index_out_of_range error ] bind: autogen13 
[ push: Index_out_of_range error ] bind: autogen14 
[ newfunc2 assign: self assign: key 
  pick: key 0 < pushf: autogen13 if 
  pick: key pick: self memory.get < not pushf: autogen14 if 
 return_no_value ] bind: boot_array.in_range 
[ newfunc2 assign: self assign: key 
  pick: key pick: self boot_array.in_range 
  pick: self pick: key + 1 + memory.get return1 
 return_no_value ] bind: boot_array.get 
[ newfunc3 assign: self assign: value assign: key 
  pick: key pick: self boot_array.in_range 
  pick: value pick: self pick: key + 1 + memory.set 
 return_no_value ] bind: boot_array.set 
[ pick: l pick: i - pick: self boot_array.get tprint 
  printspace 
  check: i 1 - assign: i ] bind: autogen15 
[ newfunc1 assign: self 
  push: {_ print 
  pick: self memory.get assign: l 
  pick: l assign: i 
  pushf: autogen15 repeat_if 
  push: } print 
 return_no_value ] bind: boot_array.print 
[ check: i return3 ] bind: autogen16 
[ check: i 1 - assign: i 
  pick: value pick: i pick: self boot_array.get string_equal pushf: autogen16 if ] bind: autogen17 
[ newfunc2 assign: self assign: value 
  pick: self memory.get assign: i 
  pushf: autogen17 repeat_if 
  None return1 
 return_no_value ] bind: boot_array.string_index 
[ check: i 1 - assign: i 
  pick: i pick: i pick: self boot_array.get pick: other boot_array.set ] bind: autogen18 
[ newfunc2 assign: self assign: other 
  pick: self memory.get assign: i 
  pushf: autogen18 repeat_if 
 return_no_value ] bind: boot_array.copy_to 
[ push: Array_looking_up_ print 
  pick: name print 
  printeol ] bind: autogen19 
[ newfunc3 assign: searcher assign: receiver assign: name 
  pick: lookup_print pushf: autogen19 if 
  pick: name push: get string_equal pick: boot_array.get return_if 
  pick: name push: set string_equal pick: boot_array.set return_if 
  pick: name push: in_range string_equal pick: boot_array.in_range return_if 
  pick: name push: instance string_equal pick: boot_array.instance return_if 
  pick: name push: print string_equal pick: boot_array.print return_if 
  pick: name push: string_index string_equal pick: boot_array.string_index return_if 
  pick: name push: copy_to string_equal pick: boot_array.copy_to return_if 
  pick: name push: len string_equal pick: receiver memory.get return_if 
  pick: name push: type string_equal push: boot_array return_if 
  pick: name pick: receiver pick: searcher instance_attrib return1 
 return_no_value ] bind: boot_array.attrib 
 pick: boot_array.attrib pick: boot_obj attr_call: subclass bind: boot_array_class 
 pick: boot_array_class attr: instance pick: boot_array_class closure bind: boot_array 
[ newfunc2 assign: self assign: length 
  pick: length pick: boot_array_class boot_array.instance assign: keys 
  pick: length pick: boot_array_class boot_array.instance assign: values 
  pick: boot_obj minobj.instance assign: new_obj 
  pick: self pick: new_obj 2 - memory.set 
  0 pick: new_obj memory.set 
  pick: keys memory.append 
  pick: values memory.append 
  push: ] names.get memory.append 
  pick: new_obj return1 
 return_no_value ] bind: boot_dict.instance 
[ newfunc2 assign: self assign: key 
  pick: key pick: self 1 + memory.get boot_array.string_index assign: index 
  pick: index None == None return_if 
  pick: index pick: self 2 + memory.get boot_array.get return1 
 return_no_value ] bind: boot_dict.get 
[ newfunc3 assign: self assign: value assign: key 
  pick: self memory.get assign: l 
  pick: l pick: key pick: self 1 + memory.get boot_array.set 
  pick: l pick: value pick: self 2 + memory.get boot_array.set 
  pick: self memory.get 1 + pick: self memory.set 
 return_no_value ] bind: boot_dict.set 
[ newfunc1 assign: self 
 pick: self memory.get 1 + pick: self memory.set return_no_value ] bind: boot_dict.increase 
[ pick: l pick: i - pick: keys boot_array.get tprint 
  push: :_ print 
  pick: l pick: i - pick: values boot_array.get tprint 
  push: ,_ print 
  check: i 1 - assign: i ] bind: autogen20 
[ newfunc1 assign: self 
  push: {_ print 
  pick: self memory.get assign: l 
  pick: self 1 + memory.get assign: keys 
  pick: self 2 + memory.get assign: values 
  pick: l assign: i 
  pushf: autogen20 repeat_if 
  push: } print 
 return_no_value ] bind: boot_dict.print 
[ push: Dict_looking_up_ print 
  pick: name print 
  printeol ] bind: autogen21 
[ newfunc3 assign: searcher assign: receiver assign: name 
  pick: lookup_print pushf: autogen21 if 
  pick: name push: get string_equal pick: boot_dict.get return_if 
  pick: name push: set string_equal pick: boot_dict.set return_if 
  pick: name push: instance string_equal pick: boot_dict.instance return_if 
  pick: name push: print string_equal pick: boot_dict.print return_if 
  pick: name push: increase string_equal pick: boot_dict.increase return_if 
  pick: name push: len string_equal pick: receiver memory.get return_if 
  pick: name push: keys string_equal pick: receiver 1 + memory.get return_if 
  pick: name push: values string_equal pick: receiver 2 + memory.get return_if 
  pick: name push: type string_equal push: boot_dict return_if 
  pick: name pick: receiver pick: searcher instance_attrib return1 
 return_no_value ] bind: boot_dict.attrib 
 pick: boot_dict.attrib pick: boot_obj attr_call: subclass bind: boot_dict_class 
 pick: boot_dict_class attr: instance pick: boot_dict_class closure bind: boot_dict 
[ pick: False return2 ] bind: autogen22 
[ newfunc2 assign: class assign: other 
  pick: other is_basic pushf: autogen22 if 
  check: class pick: other 2 - memory.get == return1 
 return_no_value ] bind: is_instance 
[ newfunc2 assign: self assign: length 
  pick: length pick: length + pushi: 3 + pick: boot_array_class boot_array.instance assign: _array 
  pick: boot_obj minobj.instance assign: new_obj 
  pick: self pick: new_obj 2 - memory.set 
  pick: length pick: new_obj memory.set 
  pick: _array memory.append 
  push: ] names.get memory.append 
  pick: new_obj return1 
 return_no_value ] bind: resizable.instance 
[ newfunc2 assign: self assign: key 
 pick: key pick: self 1 + memory.get boot_array.get return1 ] bind: resizable.get 
[ newfunc3 assign: self assign: value assign: key 
 pick: key pick: value pick: self 1 + memory.get boot_array.set return_no_value ] bind: resizable.set 
[ newfunc2 assign: self assign: name 
 pick: name pick: self 1 + memory.get boot_array.string_index return1 ] bind: resizable.string_index 
[ newfunc1 assign: self 
  pick: self memory.get assign: length 
  pick: length pick: length + pushi: 3 + pick: boot_array_class boot_array.instance assign: new_array 
  pick: new_array pick: self 1 + memory.get boot_array.copy_to 
  pick: new_array pick: self 1 + memory.set 
 return_no_value ] bind: resizable.double 
[ newfunc1 assign: self 
  pick: self memory.get assign: length 
  pick: length pick: boot_array_class boot_array.instance assign: new_array 
  pick: new_array pick: self 1 + memory.set 
 return_no_value ] bind: resizable.reset 
[ newfunc1 assign: self 
 pick: self memory.get 1 + pick: self memory.set return_no_value ] bind: resizable.increase 
[ newfunc1 assign: self 
  pick: self 1 + memory.get memory.get return1 
 return_no_value ] bind: resizable.max_len 
[ pick: self resizable.double ] bind: autogen23 
[ newfunc2 assign: self assign: value 
  pick: self memory.get pick: self resizable.max_len < not pushf: autogen23 if 
  pick: self memory.get pick: value pick: self resizable.set 
  pick: self resizable.increase 
 return_no_value ] bind: resizable.append 
[ pick: l pick: i - pick: other resizable.get pick: self resizable.append 
  check: i 1 - assign: i ] bind: autogen24 
[ newfunc2 assign: self assign: other 
  pick: other attr: len assign: l 
  pick: l assign: i 
  pushf: autogen24 repeat_if 
 return_no_value ] bind: resizable.extend 
[ return_no_value2 ] bind: autogen25 
[ pick: value pick: self resizable.extend ] bind: autogen26 
[ pick: value pick: self resizable.append ] bind: autogen27 
[ newfunc2 assign: self assign: value 
  pick: value None == pushf: autogen25 if 
  pick: value pick: resizable_class is_instance pushf: autogen26 pushf: autogen27 if-else 
 return_no_value ] bind: resizable.append_array 
[ newfunc1 assign: self 
  pick: self memory.get 1 - pick: self memory.set 
  pick: self memory.get pick: self resizable.get return1 
 return_no_value ] bind: resizable.pop 
[ newfunc1 assign: self 
 pick: self memory.get 1 - pick: self resizable.get return1 ] bind: resizable.top 
[ pick: l pick: i - pick: self resizable.get tprint 
  printspace 
  check: i 1 - assign: i ] bind: autogen28 
[ newfunc1 assign: self 
  push: {_ print 
  pick: self memory.get assign: l 
  pick: l assign: i 
  pushf: autogen28 repeat_if 
  push: } print 
 return_no_value ] bind: resizable.print 
[ push: Resizable_looking_up_ print 
  pick: name print 
  printeol ] bind: autogen29 
[ newfunc3 assign: searcher assign: receiver assign: name 
  pick: lookup_print pushf: autogen29 if 
  pick: name push: get string_equal pick: resizable.get return_if 
  pick: name push: set string_equal pick: resizable.set return_if 
  pick: name push: string_index string_equal pick: resizable.string_index return_if 
  pick: name push: instance string_equal pick: resizable.instance return_if 
  pick: name push: print string_equal pick: resizable.print return_if 
  pick: name push: append string_equal pick: resizable.append return_if 
  pick: name push: extend string_equal pick: resizable.extend return_if 
  pick: name push: append_array string_equal pick: resizable.append_array return_if 
  pick: name push: double string_equal pick: resizable.double return_if 
  pick: name push: reset string_equal pick: resizable.reset return_if 
  pick: name push: increase string_equal pick: resizable.increase return_if 
  pick: name push: pop string_equal pick: resizable.pop return_if 
  pick: name push: top string_equal pick: resizable.top return_if 
  pick: name push: max_len string_equal pick: resizable.max_len return_if 
  pick: name push: len string_equal pick: receiver memory.get return_if 
  pick: name push: array string_equal pick: receiver 1 + memory.get return_if 
  pick: name push: type string_equal push: resizable return_if 
  pick: name pick: receiver pick: searcher instance_attrib return1 
 return_no_value ] bind: resizable.attrib 
 pick: resizable.attrib pick: boot_obj attr_call: subclass bind: resizable_class 
 pick: resizable_class attr: instance pick: resizable_class closure bind: resizable 
[ newfunc3 assign: self assign: children assign: name 
  pick: boot_obj minobj.instance assign: new_obj 
  pick: self pick: new_obj 2 - memory.set 
  pick: name pick: new_obj memory.set 
  pick: children memory.append 
  push: ] names.get memory.append 
  check: new_obj return1 
 return_no_value ] bind: node.instance 
[ pick: key pick: children resizable.get return2 ] bind: autogen30 
[ pick: children return3 ] bind: autogen31 
[ pick: key 0 == pushf: autogen31 if 
  push: Out_of_bound_index error ] bind: autogen32 
[ newfunc2 assign: self assign: key 
  pick: self 1 + memory.get assign: children 
  pick: children pick: resizable_class is_instance pushf: autogen30 pushf: autogen32 if-else 
 return_no_value ] bind: node.get 
[ newfunc1 assign: self 
  pick: self memory.get printraw 
  push: { print 
  pick: self 1 + memory.get tprint 
  push: } print 
 return_no_value ] bind: node.print 
[ pick: children memory.get return2 ] bind: autogen33 
[ 1 return2 ] bind: autogen34 
[ newfunc1 assign: self 
  pick: self 1 + memory.get assign: children 
  pick: children pick: resizable_class is_instance pushf: autogen33 pushf: autogen34 if-else 
 return_no_value ] bind: node.len 
[ newfunc2 assign: self assign: new_name 
 pick: new_name pick: receiver memory.set return_no_value ] bind: node.name_set 
[ push: Node_looking_up_ print 
  pick: name print 
  printeol ] bind: autogen35 
[ newfunc3 assign: searcher assign: receiver assign: name 
  pick: lookup_print pushf: autogen35 if 
  pick: name push: get string_equal pick: node.get return_if 
  pick: name push: instance string_equal pick: node.instance return_if 
  pick: name push: print string_equal pick: node.print return_if 
  pick: name push: len string_equal pick: receiver node.len return_if 
  pick: name push: name string_equal pick: receiver memory.get return_if 
  pick: name push: children string_equal pick: receiver 1 + memory.get return_if 
  pick: name push: type string_equal push: node return_if 
  pick: name pick: receiver pick: searcher instance_attrib return1 
 return_no_value ] bind: node.attrib 
 pick: node.attrib pick: boot_obj attr_call: subclass bind: node_class 
 pick: node_class attr: instance pick: node_class closure bind: node 
[ newfunc2 assign: self assign: filename 
  pick: boot_obj minobj.instance assign: new_obj 
  pick: self pick: new_obj 2 - memory.set 
  pick: filename file.open pick: new_obj memory.set 
  0 memory.append 
  push: ] names.get memory.append 
  pick: new_obj return1 
 return_no_value ] bind: Input.instance 
[ newfunc1 assign: self 
 pick: self memory.get fd_next_token return1 ] bind: Input.next 
[ newfunc1 assign: self 
 pick: self memory.get fd_next_char return1 ] bind: Input.next_char 
[ newfunc2 assign: self assign: s 
 pick: s pick: self memory.get fd_startswith return1 ] bind: Input.startswith 
[ newfunc1 assign: self 
 check: self memory.get fd_position return1 ] bind: Input.position 
[ newfunc2 assign: self assign: value 
 check: self memory.get pick: value fd_position_set return_no_value ] bind: Input.position_set 
[ newfunc1 assign: self 
 check: self memory.get fd_ended return1 ] bind: Input.ended 
[ push: Input_looking_up_ print 
  pick: name print 
  printeol ] bind: autogen36 
[ newfunc3 assign: searcher assign: receiver assign: name 
  pick: lookup_print pushf: autogen36 if 
  pick: name push: instance string_equal pick: Input.instance return_if 
  pick: name push: ended string_equal pick: Input.ended return_if 
  pick: name push: next string_equal pick: Input.next return_if 
  pick: name push: next_char string_equal pick: Input.next_char return_if 
  pick: name push: startswith string_equal pick: Input.startswith return_if 
  pick: name push: position string_equal pick: Input.position return_if 
  pick: name push: position_set string_equal pick: Input.position_set return_if 
  pick: name push: file string_equal pick: receiver memory.get return_if 
  pick: name push: type string_equal push: Input return_if 
  pick: name pick: receiver pick: searcher instance_attrib return1 
 return_no_value ] bind: Input.attrib 
 pick: Input.attrib pick: boot_obj attr_call: subclass bind: Input_class 
 pick: Input_class attr: instance pick: Input_class closure bind: Input 
[ newfunc1 assign: self 
  pick: boot_obj minobj.instance assign: new_obj 
  pick: self pick: new_obj 2 - memory.set 
  _cheat_dict.new pick: new_obj memory.set 
  push: ] names.get memory.append 
  pick: new_obj return1 
 return_no_value ] bind: cheat_dict.instance 
[ push: CheatDict_looking_up_ print 
  pick: name print 
  printeol ] bind: autogen37 
[ newfunc3 assign: searcher assign: receiver assign: name 
  pick: lookup_print pushf: autogen37 if 
  pick: name push: instance string_equal pick: cheat_dict.instance return_if 
  pick: name push: get string_equal pick: _cheat_dict.get return_if 
  pick: name push: set string_equal pick: _cheat_dict.set return_if 
  pick: name pick: receiver pick: searcher instance_attrib return1 
 return_no_value ] bind: cheat_dict.attrib 
 pick: cheat_dict.attrib pick: boot_obj attr_call: subclass bind: cheat_dict_class 
 pick: cheat_dict_class attr: instance pick: cheat_dict_class closure bind: cheat_dict 
[ newfunc2 assign: self assign: message 
  pick: boot_obj minobj.instance assign: new_obj 
  pick: self pick: new_obj 2 - memory.set 
  pick: message pick: new_obj memory.set 
  push: ] names.get memory.append 
  pick: new_obj return1 
 return_no_value ] bind: MatchError.instance 
[ newfunc1 assign: self 
  push: Match_error: print 
  check: self memory.get print 
 return_no_value ] bind: MatchError.print 
[ push: MatchError_looking_up_ print 
  pick: name print 
  printeol ] bind: autogen38 
[ newfunc3 assign: searcher assign: receiver assign: name 
  pick: lookup_print pushf: autogen38 if 
  pick: name push: instance string_equal pick: MatchError.instance return_if 
  pick: name push: print string_equal pick: MatchError.print return_if 
  pick: name push: type string_equal push: MatchError return_if 
  pick: name pick: receiver pick: searcher instance_attrib return1 
 return_no_value ] bind: MatchError.attrib 
 pick: MatchError.attrib pick: boot_obj attr_call: subclass bind: MatchError_class 
 pick: MatchError_class attr: instance pick: MatchError_class closure bind: MatchError 
[ push: End_of_file MatchError return2 ] bind: autogen39 
[ push: Not_exactly MatchError return2 ] bind: autogen40 
[ newfunc1 assign: char 
  pick: source attr_call: next_char assign: input_char 
   pick: input_char None == pushf: autogen39 if 
   pick: char pick: input_char string_equal not pushf: autogen40 if 
  check: input_char return1 
 return_no_value ] bind: exactly 
[ push: End_of_file MatchError return2 ] bind: autogen41 
[ push: Not_between MatchError return2 ] bind: autogen42 
[ newfunc2 assign: end assign: start 
  pick: source attr_call: next_char assign: input_char 
   pick: input_char None == pushf: autogen41 if 
   pick: start pick: end pick: input_char char_between not pushf: autogen42 if 
  check: input_char return1 
 return_no_value ] bind: between 
[ push: End_of_file MatchError return2 ] bind: autogen43 
[ push: Not_exactly MatchError return2 ] bind: autogen44 
[ newfunc1 assign: char 
  pick: source attr_call: next assign: input_char 
   pick: input_char None == pushf: autogen43 if 
   pick: char pick: input_char string_equal not pushf: autogen44 if 
  check: input_char return1 
 return_no_value ] bind: token 
[ 0 0 return_two2 ] bind: autogen45 
[ newfunc1 assign: children 
  pick: children memory.get pick: end_of_func == pushf: autogen45 if 
  pick: children 2 + pick: children 1 + memory.get return_two1 
 return_no_value ] bind: next_child 
[ check: output return3 ] bind: autogen46 
[ check: child call assign: output 
  pick: output pick: MatchError_class is_instance not pushf: autogen46 if 
  check: output drop1 
  pick: saved pick: source attr_call: position_set 
  check: children next_child assign: child assign: children ] bind: autogen47 
[ newfunc1 assign: children 
  pick: source attr_call: position assign: saved 
  s21 assign: children assign: saved 
  check: children next_child assign: child assign: children 
  pushf: autogen47 repeat_if 
  push: No_OR_child_matches MatchError return1 
 return_no_value ] bind: or 
[ check: output return2 ] bind: autogen48 
[ newfunc1 assign: child 
  check: child call assign: output 
  pick: output pick: MatchError_class is_instance pushf: autogen48 if 
  push: out pick: output node return1 
 return_no_value ] bind: out 
[ pick: output attr: name push: out string_equal return2 ] bind: autogen49 
[ newfunc1 assign: output 
  pick: output pick: node_class is_instance pushf: autogen49 if 
  pick: False return1 
 return_no_value ] bind: is_output 
[ pick: outputs return3 ] bind: autogen50 
[ pick: outputs attr: array 1 + pick: length str_join return4 ] bind: autogen51 
[ pick: output str_len 1 == pushf: autogen51 if ] bind: autogen52 
[ pick: output return3 ] bind: autogen53 
[ pick: outputs attr: len assign: length 
  pick: length 0 == pushf: autogen50 if 
  0 pick: outputs attr_call: get assign: output 
   pick: output is_str pushf: autogen52 if 
   pick: length 1 == pushf: autogen53 if ] bind: autogen54 
[ pick: outputs attr: children return4 ] bind: autogen55 
[ pick: outputs attr: children is_str pushf: autogen55 if ] bind: autogen56 
[ pick: outputs pick: node_class is_instance pushf: autogen56 if ] bind: autogen57 
[ newfunc1 assign: outputs 
  pick: outputs pick: resizable_class is_instance pushf: autogen54 pushf: autogen57 if-else 
  pick: outputs return1 
 return_no_value ] bind: make_string 
[ pick: saved pick: source attr_call: position_set 
  push: And_match_failed MatchError return3 ] bind: autogen58 
[ pick: output attr: children pick: outputs attr_call: append_array ] bind: autogen59 
[ pick: output is_output pushf: autogen59 if 
  check: output drop1 ] bind: autogen60 
[ 0 resizable assign: outputs 
  pick: output attr: children pick: outputs attr_call: append_array 
  pick: True assign: output_mode 
  s4127 assign: children assign: output_mode assign: outputs ] bind: autogen61 
[ pick: output pick: outputs attr_call: append_array 
  check: output drop1 ] bind: autogen62 
[ pick: output is_output pushf: autogen61 pushf: autogen62 if-else ] bind: autogen63 
[ check: child call assign: output 
  pick: output pick: MatchError_class is_instance pushf: autogen58 if 
  pick: output_mode pushf: autogen60 pushf: autogen63 if-else 
  check: children next_child assign: child assign: children ] bind: autogen64 
[ newfunc1 assign: init_children 
  pick: source attr_call: position assign: saved 
  0 resizable assign: outputs 
  pick: False assign: output_mode 
  pick: init_children assign: children 
  check: children next_child assign: child assign: children 
  pushf: autogen64 repeat_if 
  pick: outputs make_string return1 
 return_no_value ] bind: and 
[ 0 c.infinity return_two2 ] bind: autogen65 
[ 1 c.infinity return_two2 ] bind: autogen66 
[ 0 1 return_two2 ] bind: autogen67 
[ newfunc1 assign: quantifier 
   pick: quantifier push: * string_equal pushf: autogen65 if 
   pick: quantifier push: + string_equal pushf: autogen66 if 
   pick: quantifier push: ? string_equal pushf: autogen67 if 
  push: Unknown_quantifier error 
 return_no_value ] bind: get_bounds 
[ pick: start_saved pick: source attr_call: position_set 
  push: Quantified_undermatch MatchError return4 ] bind: autogen68 
[ pick: count pick: lower < pushf: autogen68 if 
  pick: saved pick: source attr_call: position_set 
  pick: outputs make_string return3 ] bind: autogen69 
[ pick: outputs make_string return3 ] bind: autogen70 
[ pick: source attr_call: position assign: saved 
  pick: child call assign: output 
  pick: output pick: MatchError_class is_instance pushf: autogen69 if 
  check: output pick: outputs attr_call: append_array 
  check: saved drop1 
  check: count 1 + assign: count 
  pick: count pick: upper == pushf: autogen70 if ] bind: autogen71 
[ newfunc2 assign: quantifier assign: child 
  check: quantifier get_bounds assign: upper assign: lower 
  0 resizable assign: outputs 
  pick: source attr_call: position assign: start_saved 
  0 assign: count 
  pushf: autogen71 repeat 
 return_no_value ] bind: quantified 
[ None return2 ] bind: autogen72 
[ newfunc1 assign: child 
  pick: source attr_call: position assign: saved 
  s21 assign: child assign: saved 
  check: child call assign: output 
  pick: saved pick: source attr_call: position_set 
  pick: output pick: MatchError_class is_instance pushf: autogen72 if 
  push: Negation_is_true MatchError return1 
 return_no_value ] bind: negation 
[ pick: output return2 ] bind: autogen73 
[ newfunc2 assign: name assign: child 
  pick: child call assign: output 
  pick: output pick: MatchError_class is_instance pushf: autogen73 if 
  pick: name pick: output node return1 
 return_no_value ] bind: bound 
 0 resizable bind: flagged 
[ pick: output attr: len 1 > return2 ] bind: autogen74 
[ newfunc1 assign: output 
  pick: output pick: resizable_class is_instance pushf: autogen74 if 
  pick: False return1 
 return_no_value ] bind: should_make_node 
 pushi: 100 boot_dict bind: rules 
 0 resizable bind: indentation 
 1 boot_array bind: nest 
 0 0 pick: nest attr_call: set 
[ newfunc1 assign: name 
 push: Dummy error return_no_value ] bind: _apply 
 pick: False bind: apply_print 
[ printspace 
  check: i 1 - assign: i ] bind: autogen75 
[ pick: nesting assign: i 
  pushf: autogen75 repeat_if 
  pick: name print 
  printspace 
  pick: source attr_call: position tprint 
  printeol ] bind: autogen76 
[ printspace 
  check: i 1 - assign: i ] bind: autogen77 
[ pick: nesting assign: i 
  pushf: autogen77 repeat_if 
  pick: name print 
  printspace 
  pick: source attr_call: position tprint 
  push: _->_ print 
  pick: output tprint 
  printeol ] bind: autogen78 
[ printspace 
  check: i 1 - assign: i ] bind: autogen79 
[ pick: nesting assign: i 
  pushf: autogen79 repeat_if 
  pick: name print 
  push: _->_ print 
  pick: output tprint 
  printeol ] bind: autogen80 
[ pick: output return2 ] bind: autogen81 
[ push: Making_node_ print 
  pick: name printraw 
  printeol 
  pick: name pick: output node return2 ] bind: autogen82 
[ pick: output return2 ] bind: autogen83 
[ newfunc1 assign: name 
  0 pick: nest attr_call: get assign: nesting 
  pick: apply_print pushf: autogen76 if 
  0 pick: nesting 1 + pick: nest attr_call: set 
  pick: name pick: rules boot_dict.get call assign: output 
  0 pick: nesting pick: nest attr_call: set 
   pick: apply_print pushf: autogen78 if 
   pick: name push: statement string_equal pushf: autogen80 if 
   pick: output pick: MatchError_class is_instance pushf: autogen81 if 
   pick: output should_make_node pushf: autogen82 if 
   pick: name pick: flagged attr_call: string_index None == pushf: autogen83 if 
  pick: name pick: output node return1 
 return_no_value ] rebind: _apply 
[ check: new_pos pick: source attr_call: position_set 
  check: mem_out return2 ] bind: autogen84 
[ pick: source attr_call: position assign: saved 
  pick: name _apply assign: output 
  pick: name pick: saved pick: indentation pick: output pick: source attr_call: position memoizer.set 
  check: output return2 ] bind: autogen85 
[ newfunc1 assign: name 
  pick: name pick: source attr_call: position pick: indentation memoizer.get assign: memoized assign: new_pos assign: mem_out 
  check: memoized pushf: autogen84 pushf: autogen85 if-else 
 return_no_value ] bind: apply 
[ push: End_of_file MatchError return2 ] bind: autogen86 
[ newfunc0 
  pick: source attr_call: next_char assign: char 
  pick: char None == pushf: autogen86 if 
  check: char return1 
 return_no_value ] bind: rule.anything 
[ push: a push: z between ] bind: autogen87 
[ push: A push: Z between ] bind: autogen88 
[ pushf: autogen87 pushf: autogen88 ] bind: autogen89 
[ newfunc0 
 pushf: autogen89 or return1 ] bind: rule.letter 
[ newfunc0 
 push: 0 push: 9 between return1 ] bind: rule.digit 
[ push: rule.letter apply ] bind: autogen90 
[ push: _ exactly ] bind: autogen91 
[ pushf: autogen90 pushf: autogen91 ] bind: autogen92 
[ pushf: autogen92 or ] bind: autogen93 
[ push: rule.letter apply ] bind: autogen94 
[ push: rule.digit apply ] bind: autogen95 
[ push: _ exactly ] bind: autogen96 
[ pushf: autogen94 pushf: autogen95 pushf: autogen96 ] bind: autogen97 
[ pushf: autogen97 or ] bind: autogen98 
[ pushf: autogen98 push: * quantified ] bind: autogen99 
[ pushf: autogen93 pushf: autogen99 ] bind: autogen100 
[ newfunc0 
 pushf: autogen100 and return1 ] bind: rule.name 
 functions.end pushi: 5 + assign: source_index 
 push: grammar/flpc.grammar Input bind: source 
[ push: letter apply ] bind: autogen101 
[ push: _ exactly ] bind: autogen102 
[ pushf: autogen101 pushf: autogen102 ] bind: autogen103 
[ pushf: autogen103 or ] bind: autogen104 
[ push: letter apply ] bind: autogen105 
[ push: digit apply ] bind: autogen106 
[ push: _ exactly ] bind: autogen107 
[ pushf: autogen105 pushf: autogen106 pushf: autogen107 ] bind: autogen108 
[ pushf: autogen108 or ] bind: autogen109 
[ pushf: autogen109 push: * quantified ] bind: autogen110 
[ pushf: autogen104 pushf: autogen110 ] bind: autogen111 
[ newfunc0 
 pushf: autogen111 and return1 ] rebind: rule.name 
[ push: apply apply ] bind: autogen112 
[ push: exactly apply ] bind: autogen113 
[ push: token apply ] bind: autogen114 
[ push: parenthesis apply ] bind: autogen115 
[ push: output apply ] bind: autogen116 
[ pushf: autogen112 pushf: autogen113 pushf: autogen114 pushf: autogen115 pushf: autogen116 ] bind: autogen117 
[ newfunc0 
 pushf: autogen117 or return1 ] bind: rule.expr 
[ push: ' token ] bind: autogen118 
[ push: escaped_char apply ] bind: autogen119 
[ push: ' exactly ] bind: autogen120 
[ pushf: autogen120 negation ] bind: autogen121 
[ push: anything apply ] bind: autogen122 
[ pushf: autogen121 pushf: autogen122 ] bind: autogen123 
[ pushf: autogen123 and ] bind: autogen124 
[ pushf: autogen119 pushf: autogen124 ] bind: autogen125 
[ pushf: autogen125 or ] bind: autogen126 
[ pushf: autogen126 push: * quantified ] bind: autogen127 
[ pushf: autogen127 out ] bind: autogen128 
[ push: ' token ] bind: autogen129 
[ pushf: autogen118 pushf: autogen128 pushf: autogen129 ] bind: autogen130 
[ newfunc0 
 pushf: autogen130 and return1 ] bind: rule.exactly 
[ push: " token ] bind: autogen131 
[ push: escaped_char apply ] bind: autogen132 
[ push: " exactly ] bind: autogen133 
[ pushf: autogen133 negation ] bind: autogen134 
[ push: anything apply ] bind: autogen135 
[ pushf: autogen134 pushf: autogen135 ] bind: autogen136 
[ pushf: autogen136 and ] bind: autogen137 
[ pushf: autogen132 pushf: autogen137 ] bind: autogen138 
[ pushf: autogen138 or ] bind: autogen139 
[ pushf: autogen139 push: * quantified ] bind: autogen140 
[ pushf: autogen140 out ] bind: autogen141 
[ push: " token ] bind: autogen142 
[ pushf: autogen131 pushf: autogen141 pushf: autogen142 ] bind: autogen143 
[ newfunc0 
 pushf: autogen143 and return1 ] bind: rule.token 
[ push: \\ exactly ] bind: autogen144 
[ push: n exactly ] bind: autogen145 
[ push: r exactly ] bind: autogen146 
[ push: t exactly ] bind: autogen147 
[ push: b exactly ] bind: autogen148 
[ push: f exactly ] bind: autogen149 
[ push: " exactly ] bind: autogen150 
[ push: ' exactly ] bind: autogen151 
[ push: \\ exactly ] bind: autogen152 
[ pushf: autogen145 pushf: autogen146 pushf: autogen147 pushf: autogen148 pushf: autogen149 pushf: autogen150 pushf: autogen151 pushf: autogen152 ] bind: autogen153 
[ pushf: autogen153 or ] bind: autogen154 
[ pushf: autogen154 out ] bind: autogen155 
[ pushf: autogen144 pushf: autogen155 ] bind: autogen156 
[ pick: output return2 ] bind: autogen157 
[ push: \t return2 ] bind: autogen158 
[ push: \n return2 ] bind: autogen159 
[ push: \r return2 ] bind: autogen160 
[ push: \\\\ return2 ] bind: autogen161 
[ push: ' return2 ] bind: autogen162 
[ push: " return2 ] bind: autogen163 
[ newfunc0 
  pushf: autogen156 and assign: output 
   pick: output pick: MatchError_class is_instance pushf: autogen157 if 
   pick: output push: t string_equal pushf: autogen158 if 
   pick: output push: n string_equal pushf: autogen159 if 
   pick: output push: r string_equal pushf: autogen160 if 
   pick: output push: \\ string_equal pushf: autogen161 if 
   pick: output push: ' string_equal pushf: autogen162 if 
   pick: output push: " string_equal pushf: autogen163 if 
  push: Unknown_escaped_char error 
 return_no_value ] bind: rule.escaped_char 
[ push: \t exactly ] bind: autogen164 
[ push: \s exactly ] bind: autogen165 
[ pushf: autogen164 pushf: autogen165 ] bind: autogen166 
[ pushf: autogen166 or ] bind: autogen167 
[ pushf: autogen167 push: * quantified ] bind: autogen168 
[ push: name apply ] bind: autogen169 
[ pushf: autogen169 out ] bind: autogen170 
[ pushf: autogen168 pushf: autogen170 ] bind: autogen171 
[ newfunc0 
 pushf: autogen171 and return1 ] bind: rule.apply 
[ push: ( token ] bind: autogen172 
[ push: or apply ] bind: autogen173 
[ pushf: autogen173 out ] bind: autogen174 
[ push: ) token ] bind: autogen175 
[ pushf: autogen172 pushf: autogen174 pushf: autogen175 ] bind: autogen176 
[ newfunc0 
 pushf: autogen176 and return1 ] bind: rule.parenthesis 
[ push: { token ] bind: autogen177 
[ push: or apply ] bind: autogen178 
[ pushf: autogen178 out ] bind: autogen179 
[ push: } token ] bind: autogen180 
[ pushf: autogen177 pushf: autogen179 pushf: autogen180 ] bind: autogen181 
[ newfunc0 
 pushf: autogen181 and return1 ] bind: rule.output 
[ push: ~ token ] bind: autogen182 
[ push: expr apply ] bind: autogen183 
[ pushf: autogen183 push: negation bound ] bind: autogen184 
[ pushf: autogen184 out ] bind: autogen185 
[ pushf: autogen182 pushf: autogen185 ] bind: autogen186 
[ pushf: autogen186 and ] bind: autogen187 
[ push: expr apply ] bind: autogen188 
[ pushf: autogen187 pushf: autogen188 ] bind: autogen189 
[ newfunc0 
 pushf: autogen189 or return1 ] bind: rule.not 
[ push: not apply ] bind: autogen190 
[ push: * exactly ] bind: autogen191 
[ push: + exactly ] bind: autogen192 
[ push: ? exactly ] bind: autogen193 
[ pushf: autogen191 pushf: autogen192 pushf: autogen193 ] bind: autogen194 
[ pushf: autogen194 or ] bind: autogen195 
[ pushf: autogen195 push: ? quantified ] bind: autogen196 
[ pushf: autogen190 pushf: autogen196 ] bind: autogen197 
[ newfunc0 
 pushf: autogen197 and return1 ] bind: rule.quantified 
[ push: quantified apply ] bind: autogen198 
[ push: = exactly ] bind: autogen199 
[ push: name apply ] bind: autogen200 
[ pushf: autogen200 out ] bind: autogen201 
[ pushf: autogen199 pushf: autogen201 ] bind: autogen202 
[ pushf: autogen202 and ] bind: autogen203 
[ pushf: autogen203 push: ? quantified ] bind: autogen204 
[ pushf: autogen198 pushf: autogen204 ] bind: autogen205 
[ newfunc0 
 pushf: autogen205 and return1 ] bind: rule.bound 
[ push: bound apply ] bind: autogen206 
[ newfunc0 
 pushf: autogen206 push: * quantified return1 ] bind: rule.and 
[ push: and apply ] bind: autogen207 
[ push: | token ] bind: autogen208 
[ push: and apply ] bind: autogen209 
[ pushf: autogen209 out ] bind: autogen210 
[ pushf: autogen208 pushf: autogen210 ] bind: autogen211 
[ pushf: autogen211 and ] bind: autogen212 
[ pushf: autogen212 push: * quantified ] bind: autogen213 
[ pushf: autogen207 pushf: autogen213 ] bind: autogen214 
[ newfunc0 
 pushf: autogen214 and return1 ] bind: rule.or 
[ push: spaces apply ] bind: autogen215 
[ push: name apply ] bind: autogen216 
[ pushf: autogen216 push: rule_name bound ] bind: autogen217 
[ push: ! exactly ] bind: autogen218 
[ pushf: autogen218 push: ? quantified ] bind: autogen219 
[ pushf: autogen219 push: flags bound ] bind: autogen220 
[ push: and apply ] bind: autogen221 
[ pushf: autogen221 push: args bound ] bind: autogen222 
[ push: = token ] bind: autogen223 
[ push: or apply ] bind: autogen224 
[ pushf: autogen224 out ] bind: autogen225 
[ pushf: autogen223 pushf: autogen225 ] bind: autogen226 
[ pushf: autogen226 and ] bind: autogen227 
[ pushf: autogen217 pushf: autogen220 pushf: autogen222 pushf: autogen227 ] bind: autogen228 
[ pushf: autogen228 and ] bind: autogen229 
[ pushf: autogen229 out ] bind: autogen230 
[ pushf: autogen215 pushf: autogen230 ] bind: autogen231 
[ newfunc0 
 pushf: autogen231 and return1 ] bind: rule.rule 
[ push: rule apply ] bind: autogen232 
[ pushf: autogen232 push: * quantified ] bind: autogen233 
[ pushf: autogen233 out ] bind: autogen234 
[ push: spaces apply ] bind: autogen235 
[ pushf: autogen234 pushf: autogen235 ] bind: autogen236 
[ newfunc0 
 pushf: autogen236 and return1 ] bind: rule.grammar 
[ push: # exactly ] bind: autogen237 
[ push: \n exactly ] bind: autogen238 
[ pushf: autogen238 negation ] bind: autogen239 
[ push: anything apply ] bind: autogen240 
[ pushf: autogen239 pushf: autogen240 ] bind: autogen241 
[ pushf: autogen241 and ] bind: autogen242 
[ pushf: autogen242 push: * quantified ] bind: autogen243 
[ pushf: autogen237 pushf: autogen243 ] bind: autogen244 
[ newfunc0 
 pushf: autogen244 and return1 ] bind: rule.comment 
[ push: \s exactly ] bind: autogen245 
[ push: \t exactly ] bind: autogen246 
[ push: comment apply ] bind: autogen247 
[ pushf: autogen245 pushf: autogen246 pushf: autogen247 ] bind: autogen248 
[ newfunc0 
 pushf: autogen248 or return1 ] bind: rule.hspace 
[ push: hspace apply ] bind: autogen249 
[ pushf: autogen249 push: * quantified ] bind: autogen250 
[ push: \r exactly ] bind: autogen251 
[ push: \n exactly ] bind: autogen252 
[ pushf: autogen251 pushf: autogen252 ] bind: autogen253 
[ pushf: autogen253 and ] bind: autogen254 
[ push: \r exactly ] bind: autogen255 
[ push: \n exactly ] bind: autogen256 
[ pushf: autogen254 pushf: autogen255 pushf: autogen256 ] bind: autogen257 
[ pushf: autogen257 or ] bind: autogen258 
[ pushf: autogen250 pushf: autogen258 ] bind: autogen259 
[ pushf: autogen259 and ] bind: autogen260 
[ pushf: autogen260 push: * quantified ] bind: autogen261 
[ push: hspace apply ] bind: autogen262 
[ pushf: autogen262 push: + quantified ] bind: autogen263 
[ pushf: autogen261 pushf: autogen263 ] bind: autogen264 
[ newfunc0 
 pushf: autogen264 and return1 ] bind: rule.indentation 
[ push: \n exactly ] bind: autogen265 
[ push: \r exactly ] bind: autogen266 
[ push: hspace apply ] bind: autogen267 
[ pushf: autogen265 pushf: autogen266 pushf: autogen267 ] bind: autogen268 
[ newfunc0 
 pushf: autogen268 or return1 ] bind: rule.space 
[ push: space apply ] bind: autogen269 
[ newfunc0 
 pushf: autogen269 push: * quantified return1 ] bind: rule.spaces 
 push: name pick: rule.name pick: rules boot_dict.set 
 push: expr pick: rule.expr pick: rules boot_dict.set 
 push: exactly pick: rule.exactly pick: rules boot_dict.set 
 push: token pick: rule.token pick: rules boot_dict.set 
 push: escaped_char pick: rule.escaped_char pick: rules boot_dict.set 
 push: apply pick: rule.apply pick: rules boot_dict.set 
 push: parenthesis pick: rule.parenthesis pick: rules boot_dict.set 
 push: output pick: rule.output pick: rules boot_dict.set 
 push: not pick: rule.not pick: rules boot_dict.set 
 push: quantified pick: rule.quantified pick: rules boot_dict.set 
 push: bound pick: rule.bound pick: rules boot_dict.set 
 push: and pick: rule.and pick: rules boot_dict.set 
 push: or pick: rule.or pick: rules boot_dict.set 
 push: rule pick: rule.rule pick: rules boot_dict.set 
 push: grammar pick: rule.grammar pick: rules boot_dict.set 
 push: comment pick: rule.comment pick: rules boot_dict.set 
 push: hspace pick: rule.hspace pick: rules boot_dict.set 
 push: indentation pick: rule.indentation pick: rules boot_dict.set 
 push: space pick: rule.space pick: rules boot_dict.set 
 push: spaces pick: rule.spaces pick: rules boot_dict.set 
 push: letter pick: rule.letter pick: rules boot_dict.set 
 push: digit pick: rule.digit pick: rules boot_dict.set 
 push: anything pick: rule.anything pick: rules boot_dict.set 
 push: exactly pick: flagged attr_call: append 
 push: token pick: flagged attr_call: append 
 push: escaped_char pick: flagged attr_call: append 
 push: apply pick: flagged attr_call: append 
 push: output pick: flagged attr_call: append 
 memoizer.reset 
 push: Running_grammar print 
 printeol 
 push: stage2.pkl save 
 push: stage2.pkl load 
 push:  rule. bind: prefix 
[ newfunc1 assign: root 
 push: Dummy_function_should_not_be_called error return_no_value ] bind: to_flpc2 
[ pick: root printrepr 
  return_no_value2 ] bind: autogen270 
[ 0 pick: root attr_call: get to_flpc2 return_no_value2 ] bind: autogen271 
[ 0 pick: root attr_call: get to_flpc2 return_no_value2 ] bind: autogen272 
[ pick: prefix print 
  0 0 pick: root attr_call: get attr_call: get tprint 
  push: _<-_fun[]:\n____return( print 
  pushi: 3 pick: root attr_call: get to_flpc2 
  push: ) print 
  return_no_value2 ] bind: autogen273 
[ push: out print ] bind: autogen274 
[ pick: name printraw ] bind: autogen275 
[ push: [ print ] bind: autogen276 
[ push: [ print ] bind: autogen277 
[ check: bracket 1 + assign: bracket ] bind: autogen278 
[ check: bracket 1 + assign: bracket ] bind: autogen279 
[ check: bracket 1 + assign: bracket ] bind: autogen280 
[ pick: child attr: name push: quantifier string_equal pushf: autogen279 if 
  pick: child attr: name push: inline string_equal pushf: autogen280 if ] bind: autogen281 
[ push: [ print ] bind: autogen282 
[ push: ] print ] bind: autogen283 
[ push: _ print ] bind: autogen284 
[ pick: l pick: i - pick: root attr_call: get assign: child 
  0 assign: bracket 
   pick: child pick: node_class is_instance not pushf: autogen278 pushf: autogen281 if-else 
   pick: bracket not pushf: autogen282 if 
  s21 assign: child assign: bracket 
  check: child to_flpc2 
  check: bracket not pushf: autogen283 if 
  check: i 1 - assign: i 
  pick: i pushf: autogen284 if ] bind: autogen285 
[ push: ] print ] bind: autogen286 
[ push: ] print ] bind: autogen287 
[ newfunc1 assign: root 
  pick: root pick: node_class is_instance not pushf: autogen270 if 
  pick: root attr: name assign: name 
   pick: name push: quantifier string_equal pushf: autogen271 if 
   pick: name push: inline string_equal pushf: autogen272 if 
   pick: name push: rule string_equal pushf: autogen273 if 
  pick: name push: output string_equal pushf: autogen274 pushf: autogen275 if-else 
  push: ( print 
   pick: name push: and string_equal pushf: autogen276 if 
   pick: name push: or string_equal pushf: autogen277 if 
  pick: root attr: len assign: l 
  pick: l assign: i 
   pushf: autogen285 repeat_if 
   pick: name push: and string_equal pushf: autogen286 if 
   pick: name push: or string_equal pushf: autogen287 if 
  push: ) print 
 return_no_value ] rebind: to_flpc2 
[ pick: l pick: i - pick: root attr_call: get to_flpc2 
  printeol 
  printeol 
  check: i 1 - assign: i ] bind: autogen288 
[ pick: l pick: i - pick: root attr_call: get assign: child 
  push: boot\udict.set(" print 
  0 0 pick: child attr_call: get attr_call: get tprint 
  push: "_ print 
  pick: prefix print 
  0 0 pick: child attr_call: get attr_call: get tprint 
  push: _rules) print 
  printeol 
  check: child drop1 
  check: i 1 - assign: i ] bind: autogen289 
[ newfunc1 assign: root 
  pick: root attr: len assign: l 
  pick: l assign: i 
  pushf: autogen288 repeat_if 
  pick: root attr: len assign: l 
  pick: l assign: i 
  pushf: autogen289 repeat_if 
 return_no_value ] bind: to_flpc2_grammar 
 push: grammar apply assign: output 
 pick: output attr_call: print 
 push: Writing_stage4.flpc print 
 printeol 
 pick: output to_flpc2_grammar 