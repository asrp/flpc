push: Generated_from_lib/stage0.flpc_lib/stage1a.flpc_lib/stage1b.flpc_lib/stage1b2.flpc_lib/stage1b3.flpc_lib/stage1c.flpc_lib/stage1d.flpc_lib/stage3a.flpc_lib/stage3b.flpc_lib/flpc_grammar.flpc_lib/stage6a.flpc_lib/stage6b.flpc_test/self.flpc print
[ input.next_token functions.add ] input.next_token bind: functions.add 
[ newfunc1 assign: func 
   input.next_token names.get assign: location 
   pick: location 1 + push: ] names.get memory.set 
   s21 memory.set return_no_value ] bind: rebind: 
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
   memory.len 1 - Pointer return1 ] bind: subclass 
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
   check: parent_copy 1 - memory.get call return1 ] bind: instance_attrib 
[ newfunc1 assign: self 
   push: Boot_object_at_ return1 ] bind: minobj.str 
[ newfunc1 assign: parent 
  pick: instance_attrib pick: parent subclass return1 ] bind: minobj.instance 
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
   pick: name pick: receiver pick: searcher instance_attrib return1 ] rebind: minobj.attrib 
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
   pick: new_obj return1 ] bind: boot_array.instance 
[ push: Index_out_of_range error ] bind: autogen20 
[ push: Index_out_of_range error ] bind: autogen21 
[ newfunc2 assign: self assign: key 
   pick: key 0 < pushf: autogen20 if 
   pick: key pick: self memory.get < not pushf: autogen21 if return_no_value ] bind: boot_array.in_range 
[ newfunc2 assign: self assign: key 
   pick: key pick: self boot_array.in_range 
   pick: self pick: key + 1 + memory.get return1 ] bind: boot_array.get 
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
[ check: i return3 ] bind: autogen23 
[ check: i 1 - assign: i 
  pick: value pick: i pick: self boot_array.get string_equal pushf: autogen23 if ] bind: autogen24 
[ newfunc2 assign: self assign: value 
   pick: self memory.get assign: i 
   pushf: autogen24 repeat_if 
   None return1 ] bind: boot_array.string_index 
[ check: i return3 ] bind: autogen25 
[ None return3 ] bind: autogen26 
[ drop1 
  pick: self memory.get assign: i ] bind: autogen27 
[ pick: key pick: i pick: self boot_array.get string_equal pushf: autogen25 if 
   pick: i pick: self boot_array.get 0 == pushf: autogen26 if 
  check: i 1 - assign: i 
  pick: i 0 == pushf: autogen27 if ] bind: autogen28 
[ newfunc3 assign: self assign: i assign: key 
   s21 assign: i assign: self 
   pushf: autogen28 repeat return_no_value ] bind: boot_array.hash_index 
[ check: i return3 ] bind: autogen29 
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
   pick: name pick: receiver pick: searcher instance_attrib return1 ] bind: boot_array.attrib 
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
   pick: new_obj return1 ] bind: boot_dict.instance 
[ newfunc2 assign: self assign: key 
   pick: key pick: self 1 + memory.get boot_array.string_index assign: index 
   pick: index None == None return_if 
   pick: index pick: self 2 + memory.get boot_array.get return1 ] bind: boot_dict.get 
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
   pick: name pick: receiver pick: searcher instance_attrib return1 ] bind: boot_dict.attrib 
 pick: boot_dict.attrib pick: boot_obj attr_call: subclass bind: boot_dict_class 
 pick: boot_dict_class attr: instance pick: boot_dict_class closure bind: boot_dict 
[ pick: False return2 ] bind: autogen36 
[ newfunc2 assign: class assign: other 
   pick: other is_basic pushf: autogen36 if 
   check: class pick: other 2 - memory.get == return1 ] bind: is_instance 
 memory.len Pointer bind: obj_boundary 
[ pick: False return3 ] bind: autogen37 
[ drop1 
  pick: n pick: i mod 0 == pushf: autogen37 if 
  check: i 1 + assign: i 
  pick: i pick: n < assign: cond ] bind: autogen38 
[ newfunc1 assign: n 
   2 assign: i 
   pick: i pick: n < assign: cond 
   pushf: autogen38 repeat_if 
   pick: True return1 ] bind: is_prime 
[ check: n return3 ] bind: autogen39 
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
   pick: new_obj return1 ] bind: hashtable.instance 
[ newfunc2 assign: self assign: key 
   pick: key hash pick: self memory.get mod assign: start 
   pick: key pick: start pick: self 1 + memory.get boot_array.hash_index assign: index 
   pick: index None == None return_if 
   pick: index pick: self 2 + memory.get boot_array.get return1 ] bind: hashtable.get 
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
   pick: count return1 ] bind: hashtable.num_elems 
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
   pick: name pick: receiver pick: searcher instance_attrib return1 ] bind: hashtable.attrib 
 pick: hashtable.attrib pick: boot_obj attr_call: subclass bind: hashtable_class 
 pick: hashtable_class attr: instance pick: hashtable_class closure bind: hashtable 
 pushi: 2131 hashtable bind: names 
  [ pushf: names ] bind: names2 
 pushi: 200000 hashtable bind: mem_value 
[ newfunc2 assign: hint assign: index 
   pick: index int_to_str pick: hint pick: mem_value hashtable.set 
   pick: hint pick: index memory_hint.set return_no_value ] bind: set_mem_hint 
[ newfunc1 assign: index 
  pick: index int_to_str pick: mem_value hashtable.get return1 ] bind: get_mem_hint 
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
   pick: value return1 ] bind: names.get 
[ newfunc1 assign: value 
   input.next_token assign: name 
   pick: name pick: value names2 hashtable.set 
   pick: value pick: name set_mem_hint return_no_value ] bind: new.bind 
 convert_names 
 push: bind: push: new.bind names2 hashtable.get names2 hashtable.set 
  push: bind: names2 hashtable.get rebind: bind: 
  push: names.get names2 hashtable.get rebind: names.get 
[ pick: index pick: func - return3 ] bind: autogen55 
[ pick: index memory.get pick: end_of_func == pushf: autogen55 if 
  check: index 1 + assign: index ] bind: autogen56 
[ newfunc1 assign: func 
   pick: func assign: index 
   pushf: autogen56 repeat return_no_value ] bind: func_len 
[ check: index return3 ] bind: autogen57 
[ check: index 1 + assign: index 
  pick: index memory.get pick: return_if == pushf: autogen57 if ] bind: autogen58 
[ newfunc1 assign: index 
  pushf: autogen58 repeat return_no_value ] bind: read_to_return_if 
[ None return3 ] bind: autogen59 
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
  pick: len return3 ] bind: autogen62 
[ pick: obj pick: nullobj_cached == pushf: autogen62 if 
  check: len pick: obj attr: attrib_raw func_len + assign: len 
  pick: obj attr: parent assign: parent 
  push: 214 shuffle assign: len assign: obj ] bind: autogen63 
[ newfunc1 assign: obj 
   pick: nullobj assign: nullobj_cached 
   s21 assign: obj assign: nullobj_cached 
   pick: obj attr: attrib_raw func_len assign: len 
   pushf: autogen63 repeat return_no_value ] bind: obj_total_len 
[ pick: attrib_hash return3 ] bind: autogen64 
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
   pick: new_obj 2 - pick: self memory.set 
   pick: new_obj pick: length memory.set 
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
   pick: self 1 + pick: new_array memory.set return_no_value ] bind: resizable.double 
[ newfunc1 assign: self 
   pick: self memory.get assign: length 
   pick: length pick: boot_array_class boot_array.instance assign: new_array 
   pick: self 1 + pick: new_array memory.set return_no_value ] bind: resizable.reset 
[ newfunc1 assign: self 
  pick: self pick: self memory.get 1 + memory.set return_no_value ] bind: resizable.increase 
