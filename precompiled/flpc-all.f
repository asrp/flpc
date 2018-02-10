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
[ newfunc3 assign: searcher assign: receiver assign: name 
 push: Dummy_function_should_not_be_called error return_no_value ] bind: obj.attrib 
[ pick: name pick: searcher attr: parent pick: receiver obj.attrib return2 ] bind: autogen23 
[ newfunc3 assign: searcher assign: receiver assign: name 
  pick: name pick: searcher 2 - memory.get boot_dict.get assign: func 
  pick: func None == pushf: autogen23 if 
  pick: func return1 
 return_no_value ] rebind: obj.attrib 
[ newfunc1 assign: self 
  pushi: 20 pick: boot_dict_class attr_call: instance assign: attr 
  push: parent pick: self pick: attr attr_call: set 
  push: attr pick: attr pick: attr attr_call: set 
  pick: self attr: parent attr_call: instance assign: new_obj 
  pick: attr pick: new_obj 2 - memory.set 
  pick: new_obj return1 
 return_no_value ] bind: obj.instance 
[ newfunc3 assign: self assign: value assign: key 
 pick: key pick: value pick: self attr: attr attr_call: set return1 ] bind: obj.set_attr 
[ newfunc2 assign: self assign: name 
 pick: name pick: self pick: self obj.attrib return1 ] bind: obj_getattr 
[ newfunc1 assign: attr 
  pick: attr memory.append 
  pick: obj.attrib memory.append 
  push: ] names.get memory.append 
  memory.len 1 - Pointer return1 
 return_no_value ] bind: null_newobj.instance 
 1 pick: boot_dict_class attr_call: instance assign: null_attr 
 push: instance pick: null_newobj.instance pick: null_attr attr_call: set 
 check: null_attr null_newobj.instance bind: null_newobj 
 pushi: 10 pick: boot_dict_class attr_call: instance assign: attr 
 push: parent pick: null_newobj pick: attr attr_call: set 
 push: instance pick: obj.instance pick: attr attr_call: set 
 push: set_attr pick: obj.set_attr pick: attr attr_call: set 
 push: attr pick: attr pick: attr attr_call: set 
 check: attr null_newobj.instance bind: obj_class 
[ newfunc2 assign: self assign: length 
  pick: length pick: boot_array_class attr_call: instance" assign: keys 
  pick: length pick: boot_array_class attr_call: instance assign: values 
  pick: self attr: parent attr_call: instance assign: new_obj 
  pick: new_obj attr: attr assign: attr 
  push: parent pick: self pick: attr attr_call: set 
  push: len 0 pick: attr attr_call: set 
  push: keys pick: keys pick: attr attr_call: set 
  push: values pick: values pick: attr attr_call: set 
  pick: new_obj return1 
 return_no_value ] bind: dict.instance 
[ newfunc2 assign: self assign: key 
  pick: key pick: self attr: keys boot_array.string_index assign: index 
  pick: index None == None return_if 
  pick: index pick: self attr: values boot_array.get return1 
 return_no_value ] bind: dict.get 
[ newfunc3 assign: self assign: value assign: key 
  pick: self attr: len assign: l 
  pick: l pick: key pick: self attr: keys boot_array.set 
  pick: l pick: value pick: self attr: values boot_array.set 
  pick: self attr_call: increase 
 return_no_value ] bind: dict.set 
[ newfunc1 assign: self 
 push: len pick: self attr: len 1 + pick: self attr_call: set_attr return_no_value ] bind: dict.increase 
 pushi: 1000 pick: boot_dict_class attr_call: instance bind: names 
[ None return3 ] bind: autogen24 
[ pick: index pick: end > pushf: autogen24 if 
  pick: index memory.get pick: index pushi: 3 + memory.get pick: names attr_call: set 
  check: index pushi: 7 + assign: index ] bind: autogen25 
[ newfunc0 
  functions.end assign: end 
  pick: names.get pushi: 5 + assign: index 
  pushf: autogen25 repeat 
 return_no_value ] bind: convert_names 
[ push: lookup_error error ] bind: autogen26 
[ newfunc1 assign: name 
  pick: name pick: names attr_call: get assign: value 
  pick: value None == pushf: autogen26 if 
  pick: value return1 
 return_no_value ] bind: names.get 
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
[ pick: self resizable.double ] bind: autogen27 
[ newfunc2 assign: self assign: value 
  pick: self memory.get pick: self resizable.max_len < not pushf: autogen27 if 
  pick: self memory.get pick: value pick: self resizable.set 
  pick: self resizable.increase 
 return_no_value ] bind: resizable.append 
[ pick: l pick: i - pick: other resizable.get pick: self resizable.append 
  check: i 1 - assign: i ] bind: autogen28 
[ newfunc2 assign: self assign: other 
  pick: other attr: len assign: l 
  pick: l assign: i 
  pushf: autogen28 repeat_if 
 return_no_value ] bind: resizable.extend 
[ return_no_value2 ] bind: autogen29 
[ pick: value pick: self resizable.extend ] bind: autogen30 
[ pick: value pick: self resizable.append ] bind: autogen31 
[ newfunc2 assign: self assign: value 
  pick: value None == pushf: autogen29 if 
  pick: value pick: resizable_class is_instance pushf: autogen30 pushf: autogen31 if-else 
 return_no_value ] bind: resizable.append_array 
[ newfunc1 assign: self 
  pick: self memory.get 1 - pick: self memory.set 
  pick: self memory.get pick: self resizable.get return1 
 return_no_value ] bind: resizable.pop 
[ newfunc1 assign: self 
 pick: self memory.get 1 - pick: self resizable.get return1 ] bind: resizable.top 
[ pick: l pick: i - pick: self resizable.get tprint 
  printspace 
  check: i 1 - assign: i ] bind: autogen32 
[ newfunc1 assign: self 
  push: {_ print 
  pick: self memory.get assign: l 
  pick: l assign: i 
  pushf: autogen32 repeat_if 
  push: } print 
 return_no_value ] bind: resizable.print 
[ push: Resizable_looking_up_ print 
  pick: name print 
  printeol ] bind: autogen33 
