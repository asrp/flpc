push: Generated_from_lib/stage0.flpc_lib/stage1a.flpc_lib/stage1b.flpc_lib/stage1b2.flpc_lib/stage1b3.flpc_lib/stage1c.flpc_lib/stage1d.flpc_lib/stage3a.flpc_lib/stage3b.flpc_lib/flpc_grammar.flpc_lib/stage6a.flpc_lib/stage6b.flpc_lib/stage7a2.flpc_lib/stage7a.flpc print
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
   pick: length 1 == pushf: autogen97 if 
  pick: outputs func_return ] bind: autogen98 
[ pick: outputs attr: children func_return ] bind: autogen99 
[ pick: outputs attr: children is_str pushf: autogen99 if ] bind: autogen100 
[ pick: outputs pick: node_class is_instance pushf: autogen100 if 
  pick: outputs func_return ] bind: autogen101 
[ newfunc1 assign: outputs 
  pick: outputs pick: resizable_class is_instance pushf: autogen98 pushf: autogen101 if-else return_no_value ] bind: make_string 
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
 push: stage2.pkl load 
[ newfunc1 assign: root 
  push: Dummy_function_should_not_be_called error return_no_value ] bind: to_flpc2 
[ pick: root printrepr return_no_value ] bind: autogen152 
[ 0 pick: root attr_call: get to_flpc2 return_no_value ] bind: autogen153 
[ 0 pick: root attr_call: get to_flpc2 return_no_value ] bind: autogen154 
[ 0 pick: root attr_call: get tprint 
  push: Unexpected_child_of_exactly._Was_expecting_a_escaped_chart. error ] bind: autogen155 
[ 0 pick: root attr_call: get attr: name push: escaped\uchar string_equal not pushf: autogen155 if 
  pick: root attr: name 0 0 pick: root attr_call: get attr_call: get node to_flpc2 return_no_value ] bind: autogen156 
[ push: prefix pick: parseg attr_call: get printraw 
  push: .rules. print 
  0 0 pick: root attr_call: get attr_call: get printraw 
  push: _<-_fun[]:\n____return( print 
  pushi: 3 pick: root attr_call: get to_flpc2 
  push: ) print return_no_value ] bind: autogen157 
[ push: out print ] bind: autogen158 
[ pick: name printraw ] bind: autogen159 
[ push: [ print ] bind: autogen160 
[ push: [ print ] bind: autogen161 
[ check: bracket 1 + assign: bracket ] bind: autogen162 
[ check: bracket 1 + assign: bracket ] bind: autogen163 
[ check: bracket 1 + assign: bracket ] bind: autogen164 
[ pick: child attr: name push: quantifier string_equal pushf: autogen163 if 
  pick: child attr: name push: inline string_equal pushf: autogen164 if ] bind: autogen165 
[ push: [ print ] bind: autogen166 
[ push: ] print ] bind: autogen167 
[ push: _ print ] bind: autogen168 
[ pick: l pick: i - pick: root attr_call: get assign: child 
  0 assign: bracket 
   pick: child pick: node_class is_instance not pushf: autogen162 pushf: autogen165 if-else 
   pick: bracket not pushf: autogen166 if 
  s21 assign: child assign: bracket 
  check: child to_flpc2 
  check: bracket not pushf: autogen167 if 
  check: i 1 - assign: i 
  pick: i 0 > pushf: autogen168 if ] bind: autogen169 
[ push: ] print ] bind: autogen170 
[ push: ] print ] bind: autogen171 
[ newfunc1 assign: root 
   pick: root pick: node_class is_instance not pushf: autogen152 if 
   pick: root attr: name assign: name 
    pick: name push: quantifier string_equal pushf: autogen153 if 
    pick: name push: inline string_equal pushf: autogen154 if 
    pick: name push: exactly string_equal pick: name push: token string_equal || 0 pick: root attr_call: get pick: node_class is_instance && pushf: autogen156 if 
    pick: name push: rule string_equal pushf: autogen157 if 
    pick: name push: output string_equal pushf: autogen158 pushf: autogen159 if-else 
   push: ( print 
    pick: name push: and string_equal pushf: autogen160 if 
    pick: name push: or string_equal pushf: autogen161 if 
   pick: root attr: len assign: l 
   pick: l assign: i 
    pushf: autogen169 repeat_if 
    pick: name push: and string_equal pushf: autogen170 if 
    pick: name push: or string_equal pushf: autogen171 if 
   push: ) print return_no_value ] rebind: to_flpc2 
[ pick: l pick: i - pick: root attr_call: get to_flpc2 
  printeol 
  printeol 
  check: i 1 - assign: i ] bind: autogen172 
[ newfunc1 assign: root 
   pick: root attr: len assign: l 
   pick: l assign: i 
   pushf: autogen172 repeat_if return_no_value ] bind: print_grammar_funcs 
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
  check: i 1 - assign: i ] bind: autogen173 
[ newfunc0 
   push: prefix pick: parseg attr_call: get assign: prefix 
   pick: prefix printraw 
   push: .base_<-_resizable(0) print 
   printeol 
   push: base\urules pick: parseg attr_call: get attr: len assign: l 
   pick: l assign: i 
   pushf: autogen173 repeat_if 
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
  printeol ] bind: autogen174 
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
   1 pick: child attr_call: get attr: len 0 > pushf: autogen174 if return_no_value ] bind: print_child_setter 
[ pick: l pick: i - pick: root attr_call: get print_child_setter 
  check: i 1 - assign: i ] bind: autogen175 
[ pick: l pick: i - push: base\urules pick: parseg attr_call: get attr_call: get print_ruleset 
  check: i 1 - assign: i ] bind: autogen176 
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
   pushf: autogen175 repeat_if 
   push: base\urules pick: parseg attr_call: get attr: len assign: l 
   pick: l assign: i 
   pushf: autogen176 repeat_if return_no_value ] bind: print_grammar_setters 
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
  0 pick: output pick: wrapped attr_call: set ] bind: autogen177 
[ pick: output assign: wrapped ] bind: autogen178 
[ pick: l pick: i - pick: wrapped attr_call: get print_child_setter 
  check: i 1 - assign: i ] bind: autogen179 
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
   pick: output attr: name push: grammar string_equal not pushf: autogen177 pushf: autogen178 if-else 
   pick: wrapped print_grammar_funcs 
   pick: wrapped attr: len assign: l 
   pick: l assign: i 
   pushf: autogen179 repeat_if 
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
[ None func_return ] bind: autogen180 
[ newfunc0 
   pick: source attr_call: position assign: saved 
   push: hspaces apply make_string assign: s 
   push: indentation pick: parseg attr_call: get attr_call: top pick: s str_len == pushf: autogen180 if 
   pick: saved pick: source attr_call: position_set 
   push: Different_indent MatchError func_return ] bind: base.rules.SAME_INDENT 
[ newfunc0 
   push: indentation pick: parseg attr_call: get attr_call: pop 
   None func_return ] bind: base.rules.DEDENT 
[ pick: saved pick: source attr_call: position_set 
  push: Missing_newline_before_indent MatchError func_return ] bind: autogen181 
[ newfunc0 
   pick: source attr_call: position assign: saved 
   push: NEWLINE apply pick: MatchError_class is_instance pushf: autogen181 if 
   push: hspaces apply make_string assign: s 
   pick: saved pick: source attr_call: position_set 
   pick: s str_len push: indentation pick: parseg attr_call: get attr_call: append 
   None func_return ] bind: base.rules.INDENT 
[ check: output 1 + memory.get make_string assign: output ] bind: autogen182 
[ push: NAME apply assign: output 
  pick: output pick: node_class is_instance pushf: autogen182 if ] bind: autogen183 
[ push: Not_token_or_EOF MatchError func_return ] bind: autogen184 
[ pick: s pick: source attr_call: startswith assign: output 
  pick: output None == pushf: autogen184 if 
  check: output func_return ] bind: autogen185 
[ pick: output func_return ] bind: autogen186 
[ push: End_of_file MatchError func_return ] bind: autogen187 
[ push: Not_exactly_token MatchError func_return ] bind: autogen188 
[ newfunc1 assign: s 
   pick: source attr_call: position assign: saved 
   push: spaces apply drop1 
    pick: s is_alpha pushf: autogen183 pushf: autogen185 if-else 
    pick: output pick: MatchError_class is_instance pushf: autogen186 if 
    pick: output None == pushf: autogen187 if 
    pick: output pick: s string_equal not pushf: autogen188 if 
   pick: output func_return ] rebind: token 
[ newfunc1 assign: rules 
   push: INDENT pick: base.rules.INDENT pick: rules hashtable.set 
   push: DEDENT pick: base.rules.DEDENT pick: rules hashtable.set 
   push: SAME\uINDENT pick: base.rules.SAME_INDENT pick: rules hashtable.set return_no_value ] bind: add_indent_rules 