[ newfunc1 assign: self 
   pick: self 1 + memory.get memory.get return1 ] bind: resizable.max_len 
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
[ return_no_value2 ] bind: autogen68 
[ pick: value pick: self resizable.extend ] bind: autogen69 
[ pick: value pick: self resizable.append ] bind: autogen70 
[ newfunc2 assign: self assign: value 
   pick: value None == pushf: autogen68 if 
   pick: value pick: resizable_class is_instance pushf: autogen69 pushf: autogen70 if-else return_no_value ] bind: resizable.append_array 
[ newfunc1 assign: self 
   pick: self pick: self memory.get 1 - memory.set 
   pick: self memory.get pick: self resizable.get return1 ] bind: resizable.pop 
[ newfunc1 assign: self 
  pick: self memory.get 1 - pick: self resizable.get return1 ] bind: resizable.top 
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
  pick: self attr: array 1 + pick: self attr: len str_join return1 ] bind: resizable.join 
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
   pick: name pick: receiver pick: searcher instance_attrib return1 ] bind: resizable.attrib 
 pick: resizable.attrib pick: boot_obj attr_call: subclass bind: resizable_class 
 pick: resizable_class attr: instance pick: resizable_class closure bind: resizable 
 pick: resizable_class convert_attr bind: resizable.hash 
[ 
   hash_header 
   pick: name pick: resizable.hash hashtable.get call ] rebind: resizable.attrib 
[ newfunc3 assign: self assign: children assign: name 
   pick: boot_obj minobj.instance assign: new_obj 
   pick: new_obj 2 - pick: self memory.set 
   pick: new_obj pick: name memory.set 
   pick: children memory.append 
   push: ] names.get memory.append 
   check: new_obj return1 ] bind: node.instance 
[ pick: key pick: children resizable.get return2 ] bind: autogen74 
[ pick: children return3 ] bind: autogen75 
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
[ pick: children memory.get return2 ] bind: autogen77 
[ 1 return2 ] bind: autogen78 
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
   pick: name pick: receiver pick: searcher instance_attrib return1 ] bind: node.attrib 
 pick: node.attrib pick: boot_obj attr_call: subclass bind: node_class 
 pick: node_class attr: instance pick: node_class closure bind: node 
 pick: node_class convert_attr bind: node.hash 
[ 
   hash_header 
   pick: name pick: node.hash hashtable.get call ] rebind: node.attrib 
[ newfunc2 assign: self assign: filename 
   pick: boot_obj minobj.instance assign: new_obj 
   pick: new_obj 2 - pick: self memory.set 
   pick: new_obj push: r pick: filename file.open memory.set 
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
   pick: name pick: receiver pick: searcher instance_attrib return1 ] bind: Input.attrib 
 pick: Input.attrib pick: boot_obj attr_call: subclass bind: Input_class 
 pick: Input_class attr: instance pick: Input_class closure bind: Input 
 pick: Input_class convert_attr bind: Input.hash 
[ 
   hash_header 
   pick: name pick: Input.hash hashtable.get call ] rebind: Input.attrib 
[ newfunc1 assign: self 
   pick: boot_obj minobj.instance assign: new_obj 
   pick: new_obj 2 - pick: self memory.set 
   pick: new_obj _cheat_dict.new memory.set 
   push: ] names.get memory.append 
   pick: new_obj return1 ] bind: cheat_dict.instance 
[ push: CheatDict_looking_up_ print 
  pick: name print 
  printeol ] bind: autogen81 
[ newfunc3 assign: searcher assign: receiver assign: name 
   pick: lookup_print pushf: autogen81 if 
   pick: name push: instance string_equal pick: cheat_dict.instance return_if 
   pick: name push: get string_equal pick: _cheat_dict.get return_if 
   pick: name push: set string_equal pick: _cheat_dict.set return_if 
   pick: name pick: receiver pick: searcher instance_attrib return1 ] bind: cheat_dict.attrib 
 pick: cheat_dict.attrib pick: boot_obj attr_call: subclass bind: cheat_dict_class 
 pick: cheat_dict_class attr: instance pick: cheat_dict_class closure bind: cheat_dict 
[ newfunc2 assign: self assign: message 
   pick: boot_obj minobj.instance assign: new_obj 
   pick: new_obj 2 - pick: self memory.set 
   pick: new_obj pick: message memory.set 
   push: ] names.get memory.append 
   pick: new_obj return1 ] bind: MatchError.instance 
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
   pick: name pick: receiver pick: searcher instance_attrib return1 ] bind: MatchError.attrib 
 pick: MatchError.attrib pick: boot_obj attr_call: subclass bind: MatchError_class 
 pick: MatchError_class attr: instance pick: MatchError_class closure bind: MatchError 
[ push: End_of_file MatchError return2 ] bind: autogen83 
[ push: Not_exactly MatchError return2 ] bind: autogen84 
[ newfunc1 assign: char 
   pick: source attr_call: next_char assign: input_char 
    pick: input_char None == pushf: autogen83 if 
    pick: char pick: input_char string_equal not pushf: autogen84 if 
   check: input_char return1 ] bind: exactly 
[ push: End_of_file MatchError return2 ] bind: autogen85 
[ push: Not_between MatchError return2 ] bind: autogen86 
[ newfunc2 assign: end assign: start 
   pick: source attr_call: next_char assign: input_char 
    pick: input_char None == pushf: autogen85 if 
    pick: start pick: end pick: input_char char_between not pushf: autogen86 if 
   check: input_char return1 ] bind: between 
[ push: End_of_file MatchError return2 ] bind: autogen87 
[ push: Not_exactly MatchError return2 ] bind: autogen88 
[ newfunc1 assign: char 
   pick: source attr_call: next assign: input_char 
    pick: input_char None == pushf: autogen87 if 
    pick: char pick: input_char string_equal not pushf: autogen88 if 
   check: input_char return1 ] bind: token 
[ 0 0 return_two2 ] bind: autogen89 
[ newfunc1 assign: children 
   pick: children memory.get pick: end_of_func == pushf: autogen89 if 
   pick: children 2 + pick: children 1 + memory.get return_two1 return_no_value ] bind: next_child 
[ check: output return3 ] bind: autogen90 
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
   push: No_OR_child_matches MatchError return1 ] bind: or 
[ check: output return2 ] bind: autogen92 
[ newfunc1 assign: child 
   check: child call assign: output 
   pick: output pick: MatchError_class is_instance pushf: autogen92 if 
   push: out pick: output node return1 ] bind: out 
[ pick: output attr: name push: out string_equal return2 ] bind: autogen93 
[ newfunc1 assign: output 
   pick: output pick: node_class is_instance pushf: autogen93 if 
   pick: False return1 ] bind: is_output 
[ pick: outputs return3 ] bind: autogen94 
[ pick: outputs attr: array 1 + pick: length str_join return4 ] bind: autogen95 
[ pick: output str_len 1 == pushf: autogen95 if ] bind: autogen96 
[ pick: output return3 ] bind: autogen97 
[ pick: outputs attr: len assign: length 
  pick: length 0 == pushf: autogen94 if 
  0 pick: outputs attr_call: get assign: output 
   pick: output is_str pushf: autogen96 if 
   pick: length 1 == pushf: autogen97 if ] bind: autogen98 
[ pick: outputs attr: children return4 ] bind: autogen99 
[ pick: outputs attr: children is_str pushf: autogen99 if ] bind: autogen100 
[ pick: outputs pick: node_class is_instance pushf: autogen100 if ] bind: autogen101 
[ newfunc1 assign: outputs 
   pick: outputs pick: resizable_class is_instance pushf: autogen98 pushf: autogen101 if-else 
   pick: outputs return1 ] bind: make_string 
[ pick: saved pick: source attr_call: position_set 
  push: And_match_failed MatchError return3 ] bind: autogen102 
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
   pick: outputs make_string return1 ] bind: and 
[ 0 c.infinity return_two2 ] bind: autogen109 
[ 1 c.infinity return_two2 ] bind: autogen110 
[ 0 1 return_two2 ] bind: autogen111 
[ newfunc1 assign: quantifier 
    pick: quantifier push: * string_equal pushf: autogen109 if 
    pick: quantifier push: + string_equal pushf: autogen110 if 
    pick: quantifier push: ? string_equal pushf: autogen111 if 
   push: Unknown_quantifier error return_no_value ] bind: get_bounds 
