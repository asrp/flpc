push: Generated_from_lib/stage0.flpc_lib/stage1a.flpc_lib/stage1b.flpc_lib/stage1b2.flpc_lib/stage1b3.flpc_lib/stage1c.flpc_lib/stage1d.flpc_lib/stage3a.flpc_lib/stage3b.flpc_lib/flpc_grammar.flpc_lib/stage6a.flpc_lib/stage6b.flpc_lib/stage7a.flpc print
[ input.next_token functions.add ] input.next_token bind: functions.add 
[ newfunc1 assign: func 
   input.next_token names.get assign: location 
   push: ] names.get pick: location 1 + memory.set 
   memory.set return_no_value ] bind: rebind: 
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
   debugger_inner debugger_waitlen_set return_no_value ] bind: debugger 
[ push: 125 shuffle assign: i assign: block 
  check: i 1 - assign: i ] bind: autogen8 
[ s21 assign: i assign: block 
  pushf: autogen8 repeat_if 
  check: block call 
  0 assign: i ] bind: autogen9 
[ check: block drop1 ] bind: autogen10 
[ check: i 1 - assign: i 
  push: 231 shuffle assign: cond assign: block assign: i 
  check: cond call pushf: autogen9 pushf: autogen10 if-else ] bind: autogen11 
[ assign: i 
  pushf: autogen11 repeat_if ] bind: multi-if 
 pick: debugger error_handler_set 
[ 
   pushf: push: memory.append memory.append 
  memory.append pushf: ] memory.append 
   memory.len pushi: 4 - Pointer ] bind: closure 
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
   memory.len 1 - Pointer return1 ] bind: subclass 
 pick: nullobj.attrib None subclass bind: nullobj 
[ push: Lookup_error error ] bind: autogen12 
[ newfunc3 assign: searcher assign: receiver assign: name 
   pick: name push: parent string_equal pick: receiver 2 - memory.get return_if 
   pick: searcher attr: parent assign: parent 
   pick: parent pick: nullobj == pushf: autogen12 if 
   pick: name pick: receiver pick: parent pick1 assign: parent_copy 
   check: parent_copy 1 - memory.get call return1 ] bind: instance_attrib 
[ newfunc1 assign: self 
   push: Boot_object_at_ return1 ] bind: minobj.str 
[ newfunc1 assign: parent 
  pick: instance_attrib pick: parent subclass return1 ] bind: minobj.instance 
[ newfunc3 assign: searcher assign: receiver assign: name 
  push: Dummy_function_should_not_be_called error return_no_value ] bind: minobj.attrib 
[ push: Boot_looking_up_ print 
  pick: name print 
  printeol ] bind: autogen13 
[ newfunc3 assign: searcher assign: receiver assign: name 
   pick: lookup_print pushf: autogen13 if 
   pick: name push: attrib_raw string_equal pick: receiver 1 - memory.get return_if 
   pick: name push: attrib string_equal pick: minobj.attrib return_if 
   pick: name push: instance string_equal pick: minobj.instance return_if 
   pick: name push: subclass string_equal pick: subclass return_if 
   pick: name push: str string_equal pick: minobj.str return_if 
   pick: name push: type string_equal push: minobj return_if 
   pick: name pick: receiver pick: searcher instance_attrib return1 ] rebind: minobj.attrib 
 pick: minobj.attrib pick: nullobj subclass bind: boot_obj 
[ 0 memory.append 
  check: i 1 - assign: i ] bind: autogen14 
[ newfunc1 assign: i 
  pushf: autogen14 repeat_if return_no_value ] bind: memory.extend 
[ pick: value print ] bind: autogen15 
[ pick: value print ] bind: autogen16 
[ pick: value attr_call: print ] bind: autogen17 
[ pick: value pick: obj_boundary < pushf: autogen16 pushf: autogen17 if-else ] bind: autogen18 
[ newfunc1 assign: value 
  pick: value is_basic pushf: autogen15 pushf: autogen18 if-else return_no_value ] bind: tprint 
[ newfunc2 assign: self assign: length 
   pick: boot_obj minobj.instance assign: new_obj 
   pick: self pick: new_obj 2 - memory.set 
   pick: length pick: new_obj memory.set 
   pick: length memory.extend 
   push: ] names.get memory.append 
   pick: new_obj return1 ] bind: boot_array.instance 
[ push: Index_out_of_range error ] bind: autogen19 
[ push: Index_out_of_range error ] bind: autogen20 
[ newfunc2 assign: self assign: key 
   pick: key 0 < pushf: autogen19 if 
   pick: key pick: self memory.get < not pushf: autogen20 if return_no_value ] bind: boot_array.in_range 
[ newfunc2 assign: self assign: key 
   pick: key pick: self boot_array.in_range 
   pick: self pick: key + 1 + memory.get return1 ] bind: boot_array.get 
[ newfunc3 assign: self assign: value assign: key 
   pick: key pick: self boot_array.in_range 
   pick: value pick: self pick: key + 1 + memory.set return_no_value ] bind: boot_array.set 
[ pick: l pick: i - pick: self boot_array.get tprint 
  printspace 
  check: i 1 - assign: i ] bind: autogen21 
[ newfunc1 assign: self 
   push: {_ print 
   pick: self memory.get assign: l 
   pick: l assign: i 
   pushf: autogen21 repeat_if 
   push: } print return_no_value ] bind: boot_array.print 
[ check: i return3 ] bind: autogen22 
[ check: i 1 - assign: i 
  pick: value pick: i pick: self boot_array.get string_equal pushf: autogen22 if ] bind: autogen23 
[ newfunc2 assign: self assign: value 
   pick: self memory.get assign: i 
   pushf: autogen23 repeat_if 
   None return1 ] bind: boot_array.string_index 
[ check: i return3 ] bind: autogen24 
[ None return3 ] bind: autogen25 
[ drop1 
  pick: self memory.get assign: i ] bind: autogen26 
[ pick: key pick: i pick: self boot_array.get string_equal pushf: autogen24 if 
   pick: i pick: self boot_array.get 0 == pushf: autogen25 if 
  check: i 1 - assign: i 
  pick: i 0 == pushf: autogen26 if ] bind: autogen27 
[ newfunc3 assign: self assign: i assign: key 
   s21 assign: i assign: self 
   pushf: autogen27 repeat return_no_value ] bind: boot_array.hash_index 
[ check: i return3 ] bind: autogen28 
[ drop1 
  pick: self memory.get assign: i ] bind: autogen29 
[ pick: i pick: self boot_array.get 0 == pushf: autogen28 if 
  check: i 1 - assign: i 
  pick: i 0 == pushf: autogen29 if ] bind: autogen30 
[ newfunc2 assign: self assign: i 
   s21 assign: i assign: self 
   pushf: autogen30 repeat return_no_value ] bind: boot_array.none_index 
[ check: i 1 - assign: i 
  pick: i pick: i pick: self boot_array.get pick: other boot_array.set ] bind: autogen31 
[ newfunc2 assign: self assign: other 
   pick: self memory.get assign: i 
   pushf: autogen31 repeat_if return_no_value ] bind: boot_array.copy_to 
[ push: Array_looking_up_ print 
  pick: name print 
  printeol ] bind: autogen32 
[ newfunc3 assign: searcher assign: receiver assign: name 
   pick: lookup_print pushf: autogen32 if 
   pick: name push: get string_equal pick: boot_array.get return_if 
   pick: name push: set string_equal pick: boot_array.set return_if 
   pick: name push: in_range string_equal pick: boot_array.in_range return_if 
   pick: name push: instance string_equal pick: boot_array.instance return_if 
   pick: name push: print string_equal pick: boot_array.print return_if 
   pick: name push: string_index string_equal pick: boot_array.string_index return_if 
   pick: name push: hash_index string_equal pick: boot_array.hash_index return_if 
   pick: name push: none_index string_equal pick: boot_array.none_index return_if 
   pick: name push: copy_to string_equal pick: boot_array.copy_to return_if 
   pick: name push: len string_equal pick: receiver memory.get return_if 
   pick: name push: type string_equal push: boot_array return_if 
   pick: name pick: receiver pick: searcher instance_attrib return1 ] bind: boot_array.attrib 
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
   pick: new_obj return1 ] bind: boot_dict.instance 
[ newfunc2 assign: self assign: key 
   pick: key pick: self 1 + memory.get boot_array.string_index assign: index 
   pick: index None == None return_if 
   pick: index pick: self 2 + memory.get boot_array.get return1 ] bind: boot_dict.get 
[ newfunc3 assign: self assign: value assign: key 
   pick: self memory.get assign: l 
   pick: l pick: key pick: self 1 + memory.get boot_array.set 
   pick: l pick: value pick: self 2 + memory.get boot_array.set 
   pick: self memory.get 1 + pick: self memory.set return_no_value ] bind: boot_dict.set 
[ newfunc1 assign: self 
  pick: self memory.get 1 + pick: self memory.set return_no_value ] bind: boot_dict.increase 
[ pick: l pick: i - pick: keys boot_array.get tprint 
  push: :_ print 
  pick: l pick: i - pick: values boot_array.get tprint 
  push: ,_ print 
  check: i 1 - assign: i ] bind: autogen33 
[ newfunc1 assign: self 
   push: {_ print 
   pick: self memory.get assign: l 
   pick: self 1 + memory.get assign: keys 
   pick: self 2 + memory.get assign: values 
   pick: l assign: i 
   pushf: autogen33 repeat_if 
   push: } print return_no_value ] bind: boot_dict.print 
[ push: Dict_looking_up_ print 
  pick: name print 
  printeol ] bind: autogen34 
[ newfunc3 assign: searcher assign: receiver assign: name 
   pick: lookup_print pushf: autogen34 if 
   pick: name push: get string_equal pick: boot_dict.get return_if 
   pick: name push: set string_equal pick: boot_dict.set return_if 
   pick: name push: instance string_equal pick: boot_dict.instance return_if 
   pick: name push: print string_equal pick: boot_dict.print return_if 
   pick: name push: increase string_equal pick: boot_dict.increase return_if 
   pick: name push: len string_equal pick: receiver memory.get return_if 
   pick: name push: keys string_equal pick: receiver 1 + memory.get return_if 
   pick: name push: values string_equal pick: receiver 2 + memory.get return_if 
   pick: name push: type string_equal push: boot_dict return_if 
   pick: name pick: receiver pick: searcher instance_attrib return1 ] bind: boot_dict.attrib 
 pick: boot_dict.attrib pick: boot_obj attr_call: subclass bind: boot_dict_class 
 pick: boot_dict_class attr: instance pick: boot_dict_class closure bind: boot_dict 
[ pick: False return2 ] bind: autogen35 
[ newfunc2 assign: class assign: other 
   pick: other is_basic pushf: autogen35 if 
   check: class pick: other 2 - memory.get == return1 ] bind: is_instance 
 memory.len Pointer bind: obj_boundary 
[ pick: False return3 ] bind: autogen36 
[ drop1 
  pick: n pick: i mod 0 == pushf: autogen36 if 
  check: i 1 + assign: i 
  pick: i pick: n < assign: cond ] bind: autogen37 
[ newfunc1 assign: n 
   2 assign: i 
   pick: i pick: n < assign: cond 
   pushf: autogen37 repeat_if 
   pick: True return1 ] bind: is_prime 
[ check: n return3 ] bind: autogen38 
[ pick: n is_prime pushf: autogen38 if 
  check: n 1 + assign: n ] bind: autogen39 
[ newfunc1 assign: n 
  pushf: autogen39 repeat return_no_value ] bind: next_prime 
[ newfunc2 assign: self assign: length 
   pick: length next_prime assign: plength 
   pick: plength pick: boot_array_class boot_array.instance assign: keys 
   pick: plength pick: boot_array_class boot_array.instance assign: values 
   pick: boot_obj minobj.instance assign: new_obj 
   pick: self pick: new_obj 2 - memory.set 
   pick: plength pick: new_obj memory.set 
   pick: keys memory.append 
   pick: values memory.append 
   push: ] names.get memory.append 
   pick: new_obj return1 ] bind: hashtable.instance 
[ newfunc2 assign: self assign: key 
   pick: key hash pick: self memory.get mod assign: start 
   pick: key pick: start pick: self 1 + memory.get boot_array.hash_index assign: index 
   pick: index None == None return_if 
   pick: index pick: self 2 + memory.get boot_array.get return1 ] bind: hashtable.get 
[ push: Index_too_big error ] bind: autogen40 
[ push: Index_still_too_big error ] bind: autogen41 
[ push: Negative_index error ] bind: autogen42 
[ drop1 
  pick: start pick: self 1 + memory.get boot_array.none_index assign: l ] bind: autogen43 
[ push: Error_reading_new_key error ] bind: autogen44 
[ newfunc3 assign: self assign: value assign: key 
   pick: key hash pick: self memory.get mod assign: start 
    pick: self memory.get pick: start < pushf: autogen40 if 
    pick: self memory.get pick: start == pushf: autogen41 if 
    pick: start 0 < pushf: autogen42 if 
   pick: key pick: start pick: self 1 + memory.get boot_array.hash_index assign: l 
   pick: l None == pushf: autogen43 if 
   pick: l pick: key pick: self 1 + memory.get boot_array.set 
   pick: l pick: value pick: self 2 + memory.get boot_array.set 
   pick: key pick: start pick: self 1 + memory.get boot_array.hash_index pick: l == not pushf: autogen44 if return_no_value ] bind: hashtable.set 
[ pick: key tprint 
  push: :_ print 
  pick: l pick: i - pick: values boot_array.get print 
  push: ,_ print ] bind: autogen45 
[ pick: l pick: i - pick: keys boot_array.get assign: key 
  pick: key 0 > pushf: autogen45 if 
  drop1 
  check: i 1 - assign: i ] bind: autogen46 
[ newfunc1 assign: self 
   push: {_ print 
   pick: self memory.get assign: l 
   pick: self 1 + memory.get assign: keys 
   pick: self 2 + memory.get assign: values 
   pick: l assign: i 
   pushf: autogen46 repeat_if 
   push: } print return_no_value ] bind: hashtable.print 
[ s21 assign: count assign: i 
  check: count 1 + assign: count 
  s21 assign: i assign: count ] bind: autogen47 
[ check: i 1 - assign: i 
  pick: i pick: keys boot_array.get assign: key 
  check: key 0 > pushf: autogen47 if ] bind: autogen48 
[ newfunc1 assign: self 
   pick: self 1 + memory.get assign: keys 
   0 assign: count 
   pick: self memory.get assign: i 
   pushf: autogen48 repeat_if 
   pick: count return1 ] bind: hashtable.num_elems 
[ push: Dict_looking_up_ print 
  pick: name print 
  printeol ] bind: autogen49 
[ newfunc3 assign: searcher assign: receiver assign: name 
   pick: lookup_print pushf: autogen49 if 
   pick: name push: get string_equal pick: hashtable.get return_if 
   pick: name push: set string_equal pick: hashtable.set return_if 
   pick: name push: instance string_equal pick: hashtable.instance return_if 
   pick: name push: print string_equal pick: hashtable.print return_if 
   pick: name push: len string_equal pick: receiver memory.get return_if 
   pick: name push: keys string_equal pick: receiver 1 + memory.get return_if 
   pick: name push: values string_equal pick: receiver 2 + memory.get return_if 
   pick: name push: type string_equal push: hashtable return_if 
   pick: name pick: receiver pick: searcher instance_attrib return1 ] bind: hashtable.attrib 
 pick: hashtable.attrib pick: boot_obj attr_call: subclass bind: hashtable_class 
 pick: hashtable_class attr: instance pick: hashtable_class closure bind: hashtable 
 pushi: 2131 hashtable bind: names 
  [ pushf: names ] bind: names2 
 pushi: 4000 hashtable bind: mem_value 
[ newfunc2 assign: hint assign: index 
   pick: index int_to_str pick: hint pick: mem_value hashtable.set 
   pick: hint pick: index memory_hint.set return_no_value ] bind: set_mem_hint 
[ pick: index pushi: 3 + memory.get pick: index memory.get set_mem_hint ] bind: autogen50 
[ check: cond drop1 
  pick: index memory.get pick: index pushi: 3 + memory.get pick: names attr_call: set 
  pick: index pushi: 3 + memory.get type_of 2 == pushf: autogen50 if 
  check: index pushi: 7 + assign: index 
  pick: index pick: end > not assign: cond ] bind: autogen51 
