push: Generated_from_lib/stage0.flpc_lib/stage1a.flpc_lib/stage1b.flpc_lib/stage1b2.flpc_lib/stage1b3.flpc_lib/stage1c.flpc_lib/stage1d.flpc_lib/grammar.flpc_lib/stage2.flpc_lib/stage3a.flpc_test/stage3-test.flpc print
[ input.next_token functions.add ] input.next_token bind: functions.add 
[ newfunc1 assign: func 
   input.next_token names.get assign: location 
   pick: location 1 + push: ] names.get memory.set 
   s21 memory.set return_no_value ] bind: rebind: 
[ newfunc0 
  input.next_token func_return ] bind: pushn: 
[ 
  print_state ] bind: ps 
[ None func_return ] bind: autogen0 
[ call_stack.len pushi: 5 - func_return ] bind: autogen1 
[ call_stack.len pushi: 6 - func_return ] bind: autogen2 
[ 0 func_return ] bind: autogen3 
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
[ pushi: 1 remove_top_names assign: i 
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
[ 
   next_token2 assign: name 
   s21 assign: self assign: name 
   pick: self pick: self 1 - memory.get call ] bind: attr: 
[ push: attr_call_on_non_string_ print 
  pick: name print 
  printeol 
  push: attr_call_on_non_string error ] bind: autogen12 
[ 
   push: self assign2 
   next_token2 assign: name 
   pick: name is_str not pushf: autogen12 if 
   check: name pick: self pick: self pick: self 1 - memory.get call call ] bind: attr_call: 
[ newfunc3 assign: searcher assign: receiver assign: name 
   push: Cannot_find_ print 
   pick: name print 
   push: Lookup_error error return_no_value ] bind: nullobj.attrib 
[ newfunc2 assign: parent assign: attrib 
   check: parent memory.append 
   check: attrib memory.append 
   push: ] names.get memory.append 
   memory.len 1 - Pointer func_return ] bind: subclass 
 pick: nullobj.attrib None subclass bind: nullobj 
[ push: Cannot_find_ print 
  pick: name print 
  printeol 
  push: Lookup_error error ] bind: autogen13 
[ newfunc3 assign: searcher assign: receiver assign: name 
   pick: name push: parent string_equal pick: receiver 2 - memory.get return_if 
   pick: searcher attr: parent assign: parent 
   pick: parent pick: nullobj == pushf: autogen13 if 
   pick: name pick: receiver pick: parent pick1 assign: parent_copy 
   check: parent_copy 1 - memory.get call func_return ] bind: instance_attrib 
[ newfunc1 assign: self 
   push: Boot_object_at_ func_return ] bind: minobj.str 
[ newfunc1 assign: parent 
  pick: instance_attrib pick: parent subclass func_return ] bind: minobj.instance 
[ newfunc3 assign: searcher assign: receiver assign: name 
  push: Dummy_function_should_not_be_called error return_no_value ] bind: minobj.attrib 
[ push: Boot_looking_up_ print 
  pick: name print 
  printeol ] bind: autogen14 
[ newfunc3 assign: searcher assign: receiver assign: name 
   pick: lookup_print pushf: autogen14 if 
   pick: name push: attrib\uraw string_equal pick: receiver 1 - memory.get return_if 
   pick: name push: attrib string_equal pick: minobj.attrib return_if 
   pick: name push: instance string_equal pick: minobj.instance return_if 
   pick: name push: subclass string_equal pick: subclass return_if 
   pick: name push: str string_equal pick: minobj.str return_if 
   pick: name push: type string_equal push: minobj return_if 
   pick: name pick: receiver pick: searcher instance_attrib func_return ] rebind: minobj.attrib 
 pick: minobj.attrib pick: nullobj subclass bind: boot_obj 
[ 0 memory.append 
  check: i 1 - assign: i ] bind: autogen15 
[ newfunc1 assign: i 
  pushf: autogen15 repeat_if return_no_value ] bind: memory.extend 
[ pick: value print ] bind: autogen16 
[ pick: value print ] bind: autogen17 
[ pick: value attr_call: print ] bind: autogen18 
[ pick: value pick: obj_boundary < pushf: autogen17 pushf: autogen18 if-else ] bind: autogen19 
[ newfunc1 assign: value 
  pick: value is_basic pushf: autogen16 pushf: autogen19 if-else return_no_value ] bind: tprint 
[ newfunc2 assign: self assign: length 
   pick: boot_obj minobj.instance assign: new_obj 
   pick: new_obj 2 - pick: self memory.set 
   pick: new_obj pick: length memory.set 
   pick: length memory.extend 
   push: ] names.get memory.append 
   pick: new_obj func_return ] bind: boot_array.instance 
[ push: Index_out_of_range error ] bind: autogen20 
[ push: Index_out_of_range error ] bind: autogen21 
[ newfunc2 assign: self assign: key 
   pick: key 0 < pushf: autogen20 if 
   pick: key pick: self memory.get < not pushf: autogen21 if return_no_value ] bind: boot_array.in_range 
[ newfunc2 assign: self assign: key 
   pick: key pick: self boot_array.in_range 
   pick: self pick: key + 1 + memory.get func_return ] bind: boot_array.get 
[ newfunc3 assign: self assign: value assign: key 
   pick: key pick: self boot_array.in_range 
   pick: self pick: key + 1 + pick: value memory.set return_no_value ] bind: boot_array.set 
[ pick: l pick: i - pick: self boot_array.get tprint 
  printspace 
  check: i 1 - assign: i ] bind: autogen22 
[ newfunc1 assign: self 
   push: {_ print 
   pick: self memory.get assign: l 
   pick: l assign: i 
   pushf: autogen22 repeat_if 
   push: } print return_no_value ] bind: boot_array.print 
[ check: i func_return ] bind: autogen23 
[ check: i 1 - assign: i 
  pick: value pick: i pick: self boot_array.get string_equal pushf: autogen23 if ] bind: autogen24 
[ newfunc2 assign: self assign: value 
   pick: self memory.get assign: i 
   pushf: autogen24 repeat_if 
   None func_return ] bind: boot_array.string_index 
[ check: i func_return ] bind: autogen25 
[ None func_return ] bind: autogen26 
[ drop1 
  pick: self memory.get assign: i ] bind: autogen27 
[ pick: key pick: i pick: self boot_array.get string_equal pushf: autogen25 if 
   pick: i pick: self boot_array.get 0 == pushf: autogen26 if 
  check: i 1 - assign: i 
  pick: i 0 == pushf: autogen27 if ] bind: autogen28 
[ newfunc3 assign: self assign: i assign: key 
   s21 assign: i assign: self 
   pushf: autogen28 repeat return_no_value ] bind: boot_array.hash_index 
[ check: i func_return ] bind: autogen29 
[ drop1 
  pick: self memory.get assign: i ] bind: autogen30 
[ pick: i pick: self boot_array.get 0 == pushf: autogen29 if 
  check: i 1 - assign: i 
  pick: i 0 == pushf: autogen30 if ] bind: autogen31 
[ newfunc2 assign: self assign: i 
   s21 assign: i assign: self 
   pushf: autogen31 repeat return_no_value ] bind: boot_array.none_index 
[ check: i 1 - assign: i 
  pick: i pick: i pick: self boot_array.get pick: other boot_array.set ] bind: autogen32 
[ newfunc2 assign: self assign: other 
   pick: self memory.get assign: i 
   pushf: autogen32 repeat_if return_no_value ] bind: boot_array.copy_to 
[ push: Array_looking_up_ print 
  pick: name print 
  printeol ] bind: autogen33 
[ newfunc3 assign: searcher assign: receiver assign: name 
   pick: lookup_print pushf: autogen33 if 
   pick: name push: get string_equal pick: boot_array.get return_if 
   pick: name push: set string_equal pick: boot_array.set return_if 
   pick: name push: in\urange string_equal pick: boot_array.in_range return_if 
   pick: name push: instance string_equal pick: boot_array.instance return_if 
   pick: name push: print string_equal pick: boot_array.print return_if 
   pick: name push: string\uindex string_equal pick: boot_array.string_index return_if 
   pick: name push: hash\uindex string_equal pick: boot_array.hash_index return_if 
   pick: name push: none\uindex string_equal pick: boot_array.none_index return_if 
   pick: name push: copy\uto string_equal pick: boot_array.copy_to return_if 
   pick: name push: len string_equal pick: receiver memory.get return_if 
   pick: name push: type string_equal push: boot\uarray return_if 
   pick: name pick: receiver pick: searcher instance_attrib func_return ] bind: boot_array.attrib 
 pick: boot_array.attrib pick: boot_obj attr_call: subclass bind: boot_array_class 
 pick: boot_array_class attr: instance pick: boot_array_class closure bind: boot_array 