[ pick: start_saved pick: source attr_call: position_set 
  push: Quantified_undermatch MatchError return4 ] bind: autogen112 
[ pick: count pick: lower < pushf: autogen112 if 
  pick: saved pick: source attr_call: position_set 
  pick: outputs make_string return3 ] bind: autogen113 
[ pick: outputs make_string return3 ] bind: autogen114 
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
[ None return2 ] bind: autogen116 
[ newfunc1 assign: child 
   pick: source attr_call: position assign: saved 
   s21 assign: child assign: saved 
   check: child call assign: output 
   pick: saved pick: source attr_call: position_set 
   pick: output pick: MatchError_class is_instance pushf: autogen116 if 
   push: Negation_is_true MatchError return1 ] bind: negation 
[ pick: output return2 ] bind: autogen117 
[ newfunc2 assign: name assign: child 
   pick: child call assign: output 
   pick: output pick: MatchError_class is_instance pushf: autogen117 if 
   pick: name pick: output node return1 ] bind: bound 
[ pick: output attr: len 1 > return2 ] bind: autogen118 
[ newfunc1 assign: output 
   pick: output pick: resizable_class is_instance pushf: autogen118 if 
   pick: False return1 ] bind: should_make_node 
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
[ pick: output return2 ] bind: autogen125 
[ push: Making_node_ print 
  pick: name printraw 
  printeol 
  pick: name pick: output node return2 ] bind: autogen126 
[ pick: output return2 ] bind: autogen127 
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
   pick: name pick: output node return1 ] rebind: _apply 
[ check: new_pos pick: source attr_call: position_set 
  check: mem_out return2 ] bind: autogen128 
[ pick: source attr_call: position assign: saved 
  pick: name _apply assign: output 
  pick: name pick: saved push: indentation pick: parseg attr_call: get pick: output pick: source attr_call: position memoizer.set 
  check: output return2 ] bind: autogen129 
[ newfunc1 assign: name 
   pick: name pick: source attr_call: position push: indentation pick: parseg attr_call: get memoizer.get assign: memoized assign: new_pos assign: mem_out 
   check: memoized pushf: autogen128 pushf: autogen129 if-else return_no_value ] bind: apply 
[ push: End_of_file MatchError return2 ] bind: autogen130 
[ newfunc0 
   pick: source attr_call: next_char assign: char 
   pick: char None == pushf: autogen130 if 
   check: char return1 ] bind: base.rules.anything 
[ newfunc0 
  None return1 ] bind: base.rules.void 
[ push: a push: z between ] bind: autogen131 
[ push: A push: Z between ] bind: autogen132 
[ pushf: autogen131 pushf: autogen132 ] bind: autogen133 
[ newfunc0 
  pushf: autogen133 or return1 ] bind: base.rules.letter 
[ newfunc0 
  push: 0 push: 9 between return1 ] bind: base.rules.digit 
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
  pushf: autogen144 and return1 ] bind: base.rules.name 
[ pick: output return2 ] bind: autogen145 
[ push: \t return2 ] bind: autogen146 
[ push: \n return2 ] bind: autogen147 
[ push: \r return2 ] bind: autogen148 
[ push: \\ return2 ] bind: autogen149 
[ push: ' return2 ] bind: autogen150 
[ push: " return2 ] bind: autogen151 
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
[ pick: root printrepr 
  return_no_value2 ] bind: autogen152 
[ 0 pick: root attr_call: get to_flpc2 return_no_value2 ] bind: autogen153 
[ 0 pick: root attr_call: get to_flpc2 return_no_value2 ] bind: autogen154 
[ 0 pick: root attr_call: get tprint 
  push: Unexpected_child_of_exactly._Was_expecting_a_escaped_chart. error ] bind: autogen155 
[ 0 pick: root attr_call: get attr: name push: escaped\uchar string_equal not pushf: autogen155 if 
  pick: root attr: name 0 0 pick: root attr_call: get attr_call: get node to_flpc2 return_no_value2 ] bind: autogen156 
[ push: prefix pick: parseg attr_call: get printraw 
  push: .rules. print 
  0 0 pick: root attr_call: get attr_call: get printraw 
  push: _<-_fun[]:\n____return( print 
  pushi: 3 pick: root attr_call: get to_flpc2 
  push: ) print 
  return_no_value2 ] bind: autogen157 
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
   pick: output return1 ] bind: parse_grammar 
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
[ None return2 ] bind: autogen180 
[ newfunc0 
   pick: source attr_call: position assign: saved 
   push: hspaces apply make_string assign: s 
   push: indentation pick: parseg attr_call: get attr_call: top pick: s str_len == pushf: autogen180 if 
   pick: saved pick: source attr_call: position_set 
   push: Different_indent MatchError return1 ] bind: base.rules.SAME_INDENT 
[ newfunc0 
   push: indentation pick: parseg attr_call: get attr_call: pop 
   None return1 ] bind: base.rules.DEDENT 
[ pick: saved pick: source attr_call: position_set 
  push: Missing_newline_before_indent MatchError return2 ] bind: autogen181 
[ newfunc0 
   pick: source attr_call: position assign: saved 
   push: NEWLINE apply pick: MatchError_class is_instance pushf: autogen181 if 
   push: hspaces apply make_string assign: s 
   pick: saved pick: source attr_call: position_set 
   pick: s str_len push: indentation pick: parseg attr_call: get attr_call: append 
   None return1 ] bind: base.rules.INDENT 
[ check: output 1 + memory.get make_string assign: output ] bind: autogen182 
[ push: NAME apply assign: output 
  pick: output pick: node_class is_instance pushf: autogen182 if ] bind: autogen183 
[ push: Not_token_or_EOF MatchError return3 ] bind: autogen184 
[ pick: s pick: source attr_call: startswith assign: output 
  pick: output None == pushf: autogen184 if 
  check: output return2 ] bind: autogen185 
[ pick: output return2 ] bind: autogen186 
[ push: End_of_file MatchError return2 ] bind: autogen187 
[ push: Not_exactly_token MatchError return2 ] bind: autogen188 
[ newfunc1 assign: s 
   pick: source attr_call: position assign: saved 
   push: spaces apply drop1 
    pick: s is_alpha pushf: autogen183 pushf: autogen185 if-else 
    pick: output pick: MatchError_class is_instance pushf: autogen186 if 
    pick: output None == pushf: autogen187 if 
    pick: output pick: s string_equal not pushf: autogen188 if 
   pick: output return1 ] rebind: token 
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
  pushf: autogen199 push: comment bound return1 ] bind: flpcg.rules.comment 
[ push: \n exactly ] bind: autogen200 
[ push: \r exactly ] bind: autogen201 
[ push: \s exactly ] bind: autogen202 
[ push: \t exactly ] bind: autogen203 
[ pushf: autogen200 pushf: autogen201 pushf: autogen202 pushf: autogen203 ] bind: autogen204 
[ newfunc0 
  pushf: autogen204 or return1 ] bind: flpcg.rules.space 
[ push: space apply ] bind: autogen205 
[ newfunc0 
  pushf: autogen205 push: * quantified return1 ] bind: flpcg.rules.spaces 
[ push: space apply ] bind: autogen206 
[ newfunc0 
  pushf: autogen206 push: + quantified return1 ] bind: flpcg.rules.spacesp 
[ push: \s exactly ] bind: autogen207 
[ push: \t exactly ] bind: autogen208 
[ pushf: autogen207 pushf: autogen208 ] bind: autogen209 
[ pushf: autogen209 or ] bind: autogen210 
[ newfunc0 
  pushf: autogen210 push: * quantified return1 ] bind: flpcg.rules.hspaces 