[ newfunc0 
   functions.end assign: end 
   pick: names.get pushi: 5 + assign: index 
   pick: index pick: end > not assign: cond 
   pushf: autogen51 repeat_if return_no_value ] bind: convert_names 
[ push: Can't_find_global_name:_ print 
  pick: name printraw 
  printeol ] bind: autogen52 
[ pick: name is_str pushf: autogen52 if 
  push: lookup_error error ] bind: autogen53 
[ newfunc1 assign: name 
   pick: name names2 hashtable.get assign: value 
   pick: value None == pushf: autogen53 if 
   pick: value return1 ] bind: names.get 
[ newfunc1 assign: value 
   input.next_token assign: name 
   pick: name pick: value names2 hashtable.set 
   pick: value pick: name set_mem_hint return_no_value ] bind: new.bind 
 convert_names 
 push: bind: push: new.bind names2 hashtable.get names2 hashtable.set 
  push: bind: names2 hashtable.get rebind: bind: 
  push: names.get names2 hashtable.get rebind: names.get 
[ pick: index pick: func - return3 ] bind: autogen54 
[ pick: index memory.get pick: end_of_func == pushf: autogen54 if 
  check: index 1 + assign: index ] bind: autogen55 
[ newfunc1 assign: func 
   pick: func assign: index 
   pushf: autogen55 repeat return_no_value ] bind: func_len 
[ check: index return3 ] bind: autogen56 
[ check: index 1 + assign: index 
  pick: index memory.get pick: return_if == pushf: autogen56 if ] bind: autogen57 
[ newfunc1 assign: index 
  pushf: autogen57 repeat return_no_value ] bind: read_to_return_if 
[ None return3 ] bind: autogen58 
[ pick: index pushi: 3 + memory.get pick: index pushi: 5 + pick: attrib_hash attr_call: set ] bind: autogen59 
[ pick: index pick: end > pushf: autogen58 if 
  pick: index pushi: 3 + memory.get tprint 
  push: _ print 
  pick: index pushi: 6 + memory.get tprint 
  printeol 
  pick: index pushi: 3 + memory.get pick: attrib_hash attr_call: get None == pushf: autogen59 if 
  check: index pushi: 5 + read_to_return_if assign: index 
  check: index 1 + assign: index ] bind: autogen60 
[ newfunc2 assign: attrib_hash assign: attrib 
   pick: attrib func_len assign: len 
   pick: attrib pick: len + pushi: 16 - assign: end 
   pick: attrib pushi: 12 + assign: index 
   pushf: autogen60 repeat return_no_value ] bind: add_attrib 
[ push: Total_len:_ print 
  pick: len print 
  printeol 
  pick: len return3 ] bind: autogen61 
[ pick: obj pick: nullobj_cached == pushf: autogen61 if 
  check: len pick: obj attr: attrib_raw func_len + assign: len 
  pick: obj attr: parent assign: parent 
  push: 214 shuffle assign: len assign: obj ] bind: autogen62 
[ newfunc1 assign: obj 
   pick: nullobj assign: nullobj_cached 
   s21 assign: obj assign: nullobj_cached 
   pick: obj attr: attrib_raw func_len assign: len 
   pushf: autogen62 repeat return_no_value ] bind: obj_total_len 
[ pick: attrib_hash return3 ] bind: autogen63 
[ pick: obj pick: nullobj_cached == pushf: autogen63 if 
  pick: obj attr: attrib_raw pick: attrib_hash add_attrib assign: attrib_hash 
  pick: obj attr: parent assign: parent 
  push: 315 shuffle assign: attrib_hash assign: obj ] bind: autogen64 
[ newfunc1 assign: obj 
   pick: nullobj assign: nullobj_cached 
   s21 assign: obj assign: nullobj_cached 
   pick: obj obj_total_len assign: len 
   check: len hashtable assign: attrib_hash 
   pushf: autogen64 repeat return_no_value ] bind: convert_attr 
  [ newfunc3 assign: searcher assign: receiver assign: name 
  pick: True ] bind: hash_header 
 push: obj_total_len_ print 
 pick: boot_array.attrib print 
 printeol 
 pick: boot_array_class attr: attrib_raw print 
 printeol 
 pick: boot_obj attr: attrib print 
 printeol 
 pick: boot_array_class attr: parent attr: attrib_raw print 
 printeol 
 pick: nullobj print 
 printeol 
 pick: boot_array_class attr: parent attr: parent print 
 printeol 
 pick: boot_array_class print 
 pick: boot_array_class attr: parent print 
 pick: boot_array_class attr: parent attr: parent print 
 printeol 
 push: total_len_is_ print 
 pick: boot_array_class obj_total_len print 
 printeol 
 pick: hashtable_class convert_attr bind: hashtable.hash 
[ 
   hash_header 
   pick: name pick: hashtable.hash hashtable.get call ] rebind: hashtable.attrib 
 pick: boot_array_class convert_attr bind: boot_array.hash 
[ 
   hash_header 
   pick: name pick: boot_array.hash hashtable.get call ] rebind: boot_array.attrib 
 pick: boot_dict_class convert_attr bind: boot_dict.hash 
[ 
   hash_header 
   pick: name pick: boot_dict.hash hashtable.get call ] rebind: boot_dict.attrib 
[ newfunc2 assign: self assign: length 
   pick: length pick: length + pushi: 3 + pick: boot_array_class boot_array.instance assign: _array 
   pick: boot_obj minobj.instance assign: new_obj 
   pick: self pick: new_obj 2 - memory.set 
   pick: length pick: new_obj memory.set 
   pick: _array memory.append 
   push: ] names.get memory.append 
   pick: new_obj return1 ] bind: resizable.instance 
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
   pick: new_array pick: self 1 + memory.set return_no_value ] bind: resizable.double 
[ newfunc1 assign: self 
   pick: self memory.get assign: length 
   pick: length pick: boot_array_class boot_array.instance assign: new_array 
   pick: new_array pick: self 1 + memory.set return_no_value ] bind: resizable.reset 
[ newfunc1 assign: self 
  pick: self memory.get 1 + pick: self memory.set return_no_value ] bind: resizable.increase 
[ newfunc1 assign: self 
   pick: self 1 + memory.get memory.get return1 ] bind: resizable.max_len 
[ pick: self resizable.double ] bind: autogen65 
[ newfunc2 assign: self assign: value 
   pick: self memory.get pick: self resizable.max_len < not pushf: autogen65 if 
   pick: self memory.get pick: value pick: self resizable.set 
   pick: self resizable.increase return_no_value ] bind: resizable.append 
[ pick: l pick: i - pick: other resizable.get pick: self resizable.append 
  check: i 1 - assign: i ] bind: autogen66 
[ newfunc2 assign: self assign: other 
   pick: other attr: len assign: l 
   pick: l assign: i 
   pushf: autogen66 repeat_if return_no_value ] bind: resizable.extend 
[ return_no_value2 ] bind: autogen67 
[ pick: value pick: self resizable.extend ] bind: autogen68 
[ pick: value pick: self resizable.append ] bind: autogen69 
[ newfunc2 assign: self assign: value 
   pick: value None == pushf: autogen67 if 
   pick: value pick: resizable_class is_instance pushf: autogen68 pushf: autogen69 if-else return_no_value ] bind: resizable.append_array 
[ newfunc1 assign: self 
   pick: self memory.get 1 - pick: self memory.set 
   pick: self memory.get pick: self resizable.get return1 ] bind: resizable.pop 
[ newfunc1 assign: self 
  pick: self memory.get 1 - pick: self resizable.get return1 ] bind: resizable.top 
[ printspace ] bind: autogen70 
[ pick: l pick: i - pick: self resizable.get tprint 
  pick: i 1 > pushf: autogen70 if 
  check: i 1 - assign: i ] bind: autogen71 
[ newfunc1 assign: self 
   push: [ print 
   pick: self memory.get assign: l 
   pick: l assign: i 
   pushf: autogen71 repeat_if 
   push: ] print return_no_value ] bind: resizable.print 
[ push: Resizable_looking_up_ print 
  pick: name print 
  printeol ] bind: autogen72 
[ newfunc3 assign: searcher assign: receiver assign: name 
   pick: lookup_print pushf: autogen72 if 
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
   pick: name pick: receiver pick: searcher instance_attrib return1 ] bind: resizable.attrib 
 pick: resizable.attrib pick: boot_obj attr_call: subclass bind: resizable_class 
 pick: resizable_class attr: instance pick: resizable_class closure bind: resizable 
 pick: resizable_class convert_attr bind: resizable.hash 
[ 
   hash_header 
   pick: name pick: resizable.hash hashtable.get call ] rebind: resizable.attrib 
[ newfunc3 assign: self assign: children assign: name 
   pick: boot_obj minobj.instance assign: new_obj 
   pick: self pick: new_obj 2 - memory.set 
   pick: name pick: new_obj memory.set 
   pick: children memory.append 
   push: ] names.get memory.append 
   check: new_obj return1 ] bind: node.instance 
[ pick: key pick: children resizable.get return2 ] bind: autogen73 
[ pick: children return3 ] bind: autogen74 
[ pick: key 0 == pushf: autogen74 if 
  push: Out_of_bound_index error ] bind: autogen75 
[ newfunc2 assign: self assign: key 
   pick: self 1 + memory.get assign: children 
   pick: children pick: resizable_class is_instance pushf: autogen73 pushf: autogen75 if-else return_no_value ] bind: node.get 
[ newfunc1 assign: self 
   pick: self memory.get printraw 
   push: { print 
   pick: self 1 + memory.get tprint 
   push: } print return_no_value ] bind: node.print 
[ pick: children memory.get return2 ] bind: autogen76 
[ 1 return2 ] bind: autogen77 
[ newfunc1 assign: self 
   pick: self 1 + memory.get assign: children 
   pick: children pick: resizable_class is_instance pushf: autogen76 pushf: autogen77 if-else return_no_value ] bind: node.len 
[ newfunc2 assign: self assign: new_name 
  pick: new_name pick: self memory.set return_no_value ] bind: node.set_name 
[ newfunc2 assign: self assign: new_children 
  pick: new_children pick: self 1 + memory.set return_no_value ] bind: node.set_children 
[ push: Node_looking_up_ print 
  pick: name print 
  printeol ] bind: autogen78 
[ newfunc3 assign: searcher assign: receiver assign: name 
   pick: lookup_print pushf: autogen78 if 
   pick: name push: get string_equal pick: node.get return_if 
   pick: name push: instance string_equal pick: node.instance return_if 
   pick: name push: print string_equal pick: node.print return_if 
   pick: name push: set_name string_equal pick: node.set_name return_if 
   pick: name push: set_children string_equal pick: node.set_children return_if 
   pick: name push: len string_equal pick: receiver node.len return_if 
   pick: name push: name string_equal pick: receiver memory.get return_if 
   pick: name push: children string_equal pick: receiver 1 + memory.get return_if 
   pick: name push: type string_equal push: node return_if 
   pick: name pick: receiver pick: searcher instance_attrib return1 ] bind: node.attrib 
 pick: node.attrib pick: boot_obj attr_call: subclass bind: node_class 
 pick: node_class attr: instance pick: node_class closure bind: node 
 pick: node_class convert_attr bind: node.hash 
[ 
   hash_header 
   pick: name pick: node.hash hashtable.get call ] rebind: node.attrib 
[ newfunc2 assign: self assign: filename 
   pick: boot_obj minobj.instance assign: new_obj 
   pick: self pick: new_obj 2 - memory.set 
   push: r pick: filename file.open pick: new_obj memory.set 
   0 memory.append 
   push: ] names.get memory.append 
   pick: new_obj return1 ] bind: Input.instance 
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
  printeol ] bind: autogen79 
[ newfunc3 assign: searcher assign: receiver assign: name 
   pick: lookup_print pushf: autogen79 if 
   pick: name push: instance string_equal pick: Input.instance return_if 
   pick: name push: ended string_equal pick: Input.ended return_if 
   pick: name push: next string_equal pick: Input.next return_if 
   pick: name push: next_char string_equal pick: Input.next_char return_if 
   pick: name push: startswith string_equal pick: Input.startswith return_if 
   pick: name push: position string_equal pick: Input.position return_if 
   pick: name push: position_set string_equal pick: Input.position_set return_if 
   pick: name push: file string_equal pick: receiver memory.get return_if 
   pick: name push: type string_equal push: Input return_if 
   pick: name pick: receiver pick: searcher instance_attrib return1 ] bind: Input.attrib 
 pick: Input.attrib pick: boot_obj attr_call: subclass bind: Input_class 
 pick: Input_class attr: instance pick: Input_class closure bind: Input 
 pick: Input_class convert_attr bind: Input.hash 
[ 
   hash_header 
   pick: name pick: Input.hash hashtable.get call ] rebind: Input.attrib 
[ newfunc1 assign: self 
   pick: boot_obj minobj.instance assign: new_obj 
   pick: self pick: new_obj 2 - memory.set 
   _cheat_dict.new pick: new_obj memory.set 
   push: ] names.get memory.append 
   pick: new_obj return1 ] bind: cheat_dict.instance 
[ push: CheatDict_looking_up_ print 
  pick: name print 
  printeol ] bind: autogen80 
[ newfunc3 assign: searcher assign: receiver assign: name 
   pick: lookup_print pushf: autogen80 if 
   pick: name push: instance string_equal pick: cheat_dict.instance return_if 
   pick: name push: get string_equal pick: _cheat_dict.get return_if 
   pick: name push: set string_equal pick: _cheat_dict.set return_if 
   pick: name pick: receiver pick: searcher instance_attrib return1 ] bind: cheat_dict.attrib 
 pick: cheat_dict.attrib pick: boot_obj attr_call: subclass bind: cheat_dict_class 
 pick: cheat_dict_class attr: instance pick: cheat_dict_class closure bind: cheat_dict 
[ newfunc2 assign: self assign: message 
   pick: boot_obj minobj.instance assign: new_obj 
   pick: self pick: new_obj 2 - memory.set 
   pick: message pick: new_obj memory.set 
   push: ] names.get memory.append 
   pick: new_obj return1 ] bind: MatchError.instance 
[ newfunc1 assign: self 
   push: Match_error: print 
   check: self memory.get print return_no_value ] bind: MatchError.print 
[ push: MatchError_looking_up_ print 
  pick: name print 
  printeol ] bind: autogen81 
[ newfunc3 assign: searcher assign: receiver assign: name 
   pick: lookup_print pushf: autogen81 if 
   pick: name push: instance string_equal pick: MatchError.instance return_if 
   pick: name push: print string_equal pick: MatchError.print return_if 
   pick: name push: type string_equal push: MatchError return_if 
   pick: name pick: receiver pick: searcher instance_attrib return1 ] bind: MatchError.attrib 
 pick: MatchError.attrib pick: boot_obj attr_call: subclass bind: MatchError_class 
 pick: MatchError_class attr: instance pick: MatchError_class closure bind: MatchError 
[ push: End_of_file MatchError return2 ] bind: autogen82 
[ push: Not_exactly MatchError return2 ] bind: autogen83 
[ newfunc1 assign: char 
   pick: source attr_call: next_char assign: input_char 
    pick: input_char None == pushf: autogen82 if 
    pick: char pick: input_char string_equal not pushf: autogen83 if 
   check: input_char return1 ] bind: exactly 
[ push: End_of_file MatchError return2 ] bind: autogen84 
[ push: Not_between MatchError return2 ] bind: autogen85 
[ newfunc2 assign: end assign: start 
   pick: source attr_call: next_char assign: input_char 
    pick: input_char None == pushf: autogen84 if 
    pick: start pick: end pick: input_char char_between not pushf: autogen85 if 
   check: input_char return1 ] bind: between 
[ push: End_of_file MatchError return2 ] bind: autogen86 
[ push: Not_exactly MatchError return2 ] bind: autogen87 
[ newfunc1 assign: char 
   pick: source attr_call: next assign: input_char 
    pick: input_char None == pushf: autogen86 if 
    pick: char pick: input_char string_equal not pushf: autogen87 if 
   check: input_char return1 ] bind: token 