[ push: # exactly ] bind: autogen189 
[ push: \n exactly ] bind: autogen190 
[ pushf: autogen190 negation ] bind: autogen191 
[ push: anything apply ] bind: autogen192 
[ pushf: autogen192 out ] bind: autogen193 
[ pushf: autogen191 pushf: autogen193 ] bind: autogen194 
[ pushf: autogen194 and ] bind: autogen195 
[ pushf: autogen195 push: * quantified ] bind: autogen196 
[ pushf: autogen196 out ] bind: autogen197 
[ pushf: autogen189 pushf: autogen197 ] bind: autogen198 
[ pushf: autogen198 and ] bind: autogen199 
[ newfunc0 
  pushf: autogen199 push: comment bound func_return ] bind: flpcg.rules.comment 
[ push: \n exactly ] bind: autogen200 
[ push: \r exactly ] bind: autogen201 
[ push: \s exactly ] bind: autogen202 
[ push: \t exactly ] bind: autogen203 
[ pushf: autogen200 pushf: autogen201 pushf: autogen202 pushf: autogen203 ] bind: autogen204 
[ newfunc0 
  pushf: autogen204 or func_return ] bind: flpcg.rules.space 
[ push: space apply ] bind: autogen205 
[ newfunc0 
  pushf: autogen205 push: * quantified func_return ] bind: flpcg.rules.spaces 
[ push: space apply ] bind: autogen206 
[ newfunc0 
  pushf: autogen206 push: + quantified func_return ] bind: flpcg.rules.spacesp 
[ push: \s exactly ] bind: autogen207 
[ push: \t exactly ] bind: autogen208 
[ pushf: autogen207 pushf: autogen208 ] bind: autogen209 
[ pushf: autogen209 or ] bind: autogen210 
[ newfunc0 
  pushf: autogen210 push: * quantified func_return ] bind: flpcg.rules.hspaces 
[ push: \s exactly ] bind: autogen211 
[ push: \t exactly ] bind: autogen212 
[ pushf: autogen211 pushf: autogen212 ] bind: autogen213 
[ pushf: autogen213 or ] bind: autogen214 
[ newfunc0 
  pushf: autogen214 push: + quantified func_return ] bind: flpcg.rules.hspacesp 
[ push: hspaces apply ] bind: autogen215 
[ push: comment apply ] bind: autogen216 
[ pushf: autogen216 push: ? quantified ] bind: autogen217 
[ push: \n exactly ] bind: autogen218 
[ push: \r exactly ] bind: autogen219 
[ pushf: autogen218 pushf: autogen219 ] bind: autogen220 
[ pushf: autogen220 or ] bind: autogen221 
[ pushf: autogen215 pushf: autogen217 pushf: autogen221 ] bind: autogen222 
[ pushf: autogen222 and ] bind: autogen223 
[ newfunc0 
  pushf: autogen223 push: EMPTY\uLINE bound func_return ] bind: flpcg.rules.EMPTY_LINE 
[ push: hspaces apply ] bind: autogen224 
[ push: - exactly ] bind: autogen225 
[ pushf: autogen225 push: ? quantified ] bind: autogen226 
[ push: digit apply ] bind: autogen227 
[ pushf: autogen227 push: + quantified ] bind: autogen228 
[ pushf: autogen226 pushf: autogen228 ] bind: autogen229 
[ pushf: autogen229 and ] bind: autogen230 
[ pushf: autogen230 out ] bind: autogen231 
[ pushf: autogen224 pushf: autogen231 ] bind: autogen232 
[ newfunc0 
  pushf: autogen232 and func_return ] bind: flpcg.rules.NUMBER 
[ push: hspaces apply ] bind: autogen233 
[ push: \q exactly ] bind: autogen234 
[ push: \q exactly ] bind: autogen235 
[ pushf: autogen235 negation ] bind: autogen236 
[ push: anything apply ] bind: autogen237 
[ pushf: autogen236 pushf: autogen237 ] bind: autogen238 
[ pushf: autogen238 and ] bind: autogen239 
[ pushf: autogen239 push: * quantified ] bind: autogen240 
[ pushf: autogen240 out ] bind: autogen241 
[ push: \q exactly ] bind: autogen242 
[ pushf: autogen234 pushf: autogen241 pushf: autogen242 ] bind: autogen243 
[ pushf: autogen243 and ] bind: autogen244 
[ push: ' exactly ] bind: autogen245 
[ push: ' exactly ] bind: autogen246 
[ pushf: autogen246 negation ] bind: autogen247 
[ push: anything apply ] bind: autogen248 
[ pushf: autogen247 pushf: autogen248 ] bind: autogen249 
[ pushf: autogen249 and ] bind: autogen250 
[ pushf: autogen250 push: * quantified ] bind: autogen251 
[ pushf: autogen251 out ] bind: autogen252 
[ push: ' exactly ] bind: autogen253 
[ pushf: autogen245 pushf: autogen252 pushf: autogen253 ] bind: autogen254 
[ pushf: autogen254 and ] bind: autogen255 
[ pushf: autogen244 pushf: autogen255 ] bind: autogen256 
[ pushf: autogen256 or ] bind: autogen257 
[ pushf: autogen257 out ] bind: autogen258 
[ pushf: autogen233 pushf: autogen258 ] bind: autogen259 
[ newfunc0 
  pushf: autogen259 and func_return ] bind: flpcg.rules.STRING 
[ push: hspaces apply ] bind: autogen260 
[ push: letter apply ] bind: autogen261 
[ push: \u exactly ] bind: autogen262 
[ pushf: autogen261 pushf: autogen262 ] bind: autogen263 
[ pushf: autogen263 or ] bind: autogen264 
[ push: space apply ] bind: autogen265 
[ pushf: autogen265 negation ] bind: autogen266 
[ push: ( exactly ] bind: autogen267 
[ pushf: autogen267 negation ] bind: autogen268 
[ push: = exactly ] bind: autogen269 
[ pushf: autogen269 negation ] bind: autogen270 
[ push: ) exactly ] bind: autogen271 
[ pushf: autogen271 negation ] bind: autogen272 
[ push: [ exactly ] bind: autogen273 
[ pushf: autogen273 negation ] bind: autogen274 
[ push: ] exactly ] bind: autogen275 
[ pushf: autogen275 negation ] bind: autogen276 
[ push: < exactly ] bind: autogen277 
[ pushf: autogen277 negation ] bind: autogen278 
[ push: : exactly ] bind: autogen279 
[ pushf: autogen279 negation ] bind: autogen280 
[ push: ' exactly ] bind: autogen281 
[ pushf: autogen281 negation ] bind: autogen282 
[ push: anything apply ] bind: autogen283 
[ pushf: autogen266 pushf: autogen268 pushf: autogen270 pushf: autogen272 pushf: autogen274 pushf: autogen276 pushf: autogen278 pushf: autogen280 pushf: autogen282 pushf: autogen283 ] bind: autogen284 
[ pushf: autogen284 and ] bind: autogen285 
[ pushf: autogen285 push: * quantified ] bind: autogen286 
[ pushf: autogen264 pushf: autogen286 ] bind: autogen287 
[ pushf: autogen287 and ] bind: autogen288 
[ pushf: autogen288 out ] bind: autogen289 
[ pushf: autogen260 pushf: autogen289 ] bind: autogen290 
[ newfunc0 
  pushf: autogen290 and func_return ] bind: flpcg.rules.NAME 
[ push: hspacesp apply ] bind: autogen291 
[ push: 'F token ] bind: autogen292 
[ pushf: autogen292 negation ] bind: autogen293 
[ push: space apply ] bind: autogen294 
[ pushf: autogen294 negation ] bind: autogen295 
[ push: anything apply ] bind: autogen296 
[ pushf: autogen295 pushf: autogen296 ] bind: autogen297 
[ pushf: autogen297 and ] bind: autogen298 
[ pushf: autogen298 push: * quantified ] bind: autogen299 
[ pushf: autogen299 out ] bind: autogen300 
[ pushf: autogen291 pushf: autogen293 pushf: autogen300 ] bind: autogen301 
[ newfunc0 
  pushf: autogen301 and func_return ] bind: flpcg.rules.FORTH_NAME 
[ push: + token ] bind: autogen302 
[ push: - token ] bind: autogen303 
[ push: / token ] bind: autogen304 
[ push: == token ] bind: autogen305 
[ push: < token ] bind: autogen306 
[ push: > token ] bind: autogen307 
[ push: . token ] bind: autogen308 
[ push: in token ] bind: autogen309 
[ push: || token ] bind: autogen310 
[ push: && token ] bind: autogen311 
[ pushf: autogen302 pushf: autogen303 pushf: autogen304 pushf: autogen305 pushf: autogen306 pushf: autogen307 pushf: autogen308 pushf: autogen309 pushf: autogen310 pushf: autogen311 ] bind: autogen312 
[ newfunc0 
  pushf: autogen312 or func_return ] bind: flpcg.rules.bin_op 
[ push: NAME apply ] bind: autogen313 
[ newfunc0 
  pushf: autogen313 push: * quantified func_return ] bind: flpcg.rules.names 
[ newfunc0 
  push: NAME apply func_return ] bind: flpcg.rules.variable 
[ push: ` token ] bind: autogen314 
[ push: NAME apply ] bind: autogen315 
[ pushf: autogen315 out ] bind: autogen316 
[ pushf: autogen314 pushf: autogen316 ] bind: autogen317 
[ newfunc0 
  pushf: autogen317 and func_return ] bind: flpcg.rules.name_quote 
[ push: [ token ] bind: autogen318 
[ push: ] token ] bind: autogen319 
[ pushf: autogen319 negation ] bind: autogen320 
[ push: spaces apply ] bind: autogen321 
[ push: statement apply ] bind: autogen322 
[ pushf: autogen322 out ] bind: autogen323 
[ pushf: autogen320 pushf: autogen321 pushf: autogen323 ] bind: autogen324 
[ pushf: autogen324 and ] bind: autogen325 
[ pushf: autogen325 push: + quantified ] bind: autogen326 
[ pushf: autogen326 out ] bind: autogen327 
[ push: ] token ] bind: autogen328 
[ pushf: autogen318 pushf: autogen327 pushf: autogen328 ] bind: autogen329 
[ newfunc0 
  pushf: autogen329 and func_return ] bind: flpcg.rules.quote 
[ push: F' token ] bind: autogen330 
[ push: forth\uline apply ] bind: autogen331 
[ push: hspaces apply ] bind: autogen332 
[ push: \n exactly ] bind: autogen333 
[ push: \r exactly ] bind: autogen334 
[ pushf: autogen333 pushf: autogen334 ] bind: autogen335 
[ pushf: autogen335 or ] bind: autogen336 
[ push: forth\uline apply ] bind: autogen337 
[ pushf: autogen337 out ] bind: autogen338 
[ pushf: autogen332 pushf: autogen336 pushf: autogen338 ] bind: autogen339 
[ pushf: autogen339 and ] bind: autogen340 
[ pushf: autogen340 push: * quantified ] bind: autogen341 
[ pushf: autogen331 pushf: autogen341 ] bind: autogen342 
[ pushf: autogen342 and ] bind: autogen343 
[ pushf: autogen343 out ] bind: autogen344 
[ push: spaces apply ] bind: autogen345 
[ push: 'F token ] bind: autogen346 
[ pushf: autogen330 pushf: autogen344 pushf: autogen345 pushf: autogen346 ] bind: autogen347 
[ newfunc0 
  pushf: autogen347 and func_return ] bind: flpcg.rules.forth 
[ push: FORTH\uNAME apply ] bind: autogen348 
[ pushf: autogen348 push: NAME bound ] bind: autogen349 
[ newfunc0 
  pushf: autogen349 push: * quantified func_return ] bind: flpcg.rules.forth_line 
[ push: [ token ] bind: autogen350 
[ push: names apply ] bind: autogen351 
[ pushf: autogen351 out ] bind: autogen352 
[ push: ] token ] bind: autogen353 
[ pushf: autogen350 pushf: autogen352 pushf: autogen353 ] bind: autogen354 
[ newfunc0 
  pushf: autogen354 and func_return ] bind: flpcg.rules.simple_quote 
[ push: ( token ] bind: autogen355 
[ push: expr apply ] bind: autogen356 
[ pushf: autogen356 out ] bind: autogen357 
[ push: ) token ] bind: autogen358 
[ pushf: autogen355 pushf: autogen357 pushf: autogen358 ] bind: autogen359 
[ newfunc0 
  pushf: autogen359 and func_return ] bind: flpcg.rules.parenthesis 
[ push: NAME apply ] bind: autogen360 
[ push: bin\uop apply ] bind: autogen361 
[ pushf: autogen361 push: NAME bound ] bind: autogen362 
[ pushf: autogen360 pushf: autogen362 ] bind: autogen363 
[ pushf: autogen363 or ] bind: autogen364 
[ pushf: autogen364 out ] bind: autogen365 
[ push: ( exactly ] bind: autogen366 
[ push: exprs apply ] bind: autogen367 
[ pushf: autogen367 push: parameters bound ] bind: autogen368 
[ pushf: autogen368 out ] bind: autogen369 
[ push: ) token ] bind: autogen370 
[ pushf: autogen365 pushf: autogen366 pushf: autogen369 pushf: autogen370 ] bind: autogen371 
[ newfunc0 
  pushf: autogen371 and func_return ] bind: flpcg.rules.func_call 
[ push: NAME apply ] bind: autogen372 
[ push: simple\uquote apply ] bind: autogen373 
[ push: non\ublock apply ] bind: autogen374 
[ push: void apply ] bind: autogen375 
[ pushf: autogen373 pushf: autogen374 pushf: autogen375 ] bind: autogen376 
[ pushf: autogen376 or ] bind: autogen377 
[ pushf: autogen377 out ] bind: autogen378 
[ push: : token ] bind: autogen379 
[ push: suite apply ] bind: autogen380 
[ pushf: autogen380 push: quote bound ] bind: autogen381 
[ pushf: autogen381 out ] bind: autogen382 
[ pushf: autogen378 pushf: autogen379 pushf: autogen382 ] bind: autogen383 
[ pushf: autogen383 and ] bind: autogen384 
[ pushf: autogen384 push: parameters bound ] bind: autogen385 
[ pushf: autogen372 pushf: autogen385 ] bind: autogen386 
[ newfunc0 
  pushf: autogen386 and func_return ] bind: flpcg.rules.block_call 
[ push: block\ucall apply ] bind: autogen387 
[ push: NEWLINE apply ] bind: autogen388 
[ pushf: autogen388 push: + quantified ] bind: autogen389 
[ push: SAME\uINDENT apply ] bind: autogen390 
[ push: block\ucall apply ] bind: autogen391 
[ pushf: autogen391 out ] bind: autogen392 
[ pushf: autogen389 pushf: autogen390 pushf: autogen392 ] bind: autogen393 
[ pushf: autogen393 and ] bind: autogen394 
[ pushf: autogen394 push: + quantified ] bind: autogen395 
[ pushf: autogen387 pushf: autogen395 ] bind: autogen396 
[ newfunc0 
  pushf: autogen396 and func_return ] bind: flpcg.rules.multi_block_call 
[ push: forth apply ] bind: autogen397 
[ push: func\ucall apply ] bind: autogen398 
[ push: name\uquote apply ] bind: autogen399 
[ push: quote apply ] bind: autogen400 
[ push: parenthesis apply ] bind: autogen401 
[ push: NUMBER apply ] bind: autogen402 
[ push: STRING apply ] bind: autogen403 
[ push: variable apply ] bind: autogen404 
[ pushf: autogen397 pushf: autogen398 pushf: autogen399 pushf: autogen400 pushf: autogen401 pushf: autogen402 pushf: autogen403 pushf: autogen404 ] bind: autogen405 
[ newfunc0 
  pushf: autogen405 or func_return ] bind: flpcg.rules.non_block_non_infix 
[ push: infix apply ] bind: autogen406 
[ push: non\ublock\unon\uinfix apply ] bind: autogen407 
[ pushf: autogen406 pushf: autogen407 ] bind: autogen408 
[ newfunc0 
  pushf: autogen408 or func_return ] bind: flpcg.rules.non_block 
[ push: non\ublock\unon\uinfix apply ] bind: autogen409 
[ push: bin\uop apply ] bind: autogen410 
[ pushf: autogen410 push: op bound ] bind: autogen411 
[ push: non\ublock\unon\uinfix apply ] bind: autogen412 
[ pushf: autogen411 pushf: autogen412 ] bind: autogen413 
[ pushf: autogen413 and ] bind: autogen414 
[ pushf: autogen414 push: + quantified ] bind: autogen415 
[ pushf: autogen409 pushf: autogen415 ] bind: autogen416 
[ newfunc0 
  pushf: autogen416 and func_return ] bind: flpcg.rules.infix 
[ push: block\ucall apply ] bind: autogen417 
[ push: non\ublock\unon\uinfix apply ] bind: autogen418 
[ pushf: autogen417 pushf: autogen418 ] bind: autogen419 
[ newfunc0 
  pushf: autogen419 or func_return ] bind: flpcg.rules.non_infix 
[ push: infix apply ] bind: autogen420 
[ push: non\uinfix apply ] bind: autogen421 
[ pushf: autogen420 pushf: autogen421 ] bind: autogen422 
[ newfunc0 
  pushf: autogen422 or func_return ] bind: flpcg.rules.expr 
[ push: expr apply ] bind: autogen423 
[ push: spacesp apply ] bind: autogen424 
[ push: expr apply ] bind: autogen425 
[ pushf: autogen425 out ] bind: autogen426 
[ pushf: autogen424 pushf: autogen426 ] bind: autogen427 
[ pushf: autogen427 and ] bind: autogen428 
[ pushf: autogen428 push: * quantified ] bind: autogen429 
[ pushf: autogen423 pushf: autogen429 ] bind: autogen430 
[ pushf: autogen430 and ] bind: autogen431 
[ push: void apply ] bind: autogen432 
[ pushf: autogen431 pushf: autogen432 ] bind: autogen433 
[ newfunc0 
  pushf: autogen433 or func_return ] bind: flpcg.rules.exprs 
[ push: expr apply ] bind: autogen434 
[ push: hspacesp apply ] bind: autogen435 
[ push: expr apply ] bind: autogen436 
[ pushf: autogen436 out ] bind: autogen437 
[ pushf: autogen435 pushf: autogen437 ] bind: autogen438 
[ pushf: autogen438 and ] bind: autogen439 
[ pushf: autogen439 push: * quantified ] bind: autogen440 
[ pushf: autogen434 pushf: autogen440 ] bind: autogen441 
[ newfunc0 
  pushf: autogen441 and func_return ] bind: flpcg.rules.exprsp 
[ push: names apply ] bind: autogen442 
[ pushf: autogen442 out ] bind: autogen443 
[ push: = token ] bind: autogen444 
[ push: space apply ] bind: autogen445 
[ pushf: autogen443 pushf: autogen444 pushf: autogen445 ] bind: autogen446 
[ pushf: autogen446 and ] bind: autogen447 
[ push: void apply ] bind: autogen448 
[ pushf: autogen447 pushf: autogen448 ] bind: autogen449 
[ pushf: autogen449 or ] bind: autogen450 
[ push: exprsp apply ] bind: autogen451 
[ pushf: autogen450 pushf: autogen451 ] bind: autogen452 
[ newfunc0 
  pushf: autogen452 and func_return ] bind: flpcg.rules.assign 
[ push: names apply ] bind: autogen453 
[ pushf: autogen453 out ] bind: autogen454 
[ push: <- token ] bind: autogen455 
[ push: exprsp apply ] bind: autogen456 
[ pushf: autogen456 out ] bind: autogen457 
[ pushf: autogen454 pushf: autogen455 pushf: autogen457 ] bind: autogen458 
[ newfunc0 
  pushf: autogen458 and func_return ] bind: flpcg.rules.bind 
[ push: multi\ublock\ucall apply ] bind: autogen459 
[ push: bind apply ] bind: autogen460 
[ push: assign apply ] bind: autogen461 
[ pushf: autogen459 pushf: autogen460 pushf: autogen461 ] bind: autogen462 
[ newfunc0 
  pushf: autogen462 or func_return ] bind: flpcg.rules.statement 
[ push: INDENT apply ] bind: autogen463 
[ push: NEWLINE apply ] bind: autogen464 
[ pushf: autogen464 push: + quantified ] bind: autogen465 
[ push: SAME\uINDENT apply ] bind: autogen466 
[ push: statement apply ] bind: autogen467 
[ pushf: autogen465 pushf: autogen466 pushf: autogen467 ] bind: autogen468 
[ pushf: autogen468 and ] bind: autogen469 
[ pushf: autogen469 push: + quantified ] bind: autogen470 
[ push: DEDENT apply ] bind: autogen471 
[ pushf: autogen463 pushf: autogen470 pushf: autogen471 ] bind: autogen472 
[ pushf: autogen472 and ] bind: autogen473 
[ push: statement apply ] bind: autogen474 
[ pushf: autogen473 pushf: autogen474 ] bind: autogen475 
[ newfunc0 
  pushf: autogen475 or func_return ] bind: flpcg.rules.suite 
[ push: hspaces apply ] bind: autogen476 
[ push: \n exactly ] bind: autogen477 
[ push: \r exactly ] bind: autogen478 
[ pushf: autogen477 pushf: autogen478 ] bind: autogen479 
[ pushf: autogen479 or ] bind: autogen480 
[ pick: None out ] bind: autogen481 
[ pushf: autogen476 pushf: autogen480 pushf: autogen481 ] bind: autogen482 
[ pushf: autogen482 and ] bind: autogen483 
[ push: COMMENT\uLINE apply ] bind: autogen484 
[ pushf: autogen483 pushf: autogen484 ] bind: autogen485 
[ newfunc0 
  pushf: autogen485 or func_return ] bind: flpcg.rules.NEWLINE 
[ push: hspaces apply ] bind: autogen486 
[ push: comment apply ] bind: autogen487 
[ pushf: autogen487 out ] bind: autogen488 
[ push: hspaces apply ] bind: autogen489 
[ push: \n exactly ] bind: autogen490 
[ push: \r exactly ] bind: autogen491 
[ pushf: autogen490 pushf: autogen491 ] bind: autogen492 
[ pushf: autogen492 or ] bind: autogen493 
[ pushf: autogen486 pushf: autogen488 pushf: autogen489 pushf: autogen493 ] bind: autogen494 
[ newfunc0 
  pushf: autogen494 and func_return ] bind: flpcg.rules.COMMENT_LINE 
[ push: NEWLINE apply ] bind: autogen495 
[ pushf: autogen495 push: * quantified ] bind: autogen496 
[ push: SAME\uINDENT apply ] bind: autogen497 
[ push: statement apply ] bind: autogen498 
[ push: NEWLINE apply ] bind: autogen499 
[ pushf: autogen499 push: + quantified ] bind: autogen500 
[ push: anything apply ] bind: autogen501 
[ pushf: autogen501 negation ] bind: autogen502 
[ pushf: autogen500 pushf: autogen502 ] bind: autogen503 
[ pushf: autogen503 or ] bind: autogen504 
[ pushf: autogen496 pushf: autogen497 pushf: autogen498 pushf: autogen504 ] bind: autogen505 
[ pushf: autogen505 and ] bind: autogen506 
[ pushf: autogen506 push: + quantified ] bind: autogen507 
[ pushf: autogen507 push: suite bound ] bind: autogen508 
[ push: statement apply ] bind: autogen509 
[ pushf: autogen509 push: suite bound ] bind: autogen510 
[ pushf: autogen508 pushf: autogen510 ] bind: autogen511 
[ newfunc0 
  pushf: autogen511 or func_return ] bind: flpcg.rules.grammar 
 pushi: 148 hashtable bind: flpcg.rules 
 0 resizable bind: flpcg.flagged 
 push: comment pick: flpcg.rules.comment pick: flpcg.rules hashtable.set 
 push: space pick: flpcg.rules.space pick: flpcg.rules hashtable.set 
 push: spaces pick: flpcg.rules.spaces pick: flpcg.rules hashtable.set 
 push: spacesp pick: flpcg.rules.spacesp pick: flpcg.rules hashtable.set 
 push: hspaces pick: flpcg.rules.hspaces pick: flpcg.rules hashtable.set 
 push: hspacesp pick: flpcg.rules.hspacesp pick: flpcg.rules hashtable.set 
 push: EMPTY\uLINE pick: flpcg.rules.EMPTY_LINE pick: flpcg.rules hashtable.set 
 push: EMPTY\uLINE pick: flpcg.flagged attr_call: append 
 push: NUMBER pick: flpcg.rules.NUMBER pick: flpcg.rules hashtable.set 
 push: NUMBER pick: flpcg.flagged attr_call: append 
 push: STRING pick: flpcg.rules.STRING pick: flpcg.rules hashtable.set 
 push: STRING pick: flpcg.flagged attr_call: append 
 push: NAME pick: flpcg.rules.NAME pick: flpcg.rules hashtable.set 
 push: NAME pick: flpcg.flagged attr_call: append 
 push: FORTH\uNAME pick: flpcg.rules.FORTH_NAME pick: flpcg.rules hashtable.set 
 push: bin\uop pick: flpcg.rules.bin_op pick: flpcg.rules hashtable.set 
 push: names pick: flpcg.rules.names pick: flpcg.rules hashtable.set 
 push: names pick: flpcg.flagged attr_call: append 
 push: variable pick: flpcg.rules.variable pick: flpcg.rules hashtable.set 
 push: variable pick: flpcg.flagged attr_call: append 
 push: name\uquote pick: flpcg.rules.name_quote pick: flpcg.rules hashtable.set 
 push: name\uquote pick: flpcg.flagged attr_call: append 
 push: quote pick: flpcg.rules.quote pick: flpcg.rules hashtable.set 
 push: quote pick: flpcg.flagged attr_call: append 
 push: forth pick: flpcg.rules.forth pick: flpcg.rules hashtable.set 
 push: forth pick: flpcg.flagged attr_call: append 
 push: forth\uline pick: flpcg.rules.forth_line pick: flpcg.rules hashtable.set 
 push: simple\uquote pick: flpcg.rules.simple_quote pick: flpcg.rules hashtable.set 
 push: simple\uquote pick: flpcg.flagged attr_call: append 
 push: parenthesis pick: flpcg.rules.parenthesis pick: flpcg.rules hashtable.set 
 push: func\ucall pick: flpcg.rules.func_call pick: flpcg.rules hashtable.set 
 push: block\ucall pick: flpcg.rules.block_call pick: flpcg.rules hashtable.set 
 push: multi\ublock\ucall pick: flpcg.rules.multi_block_call pick: flpcg.rules hashtable.set 
 push: non\ublock\unon\uinfix pick: flpcg.rules.non_block_non_infix pick: flpcg.rules hashtable.set 
 push: non\ublock pick: flpcg.rules.non_block pick: flpcg.rules hashtable.set 
 push: infix pick: flpcg.rules.infix pick: flpcg.rules hashtable.set 
 push: non\uinfix pick: flpcg.rules.non_infix pick: flpcg.rules hashtable.set 
 push: expr pick: flpcg.rules.expr pick: flpcg.rules hashtable.set 
 push: exprs pick: flpcg.rules.exprs pick: flpcg.rules hashtable.set 
 push: exprsp pick: flpcg.rules.exprsp pick: flpcg.rules hashtable.set 
 push: assign pick: flpcg.rules.assign pick: flpcg.rules hashtable.set 
 push: bind pick: flpcg.rules.bind pick: flpcg.rules hashtable.set 
 push: bind pick: flpcg.flagged attr_call: append 
 push: statement pick: flpcg.rules.statement pick: flpcg.rules hashtable.set 
 push: suite pick: flpcg.rules.suite pick: flpcg.rules hashtable.set 
 push: NEWLINE pick: flpcg.rules.NEWLINE pick: flpcg.rules hashtable.set 
 push: COMMENT\uLINE pick: flpcg.rules.COMMENT_LINE pick: flpcg.rules hashtable.set 
 push: grammar pick: flpcg.rules.grammar pick: flpcg.rules hashtable.set 
 pick: flpcg.rules add_base_rules 
 pick: flpcg.rules add_indent_rules 
 0 resizable bind: flpcg.base 
 push: add\ubase\urules pick: flpcg.base attr_call: append 
 push: add\uindent\urules pick: flpcg.base attr_call: append 
 0 resizable bind: flpcg 
 push: flpcg pick: flpcg attr_call: append 
 pick: flpcg.rules pick: flpcg attr_call: append 
 pick: flpcg.flagged pick: flpcg attr_call: append 
 pick: flpcg.base pick: flpcg attr_call: append 
[ check: cond2_thunk call assign: cond ] bind: autogen512 
[ check: cond2_thunk drop1 
  pick: False assign: cond ] bind: autogen513 
[ pushi: 2 remove_top_names assign: cond1 assign: cond2_thunk 
  check: cond1 pushf: autogen512 pushf: autogen513 if-else ] bind: lazy_and 
[ 
  1 drop1 ] bind: debugger2 
[ newfunc2 assign: value assign: title 
   pick: title print 
   pick: value tprint 
   printeol return_no_value ] bind: dprint 
[ check: cond drop1 
  pick: block call 
  check: index 1 + assign: index 
  pick: index pick: end < assign: cond ] bind: autogen514 
[ 
   push: 231 shuffle assign: index assign: end assign: block 
   pick: index pick: end < assign: cond 
   pushf: autogen514 repeat_if 
   check: index drop1 
   check: end drop1 
   check: block drop1 ] bind: simple_for 
 None memory.append 
 memory.len 1 - Pointer bind: Done 
[ drop1 
  check: elem pick: new_resizable attr_call: append 
  s21 assign: elem assign: new_resizable 
  pick1 pick: Done == not ] bind: autogen515 
[ 
   0 resizable assign: new_resizable 
   s21 assign: elem assign: new_resizable 
   pick1 pick: Done == not 
   pushf: autogen515 repeat_if 
   push: 23 shuffle ] bind: make_resizable 
[ 
   push: 51234 shuffle assign: elem assign: index assign: end assign: block assign: new_resizable 
   check: elem pick: new_resizable attr_call: append ] bind: autogen516 
[ 
   0 resizable assign: new_resizable 
   s21 assign: num assign: new_resizable 
   check: num 0 pushf: autogen516 simple_for 
   push: 12 shuffle ] bind: make_resizable_len 
[ 
   make_resizable assign: arr 
   pick: arr attr: array 1 + pick: arr attr: len str_join assign: joined 
   push: 13 shuffle ] bind: str_cat 
[ 
   pick: index pick: iterable attr_call: get assign: elem 
   pick: block2 call ] bind: autogen517 
[ pushi: 2 remove_top_names assign: block2 assign: iterable 
   pick: iterable attr: len 0 pushf: autogen517 simple_for 
   check: block2 drop1 
   check: iterable drop1 ] bind: for_in 
[ 
   pick: block3 call pick: list_comp_out attr_call: append 
   check: elem drop1 ] bind: autogen518 
[ pushi: 2 remove_top_names assign: iterable assign: block3 
   0 resizable assign: list_comp_out 
   pick: iterable pushf: autogen518 for_in 
   push: 14 shuffle ] bind: list_comp 
[ 
   pick: elem pick: var_name assign2 
   pick: block3 call pick: list_comp_out attr_call: append 
   drop1 
   check: elem drop1 ] bind: autogen519 
[ pushi: 3 remove_top_names assign: iterable assign: var_name assign: block3 
   0 resizable assign: list_comp_out 
   pick: iterable pushf: autogen519 for_in 
   push: 15 shuffle ] bind: list_comp_var 
[ pick: block3 call pick: list_comp_out attr_call: append ] bind: autogen520 
[ 
   pick: condition call pushf: autogen520 if 
   check: elem drop1 ] bind: autogen521 
[ pushi: 3 remove_top_names assign: condition assign: iterable assign: block3 
   0 resizable assign: list_comp_out 
   pick: iterable pushf: autogen521 for_in 
   push: 14 shuffle ] bind: list_comp_cond 
[ newfunc1 assign: bar 
  1 func_return ] bind: flist.foo 
[ push: FList_looking_up_ print 
  pick: name print 
  printeol ] bind: autogen522 
[ newfunc3 assign: searcher assign: receiver assign: name 
   pick: lookup_print pushf: autogen522 if 
   pick: name push: pos string_equal 0 return_if 
   pick: name pick: receiver pick: searcher instance_attrib func_return ] bind: flist.attrib 
 pick: resizable.attrib pick: boot_obj attr_call: subclass bind: FList_class 
 pick: FList_class attr: instance pick: FList_class closure bind: FList 
[ newfunc2 assign: new_class assign: obj 
  pick: obj 2 - pick: new_class memory.set return_no_value ] bind: change_class 
[ 
  check: elem pick: out_list attr_call: append ] bind: autogen523 
[ newfunc2 assign: out_list assign: in_list 
  pick: in_list pushf: autogen523 for_in return_no_value ] bind: extend 
[ check: elem pick: out_list extend ] bind: autogen524 
[ check: elem pick: out_list attr_call: append ] bind: autogen525 
[ 
  pick: elem pick: class is_instance pushf: autogen524 pushf: autogen525 if-else ] bind: autogen526 
[ newfunc2 assign: class assign: in_list 
   0 resizable assign: out_list 
   pick: in_list pushf: autogen526 for_in 
   check: out_list func_return ] bind: flatten 
[ newfunc1 assign: self 
  pick: self 1 + memory.get tprint return_no_value ] bind: forthe.print 
[ push: Forthe_looking_up_ print 
  pick: name print 
  printeol ] bind: autogen527 
[ newfunc3 assign: searcher assign: receiver assign: name 
   pick: lookup_print pushf: autogen527 if 
   pick: name push: get string_equal pick: node.get return_if 
   pick: name push: instance string_equal pick: node.instance return_if 
   pick: name push: print string_equal pick: forthe.print return_if 
   pick: name push: len string_equal pick: receiver node.len return_if 
   pick: name push: name string_equal pick: receiver memory.get return_if 
   pick: name push: value string_equal pick: receiver 1 + memory.get return_if 
   pick: name push: type string_equal push: forthe return_if 
   pick: name pick: receiver pick: searcher instance_attrib func_return ] bind: forthe.attrib 
 pick: forthe.attrib pick: boot_obj attr_call: subclass bind: forthe_class 
 pick: forthe_class attr: instance pick: forthe_class closure bind: forthe 
[ newfunc2 assign: self assign: new_name 
  s21 memory.set return_no_value ] bind: FQuote.set_name 
[ push: FQuote_looking_up_ print 
  pick: name print 
  printeol ] bind: autogen528 
[ newfunc3 assign: searcher assign: receiver assign: name 
   pick: lookup_print pushf: autogen528 if 
   pick: name push: get string_equal pick: node.get return_if 
   pick: name push: instance string_equal pick: node.instance return_if 
   pick: name push: print string_equal pick: node.print return_if 
   pick: name push: set\uname string_equal pick: FQuote.set_name return_if 
   pick: name push: len string_equal pick: receiver node.len return_if 
   pick: name push: name string_equal pick: receiver memory.get return_if 
   pick: name push: value string_equal pick: receiver 1 + memory.get return_if 
   pick: name push: type string_equal push: FQuote return_if 
   pick: name pick: receiver pick: searcher instance_attrib func_return ] bind: FQuote.attrib 
 pick: FQuote.attrib pick: boot_obj attr_call: subclass bind: FQuote_class 
 pick: FQuote_class attr: instance pick: FQuote_class closure bind: FQuote 
 pick: FQuote_class convert_attr bind: FQuote.hash 
[ newfunc3 assign: searcher assign: receiver assign: name 
   hash_header 
   pick: name pick: FQuote.hash hashtable.get call return_no_value ] rebind: FQuote.attrib 
[ newfunc1 assign: array 
   pick: array pick: FList_class change_class 
   check: array func_return ] bind: to_flist 
[ pick: self pick: i + 1 + 0 memory.set 
  check: i 1 - assign: i ] bind: autogen529 
[ newfunc1 assign: self 
   pick: self memory.get assign: i 
   pushf: autogen529 repeat_if return_no_value ] bind: array.clear 
[ newfunc1 assign: root 
  push: Dummy_function error return_no_value ] bind: simplify 
[ pick: elem simplify ] bind: autogen530 
[ pick: root attr: name pushf: autogen530 pick: root list_comp node assign: output ] bind: autogen531 
[ pick: True ] bind: autogen532 
[ 0 resizable assign: output ] bind: autogen533 
[ pick: True ] bind: autogen534 
[ pick: elem simplify ] bind: autogen535 
[ pushf: autogen535 pick: root attr: children list_comp assign: output ] bind: autogen536 
[ pick: root attr: children None == not ] bind: autogen537 
[ pick: root attr: children simplify assign: output ] bind: autogen538 
[ pick: root attr: children pick: node_class is_instance ] bind: autogen539 
[ pushf: autogen533 pushf: autogen534 pushf: autogen536 pushf: autogen537 pushf: autogen538 pushf: autogen539 pushi: 3 multi-if ] bind: autogen540 
[ pick: root attr: name push: parameters string_equal pick: root attr: name push: exprs string_equal || ] bind: autogen541 
[ 0 pick: root attr_call: get simplify assign: output ] bind: autogen542 
[ 0 pick: root attr_call: get attr: name push: exprs string_equal ] bind: autogen543 
[ pushf: autogen543 pick: root attr: len 1 == 0 pick: root attr_call: get pick: node_class is_instance && lazy_and ] bind: autogen544 
[ pick: elem simplify ] bind: autogen545 
[ pick: True assign: cond ] bind: autogen546 
[ pick: elem attr: name push: EMPTY\uLINE string_equal not assign: cond ] bind: autogen547 
[ 
  pick: elem pick: node_class is_instance not pushf: autogen546 pushf: autogen547 if-else ] bind: autogen548 
[ pushf: autogen545 pick: root pushf: autogen548 list_comp_cond assign: children 
  pick: root attr: name pick: children node assign: output ] bind: autogen549 
[ pick: root attr: name push: suite string_equal ] bind: autogen550 
[ 0 pick: root attr_call: get simplify assign: output ] bind: autogen551 
[ pick: root attr: name push: suite string_equal pick: root attr: len 1 == && ] bind: autogen552 
[ pick: child pick: children attr_call: append ] bind: autogen553 
[ pick: True ] bind: autogen554 
[ push: multi\uif pick: last_child attr_call: set_name 
  pick: Done push: if pick: last_child attr: children node make_resizable pick: last_child attr_call: set_children ] bind: autogen555 
[ debugger2 
  pick: last_child attr: name push: if string_equal pushf: autogen555 if 
  pick: child pick: last_child attr: children attr_call: append 
  debugger2 
  check: child drop1 
  pick: last_child assign: bring_to_top ] bind: autogen556 
[ pick: child attr: name push: elif string_equal ] bind: autogen557 
[ pick: child attr: children pick: last_child attr: children attr_call: append 
  push: if-else pick: last_child attr_call: set_name ] bind: autogen558 
[ pick: last_child attr: name push: if string_equal pick: child attr: name push: else string_equal && ] bind: autogen559 
[ 
   pick: index pick: root attr_call: get simplify assign: child 
   pushf: autogen553 pushf: autogen554 pushf: autogen556 pushf: autogen557 pushf: autogen558 pushf: autogen559 pushi: 3 multi-if 
   debugger2 
   push: 23416 shuffle assign: index assign: end assign: block assign: last_child ] bind: autogen560 
[ push: multi-block-root:_ pick: root dprint 
  debugger2 
  0 resizable assign: children 
  push: dummy None node assign: last_child 
  pick: root attr: len 0 pushf: autogen560 simple_for 
  push: suite pick: children node assign: output ] bind: autogen561 
[ pick: root attr: name push: multi\ublock\ucall string_equal ] bind: autogen562 
[ check: cond drop1 
  check: i 2 + assign: i 
  0 pick: i 1 - pick: root attr_call: get attr_call: get pick: Done pick: i pick: root attr_call: get simplify pick: output simplify make_resizable node assign: output 
  push: 214 shuffle assign: i assign: output 
  pick: i pick: l < assign: cond ] bind: autogen563 
[ pick: root attr: len 2 - assign: l 
  0 pick: root attr_call: get assign: output 
  0 assign: i 
  pick: i pick: l < assign: cond 
  pushf: autogen563 repeat_if 
  check: i drop1 ] bind: autogen564 
[ pick: root attr: name push: infix string_equal ] bind: autogen565 
[ 0 0 pick: root attr_call: get attr_call: get 1 pick: root attr_call: get simplify node assign: output ] bind: autogen566 
[ pick: root attr: name push: func\ucall string_equal pick: root attr: name push: block\ucall string_equal || ] bind: autogen567 
[ pick: root assign: output ] bind: autogen568 
[ pick: root pick: node_class is_instance not ] bind: autogen569 
[ newfunc1 assign: root 
   pushf: autogen531 pushf: autogen532 pushf: autogen540 pushf: autogen541 pushf: autogen542 pushf: autogen544 pushf: autogen549 pushf: autogen550 pushf: autogen551 pushf: autogen552 pushf: autogen561 pushf: autogen562 pushf: autogen564 pushf: autogen565 pushf: autogen566 pushf: autogen567 pushf: autogen568 pushf: autogen569 pushi: 9 multi-if 
   check: output func_return ] rebind: simplify 
[ push: newfunc_called_with_unexpected_argument error ] bind: autogen570 
[ newfunc1 assign: i 
   pick: i pushi: 4 < not pushf: autogen570 if 
   pick: Done pick: i int_to_str push: newfunc str_cat func_return ] bind: newfunc_str 
[ newfunc1 assign: array 
   pick: array pick: FList_class change_class 
   check: array func_return ] rebind: to_flist 
[ newfunc1 assign: root 
  push: Dummy_function error return_no_value ] bind: last_call 
[ pick: root attr: value func_return ] bind: autogen571 
[ push: _ func_return ] bind: autogen572 
[ pick: root attr: name push: FCall string_equal pushf: autogen571 pushf: autogen572 if-else ] bind: autogen573 
[ pick: root attr: len 1 - pick: root attr_call: get last_call func_return ] bind: autogen574 
[ pick: root attr: value last_call func_return ] bind: autogen575 
[ newfunc1 assign: root 
   debugger2 
    pick: root pick: forthe_class is_instance pushf: autogen573 if 
    pick: root pick: FList_class is_instance pick: root pick: resizable_class is_instance || pushf: autogen574 if 
    pick: root pick: FQuote is_instance pushf: autogen575 if 
   push: _ func_return ] rebind: last_call 
[ newfunc1 assign: root 
  push: Dummy_function error return_no_value ] bind: to_forth 
[ newfunc2 assign: obj assign: new_class 
   pick: obj 2 - pick: new_class memory.set 
   pick: obj func_return ] bind: changed_class 
[ pick: elem to_forth ] bind: autogen576 
[ newfunc1 assign: root 
  pick: FList_class pushf: autogen576 pick: root list_comp changed_class func_return ] bind: to_forth_conv.suite 
[ pick: elem to_forth ] bind: autogen577 
[ newfunc1 assign: root 
  push: _ pushf: autogen577 pick: root list_comp pick: FList_class flatten FQuote func_return ] bind: to_forth_conv.quote 
[ pick: elem to_forth ] bind: autogen578 
[ newfunc1 assign: root 
   debugger2 
   pushf: autogen578 pick: root list_comp pick: FList_class flatten assign: children 
   push: Children:_ print 
   pick: children tprint 
   printeol 
   debugger2 
   pick: children attr_call: pop drop1 
   push: FComment pick: children forthe func_return ] bind: to_forth_conv.simple_quote 
[ newfunc1 assign: root 
  pick: FList_class pick: Done 0 pick: root attr_call: get to_forth push: FCall push: pick: forthe make_resizable changed_class func_return ] bind: to_forth_conv.variable 
[ newfunc1 assign: root 
  push: FStr 0 pick: root attr_call: get forthe func_return ] bind: to_forth_conv.NAME 
[ newfunc1 assign: root 
  pick: FList_class pick: Done 0 pick: root attr_call: get to_forth push: FCall push: check: forthe make_resizable changed_class func_return ] bind: to_forth_conv.name_quote 
[ newfunc1 assign: root 
  pick: FList_class pick: Done push: FStr 0 pick: root attr_call: get string_escape forthe push: FCall push: push: forthe make_resizable changed_class func_return ] bind: to_forth_conv.STRING 
[ push: FStr pick: child forthe assign: output ] bind: autogen579 
[ pick: FList_class pick: Done push: FStr pick: child forthe push: FCall push: pushi: forthe make_resizable changed_class assign: output ] bind: autogen580 
[ newfunc1 assign: root 
   0 pick: root attr: children attr_call: get assign: child 
   push: NUMBER_in:_ print 
   pick: root tprint 
   printeol 
   debugger2 
   pick: child push: 0 string_equal pick: child push: 1 string_equal || pick: child push: 2 string_equal || pushf: autogen579 pushf: autogen580 if-else 
   push: NUMBER_out:_ print 
   pick: output tprint 
   printeol 
   debugger2 
   pick: output func_return ] bind: to_forth_conv.NUMBER 
[ push: FCall 0 pick: elem attr_call: get forthe ] bind: autogen581 
[ newfunc1 assign: root 
  pick: FList_class pushf: autogen581 pick: root list_comp changed_class func_return ] bind: to_forth_conv.forth_line 
[ pick: FList_class pick: Done pick: output make_resizable changed_class assign: output 
  s21 drop1 assign: output ] bind: autogen582 
[ check: i 1 - assign: i 
  push: FCall push: assign: forthe pick: assignments attr_call: append 
  pick: i pick: names attr_call: get to_forth pick: assignments attr_call: append ] bind: autogen583 
[ newfunc1 assign: root 
   1 pick: root attr_call: get to_forth assign: output 
   pick: output pick: FList_class is_instance not pushf: autogen582 if 
   0 resizable assign: assignments 
   0 pick: root attr_call: get assign: names 
   pick: names attr: len assign: i 
   pushf: autogen583 repeat_if 
   pick: FList_class pick: assignments changed_class pick: output attr_call: append 
   pick: output func_return ] bind: to_forth_conv.assign 
[ pick: elem to_forth ] bind: autogen584 
[ 0 pick: output attr_call: get attr: value assign: names ] bind: autogen585 
[ debugger 
  1 1 - 2 0 pick: output attr_call: get attr_call: slice assign: names ] bind: autogen586 
[ 0 resizable assign: decl ] bind: autogen587 
[ pick: is_fast_fun pick: is_inline || ] bind: autogen588 
[ pick: Done push: FCall push: remove\utop\unames forthe push: FStr pick: names attr: len int_to_str forthe push: FCall push: pushi: forthe make_resizable assign: decl ] bind: autogen589 
[ pick: is_local_fun ] bind: autogen590 
[ pick: Done push: FCall pick: names attr: len newfunc_str forthe make_resizable assign: decl ] bind: autogen591 
[ pick: Done push: FCall push: newfunc forthe push: FStr pick: names attr: len int_to_str forthe push: FCall push: pushi: forthe make_resizable assign: decl ] bind: autogen592 
[ pick: names attr: len pushi: 4 < pushf: autogen591 pushf: autogen592 if-else ] bind: autogen593 
[ pick: is_fun ] bind: autogen594 
[ check: i 1 - assign: i 
  push: FCall push: assign: forthe pick: decl attr_call: append 
  pick: i pick: names attr_call: get pick: decl attr_call: append ] bind: autogen595 
[ pick: names attr: len assign: i 
  pushf: autogen595 repeat_if ] bind: autogen596 
[ push: FCall push: return\uno\uvalue forthe 1 pick: output attr_call: get attr: value attr_call: append ] bind: autogen597 
[ push: FCall push: return\uno\uvalue forthe 1 pick: output attr_call: get attr_call: append ] bind: autogen598 
[ 1 pick: output attr_call: get pick: FQuote_class is_instance pushf: autogen597 pushf: autogen598 if-else ] bind: autogen599 
[ 1 pick: output attr_call: get last_call assign: last 
  debugger2 
  pick: last push: return string_equal pick: last push: lookup\uerror string_equal || not pushf: autogen599 if 
  check: last drop1 ] bind: autogen600 
[ 0 pick: root attr_call: get attr: name push: simple\uquote string_equal pushf: autogen585 pushf: autogen586 if-else 
   pushf: autogen587 pushf: autogen588 pushf: autogen589 pushf: autogen590 pushf: autogen593 pushf: autogen594 pushi: 3 multi-if 
  pick: decl pick: FList_class change_class 
  pick: is_fast_fun not pushf: autogen596 if 
  pick: decl tprint 
  printeol 
  debugger2 
  0 pick: decl pick: output attr: value attr_call: set 
  1 pick: output attr_call: get attr: value pick: FList_class change_class 
  1 1 pick: output attr_call: get attr: value pick: output attr: value attr_call: set 
  pick: is_fun pushf: autogen600 if ] bind: autogen601 
[ newfunc1 assign: root 
   push: _ pushf: autogen584 pick: root list_comp FQuote assign: output 
   pick: root attr: name push: inline string_equal assign: is_inline 
   pick: root attr: name push: fun string_equal assign: is_fun 
   pick: root attr: name push: local\ufun string_equal assign: is_local_fun 
   pick: root attr: name push: fast\ufun string_equal assign: is_fast_fun 
   pick: True assign: cond 
   check: cond pushf: autogen601 if 
   pick: output func_return ] bind: to_forth_conv.fun 
[ check: output pick: Done s21 make_resizable assign: output 
  pick: output pick: FList_class change_class ] bind: autogen602 
[ newfunc1 assign: root 
   push: root: pick: root dprint 
   debugger2 
   1 pick: root attr_call: get to_forth assign: output 
   push: output: pick: output dprint 
   push: root_name: pick: root attr: name dprint 
   debugger2 
   pick: output pick: FList_class is_instance not pushf: autogen602 if 
   push: FCall push: bind: forthe pick: output attr_call: append 
   0 0 pick: root attr_call: get attr_call: get to_forth pick: output attr_call: append 
   pick: output func_return ] bind: to_forth_conv.bind 
[ push: FStr pick: elem forthe ] bind: autogen603 
[ newfunc1 assign: root 
   pushf: autogen603 pick: root list_comp pick: FList_class flatten assign: children 
   push: FComment pick: children forthe func_return ] bind: to_forth_conv.comment 
[ pick: Done 0 1 pick: root attr_call: get attr_call: get to_forth push: FCall push: attr: forthe 0 pick: root attr_call: get to_forth make_resizable assign: children ] bind: autogen604 
[ pick: elem to_forth ] bind: autogen605 
[ pushf: autogen605 1 pick: root attr_call: get list_comp assign: children 
  pick: Done push: FStr 1 pick: root attr_call: get attr: name forthe push: FCall push: attr\ucall: forthe 0 pick: root attr_call: get to_forth make_resizable assign: calls 
  check: calls pick: children extend ] bind: autogen606 
[ newfunc1 assign: root 
   1 pick: root attr_call: get attr: name push: variable string_equal pushf: autogen604 pushf: autogen606 if-else 
   pick: FList_class pick: children pick: FList_class flatten changed_class func_return ] bind: to_forth_conv.dot 
[ pick: elem to_forth ] bind: autogen607 
[ newfunc1 assign: root 
   pushf: autogen607 pick: root list_comp assign: output 
   pick: FList_class pick: output pick: FList_class flatten changed_class func_return ] bind: to_forth_conv.grammar 
[ pick: i 1 - pick: root attr_call: get assign: child 
  1 pick: child attr_call: get to_forth pick: output attr_call: append 
  push: quote 0 pick: child attr_call: get node to_forth pick: output attr_call: append 
  check: child drop1 
  check: i 1 - assign: i ] bind: autogen608 
[ newfunc1 assign: root 
   debugger2 
   0 resizable assign: output 
   pick: root attr: len assign: i 
   pushf: autogen608 repeat_if 
   debugger2 
   pick: output pick: FList_class flatten assign: output 
   debugger2 
   push: FCall push: pushi: forthe pick: output attr_call: append 
   push: FStr pick: root attr: len int_to_str forthe pick: output attr_call: append 
   push: FCall pick: root attr: name forthe pick: output attr_call: append 
   pick: output pick: FList_class change_class 
   debugger2 
   pick: output func_return ] bind: to_forth_conv.multi_if 
[ pick: elem to_forth ] bind: autogen609 
[ newfunc1 assign: root 
   pushf: autogen609 pick: root list_comp assign: output 
   check: output pick: FList_class flatten assign: output 
   push: FCall pick: root attr: name forthe pick: output attr_call: append 
   push: output: pick: output dprint 
   debugger2 
   pick: FList_class pick: output changed_class func_return ] bind: to_forth_conv.default 
 pushi: 200 hashtable bind: to_forth_conv_hash 
 push: suite pick: to_forth_conv.suite pick: to_forth_conv_hash attr_call: set 
 push: forth pick: to_forth_conv.suite pick: to_forth_conv_hash attr_call: set 
 push: quote pick: to_forth_conv.quote pick: to_forth_conv_hash attr_call: set 
 push: simple\uquote pick: to_forth_conv.simple_quote pick: to_forth_conv_hash attr_call: set 
 push: variable pick: to_forth_conv.variable pick: to_forth_conv_hash attr_call: set 
 push: NAME pick: to_forth_conv.NAME pick: to_forth_conv_hash attr_call: set 
 push: name\uquote pick: to_forth_conv.name_quote pick: to_forth_conv_hash attr_call: set 
 push: STRING pick: to_forth_conv.STRING pick: to_forth_conv_hash attr_call: set 
 push: NUMBER pick: to_forth_conv.NUMBER pick: to_forth_conv_hash attr_call: set 
 push: forth\uline pick: to_forth_conv.forth_line pick: to_forth_conv_hash attr_call: set 
 push: assign pick: to_forth_conv.assign pick: to_forth_conv_hash attr_call: set 
 push: fun pick: to_forth_conv.fun pick: to_forth_conv_hash attr_call: set 
 push: inline pick: to_forth_conv.fun pick: to_forth_conv_hash attr_call: set 
 push: local\ufun pick: to_forth_conv.fun pick: to_forth_conv_hash attr_call: set 
 push: fast\ufun pick: to_forth_conv.fun pick: to_forth_conv_hash attr_call: set 
 push: bind pick: to_forth_conv.bind pick: to_forth_conv_hash attr_call: set 
 push: comment pick: to_forth_conv.comment pick: to_forth_conv_hash attr_call: set 
 push: . pick: to_forth_conv.dot pick: to_forth_conv_hash attr_call: set 
 push: grammar pick: to_forth_conv.grammar pick: to_forth_conv_hash attr_call: set 
 push: exprsp pick: to_forth_conv.grammar pick: to_forth_conv_hash attr_call: set 
 push: multi\uif pick: to_forth_conv.multi_if pick: to_forth_conv_hash attr_call: set 
 push: default pick: to_forth_conv.default pick: to_forth_conv_hash attr_call: set 
[ push: root:_ pick: root dprint 
  push: type:_ pick: root attr: type dprint 
  debugger 
  push: Unexpected_non-node_root. error ] bind: autogen610 
[ check: converter drop1 
  push: default pick: to_forth_conv_hash attr_call: get assign: converter ] bind: autogen611 
[ newfunc1 assign: root 
   push: nest push: nest pick: parseg attr_call: get 1 + pick: parseg attr_call: set 
   push: nest pick: parseg attr_call: get 0 pick: printspace simple_for 
   pick: root attr: name print 
   push: _<- print 
   printeol 
   pick: root pick: node_class is_instance not pushf: autogen610 if 
   pick: root attr: name pick: to_forth_conv_hash attr_call: get assign: converter 
   pick: converter None == pushf: autogen611 if 
   pick: root pick: converter call assign: output 
   push: nest pick: parseg attr_call: get 0 pick: printspace simple_for 
   pick: root attr: name print 
   push: _->_ pick: output dprint 
   push: nest push: nest pick: parseg attr_call: get 1 - pick: parseg attr_call: set 
   check: output func_return ] rebind: to_forth 
 pushi: 11 hashtable bind: g 
 push: written pushi: 5000 hashtable pick: g attr_call: set 
[ push: file push: w pick: filename file.open pick: g attr_call: set ] bind: autogen612 
[ push: file None pick: g attr_call: set ] bind: autogen613 
[ newfunc1 assign: filename 
   push: written pick: g attr_call: get attr: keys array.clear 
   push: nesting 0 pick: g attr_call: set 
   push: last\uvalue push: _ pick: g attr_call: set 
   push: autogen\ucount 0 pick: g attr_call: set 
   push: autogen\uname push: autogen pick: g attr_call: set 
   pick: filename None == not pushf: autogen612 pushf: autogen613 if-else 
   push: init_g:_ pick: g dprint 
   debugger2 return_no_value ] bind: init_g 
[ 
  push: last\uvalue None pick: g attr_call: set ] bind: write_eol 
[ pick: value push: ] string_equal not pick: value push: return\uno\uvalue string_equal not && ] bind: autogen614 
[ printeol 
  push: nesting pick: g attr_call: get 1 pick: printspace simple_for ] bind: autogen615 
[ newfunc1 assign: value 
   push: file pick: g attr_call: get set_output 
   pushf: autogen614 push: last\uvalue pick: g attr_call: get None == lazy_and pushf: autogen615 if 
   printspace 
   pick: value printraw 
   push: last\uvalue pick: value pick: g attr_call: set 
   None set_output return_no_value ] bind: write_sep 
[ newfunc2 assign: depth assign: root 
  push: Dummy_function error return_no_value ] bind: write_string_body 
[ push: ws_root:_ pick: root dprint 
  push: ws_depth:_ pick: depth dprint 
  push: ws_is_str:_ pick: root is_str dprint 
  push: ws_type:_ pick: root attr: type dprint 
  debugger ] bind: autogen616 
[ pick: True ] bind: autogen617 
[ 
  check: elem pick: depth write_string_body ] bind: autogen618 
[ push: nesting push: nesting pick: g attr_call: get 1 + pick: g attr_call: set 
  debugger2 
  pick: root pushf: autogen618 for_in 
  debugger2 
  push: nesting push: nesting pick: g attr_call: get 1 - pick: g attr_call: set 
  write_eol ] bind: autogen619 
[ pick: root pick: FList_class is_instance ] bind: autogen620 
[ push: pushf: write_sep 
  pick: root attr: name write_sep ] bind: autogen621 
[ pick: root pick: FQuote_class is_instance ] bind: autogen622 
[ pick: root attr: value write_sep ] bind: autogen623 
[ pick: root attr: name push: FStr string_equal ] bind: autogen624 
[ pick: Done pick: root attr: value push: func\u str_cat write_sep ] bind: autogen625 
[ pick: root attr: value write_sep ] bind: autogen626 
[ pick: root attr: value push: return string_equal pick: root attr: value push: return\utwo string_equal || pushf: autogen625 pushf: autogen626 if-else ] bind: autogen627 
[ pick: root attr: name push: FCall string_equal ] bind: autogen628 
[ printspace ] bind: autogen629 
[ pick: root attr: name push: FComment string_equal ] bind: autogen630 
[ pushf: autogen623 pushf: autogen624 pushf: autogen627 pushf: autogen628 pushf: autogen629 pushf: autogen630 pushi: 3 multi-if ] bind: autogen631 
[ pick: root pick: forthe_class is_instance ] bind: autogen632 
[ newfunc2 assign: depth assign: root 
   debugger2 
   pushf: autogen616 pushf: autogen617 pushf: autogen619 pushf: autogen620 pushf: autogen621 pushf: autogen622 pushf: autogen631 pushf: autogen632 pushi: 4 multi-if return_no_value ] rebind: write_string_body 
[ newfunc2 assign: depth assign: root 
  push: Dummy_function error return_no_value ] bind: write_blocks 
[ push: root:_ pick: root dprint 
  push: root_is_quote:_ pick: root pick: FQuote_class is_instance dprint 
  push: root_is_list:_ pick: root pick: FList_class is_instance dprint 
  push: g:_ pick: g dprint ] bind: autogen633 
[ check: elem pick: depth 1 + write_blocks ] bind: autogen634 
[ check: elem pick: depth write_blocks ] bind: autogen635 
[ 
  pick: elem pick: FQuote_class is_instance pushf: autogen634 pushf: autogen635 if-else ] bind: autogen636 
[ push: nesting push: nesting pick: g attr_call: get 1 + pick: g attr_call: set 
  pick: root pushf: autogen636 for_in 
  push: nesting push: nesting pick: g attr_call: get 1 - pick: g attr_call: set 
  write_eol ] bind: autogen637 
[ pick: Done push: autogen\ucount pick: g attr_call: get int_to_str push: autogen\uname pick: g attr_call: get str_cat assign: name 
  check: name pick: root attr_call: set_name 
  push: autogen\ucount push: autogen\ucount pick: g attr_call: get 1 + pick: g attr_call: set ] bind: autogen638 
[ 
  check: elem pick: depth write_string_body ] bind: autogen639 
[ push: bind: write_sep 
  pick: root attr: name pick: True push: written pick: g attr_call: get attr_call: set ] bind: autogen640 
[ push: rebind: write_sep ] bind: autogen641 
[ push: nesting pick: g attr_call: get assign: nesting 
  debugger2 
  pick: root attr: name push: _ string_equal pushf: autogen638 if 
  push: nesting 0 pick: g attr_call: set 
  push: [ write_sep 
  push: nesting 1 pick: g attr_call: set 
  pick: root pushf: autogen639 for_in 
  push: ] write_sep 
  pick: root attr: name push: written pick: g attr_call: get attr_call: get None == pushf: autogen640 pushf: autogen641 if-else 
  pick: root attr: name write_sep 
  write_eol 
  push: nesting pick: nesting pick: g attr_call: set ] bind: autogen642 
[ newfunc2 assign: depth assign: root 
   pick: False pushf: autogen633 if 
   pick: root pick: FQuote_class is_instance pick: root pick: FList_class is_instance || pushf: autogen637 if 
   pick: root pick: FQuote_class is_instance pushf: autogen642 if return_no_value ] rebind: write_blocks 
[ push: is_bind:_ pick: child attr: len 2 - pick: child attr_call: get attr: value dprint ] bind: autogen643 
[ pick: child attr: len pushi: 4 - pick: child attr_call: get attr: value push: class string_equal ] bind: autogen644 
[ push: is_class:_ pick: child attr: len pushi: 4 - pick: child attr_call: get attr: value dprint 
  push: is_str:_ pick: child attr: len pushi: 4 - pick: child attr_call: get attr: value is_str dprint 
  push: str_eq:_ pick: child attr: len pushi: 4 - pick: child attr_call: get attr: value push: class string_equal dprint 
  push: lazy_cond:_ pushf: autogen644 pick: child attr: len pushi: 4 > lazy_and dprint ] bind: autogen645 
[ printeol 
  push: child:_ pick: child dprint 
  push: child.len:_ pick: child attr: len dprint 
   pick: child attr: len 2 > pushf: autogen643 if 
   pick: child attr: len pushi: 5 > pushf: autogen645 if ] bind: autogen646 
[ 
   pick: child pick: FList_class is_instance pushf: autogen646 if 
   debugger2 ] bind: print_child 
[ debugger2 ] bind: autogen647 
[ pick: s pick: s str_len pushi: 6 - pick: s str_len sub_str push: \ucolon string_equal ] bind: autogen648 
[ pick: Done push: : pick: s 0 pick: s str_len pushi: 6 - sub_str str_cat func_return ] bind: autogen649 
[ newfunc1 assign: s 
    pick: s str_len pushi: 6 > pushf: autogen647 if 
    pushf: autogen648 pick: s str_len pushi: 6 > lazy_and pushf: autogen649 if 
   pick: s func_return ] bind: replace_name 
[ newfunc2 assign: prefix assign: root 
  push: Dummy_function error return_no_value ] bind: write_suite 
[ push: nesting 0 pick: g attr_call: set 
  pick: child 0 write_string_body 
  write_eol ] bind: autogen650 
[ pick: child pick: FList_class is_instance ] bind: autogen651 
[ 1 drop1 ] bind: autogen652 
[ pick: child attr: name push: FComment string_equal not ] bind: autogen653 
[ pushf: autogen653 pick: child pick: forthe_class is_instance lazy_and ] bind: autogen654 
[ pick: body attr: name push: FStr string_equal pick: body attr: name push: FCall string_equal || ] bind: autogen655 
[ pick: child 0 write_string_body 
  write_eol ] bind: autogen656 
[ push: Unexpected_bind_body_length error ] bind: autogen657 
[ pick: child attr: len 1 - pick: child attr_call: get attr: value assign: func_name ] bind: autogen658 
[ pick: Done pick: child attr: len 1 - pick: child attr_call: get attr: value push: . pick: prefix str_cat assign: func_name ] bind: autogen659 
[ pick: child attr: len pushi: 4 == pushf: autogen657 if 
   pick: prefix None == pushf: autogen658 pushf: autogen659 if-else 
  check: func_name replace_name assign: func_name 
  pick: func_name pick: body attr_call: set_name 
  push: nesting 0 pick: g attr_call: set 
  pick: body 1 write_blocks ] bind: autogen660 
[ debugger2 
  0 pick: child attr_call: get assign: body 
  pushf: autogen655 pick: body pick: forthe_class is_instance lazy_and pushf: autogen656 pushf: autogen660 if-else ] bind: autogen661 
[ pick: child attr: len 2 - pick: child attr_call: get attr: value push: bind: string_equal pick: child attr: len pushi: 3 - pick: child attr_call: get pick: FQuote_class is_instance && ] bind: autogen662 
[ pushf: autogen662 pick: child attr: len 2 > lazy_and ] bind: autogen663 
[ pushf: autogen663 pick: child pick: FList_class is_instance lazy_and ] bind: autogen664 
[ debugger2 
  pick: child attr: len pushi: 4 - pick: child attr_call: get attr: value pick: child attr: len 1 - pick: child attr_call: get attr: value write_suite ] bind: autogen665 
[ pick: child attr: len pushi: 3 - pick: child attr_call: get attr: value push: class string_equal ] bind: autogen666 
[ pushf: autogen666 pick: child attr: len pushi: 3 > lazy_and ] bind: autogen667 
[ pushf: autogen667 pick: child pick: FList_class is_instance lazy_and ] bind: autogen668 
[ newfunc2 assign: prefix assign: child 
   pushf: autogen650 pushf: autogen651 pushf: autogen652 pushf: autogen654 pushf: autogen661 pushf: autogen664 pushf: autogen665 pushf: autogen668 pushi: 4 multi-if 
   debugger2 return_no_value ] bind: write_child 
[ 
  check: elem pick: prefix write_child ] bind: autogen669 
[ newfunc2 assign: prefix assign: root 
  pick: root pushf: autogen669 for_in return_no_value ] rebind: write_suite 
[ push: - print ] bind: autogen670 
[ newfunc2 assign: filename assign: sep 
   pushi: 50 0 pushf: autogen670 simple_for 
   pick: sep print 
   pick: filename print 
   printeol return_no_value ] bind: print_separator 
[ push: Parse_error_at_simplification_step. error ] bind: autogen671 
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
   pick: simplified pick: MatchError_class is_instance pushf: autogen671 if 
   push: nest 0 pick: parseg attr_call: set 
   pick: simplified to_forth assign: forthed 
   push: ToForth:_ print 
   pick: forthed attr_call: print 
   printeol 
   printeol 
   pick: forthed None write_suite 
   printeol return_no_value ] bind: compile_file 
[ 
   push: \u printraw 
   check: elem printraw ] bind: autogen672 
[ check: elem compile_file ] bind: autogen673 
[ newfunc2 assign: output assign: filenames 
   pick: output init_g 
   push: file pick: g attr_call: get set_output 
   push: push:_ print 
   push: Generated\ufrom printraw 
   pick: filenames pushf: autogen672 for_in 
   push: \uprint print 
   printeol 
   None set_output 
   pick: filenames pushf: autogen673 for_in return_no_value ] bind: compile_all 
[ 
   pushf: push: memory.append memory.append 
  memory.append pushf: ] memory.append 
   memory.len pushi: 4 - Pointer 
   pick1 push: closure set_mem_hint ] rebind: closure 
[ 
  pick: l pick: index - 1 - pick: iterable attr_call: get tprint ] bind: autogen674 
[ newfunc1 assign: iterable 
   pick: iterable attr: len assign: l 
   pick: l 0 pushf: autogen674 simple_for return_no_value ] bind: print_array 
[ newfunc3 assign: searcher assign: receiver assign: name 
  push: Dummy error return_no_value ] bind: ns_obj.attrib 
[ newfunc2 assign: parent assign: child_hash 
   pick: parent memory.append 
   pick: ns_obj.attrib memory.append 
   pick: child_hash memory.append 
   push: ] names.get memory.append 
   memory.len 2 - Pointer assign: pointer 
   pick: pointer pick: Done push: _instance pick: parent attr: type str_cat set_mem_hint 
   pick: pointer func_return ] bind: ns_obj.child 
[ newfunc3 assign: self assign: value assign: key 
  pick: key pick: value pick: self attr: attr attr_call: set func_return ] bind: ns_obj.set_attr 
[ newfunc1 assign: self 
  push: ns\uobj_instance_or_subclass print return_no_value ] bind: ns_obj.print 
[ newfunc2 assign: self assign: name 
  pick: name pick: self attr: attr attr_call: get func_return ] bind: ns_obj.getattrib 
[ pick: ns_obj.child func_return ] bind: autogen675 
[ pick: name push: child string_equal pushf: autogen675 if 
  pick: name pick: receiver pick: searcher instance_attrib func_return ] bind: autogen676 
[ newfunc3 assign: searcher assign: receiver assign: name 
   pick: name push: attr string_equal pick: receiver memory.get return_if 
   pick: name pick: searcher attr: attr attr_call: get assign: value 
   pick: value None == pushf: autogen676 if 
   check: value func_return ] rebind: ns_obj.attrib 
[ newfunc1 assign: func 
   input.next_token assign: name 
   pick: name pick: func pick: current_ns attr_call: set 
   pick: func pick: Done pick: name push: ns. str_cat set_mem_hint return_no_value ] bind: ns_bind: 
 pushi: 100 hashtable bind: current_ns 
 pick: current_ns pick: boot_obj ns_obj.child bind: ns_obj_class 
 pick: ns_obj.child pick: ns_obj_class closure bind: ns_obj 
 push: attrib pick: ns_obj.attrib pick: current_ns attr_call: set 
 push: child pick: ns_obj.child pick: current_ns attr_call: set 
 push: set\uattr pick: ns_obj.set_attr pick: current_ns attr_call: set 
 push: print pick: ns_obj.print pick: current_ns attr_call: set 
 push: type push: ns\uobj pick: current_ns attr_call: set 
[ newfunc1 assign: name 
   push: type pick: name pick: current_ns hashtable.set 
   pick: Done push: \uclass pick: name str_cat assign: class_name 
   pick: class_name pick: current_ns pick: ns_obj_class ns_obj.child names2 hashtable.set 
   pick: class_name names.get assign: new_class 
   pick: new_class attr: child pick: new_class closure assign: instance_creator 
   pick: name pick: instance_creator names2 hashtable.set 
   pick: current_ns pick: Done push: .attr pick: class_name str_cat set_mem_hint 
   pick: instance_creator pick: Done push: _instance_creator pick: class_name str_cat set_mem_hint return_no_value ] bind: new_ns_class 
pushi: 100 hashtable bind: current_ns 
[ newfunc2 assign: parent assign: str 
   pushi: 100 hashtable pick: parent pick: parent attr: parent attr: child call assign: new_obj 
   push: str pick: str pick: new_obj attr: attr attr_call: set 
   pick: new_obj func_return ] ns_bind: child 
[ newfunc1 assign: self 
  pick: self attr: str str_len func_return ] ns_bind: len 
[ newfunc3 assign: self assign: end assign: start 
  pick: self attr: str pick: start pick: end sub_str pick: self attr: parent attr_call: child func_return ] ns_bind: slice 
[ newfunc2 assign: self assign: index 
  pick: index pick: index 1 + pick: self attr_call: slice func_return ] ns_bind: get 
[ check: i func_return ] bind: autogen677 
[ check: i 1 - assign: i 
  pick: i pick: self attr_call: get attr: str pick: c string_equal pushf: autogen677 if ] bind: autogen678 
[ newfunc2 assign: self assign: c 
   pick: self attr_call: len assign: i 
   pushf: autogen678 repeat_if 
   None func_return ] ns_bind: index 
[ pick: index func_return ] bind: autogen679 
[ 
  pick: index pick: self attr_call: get attr: str pick: c string_equal pushf: autogen679 if ] bind: autogen680 
[ newfunc2 assign: self assign: c 
   pick: self attr_call: len 0 pushf: autogen680 simple_for 
   None func_return ] ns_bind: index2 
[ newfunc2 assign: self assign: suffix 
  pick: suffix pick: self attr: str str_endswith func_return ] ns_bind: endswith 
[ newfunc2 assign: class assign: arr 
  pick: arr pick: arr attr: length str_join pick: class attr_call: child func_return ] ns_bind: join 
[ newfunc1 assign: self 
   push: s\q print 
   pick: self attr: str print 
   push: \q print return_no_value ] ns_bind: print 
push: String new_ns_class 
pushi: 100 hashtable bind: current_ns 
[ newfunc2 assign: parent assign: filename 
   push: r pick: filename file.open assign: fd 
   pushi: 100 hashtable pick: parent pick: parent attr: parent attr: child call assign: new_obj 
   push: fd pick: fd pick: new_obj attr: attr attr_call: set 
   pick: new_obj func_return ] ns_bind: child 
[ newfunc2 assign: class assign: filename 
  push: r pick: filename file.open pick: class attr_call: child func_return ] ns_bind: open 
[ newfunc2 assign: self assign: value 
  pick: value pick: self attr: fd fd_write func_return ] ns_bind: write 
[ newfunc1 assign: self 
  pick: self attr: fd fd_position func_return ] ns_bind: position 
[ newfunc2 assign: self assign: value 
  pick: self attr: fd fd_position_set func_return ] ns_bind: position_set 
[ newfunc2 assign: self assign: value 
  pick: self attr: fd fd_startswith func_return ] ns_bind: startswith 
[ newfunc1 assign: self 
  pick: self attr: fd fd_next_token func_return ] ns_bind: next_token 
[ newfunc1 assign: self 
  pick: self attr: fd fd_next_char func_return ] ns_bind: next_char 
[ newfunc1 assign: self 
  pick: self attr: fd fd_next_line func_return ] ns_bind: next_line 
[ newfunc1 assign: self 
  pick: self attr: fd file.close func_return ] ns_bind: close 
push: File new_ns_class 
pushi: 100 hashtable bind: current_ns 
[ newfunc2 assign: parent assign: str 
   pushi: 100 hashtable pick: parent pick: parent attr: parent attr: child call assign: new_obj 
   push: str pick: str pick: new_obj attr: attr attr_call: set 
   push: pos 0 pick: new_obj attr: attr attr_call: set 
   pick: new_obj func_return ] ns_bind: child 
[ newfunc1 assign: self 
   pick: self attr: pos pick: self attr: str str_next_token assign: token assign: new_pos 
   push: pos pick: new_pos pick: self attr: attr attr_call: set 
   pick: token String func_return ] ns_bind: next_token 
[ newfunc1 assign: self 
  push: pos 0 pick: self attr: attr attr_call: set return_no_value ] ns_bind: reset 
[ pick: new_resizable func_return ] bind: autogen681 
[ pick: self attr_call: next_token assign: token 
  pick: token attr_call: len 0 == pushf: autogen681 if 
  check: token pick: new_resizable attr_call: append ] bind: autogen682 
[ newfunc1 assign: self 
   pick: self attr_call: reset 
   0 resizable assign: new_resizable 
   pushf: autogen682 repeat return_no_value ] ns_bind: to_res 
push: StringIO new_ns_class 
[ newfunc0 
   push: hello_world String assign: s 
   pick: s tprint 
   printeol 
   1 pushi: 3 pick: s attr_call: slice tprint 
   printeol 
   1 pick: s attr_call: get tprint return_no_value ] bind: string_test 
[ check: handler drop1 
  debugger ] bind: autogen683 
[ pick: error pick: handler call assign: result ] bind: autogen684 
[ check: cond drop1 
  pick: error_handler_index push: exception\uhandler all_data_stack_pick assign: handler 
  pick: handler None == pushf: autogen683 pushf: autogen684 if-else 
  pick: result None == assign: cond 
  push: 412 shuffle assign: error_handler_index assign: cond assign: result 
  check: error_handler_index 1 + assign: error_handler_index 
  s21 assign: cond assign: error_handler_index ] bind: autogen685 
[ newfunc1 assign: error 
   0 assign: error_handler_index 
   pick: True assign: cond 
   pushf: autogen685 repeat_if 
   pick: result func_return ] bind: top_level_exception_handler 
 pick: top_level_exception_handler error_handler_set 
[ 
   pick: Done local_call_stack make_resizable func_return_two ] bind: yield 
[ pushi: 1 remove_top_names assign: call_stack_copy 
  pick: call_stack_copy attr: array 1 + pick: call_stack_copy attr: len 1 load_call_stack ] bind: next 
[ newfunc2 assign: temp_filename assign: filename 
   pick: temp_filename init_g 
   push: autogen\uname push: tempgen pick: g attr_call: set 
   pick: filename compile_file 
   push: file pick: g attr_call: get file.close return_no_value ] bind: compile_temp 
[ 
   current_input_file 
   switch_input_file 
   continue_from_file ] bind: run_file 
[ newfunc2 assign: temp_filename assign: filename 
   pick: filename pick: temp_filename compile_temp 
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
[ func_return ] bind: autogen686 
[ push: >>_ print 
  stdin.next_line assign: source 
  pick: source None == pick: source push: q string_equal || pushf: autogen686 if 
  check: source push: gen/eval.flpc write_file 
  push: gen/eval.flpc run ] bind: autogen687 
[ newfunc0 
  pushf: autogen687 repeat return_no_value ] bind: eval_repl 
 push: debug\useparator bind: debug_separator 
[ check: cond drop1 
  tprint 
  printeol 
  pick1 pick: debug_separator == not assign: cond ] bind: autogen688 
[ 
   pick1 pick: debug_separator == not assign: cond 
   pushf: autogen688 repeat_if 
   drop1 ] bind: print_until_sep 
 pushi: 20 hashtable bind: debug_g 
[ pick: func print ] bind: autogen689 
[ pick: func get_mem_hint StringIO attr_call: next_token attr: str assign: class_name 
  pick: class_name print 
  push: _with_keys\n print 
  pick: class_name names2 attr_call: get attr: attr tprint 
  printeol 
  push: Type_help( print 
  pick: class_name print 
  push: _._method)_to_get_help_on_specific_methods_of_this_class. print ] bind: autogen690 
[ pick: True pushi: 3 pick: func print_frame ] bind: autogen691 
[ push: instance_creator pick: func get_mem_hint str_endswith pushf: autogen690 pushf: autogen691 if-else ] bind: autogen692 
[ newfunc1 assign: func 
   pick: func is_basic pushf: autogen689 pushf: autogen692 if-else 
   printeol return_no_value ] bind: help 
[ newfunc0 
  pick: False push: context pick: debug_g attr_call: get call_stack.len push: height pick: debug_g attr_call: get - print_frame return_no_value ] bind: look 
[ 
   current_input_file 
   pick: debug_separator 
   s21 
   switch_input_file 
   push: ----- print 
   printeol 
   print_until_sep 
   continue_from_file ] bind: run_and_print 
[ func_return ] bind: autogen693 
[ check: source push: gen/eval.flpc write_file 
  push: gen/eval.flpc push: gen/temp.f compile_temp 
  push: gen/temp.f run_and_print ] bind: autogen694 
[ pick: True ] bind: autogen695 
[ drop1 ] bind: autogen696 
[ pick: source str_len 0 == ] bind: autogen697 
[ pick: debug_separator 
  push: gen/eval.flpc push: gen/temp.f compile_temp 
  push: gen/temp.f run_and_print 
  push: multiline push: multiline pick: debug_g attr_call: get not pick: debug_g attr_call: set ] bind: autogen698 
[ pick: source push: gen/eval.flpc append_file ] bind: autogen699 
[ pick: source push: r string_equal pushf: autogen698 pushf: autogen699 if-else ] bind: autogen700 
[ push: multiline pick: debug_g attr_call: get ] bind: autogen701 
[ push: gen/temprun.f run_and_print ] bind: autogen702 
[ pick: source push: f string_equal ] bind: autogen703 
[ push: multiline push: multiline pick: debug_g attr_call: get not pick: debug_g attr_call: set 
  push: #Empty push: gen/eval.flpc write_file ] bind: autogen704 
[ pick: source push: m string_equal ] bind: autogen705 
[ drop1 
  push: context push: context pick: debug_g attr_call: get 1 - pick: debug_g attr_call: set 
  look ] bind: autogen706 
[ pick: source push: L string_equal ] bind: autogen707 
[ drop1 
  push: context push: context pick: debug_g attr_call: get 1 + pick: debug_g attr_call: set 
  look ] bind: autogen708 
[ pick: source push: l string_equal ] bind: autogen709 
[ drop1 
  push: height push: height pick: debug_g attr_call: get 1 - pick: debug_g attr_call: set 
  look ] bind: autogen710 
[ pick: source push: d string_equal ] bind: autogen711 
[ drop1 
  push: height push: height pick: debug_g attr_call: get 1 + pick: debug_g attr_call: set 
  look ] bind: autogen712 
[ pick: source push: u string_equal ] bind: autogen713 
[ push: >>_ print 
  stdin.next_line assign: source 
   pick: source None == pick: source push: q string_equal || pushf: autogen693 if 
   pushf: autogen694 pushf: autogen695 pushf: autogen696 pushf: autogen697 pushf: autogen700 pushf: autogen701 pushf: autogen702 pushf: autogen703 pushf: autogen704 pushf: autogen705 pushf: autogen706 pushf: autogen707 pushf: autogen708 pushf: autogen709 pushf: autogen710 pushf: autogen711 pushf: autogen712 pushf: autogen713 pushi: 9 multi-if ] bind: autogen714 
[ 
   push: height pushi: 8 pick: debug_g attr_call: set 
   push: context 2 pick: debug_g attr_call: set 
   push: multiline pick: False pick: debug_g attr_call: set 
   pushf: autogen714 repeat ] bind: debuggerv2 
 pick: debuggerv2 error_handler_set 
[ newfunc1 assign: filename 
   0 push: flpcg pick: bootg attr_call: set 
   pick: bootg pick: filename push: gen/grammar\utemp.flpc write_parsed_funcs 
   push: gen/grammar\utemp.flpc run return_no_value ] bind: grammar_eval_file 
[ newfunc2 assign: output_prefix assign: filename 
   0 push: flpcg pick: bootg attr_call: set 
   pick: bootg pick: filename pick: Done push: .flpc pick: output_prefix str_cat write_parsed_funcs 
   pick: Done push: .flpc pick: output_prefix str_cat pick: Done push: .f pick: output_prefix str_cat run_temp return_no_value ] bind: grammar_eval_file_with_out 
[ newfunc0 
   push: autogen\uname push: getter\ugen pick: g attr_call: set 
   push: grammar/getter.grammar push: gen/getter\usyntax grammar_eval_file_with_out return_no_value ] bind: add_getter_syntax 
[ newfunc2 assign: index assign: obj 
  pick: index pick: obj attr_call: get func_return ] bind: get 
 push: ! pick: get names2 attr_call: set 
[ newfunc1 assign: root 
  pick: FList_class pick: Done push: FCall push: ''' forthe push: FStr 0 pick: root attr_call: get forthe push: FCall push: ''' forthe make_resizable changed_class func_return ] bind: to_forth_conv.TRIPLE_QUOTE 
[ newfunc0 
   push: autogen\uname push: triple\uquote\ugen pick: g attr_call: set 
   push: grammar/triple\uquote.grammar push: gen/triple\uquote grammar_eval_file_with_out 
   push: TRIPLE\uQUOTE pick: to_forth_conv.TRIPLE_QUOTE pick: to_forth_conv_hash attr_call: set return_no_value ] bind: add_triple_quote 
[ pick: elem to_forth ] bind: autogen715 
[ newfunc1 assign: root 
   pick: Done push: FStr push: Done forthe push: FCall push: pick: forthe make_resizable assign: output 
   pushf: autogen715 pick: root list_comp pick: output extend 
   check: output pick: FList_class flatten assign: output 
   push: FCall pick: root attr: name forthe pick: output attr_call: append 
   pick: FList_class pick: output changed_class func_return ] bind: to_forth_conv.make_resizable 
[ newfunc0 
   push: autogen\uname push: resizable\usyntax\ugen pick: g attr_call: set 
   push: grammar/resizable.grammar push: gen/resizable\usyntax grammar_eval_file_with_out 
   push: make\uresizable pick: to_forth_conv.make_resizable pick: to_forth_conv_hash attr_call: set return_no_value ] bind: add_resizable_syntax 
[ newfunc0 
   push: autogen\uname push: list\ucomp\usyntax\ugen pick: g attr_call: set 
   push: grammar/list\ucomp.grammar push: gen/list\ucomp\usyntax grammar_eval_file_with_out 
   push: list\ucomp\uvar pick: to_forth_conv.list_comp_var pick: to_forth_conv_hash attr_call: set return_no_value ] bind: add_list_comp_syntax 
[ newfunc1 assign: root 
   pick: Done 2 pick: root attr_call: get to_forth push: FStr 0 1 pick: root attr_call: get attr_call: get forthe push: FCall push: push: forthe push: _ 0 pick: root attr_call: get to_forth FQuote make_resizable assign: output 
   check: output pick: FList_class flatten assign: output 
   push: FCall pick: root attr: name forthe pick: output attr_call: append 
   pick: FList_class pick: output changed_class func_return ] bind: to_forth_conv.list_comp_var 
[ push: debugger\uv2 print 
  printeol 
  debuggerv2 
  push: dv2loop\ufile names2 attr_call: get run ] bind: autogen716 
[ newfunc0 
  pushf: autogen716 repeat return_no_value ] bind: dv2loop 
 push: gen/triple\uquote.f run_file 
 push: TRIPLE\uQUOTE pick: to_forth_conv.TRIPLE_QUOTE pick: to_forth_conv_hash attr_call: set 
 push: gen/resizable\usyntax.f run_file 
 push: make\uresizable pick: to_forth_conv.make_resizable pick: to_forth_conv_hash attr_call: set 
 push: gen/list\ucomp\usyntax.f run_file 
 push: list\ucomp\uvar pick: to_forth_conv.list_comp_var pick: to_forth_conv_hash attr_call: set 
 push: gen/getter\usyntax.f run_file 
 push: lib/stage7b.flpc bind: dv2loop_file 
 dv2loop 