[ newfunc2 assign: self assign: length 
   pick: length pick: boot_array_class boot_array.instance assign: keys 
   pick: length pick: boot_array_class boot_array.instance assign: values 
   pick: boot_obj minobj.instance assign: new_obj 
   pick: new_obj 2 - pick: self memory.set 
   pick: new_obj 0 memory.set 
   pick: keys memory.append 
   pick: values memory.append 
   push: ] names.get memory.append 
   pick: new_obj func_return ] bind: boot_dict.instance 
[ newfunc2 assign: self assign: key 
   pick: key pick: self 1 + memory.get boot_array.string_index assign: index 
   pick: index None == None return_if 
   pick: index pick: self 2 + memory.get boot_array.get func_return ] bind: boot_dict.get 
[ newfunc3 assign: self assign: value assign: key 
   pick: self memory.get assign: l 
   pick: l pick: key pick: self 1 + memory.get boot_array.set 
   pick: l pick: value pick: self 2 + memory.get boot_array.set 
   pick: self pick: self memory.get 1 + memory.set return_no_value ] bind: boot_dict.set 
[ newfunc1 assign: self 
  pick: self pick: self memory.get 1 + memory.set return_no_value ] bind: boot_dict.increase 
[ pick: l pick: i - pick: keys boot_array.get tprint 
  push: :_ print 
  pick: l pick: i - pick: values boot_array.get tprint 
  push: ,_ print 
  check: i 1 - assign: i ] bind: autogen34 
[ newfunc1 assign: self 
   push: {_ print 
   pick: self memory.get assign: l 
   pick: self 1 + memory.get assign: keys 
   pick: self 2 + memory.get assign: values 
   pick: l assign: i 
   pushf: autogen34 repeat_if 
   push: } print return_no_value ] bind: boot_dict.print 
[ push: Dict_looking_up_ print 
  pick: name print 
  printeol ] bind: autogen35 
[ newfunc3 assign: searcher assign: receiver assign: name 
   pick: lookup_print pushf: autogen35 if 
   pick: name push: get string_equal pick: boot_dict.get return_if 
   pick: name push: set string_equal pick: boot_dict.set return_if 
   pick: name push: instance string_equal pick: boot_dict.instance return_if 
   pick: name push: print string_equal pick: boot_dict.print return_if 
   pick: name push: increase string_equal pick: boot_dict.increase return_if 
   pick: name push: len string_equal pick: receiver memory.get return_if 
   pick: name push: keys string_equal pick: receiver 1 + memory.get return_if 
   pick: name push: values string_equal pick: receiver 2 + memory.get return_if 
   pick: name push: type string_equal push: boot\udict return_if 
   pick: name pick: receiver pick: searcher instance_attrib func_return ] bind: boot_dict.attrib 
 pick: boot_dict.attrib pick: boot_obj attr_call: subclass bind: boot_dict_class 
 pick: boot_dict_class attr: instance pick: boot_dict_class closure bind: boot_dict 
[ pick: False func_return ] bind: autogen36 
[ newfunc2 assign: class assign: other 
   pick: other is_basic pushf: autogen36 if 
   check: class pick: other 2 - memory.get == func_return ] bind: is_instance 
 memory.len Pointer bind: obj_boundary 
[ pick: False func_return ] bind: autogen37 
[ drop1 
  pick: n pick: i mod 0 == pushf: autogen37 if 
  check: i 1 + assign: i 
  pick: i pick: n < assign: cond ] bind: autogen38 
[ newfunc1 assign: n 
   2 assign: i 
   pick: i pick: n < assign: cond 
   pushf: autogen38 repeat_if 
   pick: True func_return ] bind: is_prime 
[ check: n func_return ] bind: autogen39 
[ pick: n is_prime pushf: autogen39 if 
  check: n 1 + assign: n ] bind: autogen40 
[ newfunc1 assign: n 
  pushf: autogen40 repeat return_no_value ] bind: next_prime 
[ newfunc2 assign: self assign: length 
   pick: length next_prime assign: plength 
   pick: plength pick: boot_array_class boot_array.instance assign: keys 
   pick: plength pick: boot_array_class boot_array.instance assign: values 
   pick: boot_obj minobj.instance assign: new_obj 
   pick: new_obj 2 - pick: self memory.set 
   pick: new_obj pick: plength memory.set 
   pick: keys memory.append 
   pick: values memory.append 
   push: ] names.get memory.append 
   pick: new_obj func_return ] bind: hashtable.instance 
[ newfunc2 assign: self assign: key 
   pick: key hash pick: self memory.get mod assign: start 
   pick: key pick: start pick: self 1 + memory.get boot_array.hash_index assign: index 
   pick: index None == None return_if 
   pick: index pick: self 2 + memory.get boot_array.get func_return ] bind: hashtable.get 
[ push: Index_too_big error ] bind: autogen41 
[ push: Index_still_too_big error ] bind: autogen42 
[ push: Negative_index error ] bind: autogen43 
[ drop1 
  pick: start pick: self 1 + memory.get boot_array.none_index assign: l ] bind: autogen44 
[ push: Error_reading_new_key error ] bind: autogen45 
[ newfunc3 assign: self assign: value assign: key 
   pick: key hash pick: self memory.get mod assign: start 
    pick: self memory.get pick: start < pushf: autogen41 if 
    pick: self memory.get pick: start == pushf: autogen42 if 
    pick: start 0 < pushf: autogen43 if 
   pick: key pick: start pick: self 1 + memory.get boot_array.hash_index assign: l 
   pick: l None == pushf: autogen44 if 
   pick: l pick: key pick: self 1 + memory.get boot_array.set 
   pick: l pick: value pick: self 2 + memory.get boot_array.set 
   pick: key pick: start pick: self 1 + memory.get boot_array.hash_index pick: l == not pushf: autogen45 if return_no_value ] bind: hashtable.set 
[ pick: key tprint 
  push: :_ print 
  pick: l pick: i - pick: values boot_array.get print 
  push: ,_ print ] bind: autogen46 
[ pick: l pick: i - pick: keys boot_array.get assign: key 
  pick: key 0 > pushf: autogen46 if 
  drop1 
  check: i 1 - assign: i ] bind: autogen47 
[ newfunc1 assign: self 
   push: {_ print 
   pick: self memory.get assign: l 
   pick: self 1 + memory.get assign: keys 
   pick: self 2 + memory.get assign: values 
   pick: l assign: i 
   pushf: autogen47 repeat_if 
   push: } print return_no_value ] bind: hashtable.print 
[ s21 assign: count assign: i 
  check: count 1 + assign: count 
  s21 assign: i assign: count ] bind: autogen48 
[ check: i 1 - assign: i 
  pick: i pick: keys boot_array.get assign: key 
  check: key 0 > pushf: autogen48 if ] bind: autogen49 
[ newfunc1 assign: self 
   pick: self 1 + memory.get assign: keys 
   0 assign: count 
   pick: self memory.get assign: i 
   pushf: autogen49 repeat_if 
   pick: count func_return ] bind: hashtable.num_elems 
[ push: Dict_looking_up_ print 
  pick: name print 
  printeol ] bind: autogen50 
[ newfunc3 assign: searcher assign: receiver assign: name 
   pick: lookup_print pushf: autogen50 if 
   pick: name push: get string_equal pick: hashtable.get return_if 
   pick: name push: set string_equal pick: hashtable.set return_if 
   pick: name push: instance string_equal pick: hashtable.instance return_if 
   pick: name push: print string_equal pick: hashtable.print return_if 
   pick: name push: len string_equal pick: receiver memory.get return_if 
   pick: name push: keys string_equal pick: receiver 1 + memory.get return_if 
   pick: name push: values string_equal pick: receiver 2 + memory.get return_if 
   pick: name push: type string_equal push: hashtable return_if 
   pick: name pick: receiver pick: searcher instance_attrib func_return ] bind: hashtable.attrib 
 pick: hashtable.attrib pick: boot_obj attr_call: subclass bind: hashtable_class 
 pick: hashtable_class attr: instance pick: hashtable_class closure bind: hashtable 
 pushi: 2131 hashtable bind: names 
  [ pushf: names ] bind: names2 
 pushi: 200000 hashtable bind: mem_value 
[ newfunc2 assign: hint assign: index 
   pick: index int_to_str pick: hint pick: mem_value hashtable.set 
   pick: hint pick: index memory_hint.set return_no_value ] bind: set_mem_hint 
[ newfunc1 assign: index 
  pick: index int_to_str pick: mem_value hashtable.get func_return ] bind: get_mem_hint 
[ pick: index pushi: 3 + memory.get pick: index memory.get set_mem_hint ] bind: autogen51 
[ check: cond drop1 
  pick: index memory.get pick: index pushi: 3 + memory.get pick: names attr_call: set 
  pick: index pushi: 3 + memory.get type_of 2 == pushf: autogen51 if 
  check: index pushi: 7 + assign: index 
  pick: index pick: end > not assign: cond ] bind: autogen52 