[ 0 0 return_two2 ] bind: autogen88 
[ newfunc1 assign: children 
   pick: children memory.get pick: end_of_func == pushf: autogen88 if 
   pick: children 2 + pick: children 1 + memory.get return_two1 return_no_value ] bind: next_child 
[ check: output return3 ] bind: autogen89 
[ check: child call assign: output 
  pick: output pick: MatchError_class is_instance not pushf: autogen89 if 
  check: output drop1 
  pick: saved pick: source attr_call: position_set 
  check: children next_child assign: child assign: children ] bind: autogen90 
[ newfunc1 assign: children 
   pick: source attr_call: position assign: saved 
   s21 assign: children assign: saved 
   check: children next_child assign: child assign: children 
   pushf: autogen90 repeat_if 
   push: No_OR_child_matches MatchError return1 ] bind: or 
[ check: output return2 ] bind: autogen91 
[ newfunc1 assign: child 
   check: child call assign: output 
   pick: output pick: MatchError_class is_instance pushf: autogen91 if 
   push: out pick: output node return1 ] bind: out 
[ pick: output attr: name push: out string_equal return2 ] bind: autogen92 
[ newfunc1 assign: output 
   pick: output pick: node_class is_instance pushf: autogen92 if 
   pick: False return1 ] bind: is_output 
[ pick: outputs return3 ] bind: autogen93 
[ pick: outputs attr: array 1 + pick: length str_join return4 ] bind: autogen94 
[ pick: output str_len 1 == pushf: autogen94 if ] bind: autogen95 
[ pick: output return3 ] bind: autogen96 
[ pick: outputs attr: len assign: length 
  pick: length 0 == pushf: autogen93 if 
  0 pick: outputs attr_call: get assign: output 
   pick: output is_str pushf: autogen95 if 
   pick: length 1 == pushf: autogen96 if ] bind: autogen97 
[ pick: outputs attr: children return4 ] bind: autogen98 
[ pick: outputs attr: children is_str pushf: autogen98 if ] bind: autogen99 
[ pick: outputs pick: node_class is_instance pushf: autogen99 if ] bind: autogen100 
[ newfunc1 assign: outputs 
   pick: outputs pick: resizable_class is_instance pushf: autogen97 pushf: autogen100 if-else 
   pick: outputs return1 ] bind: make_string 
[ pick: saved pick: source attr_call: position_set 
  push: And_match_failed MatchError return3 ] bind: autogen101 
[ pick: output attr: children pick: outputs attr_call: append_array ] bind: autogen102 
[ pick: output is_output pushf: autogen102 if 
  check: output drop1 ] bind: autogen103 
[ 0 resizable assign: outputs 
  pick: output attr: children pick: outputs attr_call: append_array 
  pick: True assign: output_mode 
  s4127 assign: children assign: output_mode assign: outputs ] bind: autogen104 
[ pick: output pick: outputs attr_call: append_array 
  check: output drop1 ] bind: autogen105 
[ pick: output is_output pushf: autogen104 pushf: autogen105 if-else ] bind: autogen106 
[ check: child call assign: output 
   pick: output pick: MatchError_class is_instance pushf: autogen101 if 
   pick: output_mode pushf: autogen103 pushf: autogen106 if-else 
  check: children next_child assign: child assign: children ] bind: autogen107 
[ newfunc1 assign: init_children 
   pick: source attr_call: position assign: saved 
   0 resizable assign: outputs 
   pick: False assign: output_mode 
   pick: init_children assign: children 
   check: children next_child assign: child assign: children 
   pushf: autogen107 repeat_if 
   pick: outputs make_string return1 ] bind: and 
[ 0 c.infinity return_two2 ] bind: autogen108 
[ 1 c.infinity return_two2 ] bind: autogen109 
[ 0 1 return_two2 ] bind: autogen110 
[ newfunc1 assign: quantifier 
    pick: quantifier push: * string_equal pushf: autogen108 if 
    pick: quantifier push: + string_equal pushf: autogen109 if 
    pick: quantifier push: ? string_equal pushf: autogen110 if 
   push: Unknown_quantifier error return_no_value ] bind: get_bounds 
[ pick: start_saved pick: source attr_call: position_set 
  push: Quantified_undermatch MatchError return4 ] bind: autogen111 
[ pick: count pick: lower < pushf: autogen111 if 
  pick: saved pick: source attr_call: position_set 
  pick: outputs make_string return3 ] bind: autogen112 
[ pick: outputs make_string return3 ] bind: autogen113 
[ pick: source attr_call: position assign: saved 
  pick: child call assign: output 
  pick: output pick: MatchError_class is_instance pushf: autogen112 if 
  check: output pick: outputs attr_call: append_array 
  check: saved drop1 
  check: count 1 + assign: count 
  pick: count pick: upper == pushf: autogen113 if ] bind: autogen114 
[ newfunc2 assign: quantifier assign: child 
   check: quantifier get_bounds assign: upper assign: lower 
   0 resizable assign: outputs 
   pick: source attr_call: position assign: start_saved 
   0 assign: count 
   pushf: autogen114 repeat return_no_value ] bind: quantified 
[ None return2 ] bind: autogen115 
[ newfunc1 assign: child 
   pick: source attr_call: position assign: saved 
   s21 assign: child assign: saved 
   check: child call assign: output 
   pick: saved pick: source attr_call: position_set 
   pick: output pick: MatchError_class is_instance pushf: autogen115 if 
   push: Negation_is_true MatchError return1 ] bind: negation 
[ pick: output return2 ] bind: autogen116 
[ newfunc2 assign: name assign: child 
   pick: child call assign: output 
   pick: output pick: MatchError_class is_instance pushf: autogen116 if 
   pick: name pick: output node return1 ] bind: bound 
[ pick: output attr: len 1 > return2 ] bind: autogen117 
[ newfunc1 assign: output 
   pick: output pick: resizable_class is_instance pushf: autogen117 if 
   pick: False return1 ] bind: should_make_node 
 pushi: 40 hashtable bind: parseg 
[ newfunc0 
  push: apply_print pick: True pick: parseg attr_call: set return_no_value ] bind: debug_parse 
[ newfunc1 assign: grammar_obj 
   push: prefix 0 pick: grammar_obj attr_call: get pick: parseg attr_call: set 
   push: rules 1 pick: grammar_obj attr_call: get pick: parseg attr_call: set 
   push: flagged 2 pick: grammar_obj attr_call: get pick: parseg attr_call: set 
   push: base_rules pushi: 3 pick: grammar_obj attr_call: get pick: parseg attr_call: set 
   push: nest 0 pick: parseg attr_call: set 
   push: apply_print pick: False pick: parseg attr_call: set 
   push: indentation 0 resizable pick: parseg attr_call: set 
   0 push: indentation pick: parseg attr_call: get attr_call: append 
   memoizer.reset return_no_value ] bind: init_parseg 
[ newfunc1 assign: name 
  push: Dummy error return_no_value ] bind: _apply 
[ printspace 
  check: i 1 - assign: i ] bind: autogen118 
[ pick: nesting assign: i 
  pushf: autogen118 repeat_if 
  pick: name print 
  printspace 
  pick: source attr_call: position tprint 
  printeol ] bind: autogen119 
[ printspace 
  check: i 1 - assign: i ] bind: autogen120 
[ pick: nesting assign: i 
  pushf: autogen120 repeat_if 
  pick: name print 
  printspace 
  pick: source attr_call: position tprint 
  push: _->_ print 
  pick: output tprint 
  printeol ] bind: autogen121 
[ printspace 
  check: i 1 - assign: i ] bind: autogen122 
[ pick: nesting assign: i 
  pushf: autogen122 repeat_if 
  pick: name print 
  push: _->_ print 
  pick: output tprint 
  printeol ] bind: autogen123 
[ pick: output return2 ] bind: autogen124 
[ push: Making_node_ print 
  pick: name printraw 
  printeol 
  pick: name pick: output node return2 ] bind: autogen125 
[ pick: output return2 ] bind: autogen126 
[ newfunc1 assign: name 
   push: nest pick: parseg attr_call: get assign: nesting 
   push: apply_print pick: parseg attr_call: get pushf: autogen119 if 
   push: nest pick: nesting 1 + pick: parseg attr_call: set 
   pick: name push: rules pick: parseg attr_call: get hashtable.get call assign: output 
   push: nest pick: nesting pick: parseg attr_call: set 
    push: apply_print pick: parseg attr_call: get pushf: autogen121 if 
    pick: name push: statement string_equal pushf: autogen123 if 
    pick: output pick: MatchError_class is_instance pushf: autogen124 if 
    pick: output should_make_node pushf: autogen125 if 
    pick: name push: flagged pick: parseg attr_call: get attr_call: string_index None == pushf: autogen126 if 
   pick: name pick: output node return1 ] rebind: _apply 
[ check: new_pos pick: source attr_call: position_set 
  check: mem_out return2 ] bind: autogen127 
[ pick: source attr_call: position assign: saved 
  pick: name _apply assign: output 
  pick: name pick: saved push: indentation pick: parseg attr_call: get pick: output pick: source attr_call: position memoizer.set 
  check: output return2 ] bind: autogen128 
[ newfunc1 assign: name 
   pick: name pick: source attr_call: position push: indentation pick: parseg attr_call: get memoizer.get assign: memoized assign: new_pos assign: mem_out 
   check: memoized pushf: autogen127 pushf: autogen128 if-else return_no_value ] bind: apply 
[ push: End_of_file MatchError return2 ] bind: autogen129 
[ newfunc0 
   pick: source attr_call: next_char assign: char 
   pick: char None == pushf: autogen129 if 
   check: char return1 ] bind: base.rules.anything 
[ newfunc0 
  None return1 ] bind: base.rules.void 
[ push: a push: z between ] bind: autogen130 
[ push: A push: Z between ] bind: autogen131 
[ pushf: autogen130 pushf: autogen131 ] bind: autogen132 
[ newfunc0 
  pushf: autogen132 or return1 ] bind: base.rules.letter 
[ newfunc0 
  push: 0 push: 9 between return1 ] bind: base.rules.digit 
[ push: rule.letter apply ] bind: autogen133 
[ push: _ exactly ] bind: autogen134 
[ pushf: autogen133 pushf: autogen134 ] bind: autogen135 
[ pushf: autogen135 or ] bind: autogen136 
[ push: rule.letter apply ] bind: autogen137 
[ push: rule.digit apply ] bind: autogen138 
[ push: _ exactly ] bind: autogen139 
[ pushf: autogen137 pushf: autogen138 pushf: autogen139 ] bind: autogen140 
[ pushf: autogen140 or ] bind: autogen141 
[ pushf: autogen141 push: * quantified ] bind: autogen142 
[ pushf: autogen136 pushf: autogen142 ] bind: autogen143 
[ newfunc0 
  pushf: autogen143 and return1 ] bind: base.rules.name 
