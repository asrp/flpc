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
 push: stage2.pkl load 
 push:  rule. bind: prefix 
[ newfunc1 assign: root 
 push: Dummy_function_should_not_be_called error return_no_value ] bind: to_flpc2 
[ pick: root printrepr 
  return_no_value2 ] bind: autogen101 
[ 0 pick: root attr_call: get to_flpc2 return_no_value2 ] bind: autogen102 
[ 0 pick: root attr_call: get to_flpc2 return_no_value2 ] bind: autogen103 
[ pick: prefix print 
  0 0 pick: root attr_call: get attr_call: get tprint 
  push: _<-_fun[]:\n____return( print 
  pushi: 3 pick: root attr_call: get to_flpc2 
  push: ) print 
  return_no_value2 ] bind: autogen104 
[ push: out print ] bind: autogen105 
[ pick: name printraw ] bind: autogen106 
[ push: [ print ] bind: autogen107 
[ push: [ print ] bind: autogen108 
[ check: bracket 1 + assign: bracket ] bind: autogen109 
[ check: bracket 1 + assign: bracket ] bind: autogen110 
[ check: bracket 1 + assign: bracket ] bind: autogen111 
[ pick: child attr: name push: quantifier string_equal pushf: autogen110 if 
  pick: child attr: name push: inline string_equal pushf: autogen111 if ] bind: autogen112 
[ push: [ print ] bind: autogen113 
[ push: ] print ] bind: autogen114 
[ push: _ print ] bind: autogen115 
[ pick: l pick: i - pick: root attr_call: get assign: child 
  0 assign: bracket 
   pick: child pick: node_class is_instance not pushf: autogen109 pushf: autogen112 if-else 
   pick: bracket not pushf: autogen113 if 
  s21 assign: child assign: bracket 
  check: child to_flpc2 
  check: bracket not pushf: autogen114 if 
  check: i 1 - assign: i 
  pick: i pushf: autogen115 if ] bind: autogen116 
[ push: ] print ] bind: autogen117 
[ push: ] print ] bind: autogen118 
[ newfunc1 assign: root 
  pick: root pick: node_class is_instance not pushf: autogen101 if 
  pick: root attr: name assign: name 
   pick: name push: quantifier string_equal pushf: autogen102 if 
   pick: name push: inline string_equal pushf: autogen103 if 
   pick: name push: rule string_equal pushf: autogen104 if 
  pick: name push: output string_equal pushf: autogen105 pushf: autogen106 if-else 
  push: ( print 
   pick: name push: and string_equal pushf: autogen107 if 
   pick: name push: or string_equal pushf: autogen108 if 
  pick: root attr: len assign: l 
  pick: l assign: i 
   pushf: autogen116 repeat_if 
   pick: name push: and string_equal pushf: autogen117 if 
   pick: name push: or string_equal pushf: autogen118 if 
  push: ) print 
 return_no_value ] rebind: to_flpc2 
[ pick: l pick: i - pick: root attr_call: get to_flpc2 
  printeol 
  printeol 
  check: i 1 - assign: i ] bind: autogen119 
[ pick: l pick: i - pick: root attr_call: get assign: child 
  push: boot\udict.set(" print 
  0 0 pick: child attr_call: get attr_call: get tprint 
  push: "_ print 
  pick: prefix print 
  0 0 pick: child attr_call: get attr_call: get tprint 
  push: _rules) print 
  printeol 
  check: child drop1 
  check: i 1 - assign: i ] bind: autogen120 
[ newfunc1 assign: root 
  pick: root attr: len assign: l 
  pick: l assign: i 
  pushf: autogen119 repeat_if 
  pick: root attr: len assign: l 
  pick: l assign: i 
  pushf: autogen120 repeat_if 
 return_no_value ] bind: to_flpc2_grammar 
 0 pick: indentation attr_call: append 
[ None return2 ] bind: autogen121 
[ newfunc0 
  pick: source attr_call: position assign: saved 
  push: hspaces apply make_string assign: s 
  pick: indentation attr_call: top pick: s str_len == pushf: autogen121 if 
  pick: saved pick: source attr_call: position_set 
  push: Different_indent MatchError return1 
 return_no_value ] bind: rule.SAME_INDENT 
[ newfunc0 
  pick: indentation attr_call: pop 
  None return1 
 return_no_value ] bind: rule.DEDENT 