[ newfunc0 
   functions.end assign: end 
   pick: names.get pushi: 5 + assign: index 
   pick: index pick: end > not assign: cond 
   pushf: autogen52 repeat_if return_no_value ] bind: convert_names 
[ push: Can't_find_global_name:_ print 
  pick: name printraw 
  printeol ] bind: autogen53 
[ pick: name is_str pushf: autogen53 if 
  push: Lookup_error error assign: value ] bind: autogen54 
[ newfunc1 assign: name 
   pick: name names2 hashtable.get assign: value 
   pick: value None == pushf: autogen54 if 
   pick: value func_return ] bind: names.get 
[ newfunc1 assign: value 
   input.next_token assign: name 
   pick: name pick: value names2 hashtable.set 
   pick: value pick: name set_mem_hint return_no_value ] bind: new.bind 
 convert_names 
 push: bind: push: new.bind names2 hashtable.get names2 hashtable.set 
  push: bind: names2 hashtable.get rebind: bind: 
  push: names.get names2 hashtable.get rebind: names.get 
[ pick: index pick: func - func_return ] bind: autogen55 
[ pick: index memory.get pick: end_of_func == pushf: autogen55 if 
  check: index 1 + assign: index ] bind: autogen56 
[ newfunc1 assign: func 
   pick: func assign: index 
   pushf: autogen56 repeat return_no_value ] bind: func_len 
[ check: index func_return ] bind: autogen57 
[ check: index 1 + assign: index 
  pick: index memory.get pick: return_if == pushf: autogen57 if ] bind: autogen58 
[ newfunc1 assign: index 
  pushf: autogen58 repeat return_no_value ] bind: read_to_return_if 
[ None func_return ] bind: autogen59 
[ pick: index pushi: 3 + memory.get pick: index pushi: 5 + pick: attrib_hash attr_call: set ] bind: autogen60 
[ pick: index pick: end > pushf: autogen59 if 
  pick: index pushi: 3 + memory.get tprint 
  push: _ print 
  pick: index pushi: 6 + memory.get tprint 
  printeol 
  pick: index pushi: 3 + memory.get pick: attrib_hash attr_call: get None == pushf: autogen60 if 
  check: index pushi: 5 + read_to_return_if assign: index 
  check: index 1 + assign: index ] bind: autogen61 
[ newfunc2 assign: attrib_hash assign: attrib 
   pick: attrib func_len assign: len 
   pick: attrib pick: len + pushi: 16 - assign: end 
   pick: attrib pushi: 12 + assign: index 
   pushf: autogen61 repeat return_no_value ] bind: add_attrib 
[ push: Total_len:_ print 
  pick: len print 
  printeol 
  pick: len func_return ] bind: autogen62 
[ pick: obj pick: nullobj_cached == pushf: autogen62 if 
  check: len pick: obj attr: attrib_raw func_len + assign: len 
  pick: obj attr: parent assign: parent 
  push: 214 shuffle assign: len assign: obj ] bind: autogen63 
[ newfunc1 assign: obj 
   pick: nullobj assign: nullobj_cached 
   s21 assign: obj assign: nullobj_cached 
   pick: obj attr: attrib_raw func_len assign: len 
   pushf: autogen63 repeat return_no_value ] bind: obj_total_len 
[ pick: attrib_hash func_return ] bind: autogen64 
[ pick: obj pick: nullobj_cached == pushf: autogen64 if 
  pick: obj attr: attrib_raw pick: attrib_hash add_attrib assign: attrib_hash 
  pick: obj attr: parent assign: parent 
  push: 315 shuffle assign: attrib_hash assign: obj ] bind: autogen65 
[ newfunc1 assign: obj 
   pick: nullobj assign: nullobj_cached 
   s21 assign: obj assign: nullobj_cached 
   pick: obj obj_total_len assign: len 
   check: len hashtable assign: attrib_hash 
   pushf: autogen65 repeat return_no_value ] bind: convert_attr 
  [ pick: True ] bind: hash_header 
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
[ newfunc3 assign: searcher assign: receiver assign: name 
   hash_header 
   pick: name pick: hashtable.hash hashtable.get call return_no_value ] rebind: hashtable.attrib 
 pick: boot_array_class convert_attr bind: boot_array.hash 
[ newfunc3 assign: searcher assign: receiver assign: name 
   hash_header 
   pick: name pick: boot_array.hash hashtable.get call return_no_value ] rebind: boot_array.attrib 
 pick: boot_dict_class convert_attr bind: boot_dict.hash 
[ newfunc3 assign: searcher assign: receiver assign: name 
   hash_header 
   pick: name pick: boot_dict.hash hashtable.get call return_no_value ] rebind: boot_dict.attrib 
[ newfunc2 assign: self assign: length 
   pick: length pick: length + pushi: 3 + pick: boot_array_class boot_array.instance assign: _array 
   pick: boot_obj minobj.instance assign: new_obj 
   pick: new_obj 2 - pick: self memory.set 
   pick: new_obj pick: length memory.set 
   pick: _array memory.append 
   push: ] names.get memory.append 
   pick: new_obj func_return ] bind: resizable.instance 
[ newfunc2 assign: self assign: key 
  pick: key pick: self 1 + memory.get boot_array.get func_return ] bind: resizable.get 
[ newfunc3 assign: self assign: value assign: key 
  pick: key pick: value pick: self 1 + memory.get boot_array.set return_no_value ] bind: resizable.set 
[ newfunc2 assign: self assign: name 
  pick: name pick: self 1 + memory.get boot_array.string_index func_return ] bind: resizable.string_index 
[ newfunc1 assign: self 
   pick: self memory.get assign: length 
   pick: length pick: length + pushi: 3 + pick: boot_array_class boot_array.instance assign: new_array 
   pick: new_array pick: self 1 + memory.get boot_array.copy_to 
   pick: self 1 + pick: new_array memory.set return_no_value ] bind: resizable.double 
[ newfunc1 assign: self 
   pick: self memory.get assign: length 
   pick: length pick: boot_array_class boot_array.instance assign: new_array 
   pick: self 1 + pick: new_array memory.set return_no_value ] bind: resizable.reset 
[ newfunc1 assign: self 
  pick: self pick: self memory.get 1 + memory.set return_no_value ] bind: resizable.increase 
[ newfunc1 assign: self 
   pick: self 1 + memory.get memory.get func_return ] bind: resizable.max_len 
[ pick: self resizable.double ] bind: autogen66 
[ newfunc2 assign: self assign: value 
   pick: self memory.get pick: self resizable.max_len < not pushf: autogen66 if 
   pick: self memory.get pick: value pick: self resizable.set 
   pick: self resizable.increase return_no_value ] bind: resizable.append 
[ pick: l pick: i - pick: other resizable.get pick: self resizable.append 
  check: i 1 - assign: i ] bind: autogen67 
[ newfunc2 assign: self assign: other 
   pick: other attr: len assign: l 
   pick: l assign: i 
   pushf: autogen67 repeat_if return_no_value ] bind: resizable.extend 
[ return_no_value ] bind: autogen68 
[ pick: value pick: self resizable.extend ] bind: autogen69 
[ pick: value pick: self resizable.append ] bind: autogen70 
[ newfunc2 assign: self assign: value 
   pick: value None == pushf: autogen68 if 
   pick: value pick: resizable_class is_instance pushf: autogen69 pushf: autogen70 if-else return_no_value ] bind: resizable.append_array 
[ newfunc1 assign: self 
   pick: self pick: self memory.get 1 - memory.set 
   pick: self memory.get pick: self resizable.get func_return ] bind: resizable.pop 
[ newfunc1 assign: self 
  pick: self memory.get 1 - pick: self resizable.get func_return ] bind: resizable.top 
[ printspace ] bind: autogen71 
[ pick: l pick: i - pick: self resizable.get tprint 
  pick: i 1 > pushf: autogen71 if 
  check: i 1 - assign: i ] bind: autogen72 
[ newfunc1 assign: self 
   push: [ print 
   pick: self memory.get assign: l 
   pick: l assign: i 
   pushf: autogen72 repeat_if 
   push: ] print return_no_value ] bind: resizable.print 
[ newfunc1 assign: self 
  pick: self attr: array 1 + pick: self attr: len str_join func_return ] bind: resizable.join 
[ push: Resizable_looking_up_ print 
  pick: name print 
  printeol ] bind: autogen73 