[ pick: output return2 ] bind: autogen144 
[ push: \t return2 ] bind: autogen145 
[ push: \n return2 ] bind: autogen146 
[ push: \r return2 ] bind: autogen147 
[ push: \\ return2 ] bind: autogen148 
[ push: ' return2 ] bind: autogen149 
[ push: " return2 ] bind: autogen150 
[ newfunc0 
   push: raw_escaped_char apply assign: output 
    pick: output pick: MatchError_class is_instance pushf: autogen144 if 
    pick: output push: t string_equal pushf: autogen145 if 
    pick: output push: n string_equal pushf: autogen146 if 
    pick: output push: r string_equal pushf: autogen147 if 
    pick: output push: \\ string_equal pushf: autogen148 if 
    pick: output push: ' string_equal pushf: autogen149 if 
    pick: output push: " string_equal pushf: autogen150 if 
   push: Unknown_escaped_char error return_no_value ] bind: base.rules.wrapped_escaped_char 
[ newfunc1 assign: rules 
   push: letter pick: base.rules.letter pick: rules hashtable.set 
   push: digit pick: base.rules.digit pick: rules hashtable.set 
   push: anything pick: base.rules.anything pick: rules hashtable.set 
   push: void pick: base.rules.void pick: rules hashtable.set return_no_value ] bind: add_base_rules 
[ newfunc1 assign: rules 
   push: raw_escaped_char push: escaped_char pick: rules attr_call: get pick: rules hashtable.set 
   push: escaped_char pick: base.rules.wrapped_escaped_char pick: rules hashtable.set return_no_value ] bind: add_escaped_char_rules 
 None bind: source 
 push: stage2.pkl load 
[ newfunc1 assign: root 
  push: Dummy_function_should_not_be_called error return_no_value ] bind: to_flpc2 
[ pick: root printrepr 
  return_no_value2 ] bind: autogen151 
[ 0 pick: root attr_call: get to_flpc2 return_no_value2 ] bind: autogen152 
[ 0 pick: root attr_call: get to_flpc2 return_no_value2 ] bind: autogen153 
[ 0 pick: root attr_call: get tprint 
  push: Unexpected_child_of_exactly._Was_expecting_a_escaped_chart. error ] bind: autogen154 
[ 0 pick: root attr_call: get attr: name push: escaped_char string_equal not pushf: autogen154 if 
  pick: root attr: name 0 0 pick: root attr_call: get attr_call: get node to_flpc2 return_no_value2 ] bind: autogen155 
[ push: prefix pick: parseg attr_call: get printraw 
  push: .rules. print 
  0 0 pick: root attr_call: get attr_call: get printraw 
  push: _<-_fun[]:\n____return( print 
  pushi: 3 pick: root attr_call: get to_flpc2 
  push: ) print 
  return_no_value2 ] bind: autogen156 
[ push: out print ] bind: autogen157 
[ pick: name printraw ] bind: autogen158 
[ push: [ print ] bind: autogen159 
[ push: [ print ] bind: autogen160 
[ check: bracket 1 + assign: bracket ] bind: autogen161 
[ check: bracket 1 + assign: bracket ] bind: autogen162 
[ check: bracket 1 + assign: bracket ] bind: autogen163 
[ pick: child attr: name push: quantifier string_equal pushf: autogen162 if 
  pick: child attr: name push: inline string_equal pushf: autogen163 if ] bind: autogen164 
[ push: [ print ] bind: autogen165 
[ push: ] print ] bind: autogen166 
[ push: _ print ] bind: autogen167 
[ pick: l pick: i - pick: root attr_call: get assign: child 
  0 assign: bracket 
   pick: child pick: node_class is_instance not pushf: autogen161 pushf: autogen164 if-else 
   pick: bracket not pushf: autogen165 if 
  s21 assign: child assign: bracket 
  check: child to_flpc2 
  check: bracket not pushf: autogen166 if 
  check: i 1 - assign: i 
  pick: i 0 > pushf: autogen167 if ] bind: autogen168 
[ push: ] print ] bind: autogen169 
[ push: ] print ] bind: autogen170 
[ newfunc1 assign: root 
   pick: root pick: node_class is_instance not pushf: autogen151 if 
   pick: root attr: name assign: name 
    pick: name push: quantifier string_equal pushf: autogen152 if 
    pick: name push: inline string_equal pushf: autogen153 if 
    pick: name push: exactly string_equal pick: name push: token string_equal || 0 pick: root attr_call: get pick: node_class is_instance && pushf: autogen155 if 
    pick: name push: rule string_equal pushf: autogen156 if 
    pick: name push: output string_equal pushf: autogen157 pushf: autogen158 if-else 
   push: ( print 
    pick: name push: and string_equal pushf: autogen159 if 
    pick: name push: or string_equal pushf: autogen160 if 
   pick: root attr: len assign: l 
   pick: l assign: i 
    pushf: autogen168 repeat_if 
    pick: name push: and string_equal pushf: autogen169 if 
    pick: name push: or string_equal pushf: autogen170 if 
   push: ) print return_no_value ] rebind: to_flpc2 
[ pick: l pick: i - pick: root attr_call: get to_flpc2 
  printeol 
  printeol 
  check: i 1 - assign: i ] bind: autogen171 
[ newfunc1 assign: root 
   pick: root attr: len assign: l 
   pick: l assign: i 
   pushf: autogen171 repeat_if return_no_value ] bind: print_grammar_funcs 
[ newfunc1 assign: ruleset 
   pick: ruleset printraw 
   push: ( print 
   push: prefix pick: parseg attr_call: get printraw 
   push: .rules) print 
   printeol return_no_value ] bind: print_ruleset 
[ pick: prefix printraw 
  push: .base_._append(" print 
  pick: l pick: i - push: base_rules pick: parseg attr_call: get attr_call: get printraw 
  push: ") print 
  printeol 
  check: i 1 - assign: i ] bind: autogen172 
[ newfunc0 
   push: prefix pick: parseg attr_call: get assign: prefix 
   pick: prefix printraw 
   push: .base_<-_resizable(0) print 
   printeol 
   push: base_rules pick: parseg attr_call: get attr: len assign: l 
   pick: l assign: i 
   pushf: autogen172 repeat_if 
   pick: prefix printraw 
   push: _<-_resizable(0) print 
   printeol 
   pick: prefix printraw 
   push: _._append(" print 
   pick: prefix printraw 
   push: ") print 
   printeol 
   pick: prefix printraw 
   push: _._append( print 
   pick: prefix printraw 
   push: .rules) print 
   printeol 
   pick: prefix printraw 
   push: _._append( print 
   pick: prefix printraw 
   push: .flagged) print 
   printeol 
   pick: prefix printraw 
   push: _._append( print 
   pick: prefix printraw 
   push: .base) print 
   printeol return_no_value ] bind: print_grammar_obj 
[ push: prefix pick: parseg attr_call: get printraw 
  push: .flagged_._append(" print 
  pick: name printraw 
  push: ") print 
  printeol ] bind: autogen173 
[ newfunc1 assign: child 
   0 0 pick: child attr_call: get attr_call: get assign: name 
   push: hashtable.set(" print 
   pick: name printraw 
   push: "_ print 
   push: prefix pick: parseg attr_call: get printraw 
   push: .rules. print 
   pick: name printraw 
   push: _ print 
   push: prefix pick: parseg attr_call: get printraw 
   push: .rules) print 
   printeol 
   1 pick: child attr_call: get attr: len 0 > pushf: autogen173 if return_no_value ] bind: print_child_setter 
[ pick: l pick: i - pick: root attr_call: get print_child_setter 
  check: i 1 - assign: i ] bind: autogen174 
[ pick: l pick: i - push: base_rules pick: parseg attr_call: get attr_call: get print_ruleset 
  check: i 1 - assign: i ] bind: autogen175 
[ newfunc1 assign: root 
   pick: root attr: len assign: l 
   push: prefix pick: parseg attr_call: get printraw 
   push: .rules_<-_hashtable( print 
   pick: l pick: l + pick: l + pick: l + int_to_str print 
   push: ) print 
   printeol 
   push: prefix pick: parseg attr_call: get printraw 
   push: .flagged_<-_resizable(0) print 
   printeol 
   pick: l assign: i 
   pushf: autogen174 repeat_if 
   push: base_rules pick: parseg attr_call: get attr: len assign: l 
   pick: l assign: i 
   pushf: autogen175 repeat_if return_no_value ] bind: print_grammar_setters 
[ newfunc1 assign: root 
   pick: root print_grammar_funcs 
   check: root print_grammar_setters 
   print_grammar_obj return_no_value ] bind: print_grammar_all 
[ newfunc2 assign: input_filename assign: grammar_obj 
   push: source pick: input_filename Input names2 attr_call: set 
   pick: grammar_obj init_parseg 
   pick: parseg print 
   push: grammar apply assign: output 
   pick: output return1 ] bind: parse_grammar 
[ 1 resizable assign: wrapped 
  0 pick: output pick: wrapped attr_call: set ] bind: autogen176 
[ pick: output assign: wrapped ] bind: autogen177 
[ pick: l pick: i - pick: wrapped attr_call: get print_child_setter 
  check: i 1 - assign: i ] bind: autogen178 
[ newfunc3 assign: output_filename assign: input_filename assign: grammar_obj 
   pick: grammar_obj pick: input_filename parse_grammar assign: output 
   pick: output attr_call: print 
   printeol 
   push: Writing_ print 
   pick: output_filename printraw 
   printeol 
   pick: output attr: name print 
   printeol 
   push: w pick: output_filename file.open assign: outf 
   pick: outf set_output 
   pick: output attr: name push: grammar string_equal not pushf: autogen176 pushf: autogen177 if-else 
   pick: wrapped print_grammar_funcs 
   pick: wrapped attr: len assign: l 
   pick: l assign: i 
   pushf: autogen178 repeat_if 
   None set_output 
   pick: outf file.close return_no_value ] bind: write_parsed_funcs 
[ newfunc3 assign: output_filename assign: input_filename assign: grammar_obj 
   pick: grammar_obj pick: input_filename parse_grammar assign: output 
   pick: output attr_call: print 
   printeol 
   push: Writing_ print 
   pick: output_filename printraw 
   printeol 
   push: w pick: output_filename file.open assign: outf 
   pick: outf set_output 
   pick: output print_grammar_all 
   None set_output 
   pick: outf file.close return_no_value ] bind: write_parsed 
[ None return2 ] bind: autogen179 
[ newfunc0 
   pick: source attr_call: position assign: saved 
   push: hspaces apply make_string assign: s 
   push: indentation pick: parseg attr_call: get attr_call: top pick: s str_len == pushf: autogen179 if 
   pick: saved pick: source attr_call: position_set 
   push: Different_indent MatchError return1 ] bind: base.rules.SAME_INDENT 
[ newfunc0 
   push: indentation pick: parseg attr_call: get attr_call: pop 
   None return1 ] bind: base.rules.DEDENT 
[ pick: saved pick: source attr_call: position_set 
  push: Missing_newline_before_indent MatchError return2 ] bind: autogen180 
[ newfunc0 
   pick: source attr_call: position assign: saved 
   push: NEWLINE apply pick: MatchError_class is_instance pushf: autogen180 if 
   push: hspaces apply make_string assign: s 
   pick: saved pick: source attr_call: position_set 
   pick: s str_len push: indentation pick: parseg attr_call: get attr_call: append 
   None return1 ] bind: base.rules.INDENT 
[ check: output 1 + memory.get make_string assign: output ] bind: autogen181 
[ push: NAME apply assign: output 
  pick: output pick: node_class is_instance pushf: autogen181 if ] bind: autogen182 
[ push: Not_token_or_EOF MatchError return3 ] bind: autogen183 
[ pick: s pick: source attr_call: startswith assign: output 
  pick: output None == pushf: autogen183 if 
  check: output return2 ] bind: autogen184 
[ pick: output return2 ] bind: autogen185 
[ push: End_of_file MatchError return2 ] bind: autogen186 
[ push: Not_exactly_token MatchError return2 ] bind: autogen187 
[ newfunc1 assign: s 
   pick: source attr_call: position assign: saved 
   push: spaces apply drop1 
    pick: s is_alpha pushf: autogen182 pushf: autogen184 if-else 
    pick: output pick: MatchError_class is_instance pushf: autogen185 if 
    pick: output None == pushf: autogen186 if 
    pick: output pick: s string_equal not pushf: autogen187 if 
   pick: output return1 ] rebind: token 
[ newfunc1 assign: rules 
   push: INDENT pick: base.rules.INDENT pick: rules hashtable.set 
   push: DEDENT pick: base.rules.DEDENT pick: rules hashtable.set 
   push: SAME_INDENT pick: base.rules.SAME_INDENT pick: rules hashtable.set return_no_value ] bind: add_indent_rules 
[ push: # exactly ] bind: autogen188 
[ push: \n exactly ] bind: autogen189 
[ pushf: autogen189 negation ] bind: autogen190 
[ push: anything apply ] bind: autogen191 
[ pushf: autogen191 out ] bind: autogen192 
[ pushf: autogen190 pushf: autogen192 ] bind: autogen193 
[ pushf: autogen193 and ] bind: autogen194 
[ pushf: autogen194 push: * quantified ] bind: autogen195 
[ pushf: autogen195 out ] bind: autogen196 
[ pushf: autogen188 pushf: autogen196 ] bind: autogen197 
[ pushf: autogen197 and ] bind: autogen198 
[ newfunc0 
  pushf: autogen198 push: comment bound return1 ] bind: flpcg.rules.comment 
[ push: \n exactly ] bind: autogen199 
[ push: \r exactly ] bind: autogen200 
[ push: \s exactly ] bind: autogen201 
[ push: \t exactly ] bind: autogen202 
[ pushf: autogen199 pushf: autogen200 pushf: autogen201 pushf: autogen202 ] bind: autogen203 
[ newfunc0 
  pushf: autogen203 or return1 ] bind: flpcg.rules.space 
[ push: space apply ] bind: autogen204 
[ newfunc0 
  pushf: autogen204 push: * quantified return1 ] bind: flpcg.rules.spaces 
[ push: space apply ] bind: autogen205 
[ newfunc0 
  pushf: autogen205 push: + quantified return1 ] bind: flpcg.rules.spacesp 
[ push: \s exactly ] bind: autogen206 
[ push: \t exactly ] bind: autogen207 
[ pushf: autogen206 pushf: autogen207 ] bind: autogen208 
[ pushf: autogen208 or ] bind: autogen209 
[ newfunc0 
  pushf: autogen209 push: * quantified return1 ] bind: flpcg.rules.hspaces 
[ push: \s exactly ] bind: autogen210 
[ push: \t exactly ] bind: autogen211 
[ pushf: autogen210 pushf: autogen211 ] bind: autogen212 
[ pushf: autogen212 or ] bind: autogen213 
[ newfunc0 
  pushf: autogen213 push: + quantified return1 ] bind: flpcg.rules.hspacesp 
[ push: hspaces apply ] bind: autogen214 
[ push: comment apply ] bind: autogen215 
[ pushf: autogen215 push: ? quantified ] bind: autogen216 
[ push: \n exactly ] bind: autogen217 
[ push: \r exactly ] bind: autogen218 
[ pushf: autogen217 pushf: autogen218 ] bind: autogen219 
[ pushf: autogen219 or ] bind: autogen220 
[ pushf: autogen214 pushf: autogen216 pushf: autogen220 ] bind: autogen221 
[ pushf: autogen221 and ] bind: autogen222 
[ newfunc0 
  pushf: autogen222 push: EMPTY_LINE bound return1 ] bind: flpcg.rules.EMPTY_LINE 
[ push: hspaces apply ] bind: autogen223 
[ push: - exactly ] bind: autogen224 
[ pushf: autogen224 push: ? quantified ] bind: autogen225 
[ push: digit apply ] bind: autogen226 
[ pushf: autogen226 push: + quantified ] bind: autogen227 
[ pushf: autogen225 pushf: autogen227 ] bind: autogen228 
[ pushf: autogen228 and ] bind: autogen229 
[ pushf: autogen229 out ] bind: autogen230 
[ pushf: autogen223 pushf: autogen230 ] bind: autogen231 
[ newfunc0 
  pushf: autogen231 and return1 ] bind: flpcg.rules.NUMBER 
[ push: hspaces apply ] bind: autogen232 
[ push: \q exactly ] bind: autogen233 
[ push: \q exactly ] bind: autogen234 
[ pushf: autogen234 negation ] bind: autogen235 
[ push: anything apply ] bind: autogen236 
[ pushf: autogen235 pushf: autogen236 ] bind: autogen237 
[ pushf: autogen237 and ] bind: autogen238 
[ pushf: autogen238 push: * quantified ] bind: autogen239 
[ pushf: autogen239 out ] bind: autogen240 
[ push: \q exactly ] bind: autogen241 
[ pushf: autogen233 pushf: autogen240 pushf: autogen241 ] bind: autogen242 
[ pushf: autogen242 and ] bind: autogen243 
[ push: ' exactly ] bind: autogen244 
[ push: ' exactly ] bind: autogen245 
[ pushf: autogen245 negation ] bind: autogen246 
[ push: anything apply ] bind: autogen247 
[ pushf: autogen246 pushf: autogen247 ] bind: autogen248 
[ pushf: autogen248 and ] bind: autogen249 
[ pushf: autogen249 push: * quantified ] bind: autogen250 
[ pushf: autogen250 out ] bind: autogen251 
[ push: ' exactly ] bind: autogen252 
[ pushf: autogen244 pushf: autogen251 pushf: autogen252 ] bind: autogen253 
[ pushf: autogen253 and ] bind: autogen254 
[ pushf: autogen243 pushf: autogen254 ] bind: autogen255 
[ pushf: autogen255 or ] bind: autogen256 
[ pushf: autogen232 pushf: autogen256 ] bind: autogen257 
[ newfunc0 
  pushf: autogen257 and return1 ] bind: flpcg.rules.STRING 
[ push: hspaces apply ] bind: autogen258 
[ push: letter apply ] bind: autogen259 
[ push: _ exactly ] bind: autogen260 
[ pushf: autogen259 pushf: autogen260 ] bind: autogen261 
[ pushf: autogen261 or ] bind: autogen262 
[ push: space apply ] bind: autogen263 
[ pushf: autogen263 negation ] bind: autogen264 
[ push: ( exactly ] bind: autogen265 
[ pushf: autogen265 negation ] bind: autogen266 
[ push: = exactly ] bind: autogen267 
[ pushf: autogen267 negation ] bind: autogen268 
[ push: ) exactly ] bind: autogen269 
[ pushf: autogen269 negation ] bind: autogen270 
[ push: [ exactly ] bind: autogen271 
[ pushf: autogen271 negation ] bind: autogen272 
[ push: ] exactly ] bind: autogen273 
[ pushf: autogen273 negation ] bind: autogen274 
[ push: < exactly ] bind: autogen275 
[ pushf: autogen275 negation ] bind: autogen276 
[ push: : exactly ] bind: autogen277 
[ pushf: autogen277 negation ] bind: autogen278 
[ push: ' exactly ] bind: autogen279 
[ pushf: autogen279 negation ] bind: autogen280 
[ push: anything apply ] bind: autogen281 
[ pushf: autogen264 pushf: autogen266 pushf: autogen268 pushf: autogen270 pushf: autogen272 pushf: autogen274 pushf: autogen276 pushf: autogen278 pushf: autogen280 pushf: autogen281 ] bind: autogen282 
[ pushf: autogen282 and ] bind: autogen283 
[ pushf: autogen283 push: * quantified ] bind: autogen284 
[ pushf: autogen262 pushf: autogen284 ] bind: autogen285 
[ pushf: autogen285 and ] bind: autogen286 
[ pushf: autogen286 out ] bind: autogen287 
[ pushf: autogen258 pushf: autogen287 ] bind: autogen288 
[ newfunc0 
  pushf: autogen288 and return1 ] bind: flpcg.rules.NAME 
[ push: hspacesp apply ] bind: autogen289 
[ push: 'F token ] bind: autogen290 
[ pushf: autogen290 negation ] bind: autogen291 
[ push: space apply ] bind: autogen292 
[ pushf: autogen292 negation ] bind: autogen293 
[ push: anything apply ] bind: autogen294 
[ pushf: autogen293 pushf: autogen294 ] bind: autogen295 
[ pushf: autogen295 and ] bind: autogen296 
[ pushf: autogen296 push: * quantified ] bind: autogen297 
[ pushf: autogen297 out ] bind: autogen298 
[ pushf: autogen289 pushf: autogen291 pushf: autogen298 ] bind: autogen299 
[ newfunc0 
  pushf: autogen299 and return1 ] bind: flpcg.rules.FORTH_NAME 
[ push: + token ] bind: autogen300 
[ push: - token ] bind: autogen301 
[ push: / token ] bind: autogen302 
[ push: == token ] bind: autogen303 
[ push: < token ] bind: autogen304 
[ push: > token ] bind: autogen305 
[ push: . token ] bind: autogen306 
[ push: in token ] bind: autogen307 
[ push: || token ] bind: autogen308 
[ push: && token ] bind: autogen309 
[ pushf: autogen300 pushf: autogen301 pushf: autogen302 pushf: autogen303 pushf: autogen304 pushf: autogen305 pushf: autogen306 pushf: autogen307 pushf: autogen308 pushf: autogen309 ] bind: autogen310 
[ newfunc0 
  pushf: autogen310 or return1 ] bind: flpcg.rules.bin_op 
[ push: NAME apply ] bind: autogen311 
[ newfunc0 
  pushf: autogen311 push: * quantified return1 ] bind: flpcg.rules.names 
[ newfunc0 
  push: NAME apply return1 ] bind: flpcg.rules.variable 
[ push: ` token ] bind: autogen312 
[ push: NAME apply ] bind: autogen313 
[ pushf: autogen313 out ] bind: autogen314 
[ pushf: autogen312 pushf: autogen314 ] bind: autogen315 
[ newfunc0 
  pushf: autogen315 and return1 ] bind: flpcg.rules.name_quote 
[ push: [ token ] bind: autogen316 
[ push: ] token ] bind: autogen317 
[ pushf: autogen317 negation ] bind: autogen318 
[ push: spaces apply ] bind: autogen319 
[ push: statement apply ] bind: autogen320 
[ pushf: autogen320 out ] bind: autogen321 
[ pushf: autogen318 pushf: autogen319 pushf: autogen321 ] bind: autogen322 
[ pushf: autogen322 and ] bind: autogen323 
[ pushf: autogen323 push: + quantified ] bind: autogen324 
[ pushf: autogen324 out ] bind: autogen325 
[ push: ] token ] bind: autogen326 
[ pushf: autogen316 pushf: autogen325 pushf: autogen326 ] bind: autogen327 
[ newfunc0 
  pushf: autogen327 and return1 ] bind: flpcg.rules.quote 
[ push: F' token ] bind: autogen328 
[ push: forth_line apply ] bind: autogen329 
[ push: hspaces apply ] bind: autogen330 
[ push: \n exactly ] bind: autogen331 
[ push: \r exactly ] bind: autogen332 
[ pushf: autogen331 pushf: autogen332 ] bind: autogen333 
[ pushf: autogen333 or ] bind: autogen334 
[ push: forth_line apply ] bind: autogen335 
[ pushf: autogen335 out ] bind: autogen336 
[ pushf: autogen330 pushf: autogen334 pushf: autogen336 ] bind: autogen337 
[ pushf: autogen337 and ] bind: autogen338 
[ pushf: autogen338 push: * quantified ] bind: autogen339 
[ pushf: autogen329 pushf: autogen339 ] bind: autogen340 
[ pushf: autogen340 and ] bind: autogen341 
[ pushf: autogen341 out ] bind: autogen342 
[ push: spaces apply ] bind: autogen343 
[ push: 'F token ] bind: autogen344 
[ pushf: autogen328 pushf: autogen342 pushf: autogen343 pushf: autogen344 ] bind: autogen345 
[ newfunc0 
  pushf: autogen345 and return1 ] bind: flpcg.rules.forth 
[ push: FORTH_NAME apply ] bind: autogen346 
[ pushf: autogen346 push: NAME bound ] bind: autogen347 
[ newfunc0 
  pushf: autogen347 push: * quantified return1 ] bind: flpcg.rules.forth_line 
[ push: [ token ] bind: autogen348 
[ push: names apply ] bind: autogen349 
[ pushf: autogen349 out ] bind: autogen350 
[ push: ] token ] bind: autogen351 
[ pushf: autogen348 pushf: autogen350 pushf: autogen351 ] bind: autogen352 
[ newfunc0 
  pushf: autogen352 and return1 ] bind: flpcg.rules.simple_quote 
[ push: ( token ] bind: autogen353 
[ push: expr apply ] bind: autogen354 
[ pushf: autogen354 out ] bind: autogen355 
[ push: ) token ] bind: autogen356 
[ pushf: autogen353 pushf: autogen355 pushf: autogen356 ] bind: autogen357 
[ newfunc0 
  pushf: autogen357 and return1 ] bind: flpcg.rules.parenthesis 
[ push: NAME apply ] bind: autogen358 
[ push: bin_op apply ] bind: autogen359 
[ pushf: autogen359 push: NAME bound ] bind: autogen360 
[ pushf: autogen358 pushf: autogen360 ] bind: autogen361 
[ pushf: autogen361 or ] bind: autogen362 
[ pushf: autogen362 out ] bind: autogen363 
[ push: ( exactly ] bind: autogen364 
[ push: exprs apply ] bind: autogen365 
[ pushf: autogen365 push: parameters bound ] bind: autogen366 
[ pushf: autogen366 out ] bind: autogen367 
[ push: ) token ] bind: autogen368 
[ pushf: autogen363 pushf: autogen364 pushf: autogen367 pushf: autogen368 ] bind: autogen369 
[ newfunc0 
  pushf: autogen369 and return1 ] bind: flpcg.rules.func_call 
[ push: NAME apply ] bind: autogen370 
[ push: simple_quote apply ] bind: autogen371 
[ push: non_block apply ] bind: autogen372 
[ push: void apply ] bind: autogen373 
[ pushf: autogen371 pushf: autogen372 pushf: autogen373 ] bind: autogen374 
[ pushf: autogen374 or ] bind: autogen375 
[ pushf: autogen375 out ] bind: autogen376 
[ push: : token ] bind: autogen377 
[ push: suite apply ] bind: autogen378 
[ pushf: autogen378 push: quote bound ] bind: autogen379 
[ pushf: autogen379 out ] bind: autogen380 
[ pushf: autogen376 pushf: autogen377 pushf: autogen380 ] bind: autogen381 
[ pushf: autogen381 and ] bind: autogen382 
[ pushf: autogen382 push: parameters bound ] bind: autogen383 
[ pushf: autogen370 pushf: autogen383 ] bind: autogen384 
[ newfunc0 
  pushf: autogen384 and return1 ] bind: flpcg.rules.block_call 
[ push: block_call apply ] bind: autogen385 
[ push: NEWLINE apply ] bind: autogen386 
[ pushf: autogen386 push: + quantified ] bind: autogen387 
[ push: SAME_INDENT apply ] bind: autogen388 
[ push: block_call apply ] bind: autogen389 
[ pushf: autogen389 out ] bind: autogen390 
[ pushf: autogen387 pushf: autogen388 pushf: autogen390 ] bind: autogen391 
[ pushf: autogen391 and ] bind: autogen392 
[ pushf: autogen392 push: + quantified ] bind: autogen393 
[ pushf: autogen385 pushf: autogen393 ] bind: autogen394 
[ newfunc0 
  pushf: autogen394 and return1 ] bind: flpcg.rules.multi_block_call 
[ push: forth apply ] bind: autogen395 
[ push: func_call apply ] bind: autogen396 
[ push: name_quote apply ] bind: autogen397 
[ push: quote apply ] bind: autogen398 
[ push: parenthesis apply ] bind: autogen399 
[ push: NUMBER apply ] bind: autogen400 
[ push: STRING apply ] bind: autogen401 
[ push: variable apply ] bind: autogen402 
[ pushf: autogen395 pushf: autogen396 pushf: autogen397 pushf: autogen398 pushf: autogen399 pushf: autogen400 pushf: autogen401 pushf: autogen402 ] bind: autogen403 
[ newfunc0 
  pushf: autogen403 or return1 ] bind: flpcg.rules.non_block_non_infix 
[ push: infix apply ] bind: autogen404 
[ push: non_block_non_infix apply ] bind: autogen405 
[ pushf: autogen404 pushf: autogen405 ] bind: autogen406 
[ newfunc0 
  pushf: autogen406 or return1 ] bind: flpcg.rules.non_block 
[ push: non_block_non_infix apply ] bind: autogen407 
[ push: bin_op apply ] bind: autogen408 
[ pushf: autogen408 push: op bound ] bind: autogen409 
[ push: non_block_non_infix apply ] bind: autogen410 
[ pushf: autogen409 pushf: autogen410 ] bind: autogen411 
[ pushf: autogen411 and ] bind: autogen412 
[ pushf: autogen412 push: + quantified ] bind: autogen413 
[ pushf: autogen407 pushf: autogen413 ] bind: autogen414 
[ newfunc0 
  pushf: autogen414 and return1 ] bind: flpcg.rules.infix 
[ push: block_call apply ] bind: autogen415 
[ push: non_block_non_infix apply ] bind: autogen416 
[ pushf: autogen415 pushf: autogen416 ] bind: autogen417 
[ newfunc0 
  pushf: autogen417 or return1 ] bind: flpcg.rules.non_infix 
[ push: infix apply ] bind: autogen418 
[ push: non_infix apply ] bind: autogen419 
[ pushf: autogen418 pushf: autogen419 ] bind: autogen420 
[ newfunc0 
  pushf: autogen420 or return1 ] bind: flpcg.rules.expr 
[ push: expr apply ] bind: autogen421 
[ push: spacesp apply ] bind: autogen422 
[ push: expr apply ] bind: autogen423 
[ pushf: autogen423 out ] bind: autogen424 
[ pushf: autogen422 pushf: autogen424 ] bind: autogen425 
[ pushf: autogen425 and ] bind: autogen426 
[ pushf: autogen426 push: * quantified ] bind: autogen427 
[ pushf: autogen421 pushf: autogen427 ] bind: autogen428 
[ pushf: autogen428 and ] bind: autogen429 
[ push: void apply ] bind: autogen430 
[ pushf: autogen429 pushf: autogen430 ] bind: autogen431 
[ newfunc0 
  pushf: autogen431 or return1 ] bind: flpcg.rules.exprs 
[ push: expr apply ] bind: autogen432 
[ push: hspacesp apply ] bind: autogen433 
[ push: expr apply ] bind: autogen434 
[ pushf: autogen434 out ] bind: autogen435 
[ pushf: autogen433 pushf: autogen435 ] bind: autogen436 
[ pushf: autogen436 and ] bind: autogen437 
[ pushf: autogen437 push: * quantified ] bind: autogen438 
[ pushf: autogen432 pushf: autogen438 ] bind: autogen439 
[ newfunc0 
  pushf: autogen439 and return1 ] bind: flpcg.rules.exprsp 
[ push: names apply ] bind: autogen440 
[ pushf: autogen440 out ] bind: autogen441 
[ push: = token ] bind: autogen442 
[ push: space apply ] bind: autogen443 
[ pushf: autogen441 pushf: autogen442 pushf: autogen443 ] bind: autogen444 
[ pushf: autogen444 and ] bind: autogen445 
[ push: void apply ] bind: autogen446 
[ pushf: autogen445 pushf: autogen446 ] bind: autogen447 
[ pushf: autogen447 or ] bind: autogen448 
[ push: exprsp apply ] bind: autogen449 
[ pushf: autogen448 pushf: autogen449 ] bind: autogen450 
[ newfunc0 
  pushf: autogen450 and return1 ] bind: flpcg.rules.assign 
[ push: names apply ] bind: autogen451 
[ pushf: autogen451 out ] bind: autogen452 
[ push: <- token ] bind: autogen453 
[ push: exprsp apply ] bind: autogen454 
[ pushf: autogen454 out ] bind: autogen455 
[ pushf: autogen452 pushf: autogen453 pushf: autogen455 ] bind: autogen456 
[ newfunc0 
  pushf: autogen456 and return1 ] bind: flpcg.rules.bind 
[ push: multi_block_call apply ] bind: autogen457 
[ push: bind apply ] bind: autogen458 
[ push: assign apply ] bind: autogen459 
[ pushf: autogen457 pushf: autogen458 pushf: autogen459 ] bind: autogen460 
[ newfunc0 
  pushf: autogen460 or return1 ] bind: flpcg.rules.statement 
[ push: INDENT apply ] bind: autogen461 
[ push: NEWLINE apply ] bind: autogen462 
[ pushf: autogen462 push: + quantified ] bind: autogen463 
[ push: SAME_INDENT apply ] bind: autogen464 
[ push: statement apply ] bind: autogen465 
[ pushf: autogen463 pushf: autogen464 pushf: autogen465 ] bind: autogen466 
[ pushf: autogen466 and ] bind: autogen467 
[ pushf: autogen467 push: + quantified ] bind: autogen468 
[ push: DEDENT apply ] bind: autogen469 
[ pushf: autogen461 pushf: autogen468 pushf: autogen469 ] bind: autogen470 
[ pushf: autogen470 and ] bind: autogen471 
[ push: statement apply ] bind: autogen472 
[ pushf: autogen471 pushf: autogen472 ] bind: autogen473 
[ newfunc0 
  pushf: autogen473 or return1 ] bind: flpcg.rules.suite 
[ push: hspaces apply ] bind: autogen474 
[ push: \n exactly ] bind: autogen475 
[ push: \r exactly ] bind: autogen476 
[ pushf: autogen475 pushf: autogen476 ] bind: autogen477 
[ pushf: autogen477 or ] bind: autogen478 
[ pick: None out ] bind: autogen479 
[ pushf: autogen474 pushf: autogen478 pushf: autogen479 ] bind: autogen480 
[ pushf: autogen480 and ] bind: autogen481 
[ push: COMMENT_LINE apply ] bind: autogen482 
[ pushf: autogen481 pushf: autogen482 ] bind: autogen483 
[ newfunc0 
  pushf: autogen483 or return1 ] bind: flpcg.rules.NEWLINE 
[ push: hspaces apply ] bind: autogen484 
[ push: comment apply ] bind: autogen485 
[ pushf: autogen485 out ] bind: autogen486 
[ push: hspaces apply ] bind: autogen487 
[ push: \n exactly ] bind: autogen488 
[ push: \r exactly ] bind: autogen489 
[ pushf: autogen488 pushf: autogen489 ] bind: autogen490 
[ pushf: autogen490 or ] bind: autogen491 
[ pushf: autogen484 pushf: autogen486 pushf: autogen487 pushf: autogen491 ] bind: autogen492 
[ newfunc0 
  pushf: autogen492 and return1 ] bind: flpcg.rules.COMMENT_LINE 
[ push: NEWLINE apply ] bind: autogen493 
[ pushf: autogen493 push: * quantified ] bind: autogen494 
[ push: SAME_INDENT apply ] bind: autogen495 
[ push: statement apply ] bind: autogen496 
[ push: NEWLINE apply ] bind: autogen497 
[ pushf: autogen497 push: + quantified ] bind: autogen498 
[ push: anything apply ] bind: autogen499 
[ pushf: autogen499 negation ] bind: autogen500 
[ pushf: autogen498 pushf: autogen500 ] bind: autogen501 
[ pushf: autogen501 or ] bind: autogen502 
[ pushf: autogen494 pushf: autogen495 pushf: autogen496 pushf: autogen502 ] bind: autogen503 
[ pushf: autogen503 and ] bind: autogen504 
[ pushf: autogen504 push: + quantified ] bind: autogen505 
[ pushf: autogen505 push: suite bound ] bind: autogen506 
[ push: statement apply ] bind: autogen507 
[ pushf: autogen507 push: suite bound ] bind: autogen508 
[ pushf: autogen506 pushf: autogen508 ] bind: autogen509 
[ newfunc0 
  pushf: autogen509 or return1 ] bind: flpcg.rules.grammar 
 pushi: 148 hashtable bind: flpcg.rules 
 0 resizable bind: flpcg.flagged 
 push: comment pick: flpcg.rules.comment pick: flpcg.rules hashtable.set 
 push: space pick: flpcg.rules.space pick: flpcg.rules hashtable.set 
 push: spaces pick: flpcg.rules.spaces pick: flpcg.rules hashtable.set 
 push: spacesp pick: flpcg.rules.spacesp pick: flpcg.rules hashtable.set 
 push: hspaces pick: flpcg.rules.hspaces pick: flpcg.rules hashtable.set 
 push: hspacesp pick: flpcg.rules.hspacesp pick: flpcg.rules hashtable.set 
 push: EMPTY_LINE pick: flpcg.rules.EMPTY_LINE pick: flpcg.rules hashtable.set 
 push: EMPTY_LINE pick: flpcg.flagged attr_call: append 
 push: NUMBER pick: flpcg.rules.NUMBER pick: flpcg.rules hashtable.set 
 push: NUMBER pick: flpcg.flagged attr_call: append 
 push: STRING pick: flpcg.rules.STRING pick: flpcg.rules hashtable.set 
 push: STRING pick: flpcg.flagged attr_call: append 
 push: NAME pick: flpcg.rules.NAME pick: flpcg.rules hashtable.set 
 push: NAME pick: flpcg.flagged attr_call: append 
 push: FORTH_NAME pick: flpcg.rules.FORTH_NAME pick: flpcg.rules hashtable.set 
 push: bin_op pick: flpcg.rules.bin_op pick: flpcg.rules hashtable.set 
 push: names pick: flpcg.rules.names pick: flpcg.rules hashtable.set 
 push: names pick: flpcg.flagged attr_call: append 
 push: variable pick: flpcg.rules.variable pick: flpcg.rules hashtable.set 
 push: variable pick: flpcg.flagged attr_call: append 
 push: name_quote pick: flpcg.rules.name_quote pick: flpcg.rules hashtable.set 
 push: name_quote pick: flpcg.flagged attr_call: append 
 push: quote pick: flpcg.rules.quote pick: flpcg.rules hashtable.set 
 push: quote pick: flpcg.flagged attr_call: append 
 push: forth pick: flpcg.rules.forth pick: flpcg.rules hashtable.set 
 push: forth pick: flpcg.flagged attr_call: append 
 push: forth_line pick: flpcg.rules.forth_line pick: flpcg.rules hashtable.set 
 push: simple_quote pick: flpcg.rules.simple_quote pick: flpcg.rules hashtable.set 
 push: simple_quote pick: flpcg.flagged attr_call: append 
 push: parenthesis pick: flpcg.rules.parenthesis pick: flpcg.rules hashtable.set 
 push: func_call pick: flpcg.rules.func_call pick: flpcg.rules hashtable.set 
 push: block_call pick: flpcg.rules.block_call pick: flpcg.rules hashtable.set 
 push: multi_block_call pick: flpcg.rules.multi_block_call pick: flpcg.rules hashtable.set 
 push: non_block_non_infix pick: flpcg.rules.non_block_non_infix pick: flpcg.rules hashtable.set 
 push: non_block pick: flpcg.rules.non_block pick: flpcg.rules hashtable.set 
 push: infix pick: flpcg.rules.infix pick: flpcg.rules hashtable.set 
 push: non_infix pick: flpcg.rules.non_infix pick: flpcg.rules hashtable.set 
 push: expr pick: flpcg.rules.expr pick: flpcg.rules hashtable.set 
 push: exprs pick: flpcg.rules.exprs pick: flpcg.rules hashtable.set 
 push: exprsp pick: flpcg.rules.exprsp pick: flpcg.rules hashtable.set 
 push: assign pick: flpcg.rules.assign pick: flpcg.rules hashtable.set 
 push: bind pick: flpcg.rules.bind pick: flpcg.rules hashtable.set 
 push: bind pick: flpcg.flagged attr_call: append 
 push: statement pick: flpcg.rules.statement pick: flpcg.rules hashtable.set 
 push: suite pick: flpcg.rules.suite pick: flpcg.rules hashtable.set 
 push: NEWLINE pick: flpcg.rules.NEWLINE pick: flpcg.rules hashtable.set 
 push: COMMENT_LINE pick: flpcg.rules.COMMENT_LINE pick: flpcg.rules hashtable.set 
 push: grammar pick: flpcg.rules.grammar pick: flpcg.rules hashtable.set 
 pick: flpcg.rules add_base_rules 
 pick: flpcg.rules add_indent_rules 
 0 resizable bind: flpcg.base 
 push: add_base_rules pick: flpcg.base attr_call: append 
 push: add_indent_rules pick: flpcg.base attr_call: append 
 0 resizable bind: flpcg 
 push: flpcg pick: flpcg attr_call: append 
 pick: flpcg.rules pick: flpcg attr_call: append 
 pick: flpcg.flagged pick: flpcg attr_call: append 
 pick: flpcg.base pick: flpcg attr_call: append 
[ check: cond2_thunk call assign: cond ] bind: autogen510 
[ check: cond2_thunk drop1 
  pick: False assign: cond ] bind: autogen511 
[ assign: cond1 assign: cond2_thunk 
  check: cond1 pushf: autogen510 pushf: autogen511 if-else ] bind: lazy_and 
[ 
  1 drop1 ] bind: debugger2 
[ newfunc2 assign: value assign: title 
   pick: title print 
   pick: value tprint 
   printeol return_no_value ] bind: dprint 
[ check: cond drop1 
  pick: block call 
  check: index 1 + assign: index 
  pick: index pick: end < assign: cond ] bind: autogen512 
[ 
   push: 231 shuffle assign: index assign: end assign: block 
   pick: index pick: end < assign: cond 
   pushf: autogen512 repeat_if 
   check: index drop1 
   check: end drop1 
   check: block drop1 ] bind: simple_for 
[ 
   push: 51234 shuffle assign: elem assign: index assign: end assign: block assign: new_resizable 
   check: elem pick: new_resizable attr_call: append ] bind: autogen513 
[ 
   0 resizable assign: new_resizable 
   s21 assign: num assign: new_resizable 
   check: num 0 pushf: autogen513 simple_for 
   push: 12 shuffle ] bind: make_resizable 
[ 
   make_resizable assign: arr 
   pick: arr attr: array 1 + pick: arr attr: len str_join assign: joined 
   push: 13 shuffle ] bind: str_cat 
[ 
   pick: index pick: iterable attr_call: get assign: elem 
   pick: block2 call ] bind: autogen514 
[ 
   push: 12 shuffle assign: block2 assign: iterable 
   pick: iterable attr: len 0 pushf: autogen514 simple_for 
   check: block2 drop1 
   check: iterable drop1 ] bind: for_in 
[ 
   pick: block3 call pick: list_comp_out attr_call: append 
   check: elem drop1 ] bind: autogen515 
[ 
   push: 12 shuffle assign: iterable assign: block3 
   0 resizable assign: list_comp_out 
   pick: iterable pushf: autogen515 for_in 
   push: 14 shuffle ] bind: list_comp 
[ pick: block3 call pick: list_comp_out attr_call: append ] bind: autogen516 
[ 
   pick: condition call pushf: autogen516 if 
   check: elem drop1 ] bind: autogen517 
[ 
   push: 123 shuffle assign: condition assign: iterable assign: block3 
   0 resizable assign: list_comp_out 
   pick: iterable pushf: autogen517 for_in 
   push: 14 shuffle ] bind: list_comp_cond 
[ newfunc1 assign: bar 
  1 return1 ] bind: flist.foo 
[ push: FList_looking_up_ print 
  pick: name print 
  printeol ] bind: autogen518 
[ newfunc3 assign: searcher assign: receiver assign: name 
   pick: lookup_print pushf: autogen518 if 
   pick: name push: pos string_equal 0 return_if 
   pick: name pick: receiver pick: searcher instance_attrib return1 ] bind: flist.attrib 
 pick: resizable.attrib pick: boot_obj attr_call: subclass bind: FList_class 
 pick: FList_class attr: instance pick: FList_class closure bind: FList 
[ newfunc2 assign: new_class assign: obj 
  check: new_class pick: obj 2 - memory.set return_no_value ] bind: change_class 
[ 
   check: elem pick: out_list attr_call: append ] bind: autogen519 
[ newfunc2 assign: out_list assign: in_list 
  pick: in_list pushf: autogen519 for_in return_no_value ] bind: extend 
[ check: elem pick: out_list extend ] bind: autogen520 
[ check: elem pick: out_list attr_call: append ] bind: autogen521 
[ 
   pick: elem pick: class is_instance pushf: autogen520 pushf: autogen521 if-else ] bind: autogen522 
[ newfunc2 assign: class assign: in_list 
   0 resizable assign: out_list 
   pick: in_list pushf: autogen522 for_in 
   check: out_list return1 ] bind: flatten 
[ newfunc1 assign: self 
  pick: self 1 + memory.get tprint return_no_value ] bind: forthe.print 
[ push: Forthe_looking_up_ print 
  pick: name print 
  printeol ] bind: autogen523 
[ newfunc3 assign: searcher assign: receiver assign: name 
   pick: lookup_print pushf: autogen523 if 
   pick: name push: get string_equal pick: node.get return_if 
   pick: name push: instance string_equal pick: node.instance return_if 
   pick: name push: print string_equal pick: forthe.print return_if 
   pick: name push: len string_equal pick: receiver node.len return_if 
   pick: name push: name string_equal pick: receiver memory.get return_if 
   pick: name push: value string_equal pick: receiver 1 + memory.get return_if 
   pick: name push: type string_equal push: forthe return_if 
   pick: name pick: receiver pick: searcher instance_attrib return1 ] bind: forthe.attrib 
 pick: forthe.attrib pick: boot_obj attr_call: subclass bind: forthe_class 
 pick: forthe_class attr: instance pick: forthe_class closure bind: forthe 
[ newfunc2 assign: self assign: new_name 
  pick: new_name pick: self memory.set return_no_value ] bind: FQuote.set_name 
[ push: FQuote_looking_up_ print 
  pick: name print 
  printeol ] bind: autogen524 
[ newfunc3 assign: searcher assign: receiver assign: name 
   pick: lookup_print pushf: autogen524 if 
   pick: name push: get string_equal pick: node.get return_if 
   pick: name push: instance string_equal pick: node.instance return_if 
   pick: name push: print string_equal pick: node.print return_if 
   pick: name push: set_name string_equal pick: FQuote.set_name return_if 
   pick: name push: len string_equal pick: receiver node.len return_if 
   pick: name push: name string_equal pick: receiver memory.get return_if 
   pick: name push: value string_equal pick: receiver 1 + memory.get return_if 
   pick: name push: type string_equal push: FQuote return_if 
   pick: name pick: receiver pick: searcher instance_attrib return1 ] bind: FQuote.attrib 
 pick: FQuote.attrib pick: boot_obj attr_call: subclass bind: FQuote_class 
 pick: FQuote_class attr: instance pick: FQuote_class closure bind: FQuote 
 pick: FQuote_class convert_attr bind: FQuote.hash 
[ 
   hash_header 
   pick: name pick: FQuote.hash hashtable.get call ] rebind: FQuote.attrib 
[ newfunc1 assign: array 
   pick: array pick: FList_class change_class 
   check: array return1 ] bind: to_flist 
[ 0 pick: self pick: i + 1 + memory.set 
  check: i 1 - assign: i ] bind: autogen525 
[ newfunc1 assign: self 
   pick: self memory.get assign: i 
   pushf: autogen525 repeat_if return_no_value ] bind: array.clear 
[ newfunc1 assign: root 
  push: Dummy_function error return_no_value ] bind: simplify 
[ pick: elem simplify ] bind: autogen526 
[ pick: root attr: name pushf: autogen526 pick: root list_comp node assign: output ] bind: autogen527 
[ pick: True ] bind: autogen528 
[ 0 resizable assign: output ] bind: autogen529 
[ pick: True ] bind: autogen530 
[ pick: elem simplify ] bind: autogen531 
[ pushf: autogen531 pick: root attr: children list_comp assign: output ] bind: autogen532 
[ pick: root attr: children None == not ] bind: autogen533 
[ pick: root attr: children simplify assign: output ] bind: autogen534 
[ pick: root attr: children pick: node_class is_instance ] bind: autogen535 
[ pushf: autogen529 pushf: autogen530 pushf: autogen532 pushf: autogen533 pushf: autogen534 pushf: autogen535 pushi: 3 multi-if ] bind: autogen536 
[ pick: root attr: name push: parameters string_equal pick: root attr: name push: exprs string_equal || ] bind: autogen537 
[ 0 pick: root attr_call: get simplify assign: output ] bind: autogen538 
[ 0 pick: root attr_call: get attr: name push: exprs string_equal ] bind: autogen539 
[ pushf: autogen539 pick: root attr: len 1 == 0 pick: root attr_call: get pick: node_class is_instance && lazy_and ] bind: autogen540 
[ pick: elem simplify ] bind: autogen541 
[ pick: True assign: cond ] bind: autogen542 
[ pick: elem attr: name push: EMPTY_LINE string_equal not assign: cond ] bind: autogen543 
[ 
   pick: elem pick: node_class is_instance not pushf: autogen542 pushf: autogen543 if-else ] bind: autogen544 
[ pushf: autogen541 pick: root pushf: autogen544 list_comp_cond assign: children 
  pick: root attr: name pick: children node assign: output ] bind: autogen545 
[ pick: root attr: name push: suite string_equal ] bind: autogen546 
[ 0 pick: root attr_call: get simplify assign: output ] bind: autogen547 
[ pick: root attr: name push: suite string_equal pick: root attr: len 1 == && ] bind: autogen548 
[ pick: child pick: children attr_call: append ] bind: autogen549 
[ pick: True ] bind: autogen550 
[ push: multi_if pick: last_child attr_call: set_name 
  push: if pick: last_child attr: children node 1 make_resizable pick: last_child attr_call: set_children ] bind: autogen551 
[ debugger2 
  pick: last_child attr: name push: if string_equal pushf: autogen551 if 
  pick: child pick: last_child attr: children attr_call: append 
  debugger2 
  check: child drop1 
  pick: last_child assign: bring_to_top ] bind: autogen552 
[ pick: child attr: name push: elif string_equal ] bind: autogen553 
[ pick: child attr: children pick: last_child attr: children attr_call: append 
  push: if-else pick: last_child attr_call: set_name ] bind: autogen554 
[ pick: last_child attr: name push: if string_equal pick: child attr: name push: else string_equal && ] bind: autogen555 
[ 
   pick: index pick: root attr_call: get simplify assign: child 
   pushf: autogen549 pushf: autogen550 pushf: autogen552 pushf: autogen553 pushf: autogen554 pushf: autogen555 pushi: 3 multi-if 
   debugger2 
   push: 23416 shuffle assign: index assign: end assign: block assign: last_child ] bind: autogen556 
[ push: multi-block-root:_ pick: root dprint 
  debugger2 
  0 resizable assign: children 
  push: dummy None node assign: last_child 
  pick: root attr: len 0 pushf: autogen556 simple_for 
  push: suite pick: children node assign: output ] bind: autogen557 
[ pick: root attr: name push: multi_block_call string_equal ] bind: autogen558 
[ check: cond drop1 
  check: i 2 + assign: i 
  0 pick: i 1 - pick: root attr_call: get attr_call: get pick: i pick: root attr_call: get simplify pick: output simplify 2 make_resizable node assign: output 
  push: 214 shuffle assign: i assign: output 
  pick: i pick: l < assign: cond ] bind: autogen559 
[ pick: root attr: len 2 - assign: l 
  0 pick: root attr_call: get assign: output 
  0 assign: i 
  pick: i pick: l < assign: cond 
  pushf: autogen559 repeat_if 
  check: i drop1 ] bind: autogen560 
[ pick: root attr: name push: infix string_equal ] bind: autogen561 
[ 0 0 pick: root attr_call: get attr_call: get 1 pick: root attr_call: get simplify node assign: output ] bind: autogen562 
[ pick: root attr: name push: func_call string_equal pick: root attr: name push: block_call string_equal || ] bind: autogen563 
[ pick: root assign: output ] bind: autogen564 
[ pick: root pick: node_class is_instance not ] bind: autogen565 
[ newfunc1 assign: root 
   pushf: autogen527 pushf: autogen528 pushf: autogen536 pushf: autogen537 pushf: autogen538 pushf: autogen540 pushf: autogen545 pushf: autogen546 pushf: autogen547 pushf: autogen548 pushf: autogen557 pushf: autogen558 pushf: autogen560 pushf: autogen561 pushf: autogen562 pushf: autogen563 pushf: autogen564 pushf: autogen565 pushi: 9 multi-if 
   check: output return1 ] rebind: simplify 
[ push: newfunc_called_with_unexpected_argument error ] bind: autogen566 
[ newfunc1 assign: i 
   pick: i pushi: 4 < not pushf: autogen566 if 
   pick: i int_to_str push: newfunc 2 str_cat return1 ] bind: newfunc_str 
[ newfunc1 assign: array 
   pick: array pick: FList_class change_class 
   check: array return1 ] rebind: to_flist 
[ newfunc1 assign: root 
  push: Dummy_function error return_no_value ] bind: last_call 
[ pick: root attr: value return3 ] bind: autogen567 
[ push: _ return3 ] bind: autogen568 
[ pick: root attr: name push: FCall string_equal pushf: autogen567 pushf: autogen568 if-else ] bind: autogen569 
[ pick: root attr: len 1 - pick: root attr_call: get last_call return2 ] bind: autogen570 
[ pick: root attr: value last_call return2 ] bind: autogen571 
[ newfunc1 assign: root 
   debugger2 
    pick: root pick: forthe_class is_instance pushf: autogen569 if 
    pick: root pick: FList_class is_instance pick: root pick: resizable_class is_instance || pushf: autogen570 if 
    pick: root pick: FQuote is_instance pushf: autogen571 if 
   push: _ return1 ] rebind: last_call 
[ newfunc1 assign: root 
  push: Dummy_function error return_no_value ] bind: to_forth 
[ newfunc2 assign: obj assign: new_class 
   pick: new_class pick: obj 2 - memory.set 
   pick: obj return1 ] bind: changed_class 
[ pick: elem to_forth ] bind: autogen572 
[ newfunc1 assign: root 
  pick: FList_class pushf: autogen572 pick: root list_comp changed_class return1 ] bind: to_forth_conv.suite 
[ pick: elem to_forth ] bind: autogen573 
[ newfunc1 assign: root 
  push: _ pushf: autogen573 pick: root list_comp pick: FList_class flatten FQuote return1 ] bind: to_forth_conv.quote 
[ pick: elem to_forth ] bind: autogen574 
[ newfunc1 assign: root 
   debugger2 
   pushf: autogen574 pick: root list_comp pick: FList_class flatten assign: children 
   push: Children:_ print 
   pick: children tprint 
   printeol 
   debugger2 
   pick: children attr_call: pop drop1 
   push: FComment pick: children forthe return1 ] bind: to_forth_conv.simple_quote 
[ newfunc1 assign: root 
  pick: FList_class 0 pick: root attr_call: get to_forth push: FCall push: pick: forthe 2 make_resizable changed_class return1 ] bind: to_forth_conv.variable 
[ newfunc1 assign: root 
  push: FStr 0 pick: root attr_call: get forthe return1 ] bind: to_forth_conv.NAME 
[ newfunc1 assign: root 
  pick: FList_class 0 pick: root attr_call: get to_forth push: FCall push: check: forthe 2 make_resizable changed_class return1 ] bind: to_forth_conv.name_quote 
[ newfunc1 assign: root 
  pick: FList_class push: FStr 0 pick: root attr_call: get forthe push: FCall push: push: forthe 2 make_resizable changed_class return1 ] bind: to_forth_conv.STRING 
[ push: FStr pick: child forthe assign: output ] bind: autogen575 
[ pick: FList_class push: FStr pick: child forthe push: FCall push: pushi: forthe 2 make_resizable changed_class assign: output ] bind: autogen576 
[ newfunc1 assign: root 
   0 pick: root attr: children attr_call: get assign: child 
   push: NUMBER_in:_ print 
   pick: root tprint 
   printeol 
   debugger2 
   pick: child push: 0 string_equal pick: child push: 1 string_equal || pick: child push: 2 string_equal || pushf: autogen575 pushf: autogen576 if-else 
   push: NUMBER_out:_ print 
   pick: output tprint 
   printeol 
   debugger2 
   pick: output return1 ] bind: to_forth_conv.NUMBER 
[ push: FCall 0 pick: elem attr_call: get forthe ] bind: autogen577 
[ newfunc1 assign: root 
  pick: FList_class pushf: autogen577 pick: root list_comp changed_class return1 ] bind: to_forth_conv.forth_line 
[ pick: FList_class pick: output 1 make_resizable changed_class assign: output ] bind: autogen578 
[ check: i 1 - assign: i 
  push: FCall push: assign: forthe pick: assignments attr_call: append 
  pick: i pick: names attr_call: get to_forth pick: assignments attr_call: append ] bind: autogen579 
[ newfunc1 assign: root 
   1 pick: root attr_call: get to_forth assign: output 
   pick: output pick: FList_class is_instance not pushf: autogen578 if 
   0 resizable assign: assignments 
   0 pick: root attr_call: get assign: names 
   pick: names attr: len assign: i 
   pushf: autogen579 repeat_if 
   pick: FList_class pick: assignments changed_class pick: output attr_call: append 
   pick: output return1 ] bind: to_forth_conv.assign 
[ pick: elem to_forth ] bind: autogen580 
[ 0 pick: output attr_call: get attr: value assign: names ] bind: autogen581 
[ debugger 
  1 1 - 2 0 pick: output attr_call: get attr_call: slice assign: names ] bind: autogen582 
[ push: FCall pick: names attr: len newfunc_str forthe 1 make_resizable assign: decl ] bind: autogen583 
[ push: FCall push: newfunc forthe push: FStr pick: names attr: len int_to_str forthe push: FCall push: pushi: forthe pushi: 3 make_resizable assign: decl ] bind: autogen584 
[ pick: names attr: len pushi: 4 < pushf: autogen583 pushf: autogen584 if-else ] bind: autogen585 
[ 0 resizable assign: decl ] bind: autogen586 
[ check: i 1 - assign: i 
  push: FCall push: assign: forthe pick: decl attr_call: append 
  pick: i pick: names attr_call: get pick: decl attr_call: append ] bind: autogen587 
[ push: FCall push: return_no_value forthe 1 pick: output attr_call: get attr: value attr_call: append ] bind: autogen588 
[ push: FCall push: return_no_value forthe 1 pick: output attr_call: get attr_call: append ] bind: autogen589 
[ 1 pick: output attr_call: get pick: FQuote_class is_instance pushf: autogen588 pushf: autogen589 if-else ] bind: autogen590 
[ 1 pick: output attr_call: get last_call assign: last 
  debugger2 
  pick: last push: return string_equal pick: last push: lookup_error string_equal || not pushf: autogen590 if ] bind: autogen591 
[ 0 pick: root attr_call: get attr: name push: simple_quote string_equal pushf: autogen581 pushf: autogen582 if-else 
   pick: inline not pushf: autogen585 pushf: autogen586 if-else 
  pick: decl pick: FList_class change_class 
  pick: names attr: len assign: i 
  pushf: autogen587 repeat_if 
  pick: decl tprint 
  printeol 
  debugger2 
  0 pick: decl pick: output attr: value attr_call: set 
  1 pick: output attr_call: get attr: value pick: FList_class change_class 
  1 1 pick: output attr_call: get attr: value pick: output attr: value attr_call: set 
  pick: inline not pushf: autogen591 if ] bind: autogen592 
[ newfunc1 assign: root 
   push: _ pushf: autogen580 pick: root list_comp FQuote assign: output 
   pick: root attr: name push: inline string_equal assign: inline 
   pick: True assign: cond 
   check: cond pushf: autogen592 if 
   pick: output return1 ] bind: to_forth_conv.fun 
[ check: output 1 make_resizable assign: output 
  pick: output pick: FList_class change_class ] bind: autogen593 
[ newfunc1 assign: root 
   push: root: pick: root dprint 
   debugger2 
   1 pick: root attr_call: get to_forth assign: output 
   push: output: pick: output dprint 
   push: root_name: pick: root attr: name dprint 
   debugger2 
   pick: output pick: FList_class is_instance not pushf: autogen593 if 
   push: FCall push: bind: forthe pick: output attr_call: append 
   0 0 pick: root attr_call: get attr_call: get to_forth pick: output attr_call: append 
   pick: output return1 ] bind: to_forth_conv.bind 
[ push: FStr pick: elem forthe ] bind: autogen594 
[ newfunc1 assign: root 
   pushf: autogen594 pick: root list_comp pick: FList_class flatten assign: children 
   push: FComment pick: children forthe return1 ] bind: to_forth_conv.comment 
[ 0 1 pick: root attr_call: get attr_call: get to_forth push: FCall push: attr: forthe 0 pick: root attr_call: get to_forth pushi: 3 make_resizable assign: children ] bind: autogen595 
[ pick: elem to_forth ] bind: autogen596 
[ pushf: autogen596 1 pick: root attr_call: get list_comp assign: children 
  push: FStr 1 pick: root attr_call: get attr: name forthe push: FCall push: attr_call: forthe 0 pick: root attr_call: get to_forth pushi: 3 make_resizable assign: calls 
  check: calls pick: children extend ] bind: autogen597 
[ newfunc1 assign: root 
   1 pick: root attr_call: get attr: name push: variable string_equal pushf: autogen595 pushf: autogen597 if-else 
   pick: FList_class pick: children pick: FList_class flatten changed_class return1 ] bind: to_forth_conv.dot 
[ pick: elem to_forth ] bind: autogen598 
[ newfunc1 assign: root 
   pushf: autogen598 pick: root list_comp assign: output 
   pick: FList_class pick: output pick: FList_class flatten changed_class return1 ] bind: to_forth_conv.grammar 
[ pick: i 1 - pick: root attr_call: get assign: child 
  1 pick: child attr_call: get to_forth pick: output attr_call: append 
  push: quote 0 pick: child attr_call: get node to_forth pick: output attr_call: append 
  check: child drop1 
  check: i 1 - assign: i ] bind: autogen599 
[ newfunc1 assign: root 
   debugger2 
   0 resizable assign: output 
   pick: root attr: len assign: i 
   pushf: autogen599 repeat_if 
   debugger2 
   pick: output pick: FList_class flatten assign: output 
   debugger2 
   push: FCall push: pushi: forthe pick: output attr_call: append 
   push: FStr pick: root attr: len int_to_str forthe pick: output attr_call: append 
   push: FCall pick: root attr: name forthe pick: output attr_call: append 
   pick: output pick: FList_class change_class 
   debugger2 
   pick: output return1 ] bind: to_forth_conv.multi_if 
[ pick: elem to_forth ] bind: autogen600 
[ newfunc1 assign: root 
   pushf: autogen600 pick: root list_comp assign: output 
   check: output pick: FList_class flatten assign: output 
   push: FCall pick: root attr: name forthe pick: output attr_call: append 
   push: output: pick: output dprint 
   debugger2 
   pick: FList_class pick: output changed_class return1 ] bind: to_forth_conv.default 
 pushi: 60 hashtable bind: to_forth_conv_hash 
 push: suite pick: to_forth_conv.suite pick: to_forth_conv_hash attr_call: set 
 push: forth pick: to_forth_conv.suite pick: to_forth_conv_hash attr_call: set 
 push: quote pick: to_forth_conv.quote pick: to_forth_conv_hash attr_call: set 
 push: simple_quote pick: to_forth_conv.simple_quote pick: to_forth_conv_hash attr_call: set 
 push: variable pick: to_forth_conv.variable pick: to_forth_conv_hash attr_call: set 
 push: NAME pick: to_forth_conv.NAME pick: to_forth_conv_hash attr_call: set 
 push: name_quote pick: to_forth_conv.name_quote pick: to_forth_conv_hash attr_call: set 
 push: STRING pick: to_forth_conv.STRING pick: to_forth_conv_hash attr_call: set 
 push: NUMBER pick: to_forth_conv.NUMBER pick: to_forth_conv_hash attr_call: set 
 push: forth_line pick: to_forth_conv.forth_line pick: to_forth_conv_hash attr_call: set 
 push: assign pick: to_forth_conv.assign pick: to_forth_conv_hash attr_call: set 
 push: fun pick: to_forth_conv.fun pick: to_forth_conv_hash attr_call: set 
 push: inline pick: to_forth_conv.fun pick: to_forth_conv_hash attr_call: set 
 push: bind pick: to_forth_conv.bind pick: to_forth_conv_hash attr_call: set 
 push: comment pick: to_forth_conv.comment pick: to_forth_conv_hash attr_call: set 
 push: . pick: to_forth_conv.dot pick: to_forth_conv_hash attr_call: set 
 push: grammar pick: to_forth_conv.grammar pick: to_forth_conv_hash attr_call: set 
 push: exprsp pick: to_forth_conv.grammar pick: to_forth_conv_hash attr_call: set 
 push: multi_if pick: to_forth_conv.multi_if pick: to_forth_conv_hash attr_call: set 
 push: default pick: to_forth_conv.default pick: to_forth_conv_hash attr_call: set 
[ push: root:_ pick: root dprint 
  push: type:_ pick: root attr: type dprint 
  debugger 
  push: Unexpected_non-node_root. error ] bind: autogen601 
[ push: default pick: to_forth_conv_hash attr_call: get assign: converter ] bind: autogen602 
[ newfunc1 assign: root 
   push: nest push: nest pick: parseg attr_call: get 1 + pick: parseg attr_call: set 
   push: nest pick: parseg attr_call: get 0 pick: printspace simple_for 
   pick: root attr: name print 
   push: _<- print 
   printeol 
   pick: root pick: node_class is_instance not pushf: autogen601 if 
   pick: root attr: name pick: to_forth_conv_hash attr_call: get assign: converter 
   pick: converter None == pushf: autogen602 if 
   pick: root pick: converter call assign: output 
   push: nest pick: parseg attr_call: get 0 pick: printspace simple_for 
   pick: root attr: name print 
   push: _->_ pick: output dprint 
   push: nest push: nest pick: parseg attr_call: get 1 - pick: parseg attr_call: set 
   check: output return1 ] rebind: to_forth 
 pushi: 11 hashtable bind: g 
 push: written pushi: 5000 hashtable pick: g attr_call: set 
[ push: file push: w pick: filename file.open pick: g attr_call: set ] bind: autogen603 
[ push: file None pick: g attr_call: set ] bind: autogen604 
[ newfunc1 assign: filename 
   push: written pick: g attr_call: get attr: keys array.clear 
   push: nesting 0 pick: g attr_call: set 
   push: last_value push: _ pick: g attr_call: set 
   push: autogen_count 0 pick: g attr_call: set 
   push: autogen_name push: autogen pick: g attr_call: set 
   pick: filename None == not pushf: autogen603 pushf: autogen604 if-else 
   push: init_g:_ pick: g dprint 
   debugger2 return_no_value ] bind: init_g 
[ 
  push: last_value None pick: g attr_call: set ] bind: write_eol 
[ pick: value push: ] string_equal not pick: value push: return_no_value string_equal not && ] bind: autogen605 
[ printeol 
  push: nesting pick: g attr_call: get 1 pick: printspace simple_for ] bind: autogen606 
[ newfunc1 assign: value 
   push: file pick: g attr_call: get set_output 
   pushf: autogen605 push: last_value pick: g attr_call: get None == lazy_and pushf: autogen606 if 
   printspace 
   pick: value printraw 
   push: last_value pick: value pick: g attr_call: set 
   None set_output return_no_value ] bind: write_sep 
[ newfunc2 assign: depth assign: root 
  push: Dummy_function error return_no_value ] bind: write_string_body 
[ push: ws_root:_ pick: root dprint 
  push: ws_depth:_ pick: depth dprint 
  push: ws_is_str:_ pick: root is_str dprint 
  push: ws_type:_ pick: root attr: type dprint 
  debugger ] bind: autogen607 
[ pick: True ] bind: autogen608 
[ 
   check: elem pick: depth write_string_body ] bind: autogen609 
[ push: nesting push: nesting pick: g attr_call: get 1 + pick: g attr_call: set 
  debugger2 
  pick: root pushf: autogen609 for_in 
  debugger2 
  push: nesting push: nesting pick: g attr_call: get 1 - pick: g attr_call: set 
  write_eol ] bind: autogen610 
[ pick: root pick: FList_class is_instance ] bind: autogen611 
[ push: pushf: write_sep 
  pick: root attr: name write_sep ] bind: autogen612 
[ pick: root pick: FQuote_class is_instance ] bind: autogen613 
[ pick: root attr: value write_sep ] bind: autogen614 
[ pick: root attr: name push: FStr string_equal ] bind: autogen615 
[ pick: depth int_to_str pick: root attr: value 2 str_cat write_sep ] bind: autogen616 
[ pick: root attr: value write_sep ] bind: autogen617 
[ pick: root attr: value push: return string_equal pick: root attr: value push: return_two string_equal || pushf: autogen616 pushf: autogen617 if-else ] bind: autogen618 
[ pick: root attr: name push: FCall string_equal ] bind: autogen619 
[ printspace ] bind: autogen620 
[ pick: root attr: name push: FComment string_equal ] bind: autogen621 
[ pushf: autogen614 pushf: autogen615 pushf: autogen618 pushf: autogen619 pushf: autogen620 pushf: autogen621 pushi: 3 multi-if ] bind: autogen622 
[ pick: root pick: forthe_class is_instance ] bind: autogen623 
[ newfunc2 assign: depth assign: root 
   debugger2 
   pushf: autogen607 pushf: autogen608 pushf: autogen610 pushf: autogen611 pushf: autogen612 pushf: autogen613 pushf: autogen622 pushf: autogen623 pushi: 4 multi-if return_no_value ] rebind: write_string_body 
[ newfunc2 assign: depth assign: root 
  push: Dummy_function error return_no_value ] bind: write_blocks 
[ push: root:_ pick: root dprint 
  push: root_is_quote:_ pick: root pick: FQuote_class is_instance dprint 
  push: root_is_list:_ pick: root pick: FList_class is_instance dprint 
  push: g:_ pick: g dprint ] bind: autogen624 
[ check: elem pick: depth 1 + write_blocks ] bind: autogen625 
[ check: elem pick: depth write_blocks ] bind: autogen626 
[ 
   pick: elem pick: FQuote_class is_instance pushf: autogen625 pushf: autogen626 if-else ] bind: autogen627 
[ push: nesting push: nesting pick: g attr_call: get 1 + pick: g attr_call: set 
  pick: root pushf: autogen627 for_in 
  push: nesting push: nesting pick: g attr_call: get 1 - pick: g attr_call: set 
  write_eol ] bind: autogen628 
[ push: autogen_count pick: g attr_call: get int_to_str push: autogen_name pick: g attr_call: get 2 str_cat assign: name 
  pick: name pick: root attr_call: set_name 
  push: autogen_count push: autogen_count pick: g attr_call: get 1 + pick: g attr_call: set ] bind: autogen629 
[ 
   check: elem pick: depth write_string_body ] bind: autogen630 
[ push: bind: write_sep 
  pick: root attr: name pick: True push: written pick: g attr_call: get attr_call: set ] bind: autogen631 
[ push: rebind: write_sep ] bind: autogen632 
[ push: nesting pick: g attr_call: get assign: nesting 
  debugger2 
  pick: root attr: name push: _ string_equal pushf: autogen629 if 
  push: nesting 0 pick: g attr_call: set 
  push: [ write_sep 
  push: nesting 1 pick: g attr_call: set 
  pick: root pushf: autogen630 for_in 
  push: ] write_sep 
  pick: root attr: name push: written pick: g attr_call: get attr_call: get None == pushf: autogen631 pushf: autogen632 if-else 
  pick: root attr: name write_sep 
  write_eol 
  push: nesting pick: nesting pick: g attr_call: set ] bind: autogen633 
[ newfunc2 assign: depth assign: root 
   pick: False pushf: autogen624 if 
   pick: root pick: FQuote_class is_instance pick: root pick: FList_class is_instance || pushf: autogen628 if 
   pick: root pick: FQuote_class is_instance pushf: autogen633 if return_no_value ] rebind: write_blocks 
[ push: is_bind:_ pick: child attr: len 2 - pick: child attr_call: get attr: value dprint ] bind: autogen634 
[ pick: child attr: len pushi: 4 - pick: child attr_call: get attr: value push: class string_equal ] bind: autogen635 
[ push: is_class:_ pick: child attr: len pushi: 4 - pick: child attr_call: get attr: value dprint 
  push: is_str:_ pick: child attr: len pushi: 4 - pick: child attr_call: get attr: value is_str dprint 
  push: str_eq:_ pick: child attr: len pushi: 4 - pick: child attr_call: get attr: value push: class string_equal dprint 
  push: lazy_cond:_ pushf: autogen635 pick: child attr: len pushi: 4 > lazy_and dprint ] bind: autogen636 
[ printeol 
  push: child:_ pick: child dprint 
  push: child.len:_ pick: child attr: len dprint 
   pick: child attr: len 2 > pushf: autogen634 if 
   pick: child attr: len pushi: 5 > pushf: autogen636 if ] bind: autogen637 
[ 
   pick: child pick: FList_class is_instance pushf: autogen637 if 
   debugger2 ] bind: print_child 
[ debugger2 ] bind: autogen638 
[ pick: s pick: s str_len pushi: 6 - pick: s str_len sub_str push: _colon string_equal ] bind: autogen639 
[ push: : pick: s 0 pick: s str_len pushi: 6 - sub_str 2 str_cat return2 ] bind: autogen640 
[ newfunc1 assign: s 
    pick: s str_len pushi: 6 > pushf: autogen638 if 
    pushf: autogen639 pick: s str_len pushi: 6 > lazy_and pushf: autogen640 if 
   pick: s return1 ] bind: replace_name 
[ newfunc2 assign: prefix assign: root 
  push: Dummy_function error return_no_value ] bind: write_suite 
[ push: nesting 0 pick: g attr_call: set 
  pick: child 0 write_string_body 
  write_eol ] bind: autogen641 
[ pick: child pick: FList_class is_instance ] bind: autogen642 
[ 1 drop1 ] bind: autogen643 
[ pick: child attr: name push: FComment string_equal not ] bind: autogen644 
[ pushf: autogen644 pick: child pick: forthe_class is_instance lazy_and ] bind: autogen645 
[ pick: body attr: name push: FStr string_equal pick: body attr: name push: FCall string_equal || ] bind: autogen646 
[ pick: child 0 write_string_body 
  write_eol ] bind: autogen647 
[ push: Unexpected_bind_body_length error ] bind: autogen648 
[ pick: child attr: len 1 - pick: child attr_call: get attr: value assign: func_name ] bind: autogen649 
[ pick: child attr: len 1 - pick: child attr_call: get attr: value push: . pick: prefix pushi: 3 str_cat assign: func_name ] bind: autogen650 
[ pick: child attr: len pushi: 4 == pushf: autogen648 if 
   pick: prefix None == pushf: autogen649 pushf: autogen650 if-else 
  check: func_name replace_name assign: func_name 
  pick: func_name pick: body attr_call: set_name 
  push: nesting 0 pick: g attr_call: set 
  pick: body 1 write_blocks ] bind: autogen651 
[ debugger2 
  0 pick: child attr_call: get assign: body 
  pushf: autogen646 pick: body pick: forthe_class is_instance lazy_and pushf: autogen647 pushf: autogen651 if-else ] bind: autogen652 
[ pick: child attr: len 2 - pick: child attr_call: get attr: value push: bind: string_equal pick: child attr: len pushi: 3 - pick: child attr_call: get pick: FQuote_class is_instance && ] bind: autogen653 
[ pushf: autogen653 pick: child attr: len 2 > lazy_and ] bind: autogen654 
[ pushf: autogen654 pick: child pick: FList_class is_instance lazy_and ] bind: autogen655 
[ debugger2 
  pick: child attr: len pushi: 4 - pick: child attr_call: get attr: value pick: child attr: len 1 - pick: child attr_call: get attr: value write_suite ] bind: autogen656 
[ pick: child attr: len pushi: 3 - pick: child attr_call: get attr: value push: class string_equal ] bind: autogen657 
[ pushf: autogen657 pick: child attr: len pushi: 3 > lazy_and ] bind: autogen658 
[ pushf: autogen658 pick: child pick: FList_class is_instance lazy_and ] bind: autogen659 
[ newfunc2 assign: prefix assign: child 
   pushf: autogen641 pushf: autogen642 pushf: autogen643 pushf: autogen645 pushf: autogen652 pushf: autogen655 pushf: autogen656 pushf: autogen659 pushi: 4 multi-if 
   debugger2 return_no_value ] bind: write_child 
[ 
   check: elem pick: prefix write_child ] bind: autogen660 
[ newfunc2 assign: prefix assign: root 
  pick: root pushf: autogen660 for_in return_no_value ] rebind: write_suite 
[ push: - print ] bind: autogen661 
[ newfunc2 assign: filename assign: sep 
   pushi: 50 0 pushf: autogen661 simple_for 
   pick: sep print 
   pick: filename print 
   printeol return_no_value ] bind: print_separator 
[ newfunc1 assign: filename 
   push: compiling_file_ print 
   pick: filename printraw 
   printeol 
   push: source pick: filename Input names2 hashtable.set 
   pick: flpcg init_parseg 
   printeol 
   push: Running_flpc_grammar_on_input_ print 
   pick: filename printraw 
   printeol 
   push: grammar apply assign: parsed 
   push: Input:_ print 
   pick: parsed tprint 
   printeol 
   pick: parsed simplify assign: simplified 
   push: Simplified:_ print 
   pick: simplified attr_call: print 
   printeol 
   push: nest 0 pick: parseg attr_call: set 
   pick: simplified to_forth assign: forthed 
   push: ToForth:_ print 
   pick: forthed attr_call: print 
   printeol 
   printeol 
   pick: forthed None write_suite 
   printeol return_no_value ] bind: compile_file 
[ 
   push: _ printraw 
   check: elem printraw ] bind: autogen662 
[ check: elem compile_file ] bind: autogen663 
[ newfunc2 assign: output assign: filenames 
   pick: output init_g 
   push: file pick: g attr_call: get set_output 
   push: push:_ print 
   push: Generated_from printraw 
   pick: filenames pushf: autogen662 for_in 
   push: _print print 
   printeol 
   None set_output 
   pick: filenames pushf: autogen663 for_in return_no_value ] bind: compile_all 
[ newfunc2 assign: temp_filename assign: filename 
   pick: temp_filename init_g 
   push: autogen_name push: tempgen pick: g attr_call: set 
   pick: filename compile_file 
   push: file pick: g attr_call: get file.close return_no_value ] bind: compile_temp 
[ 
   current_input_file 
   push: 4123 shuffle 
   switch_input_file 
   continue_from_file ] bind: run_file 
[ newfunc2 assign: temp_filename assign: filename 
   pick: temp_filename pick: filename compile_temp 
   pick: temp_filename run_file return_no_value ] bind: run_temp 
[ newfunc1 assign: filename 
   check: filename push: gen/temp.f compile_temp 
   push: gen/temp.f run_file return_no_value ] bind: run 
 1 bind: outf 
[ newfunc2 assign: filename assign: str 
   push: w pick: filename pick: outf file.open_at 
   pick: outf set_output 
   push: #_Generated print 
   printeol 
   pick: str printraw 
   printeol 
   None set_output 
   pick: outf file.close return_no_value ] bind: write_file 
[ newfunc2 assign: filename assign: str 
   push: a pick: filename pick: outf file.open_at 
   pick: outf set_output 
   pick: str printraw 
   printeol 
   None set_output 
   pick: outf file.close return_no_value ] bind: append_file 
[ newfunc0 
   push: >>_ print 
   stdin.next_line assign: source 
   pick: source push: gen/eval.flpc write_file 
   push: gen/eval.flpc run return_no_value ] bind: eval_one 
[ return3 ] bind: autogen664 
[ push: >>_ print 
  stdin.next_line assign: source 
  pick: source None == pick: source push: q string_equal || pushf: autogen664 if 
  check: source push: gen/eval.flpc write_file 
  push: gen/eval.flpc run ] bind: autogen665 
[ newfunc0 
  pushf: autogen665 repeat return_no_value ] bind: eval_repl 
 push:  debug_separator bind: debug_separator 
[ check: cond drop1 
  tprint 
  printeol 
  pick1 pick: debug_separator == not assign: cond ] bind: autogen666 
[ 
   pick1 pick: debug_separator == not assign: cond 
   pushf: autogen666 repeat_if 
   drop1 ] bind: print_until_sep 
 pushi: 20 hashtable bind: debug_g 
[ newfunc1 assign: func 
  pick: True pushi: 3 pick: func print_frame return_no_value ] bind: help 
[ newfunc0 
  pick: False push: context pick: debug_g attr_call: get call_stack.len push: height pick: debug_g attr_call: get - print_frame return_no_value ] bind: look 
[ 
   current_input_file 
   pick: debug_separator 
   push: 51234 shuffle 
   switch_input_file 
   push: ----- print 
   printeol 
   print_until_sep 
   continue_from_file ] bind: run_and_print 
[ newfunc1 
  return3 ] bind: autogen667 
[ check: source push: gen/eval.flpc write_file 
  push: gen/eval.flpc push: gen/temp.f compile_temp 
  push: gen/temp.f run_and_print ] bind: autogen668 
[ pick: True ] bind: autogen669 
[ drop1 ] bind: autogen670 
[ pick: source str_len 0 == ] bind: autogen671 
[ pick: debug_separator 
  push: gen/eval.flpc push: gen/temp.f compile_temp 
  push: gen/temp.f run_and_print 
  push: multiline push: multiline pick: debug_g attr_call: get not pick: debug_g attr_call: set ] bind: autogen672 
[ pick: source push: gen/eval.flpc append_file ] bind: autogen673 
[ pick: source push: r string_equal pushf: autogen672 pushf: autogen673 if-else ] bind: autogen674 
[ push: multiline pick: debug_g attr_call: get ] bind: autogen675 
[ push: gen/temprun.f run_and_print ] bind: autogen676 
[ pick: source push: f string_equal ] bind: autogen677 
[ push: multiline push: multiline pick: debug_g attr_call: get not pick: debug_g attr_call: set 
  push: #Empty push: gen/eval.flpc write_file ] bind: autogen678 
[ pick: source push: m string_equal ] bind: autogen679 
[ drop1 
  push: context push: context pick: debug_g attr_call: get 1 - pick: debug_g attr_call: set 
  look ] bind: autogen680 
[ pick: source push: L string_equal ] bind: autogen681 
[ drop1 
  push: context push: context pick: debug_g attr_call: get 1 + pick: debug_g attr_call: set 
  look ] bind: autogen682 
[ pick: source push: l string_equal ] bind: autogen683 
[ drop1 
  push: height push: height pick: debug_g attr_call: get 1 - pick: debug_g attr_call: set 
  look ] bind: autogen684 
[ pick: source push: d string_equal ] bind: autogen685 
[ drop1 
  push: height push: height pick: debug_g attr_call: get 1 + pick: debug_g attr_call: set 
  look ] bind: autogen686 
[ pick: source push: u string_equal ] bind: autogen687 
[ push: >>_ print 
  stdin.next_line assign: source 
   pick: source None == pick: source push: q string_equal || pushf: autogen667 if 
   pushf: autogen668 pushf: autogen669 pushf: autogen670 pushf: autogen671 pushf: autogen674 pushf: autogen675 pushf: autogen676 pushf: autogen677 pushf: autogen678 pushf: autogen679 pushf: autogen680 pushf: autogen681 pushf: autogen682 pushf: autogen683 pushf: autogen684 pushf: autogen685 pushf: autogen686 pushf: autogen687 pushi: 9 multi-if ] bind: autogen688 
[ 
   push: height pushi: 8 pick: debug_g attr_call: set 
   push: context 2 pick: debug_g attr_call: set 
   push: multiline pick: False pick: debug_g attr_call: set 
   pushf: autogen688 repeat ] bind: debuggerv2 
 pick: debuggerv2 error_handler_set 
[ newfunc1 assign: filename 
   0 push: flpcg pick: bootg attr_call: set 
   pick: bootg pick: filename push: gen/grammar_temp.flpc write_parsed_funcs 
   push: gen/grammar_temp.flpc run return_no_value ] bind: grammar_eval_file 
[ newfunc1 assign: root 
  pick: FList_class push: FCall push: ''' forthe push: FStr 0 pick: root attr_call: get forthe push: FCall push: ''' forthe pushi: 3 make_resizable changed_class return1 ] bind: to_forth_conv.TRIPLE_QUOTE 
[ newfunc0 
   push: grammar/triple_quote.grammar grammar_eval_file 
   push: TRIPLE_QUOTE pick: to_forth_conv.TRIPLE_QUOTE pick: to_forth_conv_hash attr_call: set return_no_value ] bind: add_triple_quote 
[ push: debugger_v2 print 
  printeol 
  debuggerv2 
  push: lib/stage7b.flpc run ] bind: autogen689 
[ newfunc0 
  pushf: autogen689 repeat return_no_value ] bind: dv2loop 
 push: gen/triple_quote.f run_file 
 push: TRIPLE_QUOTE pick: to_forth_conv.TRIPLE_QUOTE pick: to_forth_conv_hash attr_call: set 
 dv2loop 