[ newfunc3 assign: searcher assign: receiver assign: name 
  pick: lookup_print pushf: autogen33 if 
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
[ pick: key pick: children resizable.get return2 ] bind: autogen34 
[ pick: children return3 ] bind: autogen35 
[ pick: key 0 == pushf: autogen35 if 
  push: Out_of_bound_index error ] bind: autogen36 
[ newfunc2 assign: self assign: key 
  pick: self 1 + memory.get assign: children 
  pick: children pick: resizable_class is_instance pushf: autogen34 pushf: autogen36 if-else 
 return_no_value ] bind: node.get 
[ newfunc1 assign: self 
  pick: self memory.get printraw 
  push: { print 
  pick: self 1 + memory.get tprint 
  push: } print 
 return_no_value ] bind: node.print 
[ pick: children memory.get return2 ] bind: autogen37 
[ 1 return2 ] bind: autogen38 
[ newfunc1 assign: self 
  pick: self 1 + memory.get assign: children 
  pick: children pick: resizable_class is_instance pushf: autogen37 pushf: autogen38 if-else 
 return_no_value ] bind: node.len 
[ newfunc2 assign: self assign: new_name 
 pick: new_name pick: receiver memory.set return_no_value ] bind: node.name_set 
[ push: Node_looking_up_ print 
  pick: name print 
  printeol ] bind: autogen39 
[ newfunc3 assign: searcher assign: receiver assign: name 
  pick: lookup_print pushf: autogen39 if 
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
  printeol ] bind: autogen40 
[ newfunc3 assign: searcher assign: receiver assign: name 
  pick: lookup_print pushf: autogen40 if 
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
  printeol ] bind: autogen41 
[ newfunc3 assign: searcher assign: receiver assign: name 
  pick: lookup_print pushf: autogen41 if 
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
  printeol ] bind: autogen42 
[ newfunc3 assign: searcher assign: receiver assign: name 
  pick: lookup_print pushf: autogen42 if 
  pick: name push: instance string_equal pick: MatchError.instance return_if 
  pick: name push: print string_equal pick: MatchError.print return_if 
  pick: name push: type string_equal push: MatchError return_if 
  pick: name pick: receiver pick: searcher instance_attrib return1 
 return_no_value ] bind: MatchError.attrib 
 pick: MatchError.attrib pick: boot_obj attr_call: subclass bind: MatchError_class 
 pick: MatchError_class attr: instance pick: MatchError_class closure bind: MatchError 
[ push: End_of_file MatchError return2 ] bind: autogen43 
[ push: Not_exactly MatchError return2 ] bind: autogen44 
[ newfunc1 assign: char 
  pick: source attr_call: next_char assign: input_char 
   pick: input_char None == pushf: autogen43 if 
   pick: char pick: input_char string_equal not pushf: autogen44 if 
  check: input_char return1 
 return_no_value ] bind: exactly 
[ push: End_of_file MatchError return2 ] bind: autogen45 
[ push: Not_between MatchError return2 ] bind: autogen46 
[ newfunc2 assign: end assign: start 
  pick: source attr_call: next_char assign: input_char 
   pick: input_char None == pushf: autogen45 if 
   pick: start pick: end pick: input_char char_between not pushf: autogen46 if 
  check: input_char return1 
 return_no_value ] bind: between 
[ push: End_of_file MatchError return2 ] bind: autogen47 
[ push: Not_exactly MatchError return2 ] bind: autogen48 
[ newfunc1 assign: char 
  pick: source attr_call: next assign: input_char 
   pick: input_char None == pushf: autogen47 if 
   pick: char pick: input_char string_equal not pushf: autogen48 if 
  check: input_char return1 
 return_no_value ] bind: token 
[ 0 0 return_two2 ] bind: autogen49 
[ newfunc1 assign: children 
  pick: children memory.get pick: end_of_func == pushf: autogen49 if 
  pick: children 2 + pick: children 1 + memory.get return_two1 
 return_no_value ] bind: next_child 
[ check: output return3 ] bind: autogen50 
[ check: child call assign: output 
  pick: output pick: MatchError_class is_instance not pushf: autogen50 if 
  check: output drop1 
  pick: saved pick: source attr_call: position_set 
  check: children next_child assign: child assign: children ] bind: autogen51 
[ newfunc1 assign: children 
  pick: source attr_call: position assign: saved 
  s21 assign: children assign: saved 
  check: children next_child assign: child assign: children 
  pushf: autogen51 repeat_if 
  push: No_OR_child_matches MatchError return1 
 return_no_value ] bind: or 
[ check: output return2 ] bind: autogen52 
[ newfunc1 assign: child 
  check: child call assign: output 
  pick: output pick: MatchError_class is_instance pushf: autogen52 if 
  push: out pick: output node return1 
 return_no_value ] bind: out 
[ pick: output attr: name push: out string_equal return2 ] bind: autogen53 
[ newfunc1 assign: output 
  pick: output pick: node_class is_instance pushf: autogen53 if 
  pick: False return1 
 return_no_value ] bind: is_output 
[ pick: outputs return3 ] bind: autogen54 
[ pick: outputs attr: array 1 + pick: length str_join return4 ] bind: autogen55 
[ pick: output str_len 1 == pushf: autogen55 if ] bind: autogen56 
[ pick: output return3 ] bind: autogen57 
[ pick: outputs attr: len assign: length 
  pick: length 0 == pushf: autogen54 if 
  0 pick: outputs attr_call: get assign: output 
   pick: output is_str pushf: autogen56 if 
   pick: length 1 == pushf: autogen57 if ] bind: autogen58 
[ pick: outputs attr: children return4 ] bind: autogen59 
[ pick: outputs attr: children is_str pushf: autogen59 if ] bind: autogen60 
[ pick: outputs pick: node_class is_instance pushf: autogen60 if ] bind: autogen61 
[ newfunc1 assign: outputs 
  pick: outputs pick: resizable_class is_instance pushf: autogen58 pushf: autogen61 if-else 
  pick: outputs return1 
 return_no_value ] bind: make_string 
[ pick: saved pick: source attr_call: position_set 
  push: And_match_failed MatchError return3 ] bind: autogen62 
[ pick: output attr: children pick: outputs attr_call: append_array ] bind: autogen63 
[ pick: output is_output pushf: autogen63 if 
  check: output drop1 ] bind: autogen64 
[ 0 resizable assign: outputs 
  pick: output attr: children pick: outputs attr_call: append_array 
  pick: True assign: output_mode 
  s4127 assign: children assign: output_mode assign: outputs ] bind: autogen65 
[ pick: output pick: outputs attr_call: append_array 
  check: output drop1 ] bind: autogen66 
[ pick: output is_output pushf: autogen65 pushf: autogen66 if-else ] bind: autogen67 
[ check: child call assign: output 
  pick: output pick: MatchError_class is_instance pushf: autogen62 if 
  pick: output_mode pushf: autogen64 pushf: autogen67 if-else 
  check: children next_child assign: child assign: children ] bind: autogen68 
[ newfunc1 assign: init_children 
  pick: source attr_call: position assign: saved 
  0 resizable assign: outputs 
  pick: False assign: output_mode 
  pick: init_children assign: children 
  check: children next_child assign: child assign: children 
  pushf: autogen68 repeat_if 
  pick: outputs make_string return1 
 return_no_value ] bind: and 
[ 0 c.infinity return_two2 ] bind: autogen69 
[ 1 c.infinity return_two2 ] bind: autogen70 
[ 0 1 return_two2 ] bind: autogen71 
[ newfunc1 assign: quantifier 
   pick: quantifier push: * string_equal pushf: autogen69 if 
   pick: quantifier push: + string_equal pushf: autogen70 if 
   pick: quantifier push: ? string_equal pushf: autogen71 if 
  push: Unknown_quantifier error 
 return_no_value ] bind: get_bounds 
[ pick: start_saved pick: source attr_call: position_set 
  push: Quantified_undermatch MatchError return4 ] bind: autogen72 
[ pick: count pick: lower < pushf: autogen72 if 
  pick: saved pick: source attr_call: position_set 
  pick: outputs make_string return3 ] bind: autogen73 
[ pick: outputs make_string return3 ] bind: autogen74 
[ pick: source attr_call: position assign: saved 
  pick: child call assign: output 
  pick: output pick: MatchError_class is_instance pushf: autogen73 if 
  check: output pick: outputs attr_call: append_array 
  check: saved drop1 
  check: count 1 + assign: count 
  pick: count pick: upper == pushf: autogen74 if ] bind: autogen75 
[ newfunc2 assign: quantifier assign: child 
  check: quantifier get_bounds assign: upper assign: lower 
  0 resizable assign: outputs 
  pick: source attr_call: position assign: start_saved 
  0 assign: count 
  pushf: autogen75 repeat 
 return_no_value ] bind: quantified 
[ None return2 ] bind: autogen76 
[ newfunc1 assign: child 
  pick: source attr_call: position assign: saved 
  s21 assign: child assign: saved 
  check: child call assign: output 
  pick: saved pick: source attr_call: position_set 
  pick: output pick: MatchError_class is_instance pushf: autogen76 if 
  push: Negation_is_true MatchError return1 
 return_no_value ] bind: negation 
[ pick: output return2 ] bind: autogen77 
[ newfunc2 assign: name assign: child 
  pick: child call assign: output 
  pick: output pick: MatchError_class is_instance pushf: autogen77 if 
  pick: name pick: output node return1 
 return_no_value ] bind: bound 
 0 resizable bind: flagged 
[ pick: output attr: len 1 > return2 ] bind: autogen78 
[ newfunc1 assign: output 
  pick: output pick: resizable_class is_instance pushf: autogen78 if 
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
  check: i 1 - assign: i ] bind: autogen79 
[ pick: nesting assign: i 
  pushf: autogen79 repeat_if 
  pick: name print 
  printspace 
  pick: source attr_call: position tprint 
  printeol ] bind: autogen80 
[ printspace 
  check: i 1 - assign: i ] bind: autogen81 
[ pick: nesting assign: i 
  pushf: autogen81 repeat_if 
  pick: name print 
  printspace 
  pick: source attr_call: position tprint 
  push: _->_ print 
  pick: output tprint 
  printeol ] bind: autogen82 
[ printspace 
  check: i 1 - assign: i ] bind: autogen83 
[ pick: nesting assign: i 
  pushf: autogen83 repeat_if 
  pick: name print 
  push: _->_ print 
  pick: output tprint 
  printeol ] bind: autogen84 
[ pick: output return2 ] bind: autogen85 
[ push: Making_node_ print 
  pick: name printraw 
  printeol 
  pick: name pick: output node return2 ] bind: autogen86 
[ pick: output return2 ] bind: autogen87 
[ newfunc1 assign: name 
  0 pick: nest attr_call: get assign: nesting 
  pick: apply_print pushf: autogen80 if 
  0 pick: nesting 1 + pick: nest attr_call: set 
  pick: name pick: rules boot_dict.get call assign: output 
  0 pick: nesting pick: nest attr_call: set 
   pick: apply_print pushf: autogen82 if 
   pick: name push: statement string_equal pushf: autogen84 if 
   pick: output pick: MatchError_class is_instance pushf: autogen85 if 
   pick: output should_make_node pushf: autogen86 if 
   pick: name pick: flagged attr_call: string_index None == pushf: autogen87 if 
  pick: name pick: output node return1 
 return_no_value ] rebind: _apply 
[ check: new_pos pick: source attr_call: position_set 
  check: mem_out return2 ] bind: autogen88 
[ pick: source attr_call: position assign: saved 
  pick: name _apply assign: output 
  pick: name pick: saved pick: indentation pick: output pick: source attr_call: position memoizer.set 
  check: output return2 ] bind: autogen89 
[ newfunc1 assign: name 
  pick: name pick: source attr_call: position pick: indentation memoizer.get assign: memoized assign: new_pos assign: mem_out 
  check: memoized pushf: autogen88 pushf: autogen89 if-else 
 return_no_value ] bind: apply 
[ push: End_of_file MatchError return2 ] bind: autogen90 
[ newfunc0 
  pick: source attr_call: next_char assign: char 
  pick: char None == pushf: autogen90 if 
  check: char return1 
 return_no_value ] bind: rule.anything 
[ push: a push: z between ] bind: autogen91 
[ push: A push: Z between ] bind: autogen92 
[ pushf: autogen91 pushf: autogen92 ] bind: autogen93 
[ newfunc0 
 pushf: autogen93 or return1 ] bind: rule.letter 
[ newfunc0 
 push: 0 push: 9 between return1 ] bind: rule.digit 
[ push: rule.letter apply ] bind: autogen94 
[ push: _ exactly ] bind: autogen95 
[ pushf: autogen94 pushf: autogen95 ] bind: autogen96 
[ pushf: autogen96 or ] bind: autogen97 
[ push: rule.letter apply ] bind: autogen98 
[ push: rule.digit apply ] bind: autogen99 
[ push: _ exactly ] bind: autogen100 
[ pushf: autogen98 pushf: autogen99 pushf: autogen100 ] bind: autogen101 
[ pushf: autogen101 or ] bind: autogen102 
[ pushf: autogen102 push: * quantified ] bind: autogen103 
[ pushf: autogen97 pushf: autogen103 ] bind: autogen104 
[ newfunc0 
 pushf: autogen104 and return1 ] bind: rule.name 
 functions.end pushi: 5 + assign: source_index 
 push: grammar/flpc.grammar Input bind: source 
[ push: letter apply ] bind: autogen105 
[ push: _ exactly ] bind: autogen106 
[ pushf: autogen105 pushf: autogen106 ] bind: autogen107 
[ pushf: autogen107 or ] bind: autogen108 
[ push: letter apply ] bind: autogen109 
[ push: digit apply ] bind: autogen110 
[ push: _ exactly ] bind: autogen111 
[ pushf: autogen109 pushf: autogen110 pushf: autogen111 ] bind: autogen112 
[ pushf: autogen112 or ] bind: autogen113 
[ pushf: autogen113 push: * quantified ] bind: autogen114 
[ pushf: autogen108 pushf: autogen114 ] bind: autogen115 
[ newfunc0 
 pushf: autogen115 and return1 ] rebind: rule.name 
[ push: apply apply ] bind: autogen116 
[ push: exactly apply ] bind: autogen117 
[ push: token apply ] bind: autogen118 
[ push: parenthesis apply ] bind: autogen119 
[ push: output apply ] bind: autogen120 
[ pushf: autogen116 pushf: autogen117 pushf: autogen118 pushf: autogen119 pushf: autogen120 ] bind: autogen121 
[ newfunc0 
 pushf: autogen121 or return1 ] bind: rule.expr 
[ push: ' token ] bind: autogen122 
[ push: escaped_char apply ] bind: autogen123 
[ push: ' exactly ] bind: autogen124 
[ pushf: autogen124 negation ] bind: autogen125 
[ push: anything apply ] bind: autogen126 
[ pushf: autogen125 pushf: autogen126 ] bind: autogen127 
[ pushf: autogen127 and ] bind: autogen128 
[ pushf: autogen123 pushf: autogen128 ] bind: autogen129 
[ pushf: autogen129 or ] bind: autogen130 
[ pushf: autogen130 push: * quantified ] bind: autogen131 
[ pushf: autogen131 out ] bind: autogen132 
[ push: ' token ] bind: autogen133 
[ pushf: autogen122 pushf: autogen132 pushf: autogen133 ] bind: autogen134 
[ newfunc0 
 pushf: autogen134 and return1 ] bind: rule.exactly 
[ push: " token ] bind: autogen135 
[ push: escaped_char apply ] bind: autogen136 
[ push: " exactly ] bind: autogen137 
[ pushf: autogen137 negation ] bind: autogen138 
[ push: anything apply ] bind: autogen139 
[ pushf: autogen138 pushf: autogen139 ] bind: autogen140 
[ pushf: autogen140 and ] bind: autogen141 
[ pushf: autogen136 pushf: autogen141 ] bind: autogen142 
[ pushf: autogen142 or ] bind: autogen143 
[ pushf: autogen143 push: * quantified ] bind: autogen144 
[ pushf: autogen144 out ] bind: autogen145 
[ push: " token ] bind: autogen146 
[ pushf: autogen135 pushf: autogen145 pushf: autogen146 ] bind: autogen147 
[ newfunc0 
 pushf: autogen147 and return1 ] bind: rule.token 
[ push: \\ exactly ] bind: autogen148 
[ push: n exactly ] bind: autogen149 
[ push: r exactly ] bind: autogen150 
[ push: t exactly ] bind: autogen151 
[ push: b exactly ] bind: autogen152 
[ push: f exactly ] bind: autogen153 
[ push: " exactly ] bind: autogen154 
[ push: ' exactly ] bind: autogen155 
[ push: \\ exactly ] bind: autogen156 
[ pushf: autogen149 pushf: autogen150 pushf: autogen151 pushf: autogen152 pushf: autogen153 pushf: autogen154 pushf: autogen155 pushf: autogen156 ] bind: autogen157 
[ pushf: autogen157 or ] bind: autogen158 
[ pushf: autogen158 out ] bind: autogen159 
[ pushf: autogen148 pushf: autogen159 ] bind: autogen160 
[ pick: output return2 ] bind: autogen161 
[ push: \t return2 ] bind: autogen162 
[ push: \n return2 ] bind: autogen163 
[ push: \r return2 ] bind: autogen164 
[ push: \\\\ return2 ] bind: autogen165 
[ push: ' return2 ] bind: autogen166 
[ push: " return2 ] bind: autogen167 
[ newfunc0 
  pushf: autogen160 and assign: output 
   pick: output pick: MatchError_class is_instance pushf: autogen161 if 
   pick: output push: t string_equal pushf: autogen162 if 
   pick: output push: n string_equal pushf: autogen163 if 
   pick: output push: r string_equal pushf: autogen164 if 
   pick: output push: \\ string_equal pushf: autogen165 if 
   pick: output push: ' string_equal pushf: autogen166 if 
   pick: output push: " string_equal pushf: autogen167 if 
  push: Unknown_escaped_char error 
 return_no_value ] bind: rule.escaped_char 
[ push: \t exactly ] bind: autogen168 
[ push: \s exactly ] bind: autogen169 
[ pushf: autogen168 pushf: autogen169 ] bind: autogen170 
[ pushf: autogen170 or ] bind: autogen171 
[ pushf: autogen171 push: * quantified ] bind: autogen172 
[ push: name apply ] bind: autogen173 
[ pushf: autogen173 out ] bind: autogen174 
[ pushf: autogen172 pushf: autogen174 ] bind: autogen175 
[ newfunc0 
 pushf: autogen175 and return1 ] bind: rule.apply 
[ push: ( token ] bind: autogen176 
[ push: or apply ] bind: autogen177 
[ pushf: autogen177 out ] bind: autogen178 
[ push: ) token ] bind: autogen179 
[ pushf: autogen176 pushf: autogen178 pushf: autogen179 ] bind: autogen180 
[ newfunc0 
 pushf: autogen180 and return1 ] bind: rule.parenthesis 
[ push: { token ] bind: autogen181 
[ push: or apply ] bind: autogen182 
[ pushf: autogen182 out ] bind: autogen183 
[ push: } token ] bind: autogen184 
[ pushf: autogen181 pushf: autogen183 pushf: autogen184 ] bind: autogen185 
[ newfunc0 
 pushf: autogen185 and return1 ] bind: rule.output 
[ push: ~ token ] bind: autogen186 
[ push: expr apply ] bind: autogen187 
[ pushf: autogen187 push: negation bound ] bind: autogen188 
[ pushf: autogen188 out ] bind: autogen189 
[ pushf: autogen186 pushf: autogen189 ] bind: autogen190 
[ pushf: autogen190 and ] bind: autogen191 
[ push: expr apply ] bind: autogen192 
[ pushf: autogen191 pushf: autogen192 ] bind: autogen193 
[ newfunc0 
 pushf: autogen193 or return1 ] bind: rule.not 
[ push: not apply ] bind: autogen194 
[ push: * exactly ] bind: autogen195 
[ push: + exactly ] bind: autogen196 
[ push: ? exactly ] bind: autogen197 
[ pushf: autogen195 pushf: autogen196 pushf: autogen197 ] bind: autogen198 
[ pushf: autogen198 or ] bind: autogen199 
[ pushf: autogen199 push: ? quantified ] bind: autogen200 
[ pushf: autogen194 pushf: autogen200 ] bind: autogen201 
[ newfunc0 
 pushf: autogen201 and return1 ] bind: rule.quantified 
[ push: quantified apply ] bind: autogen202 
[ push: = exactly ] bind: autogen203 
[ push: name apply ] bind: autogen204 
[ pushf: autogen204 out ] bind: autogen205 
[ pushf: autogen203 pushf: autogen205 ] bind: autogen206 
[ pushf: autogen206 and ] bind: autogen207 
[ pushf: autogen207 push: ? quantified ] bind: autogen208 
[ pushf: autogen202 pushf: autogen208 ] bind: autogen209 
[ newfunc0 
 pushf: autogen209 and return1 ] bind: rule.bound 
[ push: bound apply ] bind: autogen210 
[ newfunc0 
 pushf: autogen210 push: * quantified return1 ] bind: rule.and 
[ push: and apply ] bind: autogen211 
[ push: | token ] bind: autogen212 
[ push: and apply ] bind: autogen213 
[ pushf: autogen213 out ] bind: autogen214 
[ pushf: autogen212 pushf: autogen214 ] bind: autogen215 
[ pushf: autogen215 and ] bind: autogen216 
[ pushf: autogen216 push: * quantified ] bind: autogen217 
[ pushf: autogen211 pushf: autogen217 ] bind: autogen218 
[ newfunc0 
 pushf: autogen218 and return1 ] bind: rule.or 
[ push: spaces apply ] bind: autogen219 
[ push: name apply ] bind: autogen220 
[ pushf: autogen220 push: rule_name bound ] bind: autogen221 
[ push: ! exactly ] bind: autogen222 
[ pushf: autogen222 push: ? quantified ] bind: autogen223 
[ pushf: autogen223 push: flags bound ] bind: autogen224 
[ push: and apply ] bind: autogen225 
[ pushf: autogen225 push: args bound ] bind: autogen226 
[ push: = token ] bind: autogen227 
[ push: or apply ] bind: autogen228 
[ pushf: autogen228 out ] bind: autogen229 
[ pushf: autogen227 pushf: autogen229 ] bind: autogen230 
[ pushf: autogen230 and ] bind: autogen231 
[ pushf: autogen221 pushf: autogen224 pushf: autogen226 pushf: autogen231 ] bind: autogen232 
[ pushf: autogen232 and ] bind: autogen233 
[ pushf: autogen233 out ] bind: autogen234 
[ pushf: autogen219 pushf: autogen234 ] bind: autogen235 
[ newfunc0 
 pushf: autogen235 and return1 ] bind: rule.rule 
[ push: rule apply ] bind: autogen236 
[ pushf: autogen236 push: * quantified ] bind: autogen237 
[ pushf: autogen237 out ] bind: autogen238 
[ push: spaces apply ] bind: autogen239 
[ pushf: autogen238 pushf: autogen239 ] bind: autogen240 
[ newfunc0 
 pushf: autogen240 and return1 ] bind: rule.grammar 
[ push: # exactly ] bind: autogen241 
[ push: \n exactly ] bind: autogen242 
[ pushf: autogen242 negation ] bind: autogen243 
[ push: anything apply ] bind: autogen244 
[ pushf: autogen243 pushf: autogen244 ] bind: autogen245 
[ pushf: autogen245 and ] bind: autogen246 
[ pushf: autogen246 push: * quantified ] bind: autogen247 
[ pushf: autogen241 pushf: autogen247 ] bind: autogen248 
[ newfunc0 
 pushf: autogen248 and return1 ] bind: rule.comment 
[ push: \s exactly ] bind: autogen249 
[ push: \t exactly ] bind: autogen250 
[ push: comment apply ] bind: autogen251 
[ pushf: autogen249 pushf: autogen250 pushf: autogen251 ] bind: autogen252 
[ newfunc0 
 pushf: autogen252 or return1 ] bind: rule.hspace 
[ push: hspace apply ] bind: autogen253 
[ pushf: autogen253 push: * quantified ] bind: autogen254 
[ push: \r exactly ] bind: autogen255 
[ push: \n exactly ] bind: autogen256 
[ pushf: autogen255 pushf: autogen256 ] bind: autogen257 
[ pushf: autogen257 and ] bind: autogen258 
[ push: \r exactly ] bind: autogen259 
[ push: \n exactly ] bind: autogen260 
[ pushf: autogen258 pushf: autogen259 pushf: autogen260 ] bind: autogen261 
[ pushf: autogen261 or ] bind: autogen262 
[ pushf: autogen254 pushf: autogen262 ] bind: autogen263 
[ pushf: autogen263 and ] bind: autogen264 
[ pushf: autogen264 push: * quantified ] bind: autogen265 
[ push: hspace apply ] bind: autogen266 
[ pushf: autogen266 push: + quantified ] bind: autogen267 
[ pushf: autogen265 pushf: autogen267 ] bind: autogen268 
[ newfunc0 
 pushf: autogen268 and return1 ] bind: rule.indentation 
[ push: \n exactly ] bind: autogen269 
[ push: \r exactly ] bind: autogen270 
[ push: hspace apply ] bind: autogen271 
[ pushf: autogen269 pushf: autogen270 pushf: autogen271 ] bind: autogen272 
[ newfunc0 
 pushf: autogen272 or return1 ] bind: rule.space 
[ push: space apply ] bind: autogen273 
[ newfunc0 
 pushf: autogen273 push: * quantified return1 ] bind: rule.spaces 
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
  return_no_value2 ] bind: autogen274 
[ 0 pick: root attr_call: get to_flpc2 return_no_value2 ] bind: autogen275 
[ 0 pick: root attr_call: get to_flpc2 return_no_value2 ] bind: autogen276 
[ pick: prefix print 
  0 0 pick: root attr_call: get attr_call: get tprint 
  push: _<-_fun[]:\n____return( print 
  pushi: 3 pick: root attr_call: get to_flpc2 
  push: ) print 
  return_no_value2 ] bind: autogen277 
[ push: out print ] bind: autogen278 
[ pick: name printraw ] bind: autogen279 
[ push: [ print ] bind: autogen280 
[ push: [ print ] bind: autogen281 
[ check: bracket 1 + assign: bracket ] bind: autogen282 
[ check: bracket 1 + assign: bracket ] bind: autogen283 
[ check: bracket 1 + assign: bracket ] bind: autogen284 
[ pick: child attr: name push: quantifier string_equal pushf: autogen283 if 
  pick: child attr: name push: inline string_equal pushf: autogen284 if ] bind: autogen285 
[ push: [ print ] bind: autogen286 
[ push: ] print ] bind: autogen287 
[ push: _ print ] bind: autogen288 
[ pick: l pick: i - pick: root attr_call: get assign: child 
  0 assign: bracket 
   pick: child pick: node_class is_instance not pushf: autogen282 pushf: autogen285 if-else 
   pick: bracket not pushf: autogen286 if 
  s21 assign: child assign: bracket 
  check: child to_flpc2 
  check: bracket not pushf: autogen287 if 
  check: i 1 - assign: i 
  pick: i pushf: autogen288 if ] bind: autogen289 
[ push: ] print ] bind: autogen290 
[ push: ] print ] bind: autogen291 
[ newfunc1 assign: root 
  pick: root pick: node_class is_instance not pushf: autogen274 if 
  pick: root attr: name assign: name 
   pick: name push: quantifier string_equal pushf: autogen275 if 
   pick: name push: inline string_equal pushf: autogen276 if 
   pick: name push: rule string_equal pushf: autogen277 if 
  pick: name push: output string_equal pushf: autogen278 pushf: autogen279 if-else 
  push: ( print 
   pick: name push: and string_equal pushf: autogen280 if 
   pick: name push: or string_equal pushf: autogen281 if 
  pick: root attr: len assign: l 
  pick: l assign: i 
   pushf: autogen289 repeat_if 
   pick: name push: and string_equal pushf: autogen290 if 
   pick: name push: or string_equal pushf: autogen291 if 
  push: ) print 
 return_no_value ] rebind: to_flpc2 
[ pick: l pick: i - pick: root attr_call: get to_flpc2 
  printeol 
  printeol 
  check: i 1 - assign: i ] bind: autogen292 
[ pick: l pick: i - pick: root attr_call: get assign: child 
  push: boot\udict.set(" print 
  0 0 pick: child attr_call: get attr_call: get tprint 
  push: "_ print 
  pick: prefix print 
  0 0 pick: child attr_call: get attr_call: get tprint 
  push: _rules) print 
  printeol 
  check: child drop1 
  check: i 1 - assign: i ] bind: autogen293 
[ newfunc1 assign: root 
  pick: root attr: len assign: l 
  pick: l assign: i 
  pushf: autogen292 repeat_if 
  pick: root attr: len assign: l 
  pick: l assign: i 
  pushf: autogen293 repeat_if 
 return_no_value ] bind: to_flpc2_grammar 
 0 pick: indentation attr_call: append 
[ None return2 ] bind: autogen294 
[ newfunc0 
  pick: source attr_call: position assign: saved 
  push: hspaces apply make_string assign: s 
  pick: indentation attr_call: top pick: s str_len == pushf: autogen294 if 
  pick: saved pick: source attr_call: position_set 
  push: Different_indent MatchError return1 
 return_no_value ] bind: rule.SAME_INDENT 
[ newfunc0 
  pick: indentation attr_call: pop 
  None return1 
 return_no_value ] bind: rule.DEDENT 
[ pick: saved pick: source attr_call: position_set 
  push: Missing_newline_before_indent MatchError return2 ] bind: autogen295 
[ newfunc0 
  pick: source attr_call: position assign: saved 
  push: NEWLINE apply pick: MatchError_class is_instance pushf: autogen295 if 
  push: hspaces apply make_string assign: s 
  pick: saved pick: source attr_call: position_set 
  pick: s str_len pick: indentation attr_call: append 
  None return1 
 return_no_value ] bind: rule.INDENT 
[ newfunc0 
 None return1 ] bind: rule.void 
[ check: output 1 + memory.get make_string assign: output ] bind: autogen296 
[ push: NAME apply assign: output 
  pick: output pick: node_class is_instance pushf: autogen296 if ] bind: autogen297 
[ push: Not_token_or_EOF MatchError return3 ] bind: autogen298 
[ pick: s pick: source attr_call: startswith assign: output 
  pick: output None == pushf: autogen298 if 
  check: output return2 ] bind: autogen299 
[ pick: output return2 ] bind: autogen300 
[ push: End_of_file MatchError return2 ] bind: autogen301 
[ push: Not_exactly_token MatchError return2 ] bind: autogen302 
[ newfunc1 assign: s 
  pick: source attr_call: position assign: saved 
  push: spaces apply drop1 
   pick: s is_alpha pushf: autogen297 pushf: autogen299 if-else 
   pick: output pick: MatchError_class is_instance pushf: autogen300 if 
   pick: output None == pushf: autogen301 if 
   pick: output pick: s string_equal not pushf: autogen302 if 
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
[ push: # exactly ] bind: autogen303 
[ push: \n exactly ] bind: autogen304 
[ pushf: autogen304 negation ] bind: autogen305 
[ push: anything apply ] bind: autogen306 
[ pushf: autogen305 pushf: autogen306 ] bind: autogen307 
[ pushf: autogen307 and ] bind: autogen308 
[ pushf: autogen308 push: * quantified ] bind: autogen309 
[ pushf: autogen303 pushf: autogen309 ] bind: autogen310 
[ newfunc0 
 pushf: autogen310 and return1 ] rebind: rule.comment 
[ push: \s exactly ] bind: autogen311 
[ push: \t exactly ] bind: autogen312 
[ push: comment apply ] bind: autogen313 
[ pushf: autogen311 pushf: autogen312 pushf: autogen313 ] bind: autogen314 
[ newfunc0 
 pushf: autogen314 or return1 ] rebind: rule.hspace 
[ push: \n exactly ] bind: autogen315 
[ push: \r exactly ] bind: autogen316 
[ push: hspace apply ] bind: autogen317 
[ pushf: autogen315 pushf: autogen316 pushf: autogen317 ] bind: autogen318 
[ newfunc0 
 pushf: autogen318 or return1 ] rebind: rule.space 
[ push: space apply ] bind: autogen319 
[ newfunc0 
 pushf: autogen319 push: * quantified return1 ] rebind: rule.spaces 
[ push: space apply ] bind: autogen320 
[ newfunc0 
 pushf: autogen320 push: + quantified return1 ] bind: rule.spacesp 
[ push: \s exactly ] bind: autogen321 
[ push: \t exactly ] bind: autogen322 
[ pushf: autogen321 pushf: autogen322 ] bind: autogen323 
[ pushf: autogen323 or ] bind: autogen324 
[ newfunc0 
 pushf: autogen324 push: * quantified return1 ] bind: rule.hspaces 
[ push: \s exactly ] bind: autogen325 
[ push: \t exactly ] bind: autogen326 
[ pushf: autogen325 pushf: autogen326 ] bind: autogen327 
[ pushf: autogen327 or ] bind: autogen328 
[ newfunc0 
 pushf: autogen328 push: + quantified return1 ] bind: rule.hspacesp 
[ push: hspaces apply ] bind: autogen329 
[ push: comment apply ] bind: autogen330 
[ pushf: autogen330 push: ? quantified ] bind: autogen331 
[ push: \n exactly ] bind: autogen332 
[ push: \r exactly ] bind: autogen333 
[ pushf: autogen332 pushf: autogen333 ] bind: autogen334 
[ pushf: autogen334 or ] bind: autogen335 
[ pushf: autogen329 pushf: autogen331 pushf: autogen335 ] bind: autogen336 
[ pushf: autogen336 and ] bind: autogen337 
[ newfunc0 
 pushf: autogen337 push: EMPTY_LINE bound return1 ] bind: rule.EMPTY_LINE 
[ push: hspaces apply ] bind: autogen338 
[ push: digit apply ] bind: autogen339 
[ pushf: autogen339 push: + quantified ] bind: autogen340 
[ pushf: autogen340 out ] bind: autogen341 
[ pushf: autogen338 pushf: autogen341 ] bind: autogen342 
[ newfunc0 
 pushf: autogen342 and return1 ] bind: rule.NUMBER 
[ push: hspaces apply ] bind: autogen343 
[ push: " exactly ] bind: autogen344 
[ push: " exactly ] bind: autogen345 
[ pushf: autogen345 negation ] bind: autogen346 
[ push: anything apply ] bind: autogen347 
[ pushf: autogen346 pushf: autogen347 ] bind: autogen348 
[ pushf: autogen348 and ] bind: autogen349 
[ pushf: autogen349 push: * quantified ] bind: autogen350 
[ pushf: autogen350 out ] bind: autogen351 
[ push: " exactly ] bind: autogen352 
[ pushf: autogen344 pushf: autogen351 pushf: autogen352 ] bind: autogen353 
[ pushf: autogen353 and ] bind: autogen354 
[ push: ' exactly ] bind: autogen355 
[ push: ' exactly ] bind: autogen356 
[ pushf: autogen356 negation ] bind: autogen357 
[ push: anything apply ] bind: autogen358 
[ pushf: autogen357 pushf: autogen358 ] bind: autogen359 
[ pushf: autogen359 and ] bind: autogen360 
[ pushf: autogen360 push: * quantified ] bind: autogen361 
[ pushf: autogen361 out ] bind: autogen362 
[ push: ' exactly ] bind: autogen363 
[ pushf: autogen355 pushf: autogen362 pushf: autogen363 ] bind: autogen364 
[ pushf: autogen364 and ] bind: autogen365 
[ pushf: autogen354 pushf: autogen365 ] bind: autogen366 
[ pushf: autogen366 or ] bind: autogen367 
[ pushf: autogen343 pushf: autogen367 ] bind: autogen368 
[ newfunc0 
 pushf: autogen368 and return1 ] bind: rule.STRING 
[ push: hspaces apply ] bind: autogen369 
[ push: letter apply ] bind: autogen370 
[ push: _ exactly ] bind: autogen371 
[ pushf: autogen370 pushf: autogen371 ] bind: autogen372 
[ pushf: autogen372 or ] bind: autogen373 
[ push: space apply ] bind: autogen374 
[ pushf: autogen374 negation ] bind: autogen375 
[ push: ( exactly ] bind: autogen376 
[ pushf: autogen376 negation ] bind: autogen377 
[ push: = exactly ] bind: autogen378 
[ pushf: autogen378 negation ] bind: autogen379 
[ push: ) exactly ] bind: autogen380 
[ pushf: autogen380 negation ] bind: autogen381 
[ push: [ exactly ] bind: autogen382 
[ pushf: autogen382 negation ] bind: autogen383 
[ push: ] exactly ] bind: autogen384 
[ pushf: autogen384 negation ] bind: autogen385 
[ push: < exactly ] bind: autogen386 
[ pushf: autogen386 negation ] bind: autogen387 
[ push: : exactly ] bind: autogen388 
[ pushf: autogen388 negation ] bind: autogen389 
[ push: ' exactly ] bind: autogen390 
[ pushf: autogen390 negation ] bind: autogen391 
[ push: anything apply ] bind: autogen392 
[ pushf: autogen375 pushf: autogen377 pushf: autogen379 pushf: autogen381 pushf: autogen383 pushf: autogen385 pushf: autogen387 pushf: autogen389 pushf: autogen391 pushf: autogen392 ] bind: autogen393 
[ pushf: autogen393 and ] bind: autogen394 
[ pushf: autogen394 push: * quantified ] bind: autogen395 
[ pushf: autogen373 pushf: autogen395 ] bind: autogen396 
[ pushf: autogen396 and ] bind: autogen397 
[ pushf: autogen397 out ] bind: autogen398 
[ pushf: autogen369 pushf: autogen398 ] bind: autogen399 
[ newfunc0 
 pushf: autogen399 and return1 ] bind: rule.NAME 
[ push: spaces apply ] bind: autogen400 
[ push: 'F token ] bind: autogen401 
[ pushf: autogen401 negation ] bind: autogen402 
[ push: space apply ] bind: autogen403 
[ pushf: autogen403 negation ] bind: autogen404 
[ push: anything apply ] bind: autogen405 
[ pushf: autogen404 pushf: autogen405 ] bind: autogen406 
[ pushf: autogen406 and ] bind: autogen407 
[ pushf: autogen407 push: * quantified ] bind: autogen408 
[ pushf: autogen408 out ] bind: autogen409 
[ pushf: autogen400 pushf: autogen402 pushf: autogen409 ] bind: autogen410 
[ newfunc0 
 pushf: autogen410 and return1 ] bind: rule.FORTH_NAME 
[ push: + token ] bind: autogen411 
[ push: - token ] bind: autogen412 
[ push: == token ] bind: autogen413 
[ push: < token ] bind: autogen414 
[ push: > token ] bind: autogen415 
[ push: . token ] bind: autogen416 
[ push: in token ] bind: autogen417 
[ pushf: autogen411 pushf: autogen412 pushf: autogen413 pushf: autogen414 pushf: autogen415 pushf: autogen416 pushf: autogen417 ] bind: autogen418 
[ newfunc0 
 pushf: autogen418 or return1 ] bind: rule.bin_op 
[ push: NAME apply ] bind: autogen419 
[ newfunc0 
 pushf: autogen419 push: * quantified return1 ] bind: rule.names 
[ newfunc0 
 push: NAME apply return1 ] bind: rule.variable 
[ push: ` token ] bind: autogen420 
[ push: NAME apply ] bind: autogen421 
[ pushf: autogen421 out ] bind: autogen422 
[ pushf: autogen420 pushf: autogen422 ] bind: autogen423 
[ newfunc0 
 pushf: autogen423 and return1 ] bind: rule.name_quote 
[ push: [ token ] bind: autogen424 
[ push: suite apply ] bind: autogen425 
[ pushf: autogen425 out ] bind: autogen426 
[ push: ] token ] bind: autogen427 
[ pushf: autogen424 pushf: autogen426 pushf: autogen427 ] bind: autogen428 
[ newfunc0 
 pushf: autogen428 and return1 ] bind: rule.quote 
[ push: F' token ] bind: autogen429 
[ push: FORTH_NAME apply ] bind: autogen430 
[ pushf: autogen430 push: NAME bound ] bind: autogen431 
[ pushf: autogen431 push: * quantified ] bind: autogen432 
[ pushf: autogen432 out ] bind: autogen433 
[ push: 'F token ] bind: autogen434 
[ pushf: autogen429 pushf: autogen433 pushf: autogen434 ] bind: autogen435 
[ newfunc0 
 pushf: autogen435 and return1 ] bind: rule.forth 
[ push: [ token ] bind: autogen436 
[ push: names apply ] bind: autogen437 
[ pushf: autogen437 out ] bind: autogen438 
[ push: ] token ] bind: autogen439 
[ pushf: autogen436 pushf: autogen438 pushf: autogen439 ] bind: autogen440 
[ newfunc0 
 pushf: autogen440 and return1 ] bind: rule.simple_quote 
[ push: ( token ] bind: autogen441 
[ push: expr apply ] bind: autogen442 
[ pushf: autogen442 out ] bind: autogen443 
[ push: ) token ] bind: autogen444 
[ pushf: autogen441 pushf: autogen443 pushf: autogen444 ] bind: autogen445 
[ newfunc0 
 pushf: autogen445 and return1 ] rebind: rule.parenthesis 
[ push: NAME apply ] bind: autogen446 
[ pushf: autogen446 out ] bind: autogen447 
[ push: ( exactly ] bind: autogen448 
[ push: exprs apply ] bind: autogen449 
[ pushf: autogen449 push: parameters bound ] bind: autogen450 
[ pushf: autogen450 out ] bind: autogen451 
[ push: ) token ] bind: autogen452 
[ pushf: autogen447 pushf: autogen448 pushf: autogen451 pushf: autogen452 ] bind: autogen453 
[ newfunc0 
 pushf: autogen453 and return1 ] bind: rule.func_call 
[ push: NAME apply ] bind: autogen454 
[ push: simple_quote apply ] bind: autogen455 
[ push: non_block apply ] bind: autogen456 
[ push: void apply ] bind: autogen457 
[ pushf: autogen455 pushf: autogen456 pushf: autogen457 ] bind: autogen458 
[ pushf: autogen458 or ] bind: autogen459 
[ pushf: autogen459 out ] bind: autogen460 
[ push: : token ] bind: autogen461 
[ push: suite apply ] bind: autogen462 
[ pushf: autogen462 push: quote bound ] bind: autogen463 
[ pushf: autogen463 out ] bind: autogen464 
[ pushf: autogen460 pushf: autogen461 pushf: autogen464 ] bind: autogen465 
[ pushf: autogen465 and ] bind: autogen466 
[ pushf: autogen466 push: parameters bound ] bind: autogen467 
[ pushf: autogen454 pushf: autogen467 ] bind: autogen468 
[ newfunc0 
 pushf: autogen468 and return1 ] bind: rule.block_call 
[ push: block_call apply ] bind: autogen469 
[ push: NEWLINE apply ] bind: autogen470 
[ push: SAME_INDENT apply ] bind: autogen471 
[ push: block_call apply ] bind: autogen472 
[ pushf: autogen472 out ] bind: autogen473 
[ pushf: autogen470 pushf: autogen471 pushf: autogen473 ] bind: autogen474 
[ pushf: autogen474 and ] bind: autogen475 
[ pushf: autogen475 push: + quantified ] bind: autogen476 
[ pushf: autogen469 pushf: autogen476 ] bind: autogen477 
[ newfunc0 
 pushf: autogen477 and return1 ] bind: rule.multi_block_call 
[ push: forth apply ] bind: autogen478 
[ push: func_call apply ] bind: autogen479 
[ push: name_quote apply ] bind: autogen480 
[ push: quote apply ] bind: autogen481 
[ push: parenthesis apply ] bind: autogen482 
[ push: NUMBER apply ] bind: autogen483 
[ push: STRING apply ] bind: autogen484 
[ push: variable apply ] bind: autogen485 
[ pushf: autogen478 pushf: autogen479 pushf: autogen480 pushf: autogen481 pushf: autogen482 pushf: autogen483 pushf: autogen484 pushf: autogen485 ] bind: autogen486 
[ newfunc0 
 pushf: autogen486 or return1 ] bind: rule.non_block_non_infix 
[ push: infix apply ] bind: autogen487 
[ push: non_block_non_infix apply ] bind: autogen488 
[ pushf: autogen487 pushf: autogen488 ] bind: autogen489 
[ newfunc0 
 pushf: autogen489 or return1 ] bind: rule.non_block 
[ push: non_block_non_infix apply ] bind: autogen490 
[ push: bin_op apply ] bind: autogen491 
[ pushf: autogen491 push: op bound ] bind: autogen492 
[ push: non_block_non_infix apply ] bind: autogen493 
[ pushf: autogen492 pushf: autogen493 ] bind: autogen494 
[ pushf: autogen494 and ] bind: autogen495 
[ pushf: autogen495 push: + quantified ] bind: autogen496 
[ pushf: autogen490 pushf: autogen496 ] bind: autogen497 
[ newfunc0 
 pushf: autogen497 and return1 ] bind: rule.infix 
[ push: block_call apply ] bind: autogen498 
[ push: non_block_non_infix apply ] bind: autogen499 
[ pushf: autogen498 pushf: autogen499 ] bind: autogen500 
[ newfunc0 
 pushf: autogen500 or return1 ] bind: rule.non_infix 
[ push: infix apply ] bind: autogen501 
[ push: non_infix apply ] bind: autogen502 
[ pushf: autogen501 pushf: autogen502 ] bind: autogen503 
[ newfunc0 
 pushf: autogen503 or return1 ] rebind: rule.expr 
[ push: expr apply ] bind: autogen504 
[ push: spacesp apply ] bind: autogen505 
[ push: expr apply ] bind: autogen506 
[ pushf: autogen506 out ] bind: autogen507 
[ pushf: autogen505 pushf: autogen507 ] bind: autogen508 
[ pushf: autogen508 and ] bind: autogen509 
[ pushf: autogen509 push: * quantified ] bind: autogen510 
[ pushf: autogen504 pushf: autogen510 ] bind: autogen511 
[ pushf: autogen511 and ] bind: autogen512 
[ push: void apply ] bind: autogen513 
[ pushf: autogen512 pushf: autogen513 ] bind: autogen514 
[ newfunc0 
 pushf: autogen514 or return1 ] bind: rule.exprs 
[ push: expr apply ] bind: autogen515 
[ push: hspacesp apply ] bind: autogen516 
[ push: expr apply ] bind: autogen517 
[ pushf: autogen517 out ] bind: autogen518 
[ pushf: autogen516 pushf: autogen518 ] bind: autogen519 
[ pushf: autogen519 and ] bind: autogen520 
[ pushf: autogen520 push: * quantified ] bind: autogen521 
[ pushf: autogen515 pushf: autogen521 ] bind: autogen522 
[ newfunc0 
 pushf: autogen522 and return1 ] bind: rule.exprsp 
[ push: names apply ] bind: autogen523 
[ pushf: autogen523 out ] bind: autogen524 
[ push: = token ] bind: autogen525 
[ push: space apply ] bind: autogen526 
[ pushf: autogen524 pushf: autogen525 pushf: autogen526 ] bind: autogen527 
[ pushf: autogen527 and ] bind: autogen528 
[ push: void apply ] bind: autogen529 
[ pushf: autogen528 pushf: autogen529 ] bind: autogen530 
[ pushf: autogen530 or ] bind: autogen531 
[ push: exprsp apply ] bind: autogen532 
[ pushf: autogen531 pushf: autogen532 ] bind: autogen533 
[ newfunc0 
 pushf: autogen533 and return1 ] bind: rule.assign 
[ push: names apply ] bind: autogen534 
[ pushf: autogen534 out ] bind: autogen535 
[ push: <- token ] bind: autogen536 
[ push: exprsp apply ] bind: autogen537 
[ pushf: autogen537 out ] bind: autogen538 
[ pushf: autogen535 pushf: autogen536 pushf: autogen538 ] bind: autogen539 
[ newfunc0 
 pushf: autogen539 and return1 ] bind: rule.bind 
[ push: multi_block_call apply ] bind: autogen540 
[ push: bind apply ] bind: autogen541 
[ push: assign apply ] bind: autogen542 
[ pushf: autogen540 pushf: autogen541 pushf: autogen542 ] bind: autogen543 
[ newfunc0 
 pushf: autogen543 or return1 ] bind: rule.statement 
[ push: INDENT apply ] bind: autogen544 
[ push: NEWLINE apply ] bind: autogen545 
[ pushf: autogen545 push: + quantified ] bind: autogen546 
[ push: SAME_INDENT apply ] bind: autogen547 
[ push: statement apply ] bind: autogen548 
[ pushf: autogen546 pushf: autogen547 pushf: autogen548 ] bind: autogen549 
[ pushf: autogen549 and ] bind: autogen550 
[ pushf: autogen550 push: + quantified ] bind: autogen551 
[ push: DEDENT apply ] bind: autogen552 
[ pushf: autogen544 pushf: autogen551 pushf: autogen552 ] bind: autogen553 
[ pushf: autogen553 and ] bind: autogen554 
[ push: statement apply ] bind: autogen555 
[ pushf: autogen554 pushf: autogen555 ] bind: autogen556 
[ newfunc0 
 pushf: autogen556 or return1 ] bind: rule.suite 
[ push: hspaces apply ] bind: autogen557 
[ push: \n exactly ] bind: autogen558 
[ push: \r exactly ] bind: autogen559 
[ pushf: autogen558 pushf: autogen559 ] bind: autogen560 
[ pushf: autogen560 or ] bind: autogen561 
[ pick: None out ] bind: autogen562 
[ pushf: autogen557 pushf: autogen561 pushf: autogen562 ] bind: autogen563 
[ pushf: autogen563 and ] bind: autogen564 
[ push: COMMENT_LINE apply ] bind: autogen565 
[ pushf: autogen564 pushf: autogen565 ] bind: autogen566 
[ newfunc0 
 pushf: autogen566 or return1 ] bind: rule.NEWLINE 
[ push: hspaces apply ] bind: autogen567 
[ push: comment apply ] bind: autogen568 
[ pushf: autogen568 out ] bind: autogen569 
[ push: hspaces apply ] bind: autogen570 
[ push: \n exactly ] bind: autogen571 
[ push: \r exactly ] bind: autogen572 
[ pushf: autogen571 pushf: autogen572 ] bind: autogen573 
[ pushf: autogen573 or ] bind: autogen574 
[ pushf: autogen567 pushf: autogen569 pushf: autogen570 pushf: autogen574 ] bind: autogen575 
[ newfunc0 
 pushf: autogen575 and return1 ] bind: rule.COMMENT_LINE 
[ newfunc0 
 push: suite apply return1 ] rebind: rule.grammar 
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
  check: i 1 - assign: i ] bind: autogen576 
[ newfunc1 assign: indent 
  pick: indent assign: i 
  pushf: autogen576 repeat_if 
 return_no_value ] bind: print_indent 
[ newfunc2 assign: self assign: indent 
 push: Dummy_function error return_no_value ] bind: pprint 
[ pick: indent 2 + pick: child pprint ] bind: autogen577 
[ pick: indent 2 + print_indent 
  push: str_' print 
  pick: child printraw 
  push: ' print 
  printeol ] bind: autogen578 
[ pick: child str_len 0 > pushf: autogen578 if ] bind: autogen579 
[ pick: child is_str pushf: autogen579 if ] bind: autogen580 
[ newfunc2 assign: child assign: indent 
 pick: child pick: node_class is_instance pushf: autogen577 pushf: autogen580 if-else return_no_value ] bind: print_child 
[ pick: indent 0 pick: self attr: children attr_call: get pprint 
  return_no_value2 ] bind: autogen581 
[ check: bad 1 + assign: bad ] bind: autogen582 
[ check: child str_len 0 == pushf: autogen582 if ] bind: autogen583 
[ check: child drop1 ] bind: autogen584 
[ check: bad 1 + assign: bad ] bind: autogen585 
[ check: child str_len 0 == pushf: autogen585 if ] bind: autogen586 
[ 1 pick: self attr: children attr_call: get assign: child 
  pick: child is_str pushf: autogen583 pushf: autogen584 if-else 
  0 pick: self attr: children attr_call: get assign: child 
  pick: child is_str pushf: autogen586 if ] bind: autogen587 
[ pick: self attr: children attr: len 2 == pushf: autogen587 if ] bind: autogen588 
[ pick: indent 0 pick: self attr: children attr_call: get pprint 
  None return3 ] bind: autogen589 
[ pick: bad pushf: autogen589 if ] bind: autogen590 
[ pick: indent 1 pick: self attr: children attr_call: get pprint 
  None return3 ] bind: autogen591 
[ pick: bad pushf: autogen591 if ] bind: autogen592 
[ pick: indent pick: children print_child ] bind: autogen593 
[ pick: indent pick: l pick: i - pick: children attr_call: get print_child 
  check: i 1 - assign: i ] bind: autogen594 
[ pick: children attr: len assign: l 
  pick: l assign: i 
  pushf: autogen594 repeat_if ] bind: autogen595 
[ newfunc2 assign: self assign: indent 
  pick: self attr: name push: exprsp string_equal pushf: autogen581 if 
  pick: False assign: bad 
   pick: self attr: children pick: resizable_class is_instance pushf: autogen588 if 
   pick: self attr: name push: exprs string_equal pushf: autogen590 if 
   pick: self attr: name push: suite string_equal pushf: autogen592 if 
  pick: indent print_indent 
  pick: self attr: name printraw 
  printeol 
  pick: self attr: children assign: children 
  pick: self attr: children pick: resizable_class is_instance not pushf: autogen593 pushf: autogen595 if-else 
 return_no_value ] rebind: pprint 
 0 pick: output pprint 