[ newfunc3 assign: searcher assign: receiver assign: name 
   pick: lookup_print pushf: autogen73 if 
   pick: name push: get string_equal pick: resizable.get return_if 
   pick: name push: set string_equal pick: resizable.set return_if 
   pick: name push: string\uindex string_equal pick: resizable.string_index return_if 
   pick: name push: instance string_equal pick: resizable.instance return_if 
   pick: name push: print string_equal pick: resizable.print return_if 
   pick: name push: append string_equal pick: resizable.append return_if 
   pick: name push: extend string_equal pick: resizable.extend return_if 
   pick: name push: append\uarray string_equal pick: resizable.append_array return_if 
   pick: name push: double string_equal pick: resizable.double return_if 
   pick: name push: reset string_equal pick: resizable.reset return_if 
   pick: name push: increase string_equal pick: resizable.increase return_if 
   pick: name push: pop string_equal pick: resizable.pop return_if 
   pick: name push: top string_equal pick: resizable.top return_if 
   pick: name push: max\ulen string_equal pick: resizable.max_len return_if 
   pick: name push: join string_equal pick: resizable.join return_if 
   pick: name push: len string_equal pick: receiver memory.get return_if 
   pick: name push: array string_equal pick: receiver 1 + memory.get return_if 
   pick: name push: type string_equal push: resizable return_if 
   pick: name pick: receiver pick: searcher instance_attrib func_return ] bind: resizable.attrib 
 pick: resizable.attrib pick: boot_obj attr_call: subclass bind: resizable_class 
 pick: resizable_class attr: instance pick: resizable_class closure bind: resizable 
 pick: resizable_class convert_attr bind: resizable.hash 
[ newfunc3 assign: searcher assign: receiver assign: name 
   hash_header 
   pick: name pick: resizable.hash hashtable.get call return_no_value ] rebind: resizable.attrib 
[ newfunc3 assign: self assign: children assign: name 
   pick: boot_obj minobj.instance assign: new_obj 
   pick: new_obj 2 - pick: self memory.set 
   pick: new_obj pick: name memory.set 
   pick: children memory.append 
   push: ] names.get memory.append 
   check: new_obj func_return ] bind: node.instance 
[ pick: key pick: children resizable.get func_return ] bind: autogen74 
[ pick: children func_return ] bind: autogen75 
[ pick: key 0 == pushf: autogen75 if 
  push: Out_of_bound_index error ] bind: autogen76 
[ newfunc2 assign: self assign: key 
   pick: self 1 + memory.get assign: children 
   pick: children pick: resizable_class is_instance pushf: autogen74 pushf: autogen76 if-else return_no_value ] bind: node.get 
[ newfunc1 assign: self 
   pick: self memory.get printraw 
   push: { print 
   pick: self 1 + memory.get tprint 
   push: } print return_no_value ] bind: node.print 
[ pick: children memory.get func_return ] bind: autogen77 
[ 1 func_return ] bind: autogen78 
[ newfunc1 assign: self 
   pick: self 1 + memory.get assign: children 
   pick: children pick: resizable_class is_instance pushf: autogen77 pushf: autogen78 if-else return_no_value ] bind: node.len 
[ newfunc2 assign: self assign: new_name 
  pick: self pick: new_name memory.set return_no_value ] bind: node.set_name 
[ newfunc2 assign: self assign: new_children 
  pick: self 1 + pick: new_children memory.set return_no_value ] bind: node.set_children 
[ push: Node_looking_up_ print 
  pick: name print 
  printeol ] bind: autogen79 
[ newfunc3 assign: searcher assign: receiver assign: name 
   pick: lookup_print pushf: autogen79 if 
   pick: name push: get string_equal pick: node.get return_if 
   pick: name push: instance string_equal pick: node.instance return_if 
   pick: name push: print string_equal pick: node.print return_if 
   pick: name push: set\uname string_equal pick: node.set_name return_if 
   pick: name push: set\uchildren string_equal pick: node.set_children return_if 
   pick: name push: len string_equal pick: receiver node.len return_if 
   pick: name push: name string_equal pick: receiver memory.get return_if 
   pick: name push: children string_equal pick: receiver 1 + memory.get return_if 
   pick: name push: type string_equal push: node return_if 
   pick: name pick: receiver pick: searcher instance_attrib func_return ] bind: node.attrib 
 pick: node.attrib pick: boot_obj attr_call: subclass bind: node_class 
 pick: node_class attr: instance pick: node_class closure bind: node 
 pick: node_class convert_attr bind: node.hash 
[ newfunc3 assign: searcher assign: receiver assign: name 
   hash_header 
   pick: name pick: node.hash hashtable.get call return_no_value ] rebind: node.attrib 
[ newfunc2 assign: self assign: filename 
   pick: boot_obj minobj.instance assign: new_obj 
   pick: new_obj 2 - pick: self memory.set 
   pick: new_obj push: r pick: filename file.open memory.set 
   0 memory.append 
   push: ] names.get memory.append 
   pick: new_obj func_return ] bind: Input.instance 
[ newfunc1 assign: self 
  pick: self memory.get fd_next_token func_return ] bind: Input.next 
[ newfunc1 assign: self 
  pick: self memory.get fd_next_char func_return ] bind: Input.next_char 
[ newfunc2 assign: self assign: s 
  pick: s pick: self memory.get fd_startswith func_return ] bind: Input.startswith 
[ newfunc1 assign: self 
  check: self memory.get fd_position func_return ] bind: Input.position 
[ newfunc2 assign: self assign: value 
  check: self memory.get pick: value fd_position_set return_no_value ] bind: Input.position_set 
[ newfunc1 assign: self 
  check: self memory.get fd_ended func_return ] bind: Input.ended 
[ push: Input_looking_up_ print 
  pick: name print 
  printeol ] bind: autogen80 
[ newfunc3 assign: searcher assign: receiver assign: name 
   pick: lookup_print pushf: autogen80 if 
   pick: name push: instance string_equal pick: Input.instance return_if 
   pick: name push: ended string_equal pick: Input.ended return_if 
   pick: name push: next string_equal pick: Input.next return_if 
   pick: name push: next\uchar string_equal pick: Input.next_char return_if 
   pick: name push: startswith string_equal pick: Input.startswith return_if 
   pick: name push: position string_equal pick: Input.position return_if 
   pick: name push: position\uset string_equal pick: Input.position_set return_if 
   pick: name push: file string_equal pick: receiver memory.get return_if 
   pick: name push: type string_equal push: Input return_if 
   pick: name pick: receiver pick: searcher instance_attrib func_return ] bind: Input.attrib 
 pick: Input.attrib pick: boot_obj attr_call: subclass bind: Input_class 
 pick: Input_class attr: instance pick: Input_class closure bind: Input 
 pick: Input_class convert_attr bind: Input.hash 
[ newfunc3 assign: searcher assign: receiver assign: name 
   hash_header 
   pick: name pick: Input.hash hashtable.get call return_no_value ] rebind: Input.attrib 
[ newfunc1 assign: self 
   pick: boot_obj minobj.instance assign: new_obj 
   pick: new_obj 2 - pick: self memory.set 
   pick: new_obj _cheat_dict.new memory.set 
   push: ] names.get memory.append 
   pick: new_obj func_return ] bind: cheat_dict.instance 
[ push: CheatDict_looking_up_ print 
  pick: name print 
  printeol ] bind: autogen81 
[ newfunc3 assign: searcher assign: receiver assign: name 
   pick: lookup_print pushf: autogen81 if 
   pick: name push: instance string_equal pick: cheat_dict.instance return_if 
   pick: name push: get string_equal pick: _cheat_dict.get return_if 
   pick: name push: set string_equal pick: _cheat_dict.set return_if 
   pick: name pick: receiver pick: searcher instance_attrib func_return ] bind: cheat_dict.attrib 
 pick: cheat_dict.attrib pick: boot_obj attr_call: subclass bind: cheat_dict_class 
 pick: cheat_dict_class attr: instance pick: cheat_dict_class closure bind: cheat_dict 
[ newfunc2 assign: self assign: message 
   pick: boot_obj minobj.instance assign: new_obj 
   pick: new_obj 2 - pick: self memory.set 
   pick: new_obj pick: message memory.set 
   push: ] names.get memory.append 
   pick: new_obj func_return ] bind: MatchError.instance 
[ newfunc1 assign: self 
   push: Match_error: print 
   check: self memory.get print return_no_value ] bind: MatchError.print 
[ push: MatchError_looking_up_ print 
  pick: name print 
  printeol ] bind: autogen82 
[ newfunc3 assign: searcher assign: receiver assign: name 
   pick: lookup_print pushf: autogen82 if 
   pick: name push: instance string_equal pick: MatchError.instance return_if 
   pick: name push: print string_equal pick: MatchError.print return_if 
   pick: name push: type string_equal push: MatchError return_if 
   pick: name pick: receiver pick: searcher instance_attrib func_return ] bind: MatchError.attrib 
 pick: MatchError.attrib pick: boot_obj attr_call: subclass bind: MatchError_class 
 pick: MatchError_class attr: instance pick: MatchError_class closure bind: MatchError 