[ pick: saved pick: source attr_call: position_set 
  push: Missing_newline_before_indent MatchError return2 ] bind: autogen122 
[ newfunc0 
  pick: source attr_call: position assign: saved 
  push: NEWLINE apply pick: MatchError_class is_instance pushf: autogen122 if 
  push: hspaces apply make_string assign: s 
  pick: saved pick: source attr_call: position_set 
  pick: s str_len pick: indentation attr_call: append 
  None return1 
 return_no_value ] bind: rule.INDENT 
[ newfunc0 
 None return1 ] bind: rule.void 
[ check: output 1 + memory.get make_string assign: output ] bind: autogen123 
[ push: NAME apply assign: output 
  pick: output pick: node_class is_instance pushf: autogen123 if ] bind: autogen124 
[ push: Not_token_or_EOF MatchError return3 ] bind: autogen125 
[ pick: s pick: source attr_call: startswith assign: output 
  pick: output None == pushf: autogen125 if 
  check: output return2 ] bind: autogen126 
[ pick: output return2 ] bind: autogen127 
[ push: End_of_file MatchError return2 ] bind: autogen128 
[ push: Not_exactly_token MatchError return2 ] bind: autogen129 
[ newfunc1 assign: s 
  pick: source attr_call: position assign: saved 
  push: spaces apply drop1 
   pick: s is_alpha pushf: autogen124 pushf: autogen126 if-else 
   pick: output pick: MatchError_class is_instance pushf: autogen127 if 
   pick: output None == pushf: autogen128 if 
   pick: output pick: s string_equal not pushf: autogen129 if 
  pick: output return1 
 return_no_value ] rebind: token 
 pushi: 100 boot_array pick: rules 1 + memory.set 
 pushi: 100 boot_array pick: rules 2 + memory.set 
 push: letter pick: rule.letter pick: rules boot_dict.set 
 push: digit pick: rule.digit pick: rules boot_dict.set 
 push: anything pick: rule.anything pick: rules boot_dict.set 
 push: INDENT pick: rule.INDENT pick: rules boot_dict.set 
 push: DEDENT pick: rule.DEDENT pick: rules boot_dict.set 
 push: void pick: rule.void pick: rules boot_dict.set 
 push: SAME_INDENT pick: rule.SAME_INDENT pick: rules boot_dict.set 