[ push: \s exactly ] bind: autogen211 
[ push: \t exactly ] bind: autogen212 
[ pushf: autogen211 pushf: autogen212 ] bind: autogen213 
[ pushf: autogen213 or ] bind: autogen214 
[ newfunc0 
  pushf: autogen214 push: + quantified return1 ] bind: flpcg.rules.hspacesp 
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
  pushf: autogen223 push: EMPTY\uLINE bound return1 ] bind: flpcg.rules.EMPTY_LINE 
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
  pushf: autogen232 and return1 ] bind: flpcg.rules.NUMBER 
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
  pushf: autogen259 and return1 ] bind: flpcg.rules.STRING 
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
  pushf: autogen290 and return1 ] bind: flpcg.rules.NAME 
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
  pushf: autogen301 and return1 ] bind: flpcg.rules.FORTH_NAME 
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
  pushf: autogen312 or return1 ] bind: flpcg.rules.bin_op 
[ push: NAME apply ] bind: autogen313 
[ newfunc0 
  pushf: autogen313 push: * quantified return1 ] bind: flpcg.rules.names 
[ newfunc0 
  push: NAME apply return1 ] bind: flpcg.rules.variable 
[ push: ` token ] bind: autogen314 
[ push: NAME apply ] bind: autogen315 
[ pushf: autogen315 out ] bind: autogen316 
[ pushf: autogen314 pushf: autogen316 ] bind: autogen317 
[ newfunc0 
  pushf: autogen317 and return1 ] bind: flpcg.rules.name_quote 
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
  pushf: autogen329 and return1 ] bind: flpcg.rules.quote 
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
  pushf: autogen347 and return1 ] bind: flpcg.rules.forth 
[ push: FORTH\uNAME apply ] bind: autogen348 
[ pushf: autogen348 push: NAME bound ] bind: autogen349 
[ newfunc0 
  pushf: autogen349 push: * quantified return1 ] bind: flpcg.rules.forth_line 
[ push: [ token ] bind: autogen350 
[ push: names apply ] bind: autogen351 
[ pushf: autogen351 out ] bind: autogen352 
[ push: ] token ] bind: autogen353 
[ pushf: autogen350 pushf: autogen352 pushf: autogen353 ] bind: autogen354 
[ newfunc0 
  pushf: autogen354 and return1 ] bind: flpcg.rules.simple_quote 
[ push: ( token ] bind: autogen355 
[ push: expr apply ] bind: autogen356 
[ pushf: autogen356 out ] bind: autogen357 
[ push: ) token ] bind: autogen358 
[ pushf: autogen355 pushf: autogen357 pushf: autogen358 ] bind: autogen359 
[ newfunc0 
  pushf: autogen359 and return1 ] bind: flpcg.rules.parenthesis 
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
  pushf: autogen371 and return1 ] bind: flpcg.rules.func_call 
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
  pushf: autogen386 and return1 ] bind: flpcg.rules.block_call 
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
  pushf: autogen396 and return1 ] bind: flpcg.rules.multi_block_call 
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
  pushf: autogen405 or return1 ] bind: flpcg.rules.non_block_non_infix 
[ push: infix apply ] bind: autogen406 
[ push: non\ublock\unon\uinfix apply ] bind: autogen407 
[ pushf: autogen406 pushf: autogen407 ] bind: autogen408 
[ newfunc0 
  pushf: autogen408 or return1 ] bind: flpcg.rules.non_block 
[ push: non\ublock\unon\uinfix apply ] bind: autogen409 
[ push: bin\uop apply ] bind: autogen410 
[ pushf: autogen410 push: op bound ] bind: autogen411 
[ push: non\ublock\unon\uinfix apply ] bind: autogen412 
[ pushf: autogen411 pushf: autogen412 ] bind: autogen413 
[ pushf: autogen413 and ] bind: autogen414 
[ pushf: autogen414 push: + quantified ] bind: autogen415 
[ pushf: autogen409 pushf: autogen415 ] bind: autogen416 
[ newfunc0 
  pushf: autogen416 and return1 ] bind: flpcg.rules.infix 
[ push: block\ucall apply ] bind: autogen417 
[ push: non\ublock\unon\uinfix apply ] bind: autogen418 
[ pushf: autogen417 pushf: autogen418 ] bind: autogen419 
[ newfunc0 
  pushf: autogen419 or return1 ] bind: flpcg.rules.non_infix 
[ push: infix apply ] bind: autogen420 
[ push: non\uinfix apply ] bind: autogen421 
[ pushf: autogen420 pushf: autogen421 ] bind: autogen422 
[ newfunc0 
  pushf: autogen422 or return1 ] bind: flpcg.rules.expr 
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
  pushf: autogen433 or return1 ] bind: flpcg.rules.exprs 
[ push: expr apply ] bind: autogen434 
[ push: hspacesp apply ] bind: autogen435 
[ push: expr apply ] bind: autogen436 
[ pushf: autogen436 out ] bind: autogen437 
[ pushf: autogen435 pushf: autogen437 ] bind: autogen438 
[ pushf: autogen438 and ] bind: autogen439 
[ pushf: autogen439 push: * quantified ] bind: autogen440 
[ pushf: autogen434 pushf: autogen440 ] bind: autogen441 
[ newfunc0 
  pushf: autogen441 and return1 ] bind: flpcg.rules.exprsp 
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
  pushf: autogen452 and return1 ] bind: flpcg.rules.assign 
[ push: names apply ] bind: autogen453 
[ pushf: autogen453 out ] bind: autogen454 
[ push: <- token ] bind: autogen455 
[ push: exprsp apply ] bind: autogen456 
[ pushf: autogen456 out ] bind: autogen457 
[ pushf: autogen454 pushf: autogen455 pushf: autogen457 ] bind: autogen458 
[ newfunc0 
  pushf: autogen458 and return1 ] bind: flpcg.rules.bind 
[ push: multi\ublock\ucall apply ] bind: autogen459 
[ push: bind apply ] bind: autogen460 
[ push: assign apply ] bind: autogen461 
[ pushf: autogen459 pushf: autogen460 pushf: autogen461 ] bind: autogen462 
[ newfunc0 
  pushf: autogen462 or return1 ] bind: flpcg.rules.statement 
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
  pushf: autogen475 or return1 ] bind: flpcg.rules.suite 
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
  pushf: autogen485 or return1 ] bind: flpcg.rules.NEWLINE 
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
  pushf: autogen494 and return1 ] bind: flpcg.rules.COMMENT_LINE 
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
  pushf: autogen511 or return1 ] bind: flpcg.rules.grammar 
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
[ 
   push: 51234 shuffle assign: elem assign: index assign: end assign: block assign: new_resizable 
   check: elem pick: new_resizable attr_call: append ] bind: autogen515 
[ 
   0 resizable assign: new_resizable 
   s21 assign: num assign: new_resizable 
   check: num 0 pushf: autogen515 simple_for 
   push: 12 shuffle ] bind: make_resizable 
[ 
   make_resizable assign: arr 
   pick: arr attr: array 1 + pick: arr attr: len str_join assign: joined 
   push: 13 shuffle ] bind: str_cat 
[ 
   pick: index pick: iterable attr_call: get assign: elem 
   pick: block2 call ] bind: autogen516 
[ pushi: 2 remove_top_names assign: block2 assign: iterable 
   pick: iterable attr: len 0 pushf: autogen516 simple_for 
   check: block2 drop1 
   check: iterable drop1 ] bind: for_in 
[ 
   pick: block3 call pick: list_comp_out attr_call: append 
   check: elem drop1 ] bind: autogen517 
[ pushi: 2 remove_top_names assign: iterable assign: block3 
   0 resizable assign: list_comp_out 
   pick: iterable pushf: autogen517 for_in 
   push: 14 shuffle ] bind: list_comp 
[ 
   pick: elem pick: var_name assign2 
   pick: block3 call pick: list_comp_out attr_call: append 
   drop1 
   check: elem drop1 ] bind: autogen518 
[ pushi: 3 remove_top_names assign: iterable assign: var_name assign: block3 
   0 resizable assign: list_comp_out 
   pick: iterable pushf: autogen518 for_in 
   push: 15 shuffle ] bind: list_comp_var 
[ pick: block3 call pick: list_comp_out attr_call: append ] bind: autogen519 
[ 
   pick: condition call pushf: autogen519 if 
   check: elem drop1 ] bind: autogen520 
[ pushi: 3 remove_top_names assign: condition assign: iterable assign: block3 
   0 resizable assign: list_comp_out 
   pick: iterable pushf: autogen520 for_in 
   push: 14 shuffle ] bind: list_comp_cond 
[ newfunc1 assign: bar 
  1 return1 ] bind: flist.foo 
[ push: FList_looking_up_ print 
  pick: name print 
  printeol ] bind: autogen521 
[ newfunc3 assign: searcher assign: receiver assign: name 
   pick: lookup_print pushf: autogen521 if 
   pick: name push: pos string_equal 0 return_if 
   pick: name pick: receiver pick: searcher instance_attrib return1 ] bind: flist.attrib 
 pick: resizable.attrib pick: boot_obj attr_call: subclass bind: FList_class 
 pick: FList_class attr: instance pick: FList_class closure bind: FList 
[ newfunc2 assign: new_class assign: obj 
  pick: obj 2 - pick: new_class memory.set return_no_value ] bind: change_class 
[ 
  check: elem pick: out_list attr_call: append ] bind: autogen522 
[ newfunc2 assign: out_list assign: in_list 
  pick: in_list pushf: autogen522 for_in return_no_value ] bind: extend 
[ check: elem pick: out_list extend ] bind: autogen523 
[ check: elem pick: out_list attr_call: append ] bind: autogen524 
[ 
  pick: elem pick: class is_instance pushf: autogen523 pushf: autogen524 if-else ] bind: autogen525 
[ newfunc2 assign: class assign: in_list 
   0 resizable assign: out_list 
   pick: in_list pushf: autogen525 for_in 
   check: out_list return1 ] bind: flatten 
[ newfunc1 assign: self 
  pick: self 1 + memory.get tprint return_no_value ] bind: forthe.print 
[ push: Forthe_looking_up_ print 
  pick: name print 
  printeol ] bind: autogen526 
[ newfunc3 assign: searcher assign: receiver assign: name 
   pick: lookup_print pushf: autogen526 if 
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
  s21 memory.set return_no_value ] bind: FQuote.set_name 
[ push: FQuote_looking_up_ print 
  pick: name print 
  printeol ] bind: autogen527 
[ newfunc3 assign: searcher assign: receiver assign: name 
   pick: lookup_print pushf: autogen527 if 
   pick: name push: get string_equal pick: node.get return_if 
   pick: name push: instance string_equal pick: node.instance return_if 
   pick: name push: print string_equal pick: node.print return_if 
   pick: name push: set\uname string_equal pick: FQuote.set_name return_if 
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
[ pick: self pick: i + 1 + 0 memory.set 
  check: i 1 - assign: i ] bind: autogen528 
[ newfunc1 assign: self 
   pick: self memory.get assign: i 
   pushf: autogen528 repeat_if return_no_value ] bind: array.clear 
[ newfunc1 assign: root 
  push: Dummy_function error return_no_value ] bind: simplify 
[ pick: elem simplify ] bind: autogen529 
[ pick: root attr: name pushf: autogen529 pick: root list_comp node assign: output ] bind: autogen530 
[ pick: True ] bind: autogen531 
[ 0 resizable assign: output ] bind: autogen532 
[ pick: True ] bind: autogen533 
[ pick: elem simplify ] bind: autogen534 
[ pushf: autogen534 pick: root attr: children list_comp assign: output ] bind: autogen535 
[ pick: root attr: children None == not ] bind: autogen536 
[ pick: root attr: children simplify assign: output ] bind: autogen537 
[ pick: root attr: children pick: node_class is_instance ] bind: autogen538 
[ pushf: autogen532 pushf: autogen533 pushf: autogen535 pushf: autogen536 pushf: autogen537 pushf: autogen538 pushi: 3 multi-if ] bind: autogen539 
[ pick: root attr: name push: parameters string_equal pick: root attr: name push: exprs string_equal || ] bind: autogen540 
[ 0 pick: root attr_call: get simplify assign: output ] bind: autogen541 
[ 0 pick: root attr_call: get attr: name push: exprs string_equal ] bind: autogen542 
[ pushf: autogen542 pick: root attr: len 1 == 0 pick: root attr_call: get pick: node_class is_instance && lazy_and ] bind: autogen543 
[ pick: elem simplify ] bind: autogen544 
[ pick: True assign: cond ] bind: autogen545 
[ pick: elem attr: name push: EMPTY\uLINE string_equal not assign: cond ] bind: autogen546 
[ 
  pick: elem pick: node_class is_instance not pushf: autogen545 pushf: autogen546 if-else ] bind: autogen547 
[ pushf: autogen544 pick: root pushf: autogen547 list_comp_cond assign: children 
  pick: root attr: name pick: children node assign: output ] bind: autogen548 
[ pick: root attr: name push: suite string_equal ] bind: autogen549 
[ 0 pick: root attr_call: get simplify assign: output ] bind: autogen550 
[ pick: root attr: name push: suite string_equal pick: root attr: len 1 == && ] bind: autogen551 
[ pick: child pick: children attr_call: append ] bind: autogen552 
[ pick: True ] bind: autogen553 
[ push: multi\uif pick: last_child attr_call: set_name 
  push: if pick: last_child attr: children node 1 make_resizable pick: last_child attr_call: set_children ] bind: autogen554 
[ debugger2 
  pick: last_child attr: name push: if string_equal pushf: autogen554 if 
  pick: child pick: last_child attr: children attr_call: append 
  debugger2 
  check: child drop1 
  pick: last_child assign: bring_to_top ] bind: autogen555 
[ pick: child attr: name push: elif string_equal ] bind: autogen556 
[ pick: child attr: children pick: last_child attr: children attr_call: append 
  push: if-else pick: last_child attr_call: set_name ] bind: autogen557 
[ pick: last_child attr: name push: if string_equal pick: child attr: name push: else string_equal && ] bind: autogen558 
[ 
   pick: index pick: root attr_call: get simplify assign: child 
   pushf: autogen552 pushf: autogen553 pushf: autogen555 pushf: autogen556 pushf: autogen557 pushf: autogen558 pushi: 3 multi-if 
   debugger2 
   push: 23416 shuffle assign: index assign: end assign: block assign: last_child ] bind: autogen559 
[ push: multi-block-root:_ pick: root dprint 
  debugger2 
  0 resizable assign: children 
  push: dummy None node assign: last_child 
  pick: root attr: len 0 pushf: autogen559 simple_for 
  push: suite pick: children node assign: output ] bind: autogen560 
[ pick: root attr: name push: multi\ublock\ucall string_equal ] bind: autogen561 
[ check: cond drop1 
  check: i 2 + assign: i 
  0 pick: i 1 - pick: root attr_call: get attr_call: get pick: i pick: root attr_call: get simplify pick: output simplify 2 make_resizable node assign: output 
  push: 214 shuffle assign: i assign: output 
  pick: i pick: l < assign: cond ] bind: autogen562 
[ pick: root attr: len 2 - assign: l 
  0 pick: root attr_call: get assign: output 
  0 assign: i 
  pick: i pick: l < assign: cond 
  pushf: autogen562 repeat_if 
  check: i drop1 ] bind: autogen563 
[ pick: root attr: name push: infix string_equal ] bind: autogen564 
[ 0 0 pick: root attr_call: get attr_call: get 1 pick: root attr_call: get simplify node assign: output ] bind: autogen565 
[ pick: root attr: name push: func\ucall string_equal pick: root attr: name push: block\ucall string_equal || ] bind: autogen566 
[ pick: root assign: output ] bind: autogen567 
[ pick: root pick: node_class is_instance not ] bind: autogen568 
[ newfunc1 assign: root 
   pushf: autogen530 pushf: autogen531 pushf: autogen539 pushf: autogen540 pushf: autogen541 pushf: autogen543 pushf: autogen548 pushf: autogen549 pushf: autogen550 pushf: autogen551 pushf: autogen560 pushf: autogen561 pushf: autogen563 pushf: autogen564 pushf: autogen565 pushf: autogen566 pushf: autogen567 pushf: autogen568 pushi: 9 multi-if 
   check: output return1 ] rebind: simplify 
[ push: newfunc_called_with_unexpected_argument error ] bind: autogen569 
[ newfunc1 assign: i 
   pick: i pushi: 4 < not pushf: autogen569 if 
   pick: i int_to_str push: newfunc 2 str_cat return1 ] bind: newfunc_str 
[ newfunc1 assign: array 
   pick: array pick: FList_class change_class 
   check: array return1 ] rebind: to_flist 
[ newfunc1 assign: root 
  push: Dummy_function error return_no_value ] bind: last_call 
[ pick: root attr: value return3 ] bind: autogen570 
[ push: _ return3 ] bind: autogen571 
[ pick: root attr: name push: FCall string_equal pushf: autogen570 pushf: autogen571 if-else ] bind: autogen572 
[ pick: root attr: len 1 - pick: root attr_call: get last_call return2 ] bind: autogen573 
[ pick: root attr: value last_call return2 ] bind: autogen574 
[ newfunc1 assign: root 
   debugger2 
    pick: root pick: forthe_class is_instance pushf: autogen572 if 
    pick: root pick: FList_class is_instance pick: root pick: resizable_class is_instance || pushf: autogen573 if 
    pick: root pick: FQuote is_instance pushf: autogen574 if 
   push: _ return1 ] rebind: last_call 
[ newfunc1 assign: root 
  push: Dummy_function error return_no_value ] bind: to_forth 
[ newfunc2 assign: obj assign: new_class 
   pick: obj 2 - pick: new_class memory.set 
   pick: obj return1 ] bind: changed_class 
[ pick: elem to_forth ] bind: autogen575 
[ newfunc1 assign: root 
  pick: FList_class pushf: autogen575 pick: root list_comp changed_class return1 ] bind: to_forth_conv.suite 
[ pick: elem to_forth ] bind: autogen576 
[ newfunc1 assign: root 
  push: _ pushf: autogen576 pick: root list_comp pick: FList_class flatten FQuote return1 ] bind: to_forth_conv.quote 
[ pick: elem to_forth ] bind: autogen577 
[ newfunc1 assign: root 
   debugger2 
   pushf: autogen577 pick: root list_comp pick: FList_class flatten assign: children 
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
  pick: FList_class push: FStr 0 pick: root attr_call: get string_escape forthe push: FCall push: push: forthe 2 make_resizable changed_class return1 ] bind: to_forth_conv.STRING 
[ push: FStr pick: child forthe assign: output ] bind: autogen578 
[ pick: FList_class push: FStr pick: child forthe push: FCall push: pushi: forthe 2 make_resizable changed_class assign: output ] bind: autogen579 
[ newfunc1 assign: root 
   0 pick: root attr: children attr_call: get assign: child 
   push: NUMBER_in:_ print 
   pick: root tprint 
   printeol 
   debugger2 
   pick: child push: 0 string_equal pick: child push: 1 string_equal || pick: child push: 2 string_equal || pushf: autogen578 pushf: autogen579 if-else 
   push: NUMBER_out:_ print 
   pick: output tprint 
   printeol 
   debugger2 
   pick: output return1 ] bind: to_forth_conv.NUMBER 
[ push: FCall 0 pick: elem attr_call: get forthe ] bind: autogen580 
[ newfunc1 assign: root 
  pick: FList_class pushf: autogen580 pick: root list_comp changed_class return1 ] bind: to_forth_conv.forth_line 
[ pick: FList_class pick: output 1 make_resizable changed_class assign: output ] bind: autogen581 
[ check: i 1 - assign: i 
  push: FCall push: assign: forthe pick: assignments attr_call: append 
  pick: i pick: names attr_call: get to_forth pick: assignments attr_call: append ] bind: autogen582 
[ newfunc1 assign: root 
   1 pick: root attr_call: get to_forth assign: output 
   pick: output pick: FList_class is_instance not pushf: autogen581 if 
   0 resizable assign: assignments 
   0 pick: root attr_call: get assign: names 
   pick: names attr: len assign: i 
   pushf: autogen582 repeat_if 
   pick: FList_class pick: assignments changed_class pick: output attr_call: append 
   pick: output return1 ] bind: to_forth_conv.assign 
[ pick: elem to_forth ] bind: autogen583 
[ 0 pick: output attr_call: get attr: value assign: names ] bind: autogen584 
[ debugger 
  1 1 - 2 0 pick: output attr_call: get attr_call: slice assign: names ] bind: autogen585 
[ push: FCall pick: names attr: len newfunc_str forthe 1 make_resizable assign: decl ] bind: autogen586 
[ push: FCall push: newfunc forthe push: FStr pick: names attr: len int_to_str forthe push: FCall push: pushi: forthe pushi: 3 make_resizable assign: decl ] bind: autogen587 
[ pick: names attr: len pushi: 4 < pushf: autogen586 pushf: autogen587 if-else ] bind: autogen588 
[ push: FCall push: remove\utop\unames forthe push: FStr pick: names attr: len int_to_str forthe push: FCall push: pushi: forthe pushi: 3 make_resizable assign: decl ] bind: autogen589 
[ 0 resizable assign: decl ] bind: autogen590 
[ check: i 1 - assign: i 
  push: FCall push: assign: forthe pick: decl attr_call: append 
  pick: i pick: names attr_call: get pick: decl attr_call: append ] bind: autogen591 
[ pick: names attr: len assign: i 
  pushf: autogen591 repeat_if ] bind: autogen592 
[ push: FCall push: return\uno\uvalue forthe 1 pick: output attr_call: get attr: value attr_call: append ] bind: autogen593 
[ push: FCall push: return\uno\uvalue forthe 1 pick: output attr_call: get attr_call: append ] bind: autogen594 
[ 1 pick: output attr_call: get pick: FQuote_class is_instance pushf: autogen593 pushf: autogen594 if-else ] bind: autogen595 
[ 1 pick: output attr_call: get last_call assign: last 
  debugger2 
  pick: last push: return string_equal pick: last push: lookup\uerror string_equal || not pushf: autogen595 if ] bind: autogen596 
[ 0 pick: root attr_call: get attr: name push: simple\uquote string_equal pushf: autogen584 pushf: autogen585 if-else 
   pick: is_fun pushf: autogen588 if 
   pick: is_local_fun pushf: autogen589 if 
   pick: is_fast_fun pick: is_inline || pushf: autogen590 if 
  pick: decl pick: FList_class change_class 
  pick: is_fast_fun not pushf: autogen592 if 
  pick: decl tprint 
  printeol 
  debugger2 
  0 pick: decl pick: output attr: value attr_call: set 
  1 pick: output attr_call: get attr: value pick: FList_class change_class 
  1 1 pick: output attr_call: get attr: value pick: output attr: value attr_call: set 
  pick: is_fun pushf: autogen596 if ] bind: autogen597 
[ newfunc1 assign: root 
   push: _ pushf: autogen583 pick: root list_comp FQuote assign: output 
   pick: root attr: name push: inline string_equal assign: is_inline 
   pick: root attr: name push: fun string_equal assign: is_fun 
   pick: root attr: name push: local\ufun string_equal assign: is_local_fun 
   pick: root attr: name push: fast\ufun string_equal assign: is_fast_fun 
   pick: True assign: cond 
   check: cond pushf: autogen597 if 
   pick: output return1 ] bind: to_forth_conv.fun 
[ check: output 1 make_resizable assign: output 
  pick: output pick: FList_class change_class ] bind: autogen598 
[ newfunc1 assign: root 
   push: root: pick: root dprint 
   debugger2 
   1 pick: root attr_call: get to_forth assign: output 
   push: output: pick: output dprint 
   push: root_name: pick: root attr: name dprint 
   debugger2 
   pick: output pick: FList_class is_instance not pushf: autogen598 if 
   push: FCall push: bind: forthe pick: output attr_call: append 
   0 0 pick: root attr_call: get attr_call: get to_forth pick: output attr_call: append 
   pick: output return1 ] bind: to_forth_conv.bind 
[ push: FStr pick: elem forthe ] bind: autogen599 
[ newfunc1 assign: root 
   pushf: autogen599 pick: root list_comp pick: FList_class flatten assign: children 
   push: FComment pick: children forthe return1 ] bind: to_forth_conv.comment 
[ 0 1 pick: root attr_call: get attr_call: get to_forth push: FCall push: attr: forthe 0 pick: root attr_call: get to_forth pushi: 3 make_resizable assign: children ] bind: autogen600 
[ pick: elem to_forth ] bind: autogen601 
[ pushf: autogen601 1 pick: root attr_call: get list_comp assign: children 
  push: FStr 1 pick: root attr_call: get attr: name forthe push: FCall push: attr\ucall: forthe 0 pick: root attr_call: get to_forth pushi: 3 make_resizable assign: calls 
  check: calls pick: children extend ] bind: autogen602 
[ newfunc1 assign: root 
   1 pick: root attr_call: get attr: name push: variable string_equal pushf: autogen600 pushf: autogen602 if-else 
   pick: FList_class pick: children pick: FList_class flatten changed_class return1 ] bind: to_forth_conv.dot 
[ pick: elem to_forth ] bind: autogen603 
[ newfunc1 assign: root 
   pushf: autogen603 pick: root list_comp assign: output 
   pick: FList_class pick: output pick: FList_class flatten changed_class return1 ] bind: to_forth_conv.grammar 
[ pick: i 1 - pick: root attr_call: get assign: child 
  1 pick: child attr_call: get to_forth pick: output attr_call: append 
  push: quote 0 pick: child attr_call: get node to_forth pick: output attr_call: append 
  check: child drop1 
  check: i 1 - assign: i ] bind: autogen604 
[ newfunc1 assign: root 
   debugger2 
   0 resizable assign: output 
   pick: root attr: len assign: i 
   pushf: autogen604 repeat_if 
   debugger2 
   pick: output pick: FList_class flatten assign: output 
   debugger2 
   push: FCall push: pushi: forthe pick: output attr_call: append 
   push: FStr pick: root attr: len int_to_str forthe pick: output attr_call: append 
   push: FCall pick: root attr: name forthe pick: output attr_call: append 
   pick: output pick: FList_class change_class 
   debugger2 
   pick: output return1 ] bind: to_forth_conv.multi_if 
[ pick: elem to_forth ] bind: autogen605 
[ newfunc1 assign: root 
   pushf: autogen605 pick: root list_comp assign: output 
   check: output pick: FList_class flatten assign: output 
   push: FCall pick: root attr: name forthe pick: output attr_call: append 
   push: output: pick: output dprint 
   debugger2 
   pick: FList_class pick: output changed_class return1 ] bind: to_forth_conv.default 
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
  push: Unexpected_non-node_root. error ] bind: autogen606 
[ push: default pick: to_forth_conv_hash attr_call: get assign: converter ] bind: autogen607 
[ newfunc1 assign: root 
   push: nest push: nest pick: parseg attr_call: get 1 + pick: parseg attr_call: set 
   push: nest pick: parseg attr_call: get 0 pick: printspace simple_for 
   pick: root attr: name print 
   push: _<- print 
   printeol 
   pick: root pick: node_class is_instance not pushf: autogen606 if 
   pick: root attr: name pick: to_forth_conv_hash attr_call: get assign: converter 
   pick: converter None == pushf: autogen607 if 
   pick: root pick: converter call assign: output 
   push: nest pick: parseg attr_call: get 0 pick: printspace simple_for 
   pick: root attr: name print 
   push: _->_ pick: output dprint 
   push: nest push: nest pick: parseg attr_call: get 1 - pick: parseg attr_call: set 
   check: output return1 ] rebind: to_forth 
 pushi: 11 hashtable bind: g 
 push: written pushi: 5000 hashtable pick: g attr_call: set 
[ push: file push: w pick: filename file.open pick: g attr_call: set ] bind: autogen608 
[ push: file None pick: g attr_call: set ] bind: autogen609 
[ newfunc1 assign: filename 
   push: written pick: g attr_call: get attr: keys array.clear 
   push: nesting 0 pick: g attr_call: set 
   push: last\uvalue push: _ pick: g attr_call: set 
   push: autogen\ucount 0 pick: g attr_call: set 
   push: autogen\uname push: autogen pick: g attr_call: set 
   pick: filename None == not pushf: autogen608 pushf: autogen609 if-else 
   push: init_g:_ pick: g dprint 
   debugger2 return_no_value ] bind: init_g 
[ 
  push: last\uvalue None pick: g attr_call: set ] bind: write_eol 
[ pick: value push: ] string_equal not pick: value push: return\uno\uvalue string_equal not && ] bind: autogen610 
[ printeol 
  push: nesting pick: g attr_call: get 1 pick: printspace simple_for ] bind: autogen611 
[ newfunc1 assign: value 
   push: file pick: g attr_call: get set_output 
   pushf: autogen610 push: last\uvalue pick: g attr_call: get None == lazy_and pushf: autogen611 if 
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
  debugger ] bind: autogen612 
[ pick: True ] bind: autogen613 
[ 
  check: elem pick: depth write_string_body ] bind: autogen614 
[ push: nesting push: nesting pick: g attr_call: get 1 + pick: g attr_call: set 
  debugger2 
  pick: root pushf: autogen614 for_in 
  debugger2 
  push: nesting push: nesting pick: g attr_call: get 1 - pick: g attr_call: set 
  write_eol ] bind: autogen615 
[ pick: root pick: FList_class is_instance ] bind: autogen616 
[ push: pushf: write_sep 
  pick: root attr: name write_sep ] bind: autogen617 
[ pick: root pick: FQuote_class is_instance ] bind: autogen618 
[ pick: root attr: value write_sep ] bind: autogen619 
[ pick: root attr: name push: FStr string_equal ] bind: autogen620 
[ pick: depth int_to_str pick: root attr: value 2 str_cat write_sep ] bind: autogen621 
[ pick: root attr: value write_sep ] bind: autogen622 
[ pick: root attr: value push: return string_equal pick: root attr: value push: return\utwo string_equal || pushf: autogen621 pushf: autogen622 if-else ] bind: autogen623 
[ pick: root attr: name push: FCall string_equal ] bind: autogen624 
[ printspace ] bind: autogen625 
[ pick: root attr: name push: FComment string_equal ] bind: autogen626 
[ pushf: autogen619 pushf: autogen620 pushf: autogen623 pushf: autogen624 pushf: autogen625 pushf: autogen626 pushi: 3 multi-if ] bind: autogen627 
[ pick: root pick: forthe_class is_instance ] bind: autogen628 
[ newfunc2 assign: depth assign: root 
   debugger2 
   pushf: autogen612 pushf: autogen613 pushf: autogen615 pushf: autogen616 pushf: autogen617 pushf: autogen618 pushf: autogen627 pushf: autogen628 pushi: 4 multi-if return_no_value ] rebind: write_string_body 
[ newfunc2 assign: depth assign: root 
  push: Dummy_function error return_no_value ] bind: write_blocks 
[ push: root:_ pick: root dprint 
  push: root_is_quote:_ pick: root pick: FQuote_class is_instance dprint 
  push: root_is_list:_ pick: root pick: FList_class is_instance dprint 
  push: g:_ pick: g dprint ] bind: autogen629 
[ check: elem pick: depth 1 + write_blocks ] bind: autogen630 
[ check: elem pick: depth write_blocks ] bind: autogen631 
[ 
  pick: elem pick: FQuote_class is_instance pushf: autogen630 pushf: autogen631 if-else ] bind: autogen632 
[ push: nesting push: nesting pick: g attr_call: get 1 + pick: g attr_call: set 
  pick: root pushf: autogen632 for_in 
  push: nesting push: nesting pick: g attr_call: get 1 - pick: g attr_call: set 
  write_eol ] bind: autogen633 
[ push: autogen\ucount pick: g attr_call: get int_to_str push: autogen\uname pick: g attr_call: get 2 str_cat assign: name 
  pick: name pick: root attr_call: set_name 
  push: autogen\ucount push: autogen\ucount pick: g attr_call: get 1 + pick: g attr_call: set ] bind: autogen634 
[ 
  check: elem pick: depth write_string_body ] bind: autogen635 
[ push: bind: write_sep 
  pick: root attr: name pick: True push: written pick: g attr_call: get attr_call: set ] bind: autogen636 
[ push: rebind: write_sep ] bind: autogen637 
[ push: nesting pick: g attr_call: get assign: nesting 
  debugger2 
  pick: root attr: name push: _ string_equal pushf: autogen634 if 
  push: nesting 0 pick: g attr_call: set 
  push: [ write_sep 
  push: nesting 1 pick: g attr_call: set 
  pick: root pushf: autogen635 for_in 
  push: ] write_sep 
  pick: root attr: name push: written pick: g attr_call: get attr_call: get None == pushf: autogen636 pushf: autogen637 if-else 
  pick: root attr: name write_sep 
  write_eol 
  push: nesting pick: nesting pick: g attr_call: set ] bind: autogen638 
[ newfunc2 assign: depth assign: root 
   pick: False pushf: autogen629 if 
   pick: root pick: FQuote_class is_instance pick: root pick: FList_class is_instance || pushf: autogen633 if 
   pick: root pick: FQuote_class is_instance pushf: autogen638 if return_no_value ] rebind: write_blocks 
[ push: is_bind:_ pick: child attr: len 2 - pick: child attr_call: get attr: value dprint ] bind: autogen639 
[ pick: child attr: len pushi: 4 - pick: child attr_call: get attr: value push: class string_equal ] bind: autogen640 
[ push: is_class:_ pick: child attr: len pushi: 4 - pick: child attr_call: get attr: value dprint 
  push: is_str:_ pick: child attr: len pushi: 4 - pick: child attr_call: get attr: value is_str dprint 
  push: str_eq:_ pick: child attr: len pushi: 4 - pick: child attr_call: get attr: value push: class string_equal dprint 
  push: lazy_cond:_ pushf: autogen640 pick: child attr: len pushi: 4 > lazy_and dprint ] bind: autogen641 
[ printeol 
  push: child:_ pick: child dprint 
  push: child.len:_ pick: child attr: len dprint 
   pick: child attr: len 2 > pushf: autogen639 if 
   pick: child attr: len pushi: 5 > pushf: autogen641 if ] bind: autogen642 
[ 
   pick: child pick: FList_class is_instance pushf: autogen642 if 
   debugger2 ] bind: print_child 
[ debugger2 ] bind: autogen643 
[ pick: s pick: s str_len pushi: 6 - pick: s str_len sub_str push: \ucolon string_equal ] bind: autogen644 
[ push: : pick: s 0 pick: s str_len pushi: 6 - sub_str 2 str_cat return2 ] bind: autogen645 
[ newfunc1 assign: s 
    pick: s str_len pushi: 6 > pushf: autogen643 if 
    pushf: autogen644 pick: s str_len pushi: 6 > lazy_and pushf: autogen645 if 
   pick: s return1 ] bind: replace_name 
[ newfunc2 assign: prefix assign: root 
  push: Dummy_function error return_no_value ] bind: write_suite 
[ push: nesting 0 pick: g attr_call: set 
  pick: child 0 write_string_body 
  write_eol ] bind: autogen646 
[ pick: child pick: FList_class is_instance ] bind: autogen647 
[ 1 drop1 ] bind: autogen648 
[ pick: child attr: name push: FComment string_equal not ] bind: autogen649 
[ pushf: autogen649 pick: child pick: forthe_class is_instance lazy_and ] bind: autogen650 
[ pick: body attr: name push: FStr string_equal pick: body attr: name push: FCall string_equal || ] bind: autogen651 
[ pick: child 0 write_string_body 
  write_eol ] bind: autogen652 
[ push: Unexpected_bind_body_length error ] bind: autogen653 
[ pick: child attr: len 1 - pick: child attr_call: get attr: value assign: func_name ] bind: autogen654 
[ pick: child attr: len 1 - pick: child attr_call: get attr: value push: . pick: prefix pushi: 3 str_cat assign: func_name ] bind: autogen655 
[ pick: child attr: len pushi: 4 == pushf: autogen653 if 
   pick: prefix None == pushf: autogen654 pushf: autogen655 if-else 
  check: func_name replace_name assign: func_name 
  pick: func_name pick: body attr_call: set_name 
  push: nesting 0 pick: g attr_call: set 
  pick: body 1 write_blocks ] bind: autogen656 
[ debugger2 
  0 pick: child attr_call: get assign: body 
  pushf: autogen651 pick: body pick: forthe_class is_instance lazy_and pushf: autogen652 pushf: autogen656 if-else ] bind: autogen657 
[ pick: child attr: len 2 - pick: child attr_call: get attr: value push: bind: string_equal pick: child attr: len pushi: 3 - pick: child attr_call: get pick: FQuote_class is_instance && ] bind: autogen658 
[ pushf: autogen658 pick: child attr: len 2 > lazy_and ] bind: autogen659 
[ pushf: autogen659 pick: child pick: FList_class is_instance lazy_and ] bind: autogen660 
[ debugger2 
  pick: child attr: len pushi: 4 - pick: child attr_call: get attr: value pick: child attr: len 1 - pick: child attr_call: get attr: value write_suite ] bind: autogen661 
[ pick: child attr: len pushi: 3 - pick: child attr_call: get attr: value push: class string_equal ] bind: autogen662 
[ pushf: autogen662 pick: child attr: len pushi: 3 > lazy_and ] bind: autogen663 
[ pushf: autogen663 pick: child pick: FList_class is_instance lazy_and ] bind: autogen664 
[ newfunc2 assign: prefix assign: child 
   pushf: autogen646 pushf: autogen647 pushf: autogen648 pushf: autogen650 pushf: autogen657 pushf: autogen660 pushf: autogen661 pushf: autogen664 pushi: 4 multi-if 
   debugger2 return_no_value ] bind: write_child 
[ 
  check: elem pick: prefix write_child ] bind: autogen665 
[ newfunc2 assign: prefix assign: root 
  pick: root pushf: autogen665 for_in return_no_value ] rebind: write_suite 
[ push: - print ] bind: autogen666 
[ newfunc2 assign: filename assign: sep 
   pushi: 50 0 pushf: autogen666 simple_for 
   pick: sep print 
   pick: filename print 
   printeol return_no_value ] bind: print_separator 
[ push: Parse_error_at_simplification_step. error ] bind: autogen667 
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
   pick: simplified pick: MatchError_class is_instance pushf: autogen667 if 
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
   check: elem printraw ] bind: autogen668 
[ check: elem compile_file ] bind: autogen669 
[ newfunc2 assign: output assign: filenames 
   pick: output init_g 
   push: file pick: g attr_call: get set_output 
   push: push:_ print 
   push: Generated\ufrom printraw 
   pick: filenames pushf: autogen668 for_in 
   push: \uprint print 
   printeol 
   None set_output 
   pick: filenames pushf: autogen669 for_in return_no_value ] bind: compile_all 
[ newfunc0 
   push: test/self.flpc push: lib/stage6b.flpc push: lib/stage6a.flpc push: lib/flpc\ugrammar.flpc push: lib/stage3b.flpc push: lib/stage3a.flpc push: lib/stage1d.flpc push: lib/stage1c.flpc push: lib/stage1b3.flpc push: lib/stage1b2.flpc push: lib/stage1b.flpc push: lib/stage1a.flpc push: lib/stage0.flpc pushi: 13 make_resizable assign: filenames 
   pick: filenames push: gen/output.f compile_all return_no_value ] bind: compile_self 
 compile_self 