[ push: End_of_file MatchError func_return ] bind: autogen83 
[ push: Not_exactly MatchError func_return ] bind: autogen84 
[ newfunc1 assign: char 
   pick: source attr_call: next_char assign: input_char 
    pick: input_char None == pushf: autogen83 if 
    pick: char pick: input_char string_equal not pushf: autogen84 if 
   check: input_char func_return ] bind: exactly 
[ push: End_of_file MatchError func_return ] bind: autogen85 
[ push: Not_between MatchError func_return ] bind: autogen86 
[ newfunc2 assign: end assign: start 
   pick: source attr_call: next_char assign: input_char 
    pick: input_char None == pushf: autogen85 if 
    pick: start pick: end pick: input_char char_between not pushf: autogen86 if 
   check: input_char func_return ] bind: between 
[ push: End_of_file MatchError func_return ] bind: autogen87 
[ push: Not_exactly MatchError func_return ] bind: autogen88 
[ newfunc1 assign: char 
   pick: source attr_call: next assign: input_char 
    pick: input_char None == pushf: autogen87 if 
    pick: char pick: input_char string_equal not pushf: autogen88 if 
   check: input_char func_return ] bind: token 
[ 0 0 func_return_two ] bind: autogen89 
[ newfunc1 assign: children 
   pick: children memory.get pick: end_of_func == pushf: autogen89 if 
   pick: children 2 + pick: children 1 + memory.get func_return_two return_no_value ] bind: next_child 
[ check: output func_return ] bind: autogen90 
[ check: child call assign: output 
  pick: output pick: MatchError_class is_instance not pushf: autogen90 if 
  check: output drop1 
  pick: saved pick: source attr_call: position_set 
  check: children next_child assign: child assign: children ] bind: autogen91 
[ newfunc1 assign: children 
   pick: source attr_call: position assign: saved 
   s21 assign: children assign: saved 
   check: children next_child assign: child assign: children 
   pushf: autogen91 repeat_if 
   push: No_OR_child_matches MatchError func_return ] bind: or 
[ check: output func_return ] bind: autogen92 
[ newfunc1 assign: child 
   check: child call assign: output 
   pick: output pick: MatchError_class is_instance pushf: autogen92 if 
   push: out pick: output node func_return ] bind: out 
[ pick: output attr: name push: out string_equal func_return ] bind: autogen93 
[ newfunc1 assign: output 
   pick: output pick: node_class is_instance pushf: autogen93 if 
   pick: False func_return ] bind: is_output 
[ pick: outputs func_return ] bind: autogen94 
[ pick: outputs attr: array 1 + pick: length str_join func_return ] bind: autogen95 
[ pick: output str_len 1 == pushf: autogen95 if ] bind: autogen96 
[ pick: output func_return ] bind: autogen97 
[ pick: outputs attr: len assign: length 
  pick: length 0 == pushf: autogen94 if 
  0 pick: outputs attr_call: get assign: output 
   pick: output is_str pushf: autogen96 if 
   pick: length 1 == pushf: autogen97 if ] bind: autogen98 
[ pick: outputs attr: children func_return ] bind: autogen99 
[ pick: outputs attr: children is_str pushf: autogen99 if ] bind: autogen100 
[ pick: outputs pick: node_class is_instance pushf: autogen100 if ] bind: autogen101 
[ newfunc1 assign: outputs 
   pick: outputs pick: resizable_class is_instance pushf: autogen98 pushf: autogen101 if-else 
   pick: outputs func_return ] bind: make_string 
[ pick: saved pick: source attr_call: position_set 
  push: And_match_failed MatchError func_return ] bind: autogen102 
[ pick: output attr: children pick: outputs attr_call: append_array ] bind: autogen103 
[ pick: output is_output pushf: autogen103 if 
  check: output drop1 ] bind: autogen104 
[ 0 resizable assign: outputs 
  pick: output attr: children pick: outputs attr_call: append_array 
  pick: True assign: output_mode 
  s4127 assign: children assign: output_mode assign: outputs ] bind: autogen105 
[ pick: output pick: outputs attr_call: append_array 
  check: output drop1 ] bind: autogen106 
[ pick: output is_output pushf: autogen105 pushf: autogen106 if-else ] bind: autogen107 
[ check: child call assign: output 
   pick: output pick: MatchError_class is_instance pushf: autogen102 if 
   pick: output_mode pushf: autogen104 pushf: autogen107 if-else 
  check: children next_child assign: child assign: children ] bind: autogen108 
[ newfunc1 assign: init_children 
   pick: source attr_call: position assign: saved 
   0 resizable assign: outputs 
   pick: False assign: output_mode 
   pick: init_children assign: children 
   check: children next_child assign: child assign: children 
   pushf: autogen108 repeat_if 
   pick: outputs make_string func_return ] bind: and 
[ 0 c.infinity func_return_two ] bind: autogen109 
[ 1 c.infinity func_return_two ] bind: autogen110 
[ 0 1 func_return_two ] bind: autogen111 
[ newfunc1 assign: quantifier 
    pick: quantifier push: * string_equal pushf: autogen109 if 
    pick: quantifier push: + string_equal pushf: autogen110 if 
    pick: quantifier push: ? string_equal pushf: autogen111 if 
   push: Unknown_quantifier error return_no_value ] bind: get_bounds 
[ pick: start_saved pick: source attr_call: position_set 
  push: Quantified_undermatch MatchError func_return ] bind: autogen112 
[ pick: count pick: lower < pushf: autogen112 if 
  pick: saved pick: source attr_call: position_set 
  pick: outputs make_string func_return ] bind: autogen113 
[ pick: outputs make_string func_return ] bind: autogen114 
[ pick: source attr_call: position assign: saved 
  pick: child call assign: output 
  pick: output pick: MatchError_class is_instance pushf: autogen113 if 
  check: output pick: outputs attr_call: append_array 
  check: saved drop1 
  check: count 1 + assign: count 
  pick: count pick: upper == pushf: autogen114 if ] bind: autogen115 
[ newfunc2 assign: quantifier assign: child 
   check: quantifier get_bounds assign: upper assign: lower 
   0 resizable assign: outputs 
   pick: source attr_call: position assign: start_saved 
   0 assign: count 
   pushf: autogen115 repeat return_no_value ] bind: quantified 
[ None func_return ] bind: autogen116 
[ newfunc1 assign: child 
   pick: source attr_call: position assign: saved 
   s21 assign: child assign: saved 
   check: child call assign: output 
   pick: saved pick: source attr_call: position_set 
   pick: output pick: MatchError_class is_instance pushf: autogen116 if 
   push: Negation_is_true MatchError func_return ] bind: negation 
[ pick: output func_return ] bind: autogen117 
[ newfunc2 assign: name assign: child 
   pick: child call assign: output 
   pick: output pick: MatchError_class is_instance pushf: autogen117 if 
   pick: name pick: output node func_return ] bind: bound 
[ pick: output attr: len 1 > func_return ] bind: autogen118 
[ newfunc1 assign: output 
   pick: output pick: resizable_class is_instance pushf: autogen118 if 
   pick: False func_return ] bind: should_make_node 
 pushi: 40 hashtable bind: parseg 
[ newfunc0 
  push: apply\uprint pick: True pick: parseg attr_call: set return_no_value ] bind: debug_parse 
[ newfunc1 assign: grammar_obj 
   push: prefix 0 pick: grammar_obj attr_call: get pick: parseg attr_call: set 
   push: rules 1 pick: grammar_obj attr_call: get pick: parseg attr_call: set 
   push: flagged 2 pick: grammar_obj attr_call: get pick: parseg attr_call: set 
   push: base\urules pushi: 3 pick: grammar_obj attr_call: get pick: parseg attr_call: set 
   push: nest 0 pick: parseg attr_call: set 
   push: apply\uprint pick: False pick: parseg attr_call: set 
   push: indentation 0 resizable pick: parseg attr_call: set 
   0 push: indentation pick: parseg attr_call: get attr_call: append 
   memoizer.reset return_no_value ] bind: init_parseg 
[ newfunc1 assign: name 
  push: Dummy error return_no_value ] bind: _apply 
[ printspace 
  check: i 1 - assign: i ] bind: autogen119 
[ pick: nesting assign: i 
  pushf: autogen119 repeat_if 
  pick: name print 
  printspace 
  pick: source attr_call: position tprint 
  printeol ] bind: autogen120 
[ printspace 
  check: i 1 - assign: i ] bind: autogen121 
[ pick: nesting assign: i 
  pushf: autogen121 repeat_if 
  pick: name print 
  printspace 
  pick: source attr_call: position tprint 
  push: _->_ print 
  pick: output tprint 
  printeol ] bind: autogen122 