[ push: # exactly ] bind: autogen130 
[ push: \n exactly ] bind: autogen131 
[ pushf: autogen131 negation ] bind: autogen132 
[ push: anything apply ] bind: autogen133 
[ pushf: autogen132 pushf: autogen133 ] bind: autogen134 
[ pushf: autogen134 and ] bind: autogen135 
[ pushf: autogen135 push: * quantified ] bind: autogen136 
[ pushf: autogen130 pushf: autogen136 ] bind: autogen137 
[ newfunc0 
 pushf: autogen137 and return1 ] bind: rule.comment 
[ push: \s exactly ] bind: autogen138 
[ push: \t exactly ] bind: autogen139 
[ push: comment apply ] bind: autogen140 
[ pushf: autogen138 pushf: autogen139 pushf: autogen140 ] bind: autogen141 
[ newfunc0 
 pushf: autogen141 or return1 ] bind: rule.hspace 
[ push: \n exactly ] bind: autogen142 
[ push: \r exactly ] bind: autogen143 
[ push: hspace apply ] bind: autogen144 
[ pushf: autogen142 pushf: autogen143 pushf: autogen144 ] bind: autogen145 
[ newfunc0 
 pushf: autogen145 or return1 ] bind: rule.space 
[ push: space apply ] bind: autogen146 
[ newfunc0 
 pushf: autogen146 push: * quantified return1 ] bind: rule.spaces 
[ push: space apply ] bind: autogen147 
[ newfunc0 
 pushf: autogen147 push: + quantified return1 ] bind: rule.spacesp 
[ push: \s exactly ] bind: autogen148 
[ push: \t exactly ] bind: autogen149 
[ pushf: autogen148 pushf: autogen149 ] bind: autogen150 
[ pushf: autogen150 or ] bind: autogen151 
[ newfunc0 
 pushf: autogen151 push: * quantified return1 ] bind: rule.hspaces 
[ push: \s exactly ] bind: autogen152 
[ push: \t exactly ] bind: autogen153 
[ pushf: autogen152 pushf: autogen153 ] bind: autogen154 
[ pushf: autogen154 or ] bind: autogen155 
[ newfunc0 
 pushf: autogen155 push: + quantified return1 ] bind: rule.hspacesp 
[ push: hspaces apply ] bind: autogen156 
[ push: comment apply ] bind: autogen157 
[ pushf: autogen157 push: ? quantified ] bind: autogen158 
[ push: \n exactly ] bind: autogen159 
[ push: \r exactly ] bind: autogen160 
[ pushf: autogen159 pushf: autogen160 ] bind: autogen161 
[ pushf: autogen161 or ] bind: autogen162 
[ pushf: autogen156 pushf: autogen158 pushf: autogen162 ] bind: autogen163 
[ pushf: autogen163 and ] bind: autogen164 
[ newfunc0 
 pushf: autogen164 push: EMPTY_LINE bound return1 ] bind: rule.EMPTY_LINE 
[ push: hspaces apply ] bind: autogen165 
[ push: digit apply ] bind: autogen166 
[ pushf: autogen166 push: + quantified ] bind: autogen167 
[ pushf: autogen167 out ] bind: autogen168 
[ pushf: autogen165 pushf: autogen168 ] bind: autogen169 
[ newfunc0 
 pushf: autogen169 and return1 ] bind: rule.NUMBER 
[ push: hspaces apply ] bind: autogen170 
[ push: " exactly ] bind: autogen171 
[ push: " exactly ] bind: autogen172 
[ pushf: autogen172 negation ] bind: autogen173 
[ push: anything apply ] bind: autogen174 
[ pushf: autogen173 pushf: autogen174 ] bind: autogen175 
[ pushf: autogen175 and ] bind: autogen176 
[ pushf: autogen176 push: * quantified ] bind: autogen177 
[ pushf: autogen177 out ] bind: autogen178 
[ push: " exactly ] bind: autogen179 
[ pushf: autogen171 pushf: autogen178 pushf: autogen179 ] bind: autogen180 
[ pushf: autogen180 and ] bind: autogen181 
[ push: ' exactly ] bind: autogen182 
[ push: ' exactly ] bind: autogen183 
[ pushf: autogen183 negation ] bind: autogen184 
[ push: anything apply ] bind: autogen185 
[ pushf: autogen184 pushf: autogen185 ] bind: autogen186 
[ pushf: autogen186 and ] bind: autogen187 
[ pushf: autogen187 push: * quantified ] bind: autogen188 
[ pushf: autogen188 out ] bind: autogen189 
[ push: ' exactly ] bind: autogen190 
[ pushf: autogen182 pushf: autogen189 pushf: autogen190 ] bind: autogen191 
[ pushf: autogen191 and ] bind: autogen192 
[ pushf: autogen181 pushf: autogen192 ] bind: autogen193 
[ pushf: autogen193 or ] bind: autogen194 
[ pushf: autogen170 pushf: autogen194 ] bind: autogen195 
[ newfunc0 
 pushf: autogen195 and return1 ] bind: rule.STRING 
[ push: hspaces apply ] bind: autogen196 
[ push: letter apply ] bind: autogen197 
[ push: _ exactly ] bind: autogen198 
[ pushf: autogen197 pushf: autogen198 ] bind: autogen199 
[ pushf: autogen199 or ] bind: autogen200 
[ push: space apply ] bind: autogen201 
[ pushf: autogen201 negation ] bind: autogen202 
[ push: ( exactly ] bind: autogen203 
[ pushf: autogen203 negation ] bind: autogen204 
[ push: = exactly ] bind: autogen205 
[ pushf: autogen205 negation ] bind: autogen206 
[ push: ) exactly ] bind: autogen207 
[ pushf: autogen207 negation ] bind: autogen208 
[ push: [ exactly ] bind: autogen209 
[ pushf: autogen209 negation ] bind: autogen210 
[ push: ] exactly ] bind: autogen211 
[ pushf: autogen211 negation ] bind: autogen212 
[ push: < exactly ] bind: autogen213 
[ pushf: autogen213 negation ] bind: autogen214 
[ push: : exactly ] bind: autogen215 
[ pushf: autogen215 negation ] bind: autogen216 
[ push: ' exactly ] bind: autogen217 
[ pushf: autogen217 negation ] bind: autogen218 
[ push: anything apply ] bind: autogen219 
[ pushf: autogen202 pushf: autogen204 pushf: autogen206 pushf: autogen208 pushf: autogen210 pushf: autogen212 pushf: autogen214 pushf: autogen216 pushf: autogen218 pushf: autogen219 ] bind: autogen220 
[ pushf: autogen220 and ] bind: autogen221 
[ pushf: autogen221 push: * quantified ] bind: autogen222 
[ pushf: autogen200 pushf: autogen222 ] bind: autogen223 
[ pushf: autogen223 and ] bind: autogen224 
[ pushf: autogen224 out ] bind: autogen225 
[ pushf: autogen196 pushf: autogen225 ] bind: autogen226 
[ newfunc0 
 pushf: autogen226 and return1 ] bind: rule.NAME 
[ push: spaces apply ] bind: autogen227 
[ push: 'F token ] bind: autogen228 
[ pushf: autogen228 negation ] bind: autogen229 
[ push: space apply ] bind: autogen230 
[ pushf: autogen230 negation ] bind: autogen231 
[ push: anything apply ] bind: autogen232 
[ pushf: autogen231 pushf: autogen232 ] bind: autogen233 
[ pushf: autogen233 and ] bind: autogen234 
[ pushf: autogen234 push: * quantified ] bind: autogen235 
[ pushf: autogen235 out ] bind: autogen236 
[ pushf: autogen227 pushf: autogen229 pushf: autogen236 ] bind: autogen237 
[ newfunc0 
 pushf: autogen237 and return1 ] bind: rule.FORTH_NAME 
[ push: + token ] bind: autogen238 
[ push: - token ] bind: autogen239 
[ push: == token ] bind: autogen240 
[ push: < token ] bind: autogen241 
[ push: > token ] bind: autogen242 
[ push: . token ] bind: autogen243 
[ push: in token ] bind: autogen244 
[ pushf: autogen238 pushf: autogen239 pushf: autogen240 pushf: autogen241 pushf: autogen242 pushf: autogen243 pushf: autogen244 ] bind: autogen245 
[ newfunc0 
 pushf: autogen245 or return1 ] bind: rule.bin_op 
[ push: NAME apply ] bind: autogen246 
[ newfunc0 
 pushf: autogen246 push: * quantified return1 ] bind: rule.names 
[ newfunc0 
 push: NAME apply return1 ] bind: rule.variable 
[ push: ` token ] bind: autogen247 
[ push: NAME apply ] bind: autogen248 
[ pushf: autogen248 out ] bind: autogen249 
[ pushf: autogen247 pushf: autogen249 ] bind: autogen250 
[ newfunc0 
 pushf: autogen250 and return1 ] bind: rule.name_quote 
[ push: [ token ] bind: autogen251 
[ push: suite apply ] bind: autogen252 
[ pushf: autogen252 out ] bind: autogen253 
[ push: ] token ] bind: autogen254 
[ pushf: autogen251 pushf: autogen253 pushf: autogen254 ] bind: autogen255 
[ newfunc0 
 pushf: autogen255 and return1 ] bind: rule.quote 
[ push: F' token ] bind: autogen256 
[ push: FORTH_NAME apply ] bind: autogen257 
[ pushf: autogen257 push: NAME bound ] bind: autogen258 
[ pushf: autogen258 push: * quantified ] bind: autogen259 
[ pushf: autogen259 out ] bind: autogen260 
[ push: 'F token ] bind: autogen261 
[ pushf: autogen256 pushf: autogen260 pushf: autogen261 ] bind: autogen262 
[ newfunc0 
 pushf: autogen262 and return1 ] bind: rule.forth 
[ push: [ token ] bind: autogen263 
[ push: names apply ] bind: autogen264 
[ pushf: autogen264 out ] bind: autogen265 
[ push: ] token ] bind: autogen266 
[ pushf: autogen263 pushf: autogen265 pushf: autogen266 ] bind: autogen267 
[ newfunc0 
 pushf: autogen267 and return1 ] bind: rule.simple_quote 
[ push: ( token ] bind: autogen268 
[ push: expr apply ] bind: autogen269 
[ pushf: autogen269 out ] bind: autogen270 
[ push: ) token ] bind: autogen271 
[ pushf: autogen268 pushf: autogen270 pushf: autogen271 ] bind: autogen272 
[ newfunc0 
 pushf: autogen272 and return1 ] bind: rule.parenthesis 
[ push: NAME apply ] bind: autogen273 
[ pushf: autogen273 out ] bind: autogen274 
[ push: ( exactly ] bind: autogen275 
[ push: exprs apply ] bind: autogen276 
[ pushf: autogen276 push: parameters bound ] bind: autogen277 
[ pushf: autogen277 out ] bind: autogen278 
[ push: ) token ] bind: autogen279 
[ pushf: autogen274 pushf: autogen275 pushf: autogen278 pushf: autogen279 ] bind: autogen280 
[ newfunc0 
 pushf: autogen280 and return1 ] bind: rule.func_call 
[ push: NAME apply ] bind: autogen281 
[ push: simple_quote apply ] bind: autogen282 
[ push: non_block apply ] bind: autogen283 
[ push: void apply ] bind: autogen284 
[ pushf: autogen282 pushf: autogen283 pushf: autogen284 ] bind: autogen285 
[ pushf: autogen285 or ] bind: autogen286 
[ pushf: autogen286 out ] bind: autogen287 
[ push: : token ] bind: autogen288 
[ push: suite apply ] bind: autogen289 
[ pushf: autogen289 push: quote bound ] bind: autogen290 
[ pushf: autogen290 out ] bind: autogen291 
[ pushf: autogen287 pushf: autogen288 pushf: autogen291 ] bind: autogen292 
[ pushf: autogen292 and ] bind: autogen293 
[ pushf: autogen293 push: parameters bound ] bind: autogen294 
[ pushf: autogen281 pushf: autogen294 ] bind: autogen295 
[ newfunc0 
 pushf: autogen295 and return1 ] bind: rule.block_call 
[ push: block_call apply ] bind: autogen296 
[ push: NEWLINE apply ] bind: autogen297 
[ push: SAME_INDENT apply ] bind: autogen298 
[ push: block_call apply ] bind: autogen299 
[ pushf: autogen299 out ] bind: autogen300 
[ pushf: autogen297 pushf: autogen298 pushf: autogen300 ] bind: autogen301 
[ pushf: autogen301 and ] bind: autogen302 
[ pushf: autogen302 push: + quantified ] bind: autogen303 
[ pushf: autogen296 pushf: autogen303 ] bind: autogen304 
[ newfunc0 
 pushf: autogen304 and return1 ] bind: rule.multi_block_call 
[ push: forth apply ] bind: autogen305 
[ push: func_call apply ] bind: autogen306 
[ push: name_quote apply ] bind: autogen307 
[ push: quote apply ] bind: autogen308 
[ push: parenthesis apply ] bind: autogen309 
[ push: NUMBER apply ] bind: autogen310 
[ push: STRING apply ] bind: autogen311 
[ push: variable apply ] bind: autogen312 
[ pushf: autogen305 pushf: autogen306 pushf: autogen307 pushf: autogen308 pushf: autogen309 pushf: autogen310 pushf: autogen311 pushf: autogen312 ] bind: autogen313 
[ newfunc0 
 pushf: autogen313 or return1 ] bind: rule.non_block_non_infix 
[ push: infix apply ] bind: autogen314 
[ push: non_block_non_infix apply ] bind: autogen315 
[ pushf: autogen314 pushf: autogen315 ] bind: autogen316 
[ newfunc0 
 pushf: autogen316 or return1 ] bind: rule.non_block 
[ push: non_block_non_infix apply ] bind: autogen317 
[ push: bin_op apply ] bind: autogen318 
[ pushf: autogen318 push: op bound ] bind: autogen319 
[ push: non_block_non_infix apply ] bind: autogen320 
[ pushf: autogen319 pushf: autogen320 ] bind: autogen321 
[ pushf: autogen321 and ] bind: autogen322 
[ pushf: autogen322 push: + quantified ] bind: autogen323 
[ pushf: autogen317 pushf: autogen323 ] bind: autogen324 
[ newfunc0 
 pushf: autogen324 and return1 ] bind: rule.infix 
[ push: block_call apply ] bind: autogen325 
[ push: non_block_non_infix apply ] bind: autogen326 
[ pushf: autogen325 pushf: autogen326 ] bind: autogen327 
[ newfunc0 
 pushf: autogen327 or return1 ] bind: rule.non_infix 
[ push: infix apply ] bind: autogen328 
[ push: non_infix apply ] bind: autogen329 
[ pushf: autogen328 pushf: autogen329 ] bind: autogen330 
[ newfunc0 
 pushf: autogen330 or return1 ] bind: rule.expr 
[ push: expr apply ] bind: autogen331 
[ push: spacesp apply ] bind: autogen332 
[ push: expr apply ] bind: autogen333 
[ pushf: autogen333 out ] bind: autogen334 
[ pushf: autogen332 pushf: autogen334 ] bind: autogen335 
[ pushf: autogen335 and ] bind: autogen336 
[ pushf: autogen336 push: * quantified ] bind: autogen337 
[ pushf: autogen331 pushf: autogen337 ] bind: autogen338 
[ pushf: autogen338 and ] bind: autogen339 
[ push: void apply ] bind: autogen340 
[ pushf: autogen339 pushf: autogen340 ] bind: autogen341 
[ newfunc0 
 pushf: autogen341 or return1 ] bind: rule.exprs 
[ push: expr apply ] bind: autogen342 
[ push: hspacesp apply ] bind: autogen343 
[ push: expr apply ] bind: autogen344 
[ pushf: autogen344 out ] bind: autogen345 
[ pushf: autogen343 pushf: autogen345 ] bind: autogen346 
[ pushf: autogen346 and ] bind: autogen347 
[ pushf: autogen347 push: * quantified ] bind: autogen348 
[ pushf: autogen342 pushf: autogen348 ] bind: autogen349 
[ newfunc0 
 pushf: autogen349 and return1 ] bind: rule.exprsp 
[ push: names apply ] bind: autogen350 
[ pushf: autogen350 out ] bind: autogen351 
[ push: = token ] bind: autogen352 
[ push: space apply ] bind: autogen353 
[ pushf: autogen351 pushf: autogen352 pushf: autogen353 ] bind: autogen354 
[ pushf: autogen354 and ] bind: autogen355 
[ push: void apply ] bind: autogen356 
[ pushf: autogen355 pushf: autogen356 ] bind: autogen357 
[ pushf: autogen357 or ] bind: autogen358 
[ push: exprsp apply ] bind: autogen359 
[ pushf: autogen358 pushf: autogen359 ] bind: autogen360 
[ newfunc0 
 pushf: autogen360 and return1 ] bind: rule.assign 
[ push: names apply ] bind: autogen361 
[ pushf: autogen361 out ] bind: autogen362 
[ push: <- token ] bind: autogen363 
[ push: exprsp apply ] bind: autogen364 
[ pushf: autogen364 out ] bind: autogen365 
[ pushf: autogen362 pushf: autogen363 pushf: autogen365 ] bind: autogen366 
[ newfunc0 
 pushf: autogen366 and return1 ] bind: rule.bind 
[ push: multi_block_call apply ] bind: autogen367 
[ push: bind apply ] bind: autogen368 
[ push: assign apply ] bind: autogen369 
[ pushf: autogen367 pushf: autogen368 pushf: autogen369 ] bind: autogen370 
[ newfunc0 
 pushf: autogen370 or return1 ] bind: rule.statement 
[ push: INDENT apply ] bind: autogen371 
[ push: NEWLINE apply ] bind: autogen372 
[ pushf: autogen372 push: + quantified ] bind: autogen373 
[ push: SAME_INDENT apply ] bind: autogen374 
[ push: statement apply ] bind: autogen375 
[ pushf: autogen373 pushf: autogen374 pushf: autogen375 ] bind: autogen376 
[ pushf: autogen376 and ] bind: autogen377 
[ pushf: autogen377 push: + quantified ] bind: autogen378 
[ push: DEDENT apply ] bind: autogen379 
[ pushf: autogen371 pushf: autogen378 pushf: autogen379 ] bind: autogen380 
[ pushf: autogen380 and ] bind: autogen381 
[ push: statement apply ] bind: autogen382 
[ pushf: autogen381 pushf: autogen382 ] bind: autogen383 
[ newfunc0 
 pushf: autogen383 or return1 ] bind: rule.suite 
[ push: hspaces apply ] bind: autogen384 
[ push: \n exactly ] bind: autogen385 
[ push: \r exactly ] bind: autogen386 
[ pushf: autogen385 pushf: autogen386 ] bind: autogen387 
[ pushf: autogen387 or ] bind: autogen388 
[ pick: None out ] bind: autogen389 
[ pushf: autogen384 pushf: autogen388 pushf: autogen389 ] bind: autogen390 
[ pushf: autogen390 and ] bind: autogen391 
[ push: COMMENT_LINE apply ] bind: autogen392 
[ pushf: autogen391 pushf: autogen392 ] bind: autogen393 
[ newfunc0 
 pushf: autogen393 or return1 ] bind: rule.NEWLINE 
[ push: hspaces apply ] bind: autogen394 
[ push: comment apply ] bind: autogen395 
[ pushf: autogen395 out ] bind: autogen396 
[ push: hspaces apply ] bind: autogen397 
[ push: \n exactly ] bind: autogen398 
[ push: \r exactly ] bind: autogen399 
[ pushf: autogen398 pushf: autogen399 ] bind: autogen400 
[ pushf: autogen400 or ] bind: autogen401 
[ pushf: autogen394 pushf: autogen396 pushf: autogen397 pushf: autogen401 ] bind: autogen402 
[ newfunc0 
 pushf: autogen402 and return1 ] bind: rule.COMMENT_LINE 
[ newfunc0 
 push: suite apply return1 ] bind: rule.grammar 
 push: comment pick: rule.comment pick: rules boot_dict.set 
 push: hspace pick: rule.hspace pick: rules boot_dict.set 
 push: space pick: rule.space pick: rules boot_dict.set 
 push: spaces pick: rule.spaces pick: rules boot_dict.set 
 push: spacesp pick: rule.spacesp pick: rules boot_dict.set 
 push: hspaces pick: rule.hspaces pick: rules boot_dict.set 
 push: hspacesp pick: rule.hspacesp pick: rules boot_dict.set 
 push: EMPTY_LINE pick: rule.EMPTY_LINE pick: rules boot_dict.set 
 push: NUMBER pick: rule.NUMBER pick: rules boot_dict.set 
 push: STRING pick: rule.STRING pick: rules boot_dict.set 
 push: NAME pick: rule.NAME pick: rules boot_dict.set 
 push: FORTH_NAME pick: rule.FORTH_NAME pick: rules boot_dict.set 
 push: bin_op pick: rule.bin_op pick: rules boot_dict.set 
 push: names pick: rule.names pick: rules boot_dict.set 
 push: variable pick: rule.variable pick: rules boot_dict.set 
 push: name_quote pick: rule.name_quote pick: rules boot_dict.set 
 push: quote pick: rule.quote pick: rules boot_dict.set 
 push: forth pick: rule.forth pick: rules boot_dict.set 
 push: simple_quote pick: rule.simple_quote pick: rules boot_dict.set 
 push: parenthesis pick: rule.parenthesis pick: rules boot_dict.set 
 push: func_call pick: rule.func_call pick: rules boot_dict.set 
 push: block_call pick: rule.block_call pick: rules boot_dict.set 
 push: multi_block_call pick: rule.multi_block_call pick: rules boot_dict.set 
 push: non_block_non_infix pick: rule.non_block_non_infix pick: rules boot_dict.set 
 push: non_block pick: rule.non_block pick: rules boot_dict.set 
 push: infix pick: rule.infix pick: rules boot_dict.set 
 push: non_infix pick: rule.non_infix pick: rules boot_dict.set 
 push: expr pick: rule.expr pick: rules boot_dict.set 
 push: exprs pick: rule.exprs pick: rules boot_dict.set 
 push: exprsp pick: rule.exprsp pick: rules boot_dict.set 
 push: assign pick: rule.assign pick: rules boot_dict.set 
 push: bind pick: rule.bind pick: rules boot_dict.set 
 push: statement pick: rule.statement pick: rules boot_dict.set 
 push: suite pick: rule.suite pick: rules boot_dict.set 
 push: NEWLINE pick: rule.NEWLINE pick: rules boot_dict.set 
 push: COMMENT_LINE pick: rule.COMMENT_LINE pick: rules boot_dict.set 
 push: grammar pick: rule.grammar pick: rules boot_dict.set 
 push: letter pick: rule.letter pick: rules boot_dict.set 
 push: digit pick: rule.digit pick: rules boot_dict.set 
 push: anything pick: rule.anything pick: rules boot_dict.set 
 push: EMPTY_LINE pick: flagged attr_call: append 
 push: NUMBER pick: flagged attr_call: append 
 push: STRING pick: flagged attr_call: append 
 push: NAME pick: flagged attr_call: append 
 push: names pick: flagged attr_call: append 
 push: variable pick: flagged attr_call: append 
 push: name_quote pick: flagged attr_call: append 
 push: quote pick: flagged attr_call: append 
 push: simple_quote pick: flagged attr_call: append 
 push: bind pick: flagged attr_call: append 
 memoizer.reset 
 push: flpc_grammar.pkl save 
 push: flpc_grammar.pkl load 
 push: lib/stage1.flpc Input pick: source_index memory.set 
 memoizer.reset 
 push: Running_flpc_grammar print 
 printeol 
 push: grammar apply assign: output 
 pick: output attr_call: print 
 push: flpc_parsed.pkl save 
 push: flpc_parsed.pkl load 
[ printspace 
  check: i 1 - assign: i ] bind: autogen403 
[ newfunc1 assign: indent 
  pick: indent assign: i 
  pushf: autogen403 repeat_if 
 return_no_value ] bind: print_indent 
[ newfunc2 assign: self assign: indent 
 push: Dummy_function error return_no_value ] bind: pprint 
[ pick: indent 2 + pick: child pprint ] bind: autogen404 
[ pick: indent 2 + print_indent 
  push: str_' print 
  pick: child printraw 
  push: ' print 
  printeol ] bind: autogen405 
[ pick: child str_len 0 > pushf: autogen405 if ] bind: autogen406 
[ pick: child is_str pushf: autogen406 if ] bind: autogen407 
[ newfunc2 assign: child assign: indent 
 pick: child pick: node_class is_instance pushf: autogen404 pushf: autogen407 if-else return_no_value ] bind: print_child 
[ pick: indent 0 pick: self attr: children attr_call: get pprint 
  return_no_value2 ] bind: autogen408 
[ check: bad 1 + assign: bad ] bind: autogen409 
[ check: child str_len 0 == pushf: autogen409 if ] bind: autogen410 
[ check: child drop1 ] bind: autogen411 
[ check: bad 1 + assign: bad ] bind: autogen412 
[ check: child str_len 0 == pushf: autogen412 if ] bind: autogen413 
[ 1 pick: self attr: children attr_call: get assign: child 
  pick: child is_str pushf: autogen410 pushf: autogen411 if-else 
  0 pick: self attr: children attr_call: get assign: child 
  pick: child is_str pushf: autogen413 if ] bind: autogen414 
[ pick: self attr: children attr: len 2 == pushf: autogen414 if ] bind: autogen415 
[ pick: indent 0 pick: self attr: children attr_call: get pprint 
  None return3 ] bind: autogen416 
[ pick: bad pushf: autogen416 if ] bind: autogen417 
[ pick: indent 1 pick: self attr: children attr_call: get pprint 
  None return3 ] bind: autogen418 
[ pick: bad pushf: autogen418 if ] bind: autogen419 
[ pick: indent pick: children print_child ] bind: autogen420 
[ pick: indent pick: l pick: i - pick: children attr_call: get print_child 
  check: i 1 - assign: i ] bind: autogen421 
[ pick: children attr: len assign: l 
  pick: l assign: i 
  pushf: autogen421 repeat_if ] bind: autogen422 
[ newfunc2 assign: self assign: indent 
  pick: self attr: name push: exprsp string_equal pushf: autogen408 if 
  pick: False assign: bad 
   pick: self attr: children pick: resizable_class is_instance pushf: autogen415 if 
   pick: self attr: name push: exprs string_equal pushf: autogen417 if 
   pick: self attr: name push: suite string_equal pushf: autogen419 if 
  pick: indent print_indent 
  pick: self attr: name printraw 
  printeol 
  pick: self attr: children assign: children 
  pick: self attr: children pick: resizable_class is_instance not pushf: autogen420 pushf: autogen422 if-else 
 return_no_value ] rebind: pprint 
 0 pick: output pprint 