[ printspace 
  check: i 1 - assign: i ] bind: autogen123 
[ pick: nesting assign: i 
  pushf: autogen123 repeat_if 
  pick: name print 
  push: _->_ print 
  pick: output tprint 
  printeol ] bind: autogen124 
[ pick: output func_return ] bind: autogen125 
[ push: Making_node_ print 
  pick: name printraw 
  printeol 
  pick: name pick: output node func_return ] bind: autogen126 
[ pick: output func_return ] bind: autogen127 
[ newfunc1 assign: name 
   push: nest pick: parseg attr_call: get assign: nesting 
   push: apply\uprint pick: parseg attr_call: get pushf: autogen120 if 
   push: nest pick: nesting 1 + pick: parseg attr_call: set 
   pick: name push: rules pick: parseg attr_call: get hashtable.get call assign: output 
   push: nest pick: nesting pick: parseg attr_call: set 
    push: apply\uprint pick: parseg attr_call: get pushf: autogen122 if 
    pick: name push: statement string_equal pushf: autogen124 if 
    pick: output pick: MatchError_class is_instance pushf: autogen125 if 
    pick: output should_make_node pushf: autogen126 if 
    pick: name push: flagged pick: parseg attr_call: get attr_call: string_index None == pushf: autogen127 if 
   pick: name pick: output node func_return ] rebind: _apply 
[ check: new_pos pick: source attr_call: position_set 
  check: mem_out func_return ] bind: autogen128 
[ pick: source attr_call: position assign: saved 
  pick: name _apply assign: output 
  pick: name pick: saved push: indentation pick: parseg attr_call: get pick: output pick: source attr_call: position memoizer.set 
  check: output func_return ] bind: autogen129 
[ newfunc1 assign: name 
   pick: name pick: source attr_call: position push: indentation pick: parseg attr_call: get memoizer.get assign: memoized assign: new_pos assign: mem_out 
   check: memoized pushf: autogen128 pushf: autogen129 if-else return_no_value ] bind: apply 
[ push: End_of_file MatchError func_return ] bind: autogen130 
[ newfunc0 
   pick: source attr_call: next_char assign: char 
   pick: char None == pushf: autogen130 if 
   check: char func_return ] bind: base.rules.anything 
[ newfunc0 
  None func_return ] bind: base.rules.void 
[ push: a push: z between ] bind: autogen131 
[ push: A push: Z between ] bind: autogen132 
[ pushf: autogen131 pushf: autogen132 ] bind: autogen133 
[ newfunc0 
  pushf: autogen133 or func_return ] bind: base.rules.letter 
[ newfunc0 
  push: 0 push: 9 between func_return ] bind: base.rules.digit 
[ push: rule.letter apply ] bind: autogen134 
[ push: \u exactly ] bind: autogen135 
[ pushf: autogen134 pushf: autogen135 ] bind: autogen136 
[ pushf: autogen136 or ] bind: autogen137 
[ push: rule.letter apply ] bind: autogen138 
[ push: rule.digit apply ] bind: autogen139 
[ push: \u exactly ] bind: autogen140 
[ pushf: autogen138 pushf: autogen139 pushf: autogen140 ] bind: autogen141 
[ pushf: autogen141 or ] bind: autogen142 
[ pushf: autogen142 push: * quantified ] bind: autogen143 
[ pushf: autogen137 pushf: autogen143 ] bind: autogen144 
[ newfunc0 
  pushf: autogen144 and func_return ] bind: base.rules.name 
[ pick: output func_return ] bind: autogen145 
[ push: \t func_return ] bind: autogen146 
[ push: \n func_return ] bind: autogen147 
[ push: \r func_return ] bind: autogen148 
[ push: \\ func_return ] bind: autogen149 
[ push: ' func_return ] bind: autogen150 
[ push: " func_return ] bind: autogen151 
[ newfunc0 
   push: raw\uescaped\uchar apply assign: output 
    pick: output pick: MatchError_class is_instance pushf: autogen145 if 
    pick: output push: t string_equal pushf: autogen146 if 
    pick: output push: n string_equal pushf: autogen147 if 
    pick: output push: r string_equal pushf: autogen148 if 
    pick: output push: \\ string_equal pushf: autogen149 if 
    pick: output push: ' string_equal pushf: autogen150 if 
    pick: output push: " string_equal pushf: autogen151 if 
   push: Unknown_escaped_char error return_no_value ] bind: base.rules.wrapped_escaped_char 
[ newfunc1 assign: rules 
   push: letter pick: base.rules.letter pick: rules hashtable.set 
   push: digit pick: base.rules.digit pick: rules hashtable.set 
   push: anything pick: base.rules.anything pick: rules hashtable.set 
   push: void pick: base.rules.void pick: rules hashtable.set return_no_value ] bind: add_base_rules 
[ newfunc1 assign: rules 
   push: raw\uescaped\uchar push: escaped\uchar pick: rules attr_call: get pick: rules hashtable.set 
   push: escaped\uchar pick: base.rules.wrapped_escaped_char pick: rules hashtable.set return_no_value ] bind: add_escaped_char_rules 
 None bind: source 
[ push: letter apply ] bind: autogen152 
[ push: \u exactly ] bind: autogen153 
[ pushf: autogen152 pushf: autogen153 ] bind: autogen154 
[ pushf: autogen154 or ] bind: autogen155 
[ push: letter apply ] bind: autogen156 
[ push: digit apply ] bind: autogen157 
[ push: \u exactly ] bind: autogen158 
[ pushf: autogen156 pushf: autogen157 pushf: autogen158 ] bind: autogen159 
[ pushf: autogen159 or ] bind: autogen160 
[ pushf: autogen160 push: * quantified ] bind: autogen161 
[ pushf: autogen155 pushf: autogen161 ] bind: autogen162 
[ newfunc0 
  pushf: autogen162 and func_return ] bind: bootg.rules.name 
[ push: apply apply ] bind: autogen163 
[ push: exactly apply ] bind: autogen164 
[ push: token apply ] bind: autogen165 
[ push: parenthesis apply ] bind: autogen166 
[ push: output apply ] bind: autogen167 
[ pushf: autogen163 pushf: autogen164 pushf: autogen165 pushf: autogen166 pushf: autogen167 ] bind: autogen168 
[ newfunc0 
  pushf: autogen168 or func_return ] bind: bootg.rules.expr 
[ push: ' token ] bind: autogen169 
[ push: escaped\uchar apply ] bind: autogen170 
[ push: ' exactly ] bind: autogen171 
[ pushf: autogen171 negation ] bind: autogen172 
[ push: anything apply ] bind: autogen173 
[ pushf: autogen172 pushf: autogen173 ] bind: autogen174 
[ pushf: autogen174 and ] bind: autogen175 
[ pushf: autogen170 pushf: autogen175 ] bind: autogen176 
[ pushf: autogen176 or ] bind: autogen177 
[ pushf: autogen177 push: * quantified ] bind: autogen178 
[ pushf: autogen178 out ] bind: autogen179 
[ push: ' token ] bind: autogen180 
[ pushf: autogen169 pushf: autogen179 pushf: autogen180 ] bind: autogen181 
[ newfunc0 
  pushf: autogen181 and func_return ] bind: bootg.rules.exactly 
[ push: \q token ] bind: autogen182 
[ push: escaped\uchar apply ] bind: autogen183 
[ push: \q exactly ] bind: autogen184 
[ pushf: autogen184 negation ] bind: autogen185 
[ push: anything apply ] bind: autogen186 
[ pushf: autogen185 pushf: autogen186 ] bind: autogen187 
[ pushf: autogen187 and ] bind: autogen188 
[ pushf: autogen183 pushf: autogen188 ] bind: autogen189 
[ pushf: autogen189 or ] bind: autogen190 
[ pushf: autogen190 push: * quantified ] bind: autogen191 
[ pushf: autogen191 out ] bind: autogen192 
[ push: \q token ] bind: autogen193 
[ pushf: autogen182 pushf: autogen192 pushf: autogen193 ] bind: autogen194 
[ newfunc0 
  pushf: autogen194 and func_return ] bind: bootg.rules.token 
[ push: \\ exactly ] bind: autogen195 
[ push: n exactly ] bind: autogen196 
[ push: r exactly ] bind: autogen197 
[ push: t exactly ] bind: autogen198 
[ push: b exactly ] bind: autogen199 
[ push: f exactly ] bind: autogen200 
[ push: \q exactly ] bind: autogen201 
[ push: ' exactly ] bind: autogen202 
[ push: \\ exactly ] bind: autogen203 
[ pushf: autogen196 pushf: autogen197 pushf: autogen198 pushf: autogen199 pushf: autogen200 pushf: autogen201 pushf: autogen202 pushf: autogen203 ] bind: autogen204 
[ pushf: autogen204 or ] bind: autogen205 
[ pushf: autogen205 out ] bind: autogen206 
[ pushf: autogen195 pushf: autogen206 ] bind: autogen207 
[ newfunc0 
  pushf: autogen207 and func_return ] bind: bootg.rules.escaped_char 
[ push: \t exactly ] bind: autogen208 
[ push: \s exactly ] bind: autogen209 
[ pushf: autogen208 pushf: autogen209 ] bind: autogen210 
[ pushf: autogen210 or ] bind: autogen211 
[ pushf: autogen211 push: * quantified ] bind: autogen212 
[ push: name apply ] bind: autogen213 
[ pushf: autogen213 out ] bind: autogen214 
[ pushf: autogen212 pushf: autogen214 ] bind: autogen215 
[ newfunc0 
  pushf: autogen215 and func_return ] bind: bootg.rules.apply 
[ push: ( token ] bind: autogen216 
[ push: or apply ] bind: autogen217 
[ pushf: autogen217 out ] bind: autogen218 
[ push: ) token ] bind: autogen219 
[ pushf: autogen216 pushf: autogen218 pushf: autogen219 ] bind: autogen220 
[ newfunc0 
  pushf: autogen220 and func_return ] bind: bootg.rules.parenthesis 
[ push: { token ] bind: autogen221 
[ push: or apply ] bind: autogen222 
[ pushf: autogen222 out ] bind: autogen223 
[ push: } token ] bind: autogen224 
[ pushf: autogen221 pushf: autogen223 pushf: autogen224 ] bind: autogen225 
[ newfunc0 
  pushf: autogen225 and func_return ] bind: bootg.rules.output 
[ push: ~ token ] bind: autogen226 
[ push: expr apply ] bind: autogen227 
[ pushf: autogen227 push: negation bound ] bind: autogen228 
[ pushf: autogen228 out ] bind: autogen229 
[ pushf: autogen226 pushf: autogen229 ] bind: autogen230 
[ pushf: autogen230 and ] bind: autogen231 
[ push: expr apply ] bind: autogen232 
[ pushf: autogen231 pushf: autogen232 ] bind: autogen233 
[ newfunc0 
  pushf: autogen233 or func_return ] bind: bootg.rules.not 
[ push: not apply ] bind: autogen234 
[ push: * exactly ] bind: autogen235 
[ push: + exactly ] bind: autogen236 
[ push: ? exactly ] bind: autogen237 
[ pushf: autogen235 pushf: autogen236 pushf: autogen237 ] bind: autogen238 
[ pushf: autogen238 or ] bind: autogen239 
[ pushf: autogen239 push: ? quantified ] bind: autogen240 
[ pushf: autogen234 pushf: autogen240 ] bind: autogen241 
[ newfunc0 
  pushf: autogen241 and func_return ] bind: bootg.rules.quantified 
[ push: quantified apply ] bind: autogen242 
[ push: = exactly ] bind: autogen243 
[ push: name apply ] bind: autogen244 
[ pushf: autogen244 out ] bind: autogen245 
[ pushf: autogen243 pushf: autogen245 ] bind: autogen246 
[ pushf: autogen246 and ] bind: autogen247 
[ pushf: autogen247 push: ? quantified ] bind: autogen248 
[ pushf: autogen242 pushf: autogen248 ] bind: autogen249 
[ newfunc0 
  pushf: autogen249 and func_return ] bind: bootg.rules.bound 
[ push: bound apply ] bind: autogen250 
[ newfunc0 
  pushf: autogen250 push: * quantified func_return ] bind: bootg.rules.and 
[ push: and apply ] bind: autogen251 
[ push: | token ] bind: autogen252 
[ push: and apply ] bind: autogen253 
[ pushf: autogen253 out ] bind: autogen254 
[ pushf: autogen252 pushf: autogen254 ] bind: autogen255 
[ pushf: autogen255 and ] bind: autogen256 
[ pushf: autogen256 push: * quantified ] bind: autogen257 
[ pushf: autogen251 pushf: autogen257 ] bind: autogen258 
[ newfunc0 
  pushf: autogen258 and func_return ] bind: bootg.rules.or 
[ push: spaces apply ] bind: autogen259 
[ push: name apply ] bind: autogen260 
[ pushf: autogen260 push: rule\uname bound ] bind: autogen261 
[ push: ! exactly ] bind: autogen262 
[ pushf: autogen262 push: ? quantified ] bind: autogen263 
[ pushf: autogen263 push: flags bound ] bind: autogen264 
[ push: and apply ] bind: autogen265 
[ pushf: autogen265 push: args bound ] bind: autogen266 
[ push: = token ] bind: autogen267 
[ push: or apply ] bind: autogen268 
[ pushf: autogen268 out ] bind: autogen269 
[ pushf: autogen267 pushf: autogen269 ] bind: autogen270 
[ pushf: autogen270 and ] bind: autogen271 
[ pushf: autogen261 pushf: autogen264 pushf: autogen266 pushf: autogen271 ] bind: autogen272 
[ pushf: autogen272 and ] bind: autogen273 
[ pushf: autogen273 out ] bind: autogen274 
[ pushf: autogen259 pushf: autogen274 ] bind: autogen275 
[ newfunc0 
  pushf: autogen275 and func_return ] bind: bootg.rules.rule 
[ push: rule apply ] bind: autogen276 
[ pushf: autogen276 push: * quantified ] bind: autogen277 
[ pushf: autogen277 out ] bind: autogen278 
[ push: spaces apply ] bind: autogen279 
[ pushf: autogen278 pushf: autogen279 ] bind: autogen280 
[ newfunc0 
  pushf: autogen280 and func_return ] bind: bootg.rules.grammar 
[ push: # exactly ] bind: autogen281 
[ push: \n exactly ] bind: autogen282 
[ pushf: autogen282 negation ] bind: autogen283 
[ push: anything apply ] bind: autogen284 
[ pushf: autogen283 pushf: autogen284 ] bind: autogen285 
[ pushf: autogen285 and ] bind: autogen286 
[ pushf: autogen286 push: * quantified ] bind: autogen287 
[ pushf: autogen281 pushf: autogen287 ] bind: autogen288 
[ newfunc0 
  pushf: autogen288 and func_return ] bind: bootg.rules.comment 
[ push: \s exactly ] bind: autogen289 
[ push: \t exactly ] bind: autogen290 
[ push: comment apply ] bind: autogen291 
[ pushf: autogen289 pushf: autogen290 pushf: autogen291 ] bind: autogen292 
[ newfunc0 
  pushf: autogen292 or func_return ] bind: bootg.rules.hspace 
[ push: hspace apply ] bind: autogen293 
[ pushf: autogen293 push: * quantified ] bind: autogen294 
[ push: \r exactly ] bind: autogen295 
[ push: \n exactly ] bind: autogen296 
[ pushf: autogen295 pushf: autogen296 ] bind: autogen297 
[ pushf: autogen297 and ] bind: autogen298 
[ push: \r exactly ] bind: autogen299 
[ push: \n exactly ] bind: autogen300 
[ pushf: autogen298 pushf: autogen299 pushf: autogen300 ] bind: autogen301 
[ pushf: autogen301 or ] bind: autogen302 
[ pushf: autogen294 pushf: autogen302 ] bind: autogen303 
[ pushf: autogen303 and ] bind: autogen304 
[ pushf: autogen304 push: * quantified ] bind: autogen305 
[ push: hspace apply ] bind: autogen306 
[ pushf: autogen306 push: + quantified ] bind: autogen307 
[ pushf: autogen305 pushf: autogen307 ] bind: autogen308 
[ newfunc0 
  pushf: autogen308 and func_return ] bind: bootg.rules.indentation 
[ push: \n exactly ] bind: autogen309 
[ push: \r exactly ] bind: autogen310 
[ push: hspace apply ] bind: autogen311 
[ pushf: autogen309 pushf: autogen310 pushf: autogen311 ] bind: autogen312 
[ newfunc0 
  pushf: autogen312 or func_return ] bind: bootg.rules.space 
[ push: space apply ] bind: autogen313 
[ newfunc0 
  pushf: autogen313 push: * quantified func_return ] bind: bootg.rules.spaces 
 pushi: 200 hashtable bind: bootg.rules 
 0 resizable bind: bootg.flagged 
 push: name pick: bootg.rules.name pick: bootg.rules hashtable.set 
 push: expr pick: bootg.rules.expr pick: bootg.rules hashtable.set 
 push: exactly pick: bootg.rules.exactly pick: bootg.rules hashtable.set 
 push: exactly pick: bootg.flagged attr_call: append 
 push: token pick: bootg.rules.token pick: bootg.rules hashtable.set 
 push: token pick: bootg.flagged attr_call: append 
 push: escaped\uchar pick: bootg.rules.escaped_char pick: bootg.rules hashtable.set 
 push: escaped\uchar pick: bootg.flagged attr_call: append 
 push: apply pick: bootg.rules.apply pick: bootg.rules hashtable.set 
 push: apply pick: bootg.flagged attr_call: append 
 push: parenthesis pick: bootg.rules.parenthesis pick: bootg.rules hashtable.set 
 push: output pick: bootg.rules.output pick: bootg.rules hashtable.set 
 push: output pick: bootg.flagged attr_call: append 
 push: not pick: bootg.rules.not pick: bootg.rules hashtable.set 
 push: quantified pick: bootg.rules.quantified pick: bootg.rules hashtable.set 
 push: bound pick: bootg.rules.bound pick: bootg.rules hashtable.set 
 push: and pick: bootg.rules.and pick: bootg.rules hashtable.set 
 push: or pick: bootg.rules.or pick: bootg.rules hashtable.set 
 push: rule pick: bootg.rules.rule pick: bootg.rules hashtable.set 
 push: grammar pick: bootg.rules.grammar pick: bootg.rules hashtable.set 
 push: comment pick: bootg.rules.comment pick: bootg.rules hashtable.set 
 push: hspace pick: bootg.rules.hspace pick: bootg.rules hashtable.set 
 push: indentation pick: bootg.rules.indentation pick: bootg.rules hashtable.set 
 push: space pick: bootg.rules.space pick: bootg.rules hashtable.set 
 push: spaces pick: bootg.rules.spaces pick: bootg.rules hashtable.set 
 pick: bootg.rules add_base_rules 
 pick: bootg.rules add_escaped_char_rules 
 0 resizable bind: bootg.base 
 push: add\ubase\urules pick: bootg.base attr_call: append 
 push: add\uescaped\uchar\urules pick: bootg.base attr_call: append 
 0 resizable bind: bootg 
 push: bootg pick: bootg attr_call: append 
 pick: bootg.rules pick: bootg attr_call: append 
 pick: bootg.flagged pick: bootg attr_call: append 
 pick: bootg.base pick: bootg attr_call: append 
 memoizer.reset 
 push: Running\ugrammar print 
 printeol 
 push: stage2.pkl save 
 push: stage2.pkl load 
[ newfunc1 assign: root 
  push: Dummy_function_should_not_be_called error return_no_value ] bind: to_flpc2 
[ pick: root printrepr return_no_value ] bind: autogen314 
[ 0 pick: root attr_call: get to_flpc2 return_no_value ] bind: autogen315 
[ 0 pick: root attr_call: get to_flpc2 return_no_value ] bind: autogen316 
[ 0 pick: root attr_call: get tprint 
  push: Unexpected_child_of_exactly._Was_expecting_a_escaped_chart. error ] bind: autogen317 
[ 0 pick: root attr_call: get attr: name push: escaped\uchar string_equal not pushf: autogen317 if 
  pick: root attr: name 0 0 pick: root attr_call: get attr_call: get node to_flpc2 return_no_value ] bind: autogen318 
[ push: prefix pick: parseg attr_call: get printraw 
  push: .rules. print 
  0 0 pick: root attr_call: get attr_call: get printraw 
  push: _<-_fun[]:\n____return( print 
  pushi: 3 pick: root attr_call: get to_flpc2 
  push: ) print return_no_value ] bind: autogen319 
[ push: out print ] bind: autogen320 
[ pick: name printraw ] bind: autogen321 
[ push: [ print ] bind: autogen322 
[ push: [ print ] bind: autogen323 
[ check: bracket 1 + assign: bracket ] bind: autogen324 
[ check: bracket 1 + assign: bracket ] bind: autogen325 
[ check: bracket 1 + assign: bracket ] bind: autogen326 
[ pick: child attr: name push: quantifier string_equal pushf: autogen325 if 
  pick: child attr: name push: inline string_equal pushf: autogen326 if ] bind: autogen327 
[ push: [ print ] bind: autogen328 
[ push: ] print ] bind: autogen329 
[ push: _ print ] bind: autogen330 
[ pick: l pick: i - pick: root attr_call: get assign: child 
  0 assign: bracket 
   pick: child pick: node_class is_instance not pushf: autogen324 pushf: autogen327 if-else 
   pick: bracket not pushf: autogen328 if 
  s21 assign: child assign: bracket 
  check: child to_flpc2 
  check: bracket not pushf: autogen329 if 
  check: i 1 - assign: i 
  pick: i 0 > pushf: autogen330 if ] bind: autogen331 
[ push: ] print ] bind: autogen332 
[ push: ] print ] bind: autogen333 
[ newfunc1 assign: root 
   pick: root pick: node_class is_instance not pushf: autogen314 if 
   pick: root attr: name assign: name 
    pick: name push: quantifier string_equal pushf: autogen315 if 
    pick: name push: inline string_equal pushf: autogen316 if 
    pick: name push: exactly string_equal pick: name push: token string_equal || 0 pick: root attr_call: get pick: node_class is_instance && pushf: autogen318 if 
    pick: name push: rule string_equal pushf: autogen319 if 
    pick: name push: output string_equal pushf: autogen320 pushf: autogen321 if-else 
   push: ( print 
    pick: name push: and string_equal pushf: autogen322 if 
    pick: name push: or string_equal pushf: autogen323 if 
   pick: root attr: len assign: l 
   pick: l assign: i 
    pushf: autogen331 repeat_if 
    pick: name push: and string_equal pushf: autogen332 if 
    pick: name push: or string_equal pushf: autogen333 if 
   push: ) print return_no_value ] rebind: to_flpc2 
[ pick: l pick: i - pick: root attr_call: get to_flpc2 
  printeol 
  printeol 
  check: i 1 - assign: i ] bind: autogen334 
[ newfunc1 assign: root 
   pick: root attr: len assign: l 
   pick: l assign: i 
   pushf: autogen334 repeat_if return_no_value ] bind: print_grammar_funcs 
[ newfunc1 assign: ruleset 
   pick: ruleset printraw 
   push: ( print 
   push: prefix pick: parseg attr_call: get printraw 
   push: .rules) print 
   printeol return_no_value ] bind: print_ruleset 
[ pick: prefix printraw 
  push: .base_._append(" print 
  pick: l pick: i - push: base\urules pick: parseg attr_call: get attr_call: get printraw 
  push: ") print 
  printeol 
  check: i 1 - assign: i ] bind: autogen335 
[ newfunc0 
   push: prefix pick: parseg attr_call: get assign: prefix 
   pick: prefix printraw 
   push: .base_<-_resizable(0) print 
   printeol 
   push: base\urules pick: parseg attr_call: get attr: len assign: l 
   pick: l assign: i 
   pushf: autogen335 repeat_if 
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
  printeol ] bind: autogen336 
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
   1 pick: child attr_call: get attr: len 0 > pushf: autogen336 if return_no_value ] bind: print_child_setter 
[ pick: l pick: i - pick: root attr_call: get print_child_setter 
  check: i 1 - assign: i ] bind: autogen337 
[ pick: l pick: i - push: base\urules pick: parseg attr_call: get attr_call: get print_ruleset 
  check: i 1 - assign: i ] bind: autogen338 
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
   pushf: autogen337 repeat_if 
   push: base\urules pick: parseg attr_call: get attr: len assign: l 
   pick: l assign: i 
   pushf: autogen338 repeat_if return_no_value ] bind: print_grammar_setters 
[ newfunc1 assign: root 
   pick: root print_grammar_funcs 
   check: root print_grammar_setters 
   print_grammar_obj return_no_value ] bind: print_grammar_all 
[ newfunc2 assign: input_filename assign: grammar_obj 
   push: source pick: input_filename Input names2 attr_call: set 
   pick: grammar_obj init_parseg 
   pick: parseg print 
   printeol 
   push: grammar apply assign: output 
   pick: output func_return ] bind: parse_grammar 
[ 1 resizable assign: wrapped 
  0 pick: output pick: wrapped attr_call: set ] bind: autogen339 
[ pick: output assign: wrapped ] bind: autogen340 
[ pick: l pick: i - pick: wrapped attr_call: get print_child_setter 
  check: i 1 - assign: i ] bind: autogen341 
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
   pick: output attr: name push: grammar string_equal not pushf: autogen339 pushf: autogen340 if-else 
   pick: wrapped print_grammar_funcs 
   pick: wrapped attr: len assign: l 
   pick: l assign: i 
   pushf: autogen341 repeat_if 
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
 pick: bootg push: grammar/boot.grammar push: gen/grammar.flpc write_parsed 
 push: add\uindent\urules pick: bootg.base attr_call: append 
 0 push: flpcg pick: bootg attr_call: set 
 pick: bootg push: grammar/flpc.grammar push: gen/flpc\ugrammar.flpc write_parsed 