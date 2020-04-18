push: Generated_from_lib/stage0.flpc_lib/stage1a.flpc_lib/stage1b.flpc_lib/stage1b2.flpc_lib/stage1b3.flpc_lib/stage1c.flpc_lib/stage1d.flpc_lib/stage3a.flpc_lib/stage3b.flpc_lib/flpc_grammar.flpc_lib/stage4.flpc_lib/stage5.flpc print
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
[ None return3 ] bind: autogen24 
[ check: i return3 ] bind: autogen25 
[ drop1 
  pick: self memory.get assign: i ] bind: autogen26 
[ check: i 1 - assign: i 
   pick: i pick: self boot_array.get 0 == pushf: autogen24 if 
   pick: key pick: i pick: self boot_array.get string_equal pushf: autogen25 if 
   pick: i 0 == pushf: autogen26 if ] bind: autogen27 
[ newfunc3 assign: self assign: i assign: key 
   s21 assign: i assign: self 
   pushf: autogen27 repeat return_no_value ] bind: boot_array.hash_index 
[ check: i return3 ] bind: autogen28 
[ drop1 
  pick: self memory.get assign: i ] bind: autogen29 
[ check: i 1 - assign: i 
   pick: i pick: self boot_array.get 0 == pushf: autogen28 if 
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
[ push: Dict_looking_up_ print 
  pick: name print 
  printeol ] bind: autogen47 
[ newfunc3 assign: searcher assign: receiver assign: name 
   pick: lookup_print pushf: autogen47 if 
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
[ None return3 ] bind: autogen48 
[ pick: index pick: end > pushf: autogen48 if 
  pick: index memory.get pick: index pushi: 3 + memory.get pick: names attr_call: set 
  check: index pushi: 7 + assign: index ] bind: autogen49 
[ newfunc0 
   functions.end assign: end 
   pick: names.get pushi: 5 + assign: index 
   pushf: autogen49 repeat return_no_value ] bind: convert_names 
[ push: lookup_error error ] bind: autogen50 
[ newfunc1 assign: name 
   check: name names2 hashtable.get assign: value 
   pick: value None == pushf: autogen50 if 
   pick: value return1 ] bind: names.get 
[ newfunc1 assign: value 
  input.next_token pick: value names2 hashtable.set return_no_value ] bind: new.bind 
 convert_names 
 push: bind: push: new.bind names2 hashtable.get names2 hashtable.set 
  push: bind: names2 hashtable.get rebind: bind: 
  push: names.get names2 hashtable.get rebind: names.get 
[ pick: index pick: func - return3 ] bind: autogen51 
[ pick: index memory.get pick: end_of_func == pushf: autogen51 if 
  check: index 1 + assign: index ] bind: autogen52 
[ newfunc1 assign: func 
   pick: func assign: index 
   pushf: autogen52 repeat return_no_value ] bind: func_len 
[ check: index return3 ] bind: autogen53 
[ check: index 1 + assign: index 
  pick: index memory.get pick: return_if == pushf: autogen53 if ] bind: autogen54 
[ newfunc1 assign: index 
  pushf: autogen54 repeat return_no_value ] bind: read_to_return_if 
[ None return3 ] bind: autogen55 
[ pick: index pushi: 3 + memory.get pick: index pushi: 5 + pick: attrib_hash attr_call: set ] bind: autogen56 
[ pick: index pick: end > pushf: autogen55 if 
  pick: index pushi: 3 + memory.get tprint 
  push: _ print 
  pick: index pushi: 6 + memory.get tprint 
  printeol 
  pick: index pushi: 3 + memory.get pick: attrib_hash attr_call: get None == pushf: autogen56 if 
  check: index pushi: 5 + read_to_return_if assign: index 
  check: index 1 + assign: index ] bind: autogen57 
[ newfunc2 assign: attrib_hash assign: attrib 
   pick: attrib func_len assign: len 
   pick: attrib pick: len + pushi: 16 - assign: end 
   pick: attrib pushi: 12 + assign: index 
   pushf: autogen57 repeat return_no_value ] bind: add_attrib 
[ push: Total_len:_ print 
  pick: len print 
  printeol 
  pick: len return3 ] bind: autogen58 
[ pick: obj pick: nullobj_cached == pushf: autogen58 if 
  check: len pick: obj attr: attrib_raw func_len + assign: len 
  pick: obj attr: parent assign: parent 
  push: 214 shuffle assign: len assign: obj ] bind: autogen59 
[ newfunc1 assign: obj 
   pick: nullobj assign: nullobj_cached 
   s21 assign: obj assign: nullobj_cached 
   pick: obj attr: attrib_raw func_len assign: len 
   pushf: autogen59 repeat return_no_value ] bind: obj_total_len 
[ pick: attrib_hash return3 ] bind: autogen60 
[ pick: obj pick: nullobj_cached == pushf: autogen60 if 
  pick: obj attr: attrib_raw pick: attrib_hash add_attrib assign: attrib_hash 
  pick: obj attr: parent assign: parent 
  push: 315 shuffle assign: attrib_hash assign: obj ] bind: autogen61 
[ newfunc1 assign: obj 
   pick: nullobj assign: nullobj_cached 
   s21 assign: obj assign: nullobj_cached 
   pick: obj obj_total_len assign: len 
   check: len hashtable assign: attrib_hash 
   pushf: autogen61 repeat return_no_value ] bind: convert_attr 
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
[ pick: self resizable.double ] bind: autogen62 
[ newfunc2 assign: self assign: value 
   pick: self memory.get pick: self resizable.max_len < not pushf: autogen62 if 
   pick: self memory.get pick: value pick: self resizable.set 
   pick: self resizable.increase return_no_value ] bind: resizable.append 
[ pick: l pick: i - pick: other resizable.get pick: self resizable.append 
  check: i 1 - assign: i ] bind: autogen63 
[ newfunc2 assign: self assign: other 
   pick: other attr: len assign: l 
   pick: l assign: i 
   pushf: autogen63 repeat_if return_no_value ] bind: resizable.extend 
[ return_no_value2 ] bind: autogen64 
[ pick: value pick: self resizable.extend ] bind: autogen65 
[ pick: value pick: self resizable.append ] bind: autogen66 
[ newfunc2 assign: self assign: value 
   pick: value None == pushf: autogen64 if 
   pick: value pick: resizable_class is_instance pushf: autogen65 pushf: autogen66 if-else return_no_value ] bind: resizable.append_array 
[ newfunc1 assign: self 
   pick: self memory.get 1 - pick: self memory.set 
   pick: self memory.get pick: self resizable.get return1 ] bind: resizable.pop 
[ newfunc1 assign: self 
  pick: self memory.get 1 - pick: self resizable.get return1 ] bind: resizable.top 
[ printspace ] bind: autogen67 
[ pick: l pick: i - pick: self resizable.get tprint 
  pick: i 1 > pushf: autogen67 if 
  check: i 1 - assign: i ] bind: autogen68 
[ newfunc1 assign: self 
   push: [ print 
   pick: self memory.get assign: l 
   pick: l assign: i 
   pushf: autogen68 repeat_if 
   push: ] print return_no_value ] bind: resizable.print 
[ push: Resizable_looking_up_ print 
  pick: name print 
  printeol ] bind: autogen69 
[ newfunc3 assign: searcher assign: receiver assign: name 
   pick: lookup_print pushf: autogen69 if 
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
[ pick: key pick: children resizable.get return2 ] bind: autogen70 
[ pick: children return3 ] bind: autogen71 
[ pick: key 0 == pushf: autogen71 if 
  push: Out_of_bound_index error ] bind: autogen72 
[ newfunc2 assign: self assign: key 
   pick: self 1 + memory.get assign: children 
   pick: children pick: resizable_class is_instance pushf: autogen70 pushf: autogen72 if-else return_no_value ] bind: node.get 
[ newfunc1 assign: self 
   pick: self memory.get printraw 
   push: { print 
   pick: self 1 + memory.get tprint 
   push: } print return_no_value ] bind: node.print 
[ pick: children memory.get return2 ] bind: autogen73 
[ 1 return2 ] bind: autogen74 
[ newfunc1 assign: self 
   pick: self 1 + memory.get assign: children 
   pick: children pick: resizable_class is_instance pushf: autogen73 pushf: autogen74 if-else return_no_value ] bind: node.len 
[ newfunc2 assign: self assign: new_name 
  pick: new_name pick: self memory.set return_no_value ] bind: node.set_name 
[ newfunc2 assign: self assign: new_children 
  pick: new_children pick: self 1 + memory.set return_no_value ] bind: node.set_children 
[ push: Node_looking_up_ print 
  pick: name print 
  printeol ] bind: autogen75 
[ newfunc3 assign: searcher assign: receiver assign: name 
   pick: lookup_print pushf: autogen75 if 
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
  printeol ] bind: autogen76 
[ newfunc3 assign: searcher assign: receiver assign: name 
   pick: lookup_print pushf: autogen76 if 
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
  printeol ] bind: autogen77 
[ newfunc3 assign: searcher assign: receiver assign: name 
   pick: lookup_print pushf: autogen77 if 
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
  printeol ] bind: autogen78 
[ newfunc3 assign: searcher assign: receiver assign: name 
   pick: lookup_print pushf: autogen78 if 
   pick: name push: instance string_equal pick: MatchError.instance return_if 
   pick: name push: print string_equal pick: MatchError.print return_if 
   pick: name push: type string_equal push: MatchError return_if 
   pick: name pick: receiver pick: searcher instance_attrib return1 ] bind: MatchError.attrib 
 pick: MatchError.attrib pick: boot_obj attr_call: subclass bind: MatchError_class 
 pick: MatchError_class attr: instance pick: MatchError_class closure bind: MatchError 
[ push: End_of_file MatchError return2 ] bind: autogen79 
[ push: Not_exactly MatchError return2 ] bind: autogen80 
[ newfunc1 assign: char 
   pick: source attr_call: next_char assign: input_char 
    pick: input_char None == pushf: autogen79 if 
    pick: char pick: input_char string_equal not pushf: autogen80 if 
   check: input_char return1 ] bind: exactly 
[ push: End_of_file MatchError return2 ] bind: autogen81 
[ push: Not_between MatchError return2 ] bind: autogen82 
[ newfunc2 assign: end assign: start 
   pick: source attr_call: next_char assign: input_char 
    pick: input_char None == pushf: autogen81 if 
    pick: start pick: end pick: input_char char_between not pushf: autogen82 if 
   check: input_char return1 ] bind: between 
[ push: End_of_file MatchError return2 ] bind: autogen83 
[ push: Not_exactly MatchError return2 ] bind: autogen84 
[ newfunc1 assign: char 
   pick: source attr_call: next assign: input_char 
    pick: input_char None == pushf: autogen83 if 
    pick: char pick: input_char string_equal not pushf: autogen84 if 
   check: input_char return1 ] bind: token 
[ 0 0 return_two2 ] bind: autogen85 
[ newfunc1 assign: children 
   pick: children memory.get pick: end_of_func == pushf: autogen85 if 
   pick: children 2 + pick: children 1 + memory.get return_two1 return_no_value ] bind: next_child 
[ check: output return3 ] bind: autogen86 
[ check: child call assign: output 
  pick: output pick: MatchError_class is_instance not pushf: autogen86 if 
  check: output drop1 
  pick: saved pick: source attr_call: position_set 
  check: children next_child assign: child assign: children ] bind: autogen87 
[ newfunc1 assign: children 
   pick: source attr_call: position assign: saved 
   s21 assign: children assign: saved 
   check: children next_child assign: child assign: children 
   pushf: autogen87 repeat_if 
   push: No_OR_child_matches MatchError return1 ] bind: or 
[ check: output return2 ] bind: autogen88 
[ newfunc1 assign: child 
   check: child call assign: output 
   pick: output pick: MatchError_class is_instance pushf: autogen88 if 
   push: out pick: output node return1 ] bind: out 
[ pick: output attr: name push: out string_equal return2 ] bind: autogen89 
[ newfunc1 assign: output 
   pick: output pick: node_class is_instance pushf: autogen89 if 
   pick: False return1 ] bind: is_output 
[ pick: outputs return3 ] bind: autogen90 
[ pick: outputs attr: array 1 + pick: length str_join return4 ] bind: autogen91 
[ pick: output str_len 1 == pushf: autogen91 if ] bind: autogen92 
[ pick: output return3 ] bind: autogen93 
[ pick: outputs attr: len assign: length 
  pick: length 0 == pushf: autogen90 if 
  0 pick: outputs attr_call: get assign: output 
   pick: output is_str pushf: autogen92 if 
   pick: length 1 == pushf: autogen93 if ] bind: autogen94 
[ pick: outputs attr: children return4 ] bind: autogen95 
[ pick: outputs attr: children is_str pushf: autogen95 if ] bind: autogen96 
[ pick: outputs pick: node_class is_instance pushf: autogen96 if ] bind: autogen97 
[ newfunc1 assign: outputs 
   pick: outputs pick: resizable_class is_instance pushf: autogen94 pushf: autogen97 if-else 
   pick: outputs return1 ] bind: make_string 
[ pick: saved pick: source attr_call: position_set 
  push: And_match_failed MatchError return3 ] bind: autogen98 
[ pick: output attr: children pick: outputs attr_call: append_array ] bind: autogen99 
[ pick: output is_output pushf: autogen99 if 
  check: output drop1 ] bind: autogen100 
[ 0 resizable assign: outputs 
  pick: output attr: children pick: outputs attr_call: append_array 
  pick: True assign: output_mode 
  s4127 assign: children assign: output_mode assign: outputs ] bind: autogen101 
[ pick: output pick: outputs attr_call: append_array 
  check: output drop1 ] bind: autogen102 
[ pick: output is_output pushf: autogen101 pushf: autogen102 if-else ] bind: autogen103 
[ check: child call assign: output 
   pick: output pick: MatchError_class is_instance pushf: autogen98 if 
   pick: output_mode pushf: autogen100 pushf: autogen103 if-else 
  check: children next_child assign: child assign: children ] bind: autogen104 
[ newfunc1 assign: init_children 
   pick: source attr_call: position assign: saved 
   0 resizable assign: outputs 
   pick: False assign: output_mode 
   pick: init_children assign: children 
   check: children next_child assign: child assign: children 
   pushf: autogen104 repeat_if 
   pick: outputs make_string return1 ] bind: and 
[ 0 c.infinity return_two2 ] bind: autogen105 
[ 1 c.infinity return_two2 ] bind: autogen106 
[ 0 1 return_two2 ] bind: autogen107 
[ newfunc1 assign: quantifier 
    pick: quantifier push: * string_equal pushf: autogen105 if 
    pick: quantifier push: + string_equal pushf: autogen106 if 
    pick: quantifier push: ? string_equal pushf: autogen107 if 
   push: Unknown_quantifier error return_no_value ] bind: get_bounds 
[ pick: start_saved pick: source attr_call: position_set 
  push: Quantified_undermatch MatchError return4 ] bind: autogen108 
[ pick: count pick: lower < pushf: autogen108 if 
  pick: saved pick: source attr_call: position_set 
  pick: outputs make_string return3 ] bind: autogen109 
[ pick: outputs make_string return3 ] bind: autogen110 
[ pick: source attr_call: position assign: saved 
  pick: child call assign: output 
  pick: output pick: MatchError_class is_instance pushf: autogen109 if 
  check: output pick: outputs attr_call: append_array 
  check: saved drop1 
  check: count 1 + assign: count 
  pick: count pick: upper == pushf: autogen110 if ] bind: autogen111 
[ newfunc2 assign: quantifier assign: child 
   check: quantifier get_bounds assign: upper assign: lower 
   0 resizable assign: outputs 
   pick: source attr_call: position assign: start_saved 
   0 assign: count 
   pushf: autogen111 repeat return_no_value ] bind: quantified 
[ None return2 ] bind: autogen112 
[ newfunc1 assign: child 
   pick: source attr_call: position assign: saved 
   s21 assign: child assign: saved 
   check: child call assign: output 
   pick: saved pick: source attr_call: position_set 
   pick: output pick: MatchError_class is_instance pushf: autogen112 if 
   push: Negation_is_true MatchError return1 ] bind: negation 
[ pick: output return2 ] bind: autogen113 
[ newfunc2 assign: name assign: child 
   pick: child call assign: output 
   pick: output pick: MatchError_class is_instance pushf: autogen113 if 
   pick: name pick: output node return1 ] bind: bound 
 0 resizable bind: flagged 
[ pick: output attr: len 1 > return2 ] bind: autogen114 
[ newfunc1 assign: output 
   pick: output pick: resizable_class is_instance pushf: autogen114 if 
   pick: False return1 ] bind: should_make_node 
 pushi: 223 hashtable bind: rules 
 0 resizable bind: indentation 
 1 boot_array bind: nest 
 0 0 pick: nest attr_call: set 
[ newfunc1 assign: name 
  push: Dummy error return_no_value ] bind: _apply 
 pick: False bind: apply_print 
[ printspace 
  check: i 1 - assign: i ] bind: autogen115 
[ pick: nesting assign: i 
  pushf: autogen115 repeat_if 
  pick: name print 
  printspace 
  pick: source attr_call: position tprint 
  printeol ] bind: autogen116 
[ printspace 
  check: i 1 - assign: i ] bind: autogen117 
[ pick: nesting assign: i 
  pushf: autogen117 repeat_if 
  pick: name print 
  printspace 
  pick: source attr_call: position tprint 
  push: _->_ print 
  pick: output tprint 
  printeol ] bind: autogen118 
[ printspace 
  check: i 1 - assign: i ] bind: autogen119 
[ pick: nesting assign: i 
  pushf: autogen119 repeat_if 
  pick: name print 
  push: _->_ print 
  pick: output tprint 
  printeol ] bind: autogen120 
[ pick: output return2 ] bind: autogen121 
[ push: Making_node_ print 
  pick: name printraw 
  printeol 
  pick: name pick: output node return2 ] bind: autogen122 
[ pick: output return2 ] bind: autogen123 
[ newfunc1 assign: name 
   0 pick: nest attr_call: get assign: nesting 
   pick: apply_print pushf: autogen116 if 
   0 pick: nesting 1 + pick: nest attr_call: set 
   pick: name pick: rules hashtable.get call assign: output 
   0 pick: nesting pick: nest attr_call: set 
    pick: apply_print pushf: autogen118 if 
    pick: name push: statement string_equal pushf: autogen120 if 
    pick: output pick: MatchError_class is_instance pushf: autogen121 if 
    pick: output should_make_node pushf: autogen122 if 
    pick: name pick: flagged attr_call: string_index None == pushf: autogen123 if 
   pick: name pick: output node return1 ] rebind: _apply 
[ check: new_pos pick: source attr_call: position_set 
  check: mem_out return2 ] bind: autogen124 
[ pick: source attr_call: position assign: saved 
  pick: name _apply assign: output 
  pick: name pick: saved pick: indentation pick: output pick: source attr_call: position memoizer.set 
  check: output return2 ] bind: autogen125 
[ newfunc1 assign: name 
   pick: name pick: source attr_call: position pick: indentation memoizer.get assign: memoized assign: new_pos assign: mem_out 
   check: memoized pushf: autogen124 pushf: autogen125 if-else return_no_value ] bind: apply 
[ push: End_of_file MatchError return2 ] bind: autogen126 
[ newfunc0 
   pick: source attr_call: next_char assign: char 
   pick: char None == pushf: autogen126 if 
   check: char return1 ] bind: rule.anything 
[ push: a push: z between ] bind: autogen127 
[ push: A push: Z between ] bind: autogen128 
[ pushf: autogen127 pushf: autogen128 ] bind: autogen129 
[ newfunc0 
  pushf: autogen129 or return1 ] bind: rule.letter 
[ newfunc0 
  push: 0 push: 9 between return1 ] bind: rule.digit 
[ push: rule.letter apply ] bind: autogen130 
[ push: _ exactly ] bind: autogen131 
[ pushf: autogen130 pushf: autogen131 ] bind: autogen132 
[ pushf: autogen132 or ] bind: autogen133 
[ push: rule.letter apply ] bind: autogen134 
[ push: rule.digit apply ] bind: autogen135 
[ push: _ exactly ] bind: autogen136 
[ pushf: autogen134 pushf: autogen135 pushf: autogen136 ] bind: autogen137 
[ pushf: autogen137 or ] bind: autogen138 
[ pushf: autogen138 push: * quantified ] bind: autogen139 
[ pushf: autogen133 pushf: autogen139 ] bind: autogen140 
[ newfunc0 
  pushf: autogen140 and return1 ] bind: rule.name 
 functions.end pushi: 5 + assign: source_index 
 push: grammar/flpc.grammar Input bind: source 
 push: stage2.pkl load 
 push:  rule. bind: prefix 
[ newfunc1 assign: root 
  push: Dummy_function_should_not_be_called error return_no_value ] bind: to_flpc2 
[ pick: root printrepr 
  return_no_value2 ] bind: autogen141 
[ 0 pick: root attr_call: get to_flpc2 return_no_value2 ] bind: autogen142 
[ 0 pick: root attr_call: get to_flpc2 return_no_value2 ] bind: autogen143 
[ 0 pick: root attr_call: get tprint 
  push: Unexpected_child_of_exactly._Was_expecting_a_escaped_chart. error ] bind: autogen144 
[ 0 pick: root attr_call: get attr: name push: escaped_char string_equal not pushf: autogen144 if 
  pick: root attr: name 0 0 pick: root attr_call: get attr_call: get node to_flpc2 return_no_value2 ] bind: autogen145 
[ pick: prefix print 
  0 0 pick: root attr_call: get attr_call: get printraw 
  push: _<-_fun[]:\n____return( print 
  pushi: 3 pick: root attr_call: get to_flpc2 
  push: ) print 
  return_no_value2 ] bind: autogen146 
[ push: out print ] bind: autogen147 
[ pick: name printraw ] bind: autogen148 
[ push: [ print ] bind: autogen149 
[ push: [ print ] bind: autogen150 
[ check: bracket 1 + assign: bracket ] bind: autogen151 
[ check: bracket 1 + assign: bracket ] bind: autogen152 
[ check: bracket 1 + assign: bracket ] bind: autogen153 
[ pick: child attr: name push: quantifier string_equal pushf: autogen152 if 
  pick: child attr: name push: inline string_equal pushf: autogen153 if ] bind: autogen154 
[ push: [ print ] bind: autogen155 
[ push: ] print ] bind: autogen156 
[ push: _ print ] bind: autogen157 
[ pick: l pick: i - pick: root attr_call: get assign: child 
  0 assign: bracket 
   pick: child pick: node_class is_instance not pushf: autogen151 pushf: autogen154 if-else 
   pick: bracket not pushf: autogen155 if 
  s21 assign: child assign: bracket 
  check: child to_flpc2 
  check: bracket not pushf: autogen156 if 
  check: i 1 - assign: i 
  pick: i pushf: autogen157 if ] bind: autogen158 
[ push: ] print ] bind: autogen159 
[ push: ] print ] bind: autogen160 
[ newfunc1 assign: root 
   pick: root pick: node_class is_instance not pushf: autogen141 if 
   pick: root attr: name assign: name 
    pick: name push: quantifier string_equal pushf: autogen142 if 
    pick: name push: inline string_equal pushf: autogen143 if 
    pick: name push: exactly string_equal 0 pick: root attr_call: get pick: node_class is_instance && pushf: autogen145 if 
    pick: name push: rule string_equal pushf: autogen146 if 
    pick: name push: output string_equal pushf: autogen147 pushf: autogen148 if-else 
   push: ( print 
    pick: name push: and string_equal pushf: autogen149 if 
    pick: name push: or string_equal pushf: autogen150 if 
   pick: root attr: len assign: l 
   pick: l assign: i 
    pushf: autogen158 repeat_if 
    pick: name push: and string_equal pushf: autogen159 if 
    pick: name push: or string_equal pushf: autogen160 if 
   push: ) print return_no_value ] rebind: to_flpc2 
[ pick: l pick: i - pick: root attr_call: get to_flpc2 
  printeol 
  printeol 
  check: i 1 - assign: i ] bind: autogen161 
[ pick: l pick: i - pick: root attr_call: get assign: child 
  push: hashtable.set(" print 
  0 0 pick: child attr_call: get attr_call: get printraw 
  push: "_ print 
  pick: prefix print 
  0 0 pick: child attr_call: get attr_call: get printraw 
  push: _rules) print 
  printeol 
  check: child drop1 
  check: i 1 - assign: i ] bind: autogen162 
[ newfunc1 assign: root 
   pick: root attr: len assign: l 
   pick: l assign: i 
   pushf: autogen161 repeat_if 
   pick: root attr: len assign: l 
   pick: l assign: i 
   pushf: autogen162 repeat_if return_no_value ] bind: to_flpc2_grammar 
 0 pick: indentation attr_call: append 
[ None return2 ] bind: autogen163 
[ newfunc0 
   pick: source attr_call: position assign: saved 
   push: hspaces apply make_string assign: s 
   pick: indentation attr_call: top pick: s str_len == pushf: autogen163 if 
   pick: saved pick: source attr_call: position_set 
   push: Different_indent MatchError return1 ] bind: rule.SAME_INDENT 
[ newfunc0 
   pick: indentation attr_call: pop 
   None return1 ] bind: rule.DEDENT 
[ pick: saved pick: source attr_call: position_set 
  push: Missing_newline_before_indent MatchError return2 ] bind: autogen164 
[ newfunc0 
   pick: source attr_call: position assign: saved 
   push: NEWLINE apply pick: MatchError_class is_instance pushf: autogen164 if 
   push: hspaces apply make_string assign: s 
   pick: saved pick: source attr_call: position_set 
   pick: s str_len pick: indentation attr_call: append 
   None return1 ] bind: rule.INDENT 
[ newfunc0 
  None return1 ] bind: rule.void 
[ check: output 1 + memory.get make_string assign: output ] bind: autogen165 
[ push: NAME apply assign: output 
  pick: output pick: node_class is_instance pushf: autogen165 if ] bind: autogen166 
[ push: Not_token_or_EOF MatchError return3 ] bind: autogen167 
[ pick: s pick: source attr_call: startswith assign: output 
  pick: output None == pushf: autogen167 if 
  check: output return2 ] bind: autogen168 
[ pick: output return2 ] bind: autogen169 
[ push: End_of_file MatchError return2 ] bind: autogen170 
[ push: Not_exactly_token MatchError return2 ] bind: autogen171 
[ newfunc1 assign: s 
   pick: source attr_call: position assign: saved 
   push: spaces apply drop1 
    pick: s is_alpha pushf: autogen166 pushf: autogen168 if-else 
    pick: output pick: MatchError_class is_instance pushf: autogen169 if 
    pick: output None == pushf: autogen170 if 
    pick: output pick: s string_equal not pushf: autogen171 if 
   pick: output return1 ] rebind: token 
 push: Regenerating_ print 
 pick: rules attr: len print 
 printeol 
 pick: rules attr: len boot_array pick: rules 1 + memory.set 
 pick: rules attr: len boot_array pick: rules 2 + memory.set 
 push: letter pick: rule.letter pick: rules hashtable.set 
 push: digit pick: rule.digit pick: rules hashtable.set 
 push: anything pick: rule.anything pick: rules hashtable.set 
 push: INDENT pick: rule.INDENT pick: rules hashtable.set 
 push: DEDENT pick: rule.DEDENT pick: rules hashtable.set 
 push: void pick: rule.void pick: rules hashtable.set 
 push: SAME_INDENT pick: rule.SAME_INDENT pick: rules hashtable.set 
[ push: # exactly ] bind: autogen172 
[ push: \n exactly ] bind: autogen173 
[ pushf: autogen173 negation ] bind: autogen174 
[ push: anything apply ] bind: autogen175 
[ pushf: autogen175 out ] bind: autogen176 
[ pushf: autogen174 pushf: autogen176 ] bind: autogen177 
[ pushf: autogen177 and ] bind: autogen178 
[ pushf: autogen178 push: * quantified ] bind: autogen179 
[ pushf: autogen179 out ] bind: autogen180 
[ pushf: autogen172 pushf: autogen180 ] bind: autogen181 
[ pushf: autogen181 and ] bind: autogen182 
[ newfunc0 
  pushf: autogen182 push: comment bound return1 ] bind: rule.comment 
[ push: \n exactly ] bind: autogen183 
[ push: \r exactly ] bind: autogen184 
[ push: \s exactly ] bind: autogen185 
[ push: \t exactly ] bind: autogen186 
[ pushf: autogen183 pushf: autogen184 pushf: autogen185 pushf: autogen186 ] bind: autogen187 
[ newfunc0 
  pushf: autogen187 or return1 ] bind: rule.space 
[ push: space apply ] bind: autogen188 
[ newfunc0 
  pushf: autogen188 push: * quantified return1 ] bind: rule.spaces 
[ push: space apply ] bind: autogen189 
[ newfunc0 
  pushf: autogen189 push: + quantified return1 ] bind: rule.spacesp 
[ push: \s exactly ] bind: autogen190 
[ push: \t exactly ] bind: autogen191 
[ pushf: autogen190 pushf: autogen191 ] bind: autogen192 
[ pushf: autogen192 or ] bind: autogen193 
[ newfunc0 
  pushf: autogen193 push: * quantified return1 ] bind: rule.hspaces 
[ push: \s exactly ] bind: autogen194 
[ push: \t exactly ] bind: autogen195 
[ pushf: autogen194 pushf: autogen195 ] bind: autogen196 
[ pushf: autogen196 or ] bind: autogen197 
[ newfunc0 
  pushf: autogen197 push: + quantified return1 ] bind: rule.hspacesp 
[ push: hspaces apply ] bind: autogen198 
[ push: comment apply ] bind: autogen199 
[ pushf: autogen199 push: ? quantified ] bind: autogen200 
[ push: \n exactly ] bind: autogen201 
[ push: \r exactly ] bind: autogen202 
[ pushf: autogen201 pushf: autogen202 ] bind: autogen203 
[ pushf: autogen203 or ] bind: autogen204 
[ pushf: autogen198 pushf: autogen200 pushf: autogen204 ] bind: autogen205 
[ pushf: autogen205 and ] bind: autogen206 
[ newfunc0 
  pushf: autogen206 push: EMPTY_LINE bound return1 ] bind: rule.EMPTY_LINE 
[ push: hspaces apply ] bind: autogen207 
[ push: - exactly ] bind: autogen208 
[ pushf: autogen208 push: ? quantified ] bind: autogen209 
[ push: digit apply ] bind: autogen210 
[ pushf: autogen210 push: + quantified ] bind: autogen211 
[ pushf: autogen209 pushf: autogen211 ] bind: autogen212 
[ pushf: autogen212 and ] bind: autogen213 
[ pushf: autogen213 out ] bind: autogen214 
[ pushf: autogen207 pushf: autogen214 ] bind: autogen215 
[ newfunc0 
  pushf: autogen215 and return1 ] bind: rule.NUMBER 
[ push: hspaces apply ] bind: autogen216 
[ push: " exactly ] bind: autogen217 
[ push: " exactly ] bind: autogen218 
[ pushf: autogen218 negation ] bind: autogen219 
[ push: anything apply ] bind: autogen220 
[ pushf: autogen219 pushf: autogen220 ] bind: autogen221 
[ pushf: autogen221 and ] bind: autogen222 
[ pushf: autogen222 push: * quantified ] bind: autogen223 
[ pushf: autogen223 out ] bind: autogen224 
[ push: " exactly ] bind: autogen225 
[ pushf: autogen217 pushf: autogen224 pushf: autogen225 ] bind: autogen226 
[ pushf: autogen226 and ] bind: autogen227 
[ push: ' exactly ] bind: autogen228 
[ push: ' exactly ] bind: autogen229 
[ pushf: autogen229 negation ] bind: autogen230 
[ push: anything apply ] bind: autogen231 
[ pushf: autogen230 pushf: autogen231 ] bind: autogen232 
[ pushf: autogen232 and ] bind: autogen233 
[ pushf: autogen233 push: * quantified ] bind: autogen234 
[ pushf: autogen234 out ] bind: autogen235 
[ push: ' exactly ] bind: autogen236 
[ pushf: autogen228 pushf: autogen235 pushf: autogen236 ] bind: autogen237 
[ pushf: autogen237 and ] bind: autogen238 
[ pushf: autogen227 pushf: autogen238 ] bind: autogen239 
[ pushf: autogen239 or ] bind: autogen240 
[ pushf: autogen216 pushf: autogen240 ] bind: autogen241 
[ newfunc0 
  pushf: autogen241 and return1 ] bind: rule.STRING 
[ push: hspaces apply ] bind: autogen242 
[ push: letter apply ] bind: autogen243 
[ push: _ exactly ] bind: autogen244 
[ pushf: autogen243 pushf: autogen244 ] bind: autogen245 
[ pushf: autogen245 or ] bind: autogen246 
[ push: space apply ] bind: autogen247 
[ pushf: autogen247 negation ] bind: autogen248 
[ push: ( exactly ] bind: autogen249 
[ pushf: autogen249 negation ] bind: autogen250 
[ push: = exactly ] bind: autogen251 
[ pushf: autogen251 negation ] bind: autogen252 
[ push: ) exactly ] bind: autogen253 
[ pushf: autogen253 negation ] bind: autogen254 
[ push: [ exactly ] bind: autogen255 
[ pushf: autogen255 negation ] bind: autogen256 
[ push: ] exactly ] bind: autogen257 
[ pushf: autogen257 negation ] bind: autogen258 
[ push: < exactly ] bind: autogen259 
[ pushf: autogen259 negation ] bind: autogen260 
[ push: : exactly ] bind: autogen261 
[ pushf: autogen261 negation ] bind: autogen262 
[ push: ' exactly ] bind: autogen263 
[ pushf: autogen263 negation ] bind: autogen264 
[ push: anything apply ] bind: autogen265 
[ pushf: autogen248 pushf: autogen250 pushf: autogen252 pushf: autogen254 pushf: autogen256 pushf: autogen258 pushf: autogen260 pushf: autogen262 pushf: autogen264 pushf: autogen265 ] bind: autogen266 
[ pushf: autogen266 and ] bind: autogen267 
[ pushf: autogen267 push: * quantified ] bind: autogen268 
[ pushf: autogen246 pushf: autogen268 ] bind: autogen269 
[ pushf: autogen269 and ] bind: autogen270 
[ pushf: autogen270 out ] bind: autogen271 
[ pushf: autogen242 pushf: autogen271 ] bind: autogen272 
[ newfunc0 
  pushf: autogen272 and return1 ] bind: rule.NAME 
[ push: hspacesp apply ] bind: autogen273 
[ push: 'F token ] bind: autogen274 
[ pushf: autogen274 negation ] bind: autogen275 
[ push: space apply ] bind: autogen276 
[ pushf: autogen276 negation ] bind: autogen277 
[ push: anything apply ] bind: autogen278 
[ pushf: autogen277 pushf: autogen278 ] bind: autogen279 
[ pushf: autogen279 and ] bind: autogen280 
[ pushf: autogen280 push: * quantified ] bind: autogen281 
[ pushf: autogen281 out ] bind: autogen282 
[ pushf: autogen273 pushf: autogen275 pushf: autogen282 ] bind: autogen283 
[ newfunc0 
  pushf: autogen283 and return1 ] bind: rule.FORTH_NAME 
[ push: + token ] bind: autogen284 
[ push: - token ] bind: autogen285 
[ push: / token ] bind: autogen286 
[ push: == token ] bind: autogen287 
[ push: < token ] bind: autogen288 
[ push: > token ] bind: autogen289 
[ push: . token ] bind: autogen290 
[ push: in token ] bind: autogen291 
[ push: || token ] bind: autogen292 
[ push: && token ] bind: autogen293 
[ pushf: autogen284 pushf: autogen285 pushf: autogen286 pushf: autogen287 pushf: autogen288 pushf: autogen289 pushf: autogen290 pushf: autogen291 pushf: autogen292 pushf: autogen293 ] bind: autogen294 
[ newfunc0 
  pushf: autogen294 or return1 ] bind: rule.bin_op 
[ push: NAME apply ] bind: autogen295 
[ newfunc0 
  pushf: autogen295 push: * quantified return1 ] bind: rule.names 
[ newfunc0 
  push: NAME apply return1 ] bind: rule.variable 
[ push: ` token ] bind: autogen296 
[ push: NAME apply ] bind: autogen297 
[ pushf: autogen297 out ] bind: autogen298 
[ pushf: autogen296 pushf: autogen298 ] bind: autogen299 
[ newfunc0 
  pushf: autogen299 and return1 ] bind: rule.name_quote 
[ push: [ token ] bind: autogen300 
[ push: ] token ] bind: autogen301 
[ pushf: autogen301 negation ] bind: autogen302 
[ push: spaces apply ] bind: autogen303 
[ push: statement apply ] bind: autogen304 
[ pushf: autogen304 out ] bind: autogen305 
[ pushf: autogen302 pushf: autogen303 pushf: autogen305 ] bind: autogen306 
[ pushf: autogen306 and ] bind: autogen307 
[ pushf: autogen307 push: + quantified ] bind: autogen308 
[ pushf: autogen308 out ] bind: autogen309 
[ push: ] token ] bind: autogen310 
[ pushf: autogen300 pushf: autogen309 pushf: autogen310 ] bind: autogen311 
[ newfunc0 
  pushf: autogen311 and return1 ] bind: rule.quote 
[ push: F' token ] bind: autogen312 
[ push: forth_line apply ] bind: autogen313 
[ push: hspaces apply ] bind: autogen314 
[ push: \n exactly ] bind: autogen315 
[ push: \r exactly ] bind: autogen316 
[ pushf: autogen315 pushf: autogen316 ] bind: autogen317 
[ pushf: autogen317 or ] bind: autogen318 
[ push: forth_line apply ] bind: autogen319 
[ pushf: autogen319 out ] bind: autogen320 
[ pushf: autogen314 pushf: autogen318 pushf: autogen320 ] bind: autogen321 
[ pushf: autogen321 and ] bind: autogen322 
[ pushf: autogen322 push: * quantified ] bind: autogen323 
[ pushf: autogen313 pushf: autogen323 ] bind: autogen324 
[ pushf: autogen324 and ] bind: autogen325 
[ pushf: autogen325 out ] bind: autogen326 
[ push: spaces apply ] bind: autogen327 
[ push: 'F token ] bind: autogen328 
[ pushf: autogen312 pushf: autogen326 pushf: autogen327 pushf: autogen328 ] bind: autogen329 
[ newfunc0 
  pushf: autogen329 and return1 ] bind: rule.forth 
[ push: FORTH_NAME apply ] bind: autogen330 
[ pushf: autogen330 push: NAME bound ] bind: autogen331 
[ newfunc0 
  pushf: autogen331 push: * quantified return1 ] bind: rule.forth_line 
[ push: [ token ] bind: autogen332 
[ push: names apply ] bind: autogen333 
[ pushf: autogen333 out ] bind: autogen334 
[ push: ] token ] bind: autogen335 
[ pushf: autogen332 pushf: autogen334 pushf: autogen335 ] bind: autogen336 
[ newfunc0 
  pushf: autogen336 and return1 ] bind: rule.simple_quote 
[ push: ( token ] bind: autogen337 
[ push: expr apply ] bind: autogen338 
[ pushf: autogen338 out ] bind: autogen339 
[ push: ) token ] bind: autogen340 
[ pushf: autogen337 pushf: autogen339 pushf: autogen340 ] bind: autogen341 
[ newfunc0 
  pushf: autogen341 and return1 ] bind: rule.parenthesis 
[ push: NAME apply ] bind: autogen342 
[ push: bin_op apply ] bind: autogen343 
[ pushf: autogen343 push: NAME bound ] bind: autogen344 
[ pushf: autogen342 pushf: autogen344 ] bind: autogen345 
[ pushf: autogen345 or ] bind: autogen346 
[ pushf: autogen346 out ] bind: autogen347 
[ push: ( exactly ] bind: autogen348 
[ push: exprs apply ] bind: autogen349 
[ pushf: autogen349 push: parameters bound ] bind: autogen350 
[ pushf: autogen350 out ] bind: autogen351 
[ push: ) token ] bind: autogen352 
[ pushf: autogen347 pushf: autogen348 pushf: autogen351 pushf: autogen352 ] bind: autogen353 
[ newfunc0 
  pushf: autogen353 and return1 ] bind: rule.func_call 
[ push: NAME apply ] bind: autogen354 
[ push: simple_quote apply ] bind: autogen355 
[ push: non_block apply ] bind: autogen356 
[ push: void apply ] bind: autogen357 
[ pushf: autogen355 pushf: autogen356 pushf: autogen357 ] bind: autogen358 
[ pushf: autogen358 or ] bind: autogen359 
[ pushf: autogen359 out ] bind: autogen360 
[ push: : token ] bind: autogen361 
[ push: suite apply ] bind: autogen362 
[ pushf: autogen362 push: quote bound ] bind: autogen363 
[ pushf: autogen363 out ] bind: autogen364 
[ pushf: autogen360 pushf: autogen361 pushf: autogen364 ] bind: autogen365 
[ pushf: autogen365 and ] bind: autogen366 
[ pushf: autogen366 push: parameters bound ] bind: autogen367 
[ pushf: autogen354 pushf: autogen367 ] bind: autogen368 
[ newfunc0 
  pushf: autogen368 and return1 ] bind: rule.block_call 
[ push: block_call apply ] bind: autogen369 
[ push: NEWLINE apply ] bind: autogen370 
[ pushf: autogen370 push: + quantified ] bind: autogen371 
[ push: SAME_INDENT apply ] bind: autogen372 
[ push: block_call apply ] bind: autogen373 
[ pushf: autogen373 out ] bind: autogen374 
[ pushf: autogen371 pushf: autogen372 pushf: autogen374 ] bind: autogen375 
[ pushf: autogen375 and ] bind: autogen376 
[ pushf: autogen376 push: + quantified ] bind: autogen377 
[ pushf: autogen369 pushf: autogen377 ] bind: autogen378 
[ newfunc0 
  pushf: autogen378 and return1 ] bind: rule.multi_block_call 
[ push: forth apply ] bind: autogen379 
[ push: func_call apply ] bind: autogen380 
[ push: name_quote apply ] bind: autogen381 
[ push: quote apply ] bind: autogen382 
[ push: parenthesis apply ] bind: autogen383 
[ push: NUMBER apply ] bind: autogen384 
[ push: STRING apply ] bind: autogen385 
[ push: variable apply ] bind: autogen386 
[ pushf: autogen379 pushf: autogen380 pushf: autogen381 pushf: autogen382 pushf: autogen383 pushf: autogen384 pushf: autogen385 pushf: autogen386 ] bind: autogen387 
[ newfunc0 
  pushf: autogen387 or return1 ] bind: rule.non_block_non_infix 
[ push: infix apply ] bind: autogen388 
[ push: non_block_non_infix apply ] bind: autogen389 
[ pushf: autogen388 pushf: autogen389 ] bind: autogen390 
[ newfunc0 
  pushf: autogen390 or return1 ] bind: rule.non_block 
[ push: non_block_non_infix apply ] bind: autogen391 
[ push: bin_op apply ] bind: autogen392 
[ pushf: autogen392 push: op bound ] bind: autogen393 
[ push: non_block_non_infix apply ] bind: autogen394 
[ pushf: autogen393 pushf: autogen394 ] bind: autogen395 
[ pushf: autogen395 and ] bind: autogen396 
[ pushf: autogen396 push: + quantified ] bind: autogen397 
[ pushf: autogen391 pushf: autogen397 ] bind: autogen398 
[ newfunc0 
  pushf: autogen398 and return1 ] bind: rule.infix 
[ push: block_call apply ] bind: autogen399 
[ push: non_block_non_infix apply ] bind: autogen400 
[ pushf: autogen399 pushf: autogen400 ] bind: autogen401 
[ newfunc0 
  pushf: autogen401 or return1 ] bind: rule.non_infix 
[ push: infix apply ] bind: autogen402 
[ push: non_infix apply ] bind: autogen403 
[ pushf: autogen402 pushf: autogen403 ] bind: autogen404 
[ newfunc0 
  pushf: autogen404 or return1 ] bind: rule.expr 
[ push: expr apply ] bind: autogen405 
[ push: spacesp apply ] bind: autogen406 
[ push: expr apply ] bind: autogen407 
[ pushf: autogen407 out ] bind: autogen408 
[ pushf: autogen406 pushf: autogen408 ] bind: autogen409 
[ pushf: autogen409 and ] bind: autogen410 
[ pushf: autogen410 push: * quantified ] bind: autogen411 
[ pushf: autogen405 pushf: autogen411 ] bind: autogen412 
[ pushf: autogen412 and ] bind: autogen413 
[ push: void apply ] bind: autogen414 
[ pushf: autogen413 pushf: autogen414 ] bind: autogen415 
[ newfunc0 
  pushf: autogen415 or return1 ] bind: rule.exprs 
[ push: expr apply ] bind: autogen416 
[ push: hspacesp apply ] bind: autogen417 
[ push: expr apply ] bind: autogen418 
[ pushf: autogen418 out ] bind: autogen419 
[ pushf: autogen417 pushf: autogen419 ] bind: autogen420 
[ pushf: autogen420 and ] bind: autogen421 
[ pushf: autogen421 push: * quantified ] bind: autogen422 
[ pushf: autogen416 pushf: autogen422 ] bind: autogen423 
[ newfunc0 
  pushf: autogen423 and return1 ] bind: rule.exprsp 
[ push: names apply ] bind: autogen424 
[ pushf: autogen424 out ] bind: autogen425 
[ push: = token ] bind: autogen426 
[ push: space apply ] bind: autogen427 
[ pushf: autogen425 pushf: autogen426 pushf: autogen427 ] bind: autogen428 
[ pushf: autogen428 and ] bind: autogen429 
[ push: void apply ] bind: autogen430 
[ pushf: autogen429 pushf: autogen430 ] bind: autogen431 
[ pushf: autogen431 or ] bind: autogen432 
[ push: exprsp apply ] bind: autogen433 
[ pushf: autogen432 pushf: autogen433 ] bind: autogen434 
[ newfunc0 
  pushf: autogen434 and return1 ] bind: rule.assign 
[ push: names apply ] bind: autogen435 
[ pushf: autogen435 out ] bind: autogen436 
[ push: <- token ] bind: autogen437 
[ push: exprsp apply ] bind: autogen438 
[ pushf: autogen438 out ] bind: autogen439 
[ pushf: autogen436 pushf: autogen437 pushf: autogen439 ] bind: autogen440 
[ newfunc0 
  pushf: autogen440 and return1 ] bind: rule.bind 
[ push: multi_block_call apply ] bind: autogen441 
[ push: bind apply ] bind: autogen442 
[ push: assign apply ] bind: autogen443 
[ pushf: autogen441 pushf: autogen442 pushf: autogen443 ] bind: autogen444 
[ newfunc0 
  pushf: autogen444 or return1 ] bind: rule.statement 
[ push: INDENT apply ] bind: autogen445 
[ push: NEWLINE apply ] bind: autogen446 
[ pushf: autogen446 push: + quantified ] bind: autogen447 
[ push: SAME_INDENT apply ] bind: autogen448 
[ push: statement apply ] bind: autogen449 
[ pushf: autogen447 pushf: autogen448 pushf: autogen449 ] bind: autogen450 
[ pushf: autogen450 and ] bind: autogen451 
[ pushf: autogen451 push: + quantified ] bind: autogen452 
[ push: DEDENT apply ] bind: autogen453 
[ pushf: autogen445 pushf: autogen452 pushf: autogen453 ] bind: autogen454 
[ pushf: autogen454 and ] bind: autogen455 
[ push: statement apply ] bind: autogen456 
[ pushf: autogen455 pushf: autogen456 ] bind: autogen457 
[ newfunc0 
  pushf: autogen457 or return1 ] bind: rule.suite 
[ push: hspaces apply ] bind: autogen458 
[ push: \n exactly ] bind: autogen459 
[ push: \r exactly ] bind: autogen460 
[ pushf: autogen459 pushf: autogen460 ] bind: autogen461 
[ pushf: autogen461 or ] bind: autogen462 
[ pick: None out ] bind: autogen463 
[ pushf: autogen458 pushf: autogen462 pushf: autogen463 ] bind: autogen464 
[ pushf: autogen464 and ] bind: autogen465 
[ push: COMMENT_LINE apply ] bind: autogen466 
[ pushf: autogen465 pushf: autogen466 ] bind: autogen467 
[ newfunc0 
  pushf: autogen467 or return1 ] bind: rule.NEWLINE 
[ push: hspaces apply ] bind: autogen468 
[ push: comment apply ] bind: autogen469 
[ pushf: autogen469 out ] bind: autogen470 
[ push: hspaces apply ] bind: autogen471 
[ push: \n exactly ] bind: autogen472 
[ push: \r exactly ] bind: autogen473 
[ pushf: autogen472 pushf: autogen473 ] bind: autogen474 
[ pushf: autogen474 or ] bind: autogen475 
[ pushf: autogen468 pushf: autogen470 pushf: autogen471 pushf: autogen475 ] bind: autogen476 
[ newfunc0 
  pushf: autogen476 and return1 ] bind: rule.COMMENT_LINE 
[ push: NEWLINE apply ] bind: autogen477 
[ pushf: autogen477 push: * quantified ] bind: autogen478 
[ push: SAME_INDENT apply ] bind: autogen479 
[ push: statement apply ] bind: autogen480 
[ push: NEWLINE apply ] bind: autogen481 
[ pushf: autogen481 push: + quantified ] bind: autogen482 
[ push: anything apply ] bind: autogen483 
[ pushf: autogen483 negation ] bind: autogen484 
[ pushf: autogen482 pushf: autogen484 ] bind: autogen485 
[ pushf: autogen485 or ] bind: autogen486 
[ pushf: autogen478 pushf: autogen479 pushf: autogen480 pushf: autogen486 ] bind: autogen487 
[ pushf: autogen487 and ] bind: autogen488 
[ pushf: autogen488 push: + quantified ] bind: autogen489 
[ pushf: autogen489 push: suite bound ] bind: autogen490 
[ push: statement apply ] bind: autogen491 
[ pushf: autogen490 pushf: autogen491 ] bind: autogen492 
[ newfunc0 
  pushf: autogen492 or return1 ] bind: rule.grammar 
 push: comment pick: rule.comment pick: rules hashtable.set 
 push: space pick: rule.space pick: rules hashtable.set 
 push: spaces pick: rule.spaces pick: rules hashtable.set 
 push: spacesp pick: rule.spacesp pick: rules hashtable.set 
 push: hspaces pick: rule.hspaces pick: rules hashtable.set 
 push: hspacesp pick: rule.hspacesp pick: rules hashtable.set 
 push: EMPTY_LINE pick: rule.EMPTY_LINE pick: rules hashtable.set 
 push: NUMBER pick: rule.NUMBER pick: rules hashtable.set 
 push: STRING pick: rule.STRING pick: rules hashtable.set 
 push: NAME pick: rule.NAME pick: rules hashtable.set 
 push: FORTH_NAME pick: rule.FORTH_NAME pick: rules hashtable.set 
 push: bin_op pick: rule.bin_op pick: rules hashtable.set 
 push: names pick: rule.names pick: rules hashtable.set 
 push: variable pick: rule.variable pick: rules hashtable.set 
 push: name_quote pick: rule.name_quote pick: rules hashtable.set 
 push: quote pick: rule.quote pick: rules hashtable.set 
 push: forth pick: rule.forth pick: rules hashtable.set 
 push: forth_line pick: rule.forth_line pick: rules hashtable.set 
 push: simple_quote pick: rule.simple_quote pick: rules hashtable.set 
 push: parenthesis pick: rule.parenthesis pick: rules hashtable.set 
 push: func_call pick: rule.func_call pick: rules hashtable.set 
 push: block_call pick: rule.block_call pick: rules hashtable.set 
 push: multi_block_call pick: rule.multi_block_call pick: rules hashtable.set 
 push: non_block_non_infix pick: rule.non_block_non_infix pick: rules hashtable.set 
 push: non_block pick: rule.non_block pick: rules hashtable.set 
 push: infix pick: rule.infix pick: rules hashtable.set 
 push: non_infix pick: rule.non_infix pick: rules hashtable.set 
 push: expr pick: rule.expr pick: rules hashtable.set 
 push: exprs pick: rule.exprs pick: rules hashtable.set 
 push: exprsp pick: rule.exprsp pick: rules hashtable.set 
 push: assign pick: rule.assign pick: rules hashtable.set 
 push: bind pick: rule.bind pick: rules hashtable.set 
 push: statement pick: rule.statement pick: rules hashtable.set 
 push: suite pick: rule.suite pick: rules hashtable.set 
 push: NEWLINE pick: rule.NEWLINE pick: rules hashtable.set 
 push: COMMENT_LINE pick: rule.COMMENT_LINE pick: rules hashtable.set 
 push: grammar pick: rule.grammar pick: rules hashtable.set 
 push: letter pick: rule.letter pick: rules hashtable.set 
 push: digit pick: rule.digit pick: rules hashtable.set 
 push: anything pick: rule.anything pick: rules hashtable.set 
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
 push: flpc_grammar.pkl load 
 push: lib/stage1a.flpc Input bind: source 
 memoizer.reset 
 push: Running_flpc_grammar print 
 printeol 
 push: grammar apply assign: output 
 pick: output attr_call: print 
 push: flpc_parsed.pkl save 
 push: flpc_parsed.pkl load 
[ printspace 
  check: i 1 - assign: i ] bind: autogen493 
[ newfunc1 assign: indent 
   pick: indent assign: i 
   pushf: autogen493 repeat_if return_no_value ] bind: print_indent 
[ newfunc2 assign: self assign: indent 
  push: Dummy_function error return_no_value ] bind: pprint 
[ pick: indent 2 + pick: child pprint ] bind: autogen494 
[ pick: indent 2 + print_indent 
  push: str_' print 
  pick: child printraw 
  push: ' print 
  printeol ] bind: autogen495 
[ pick: child str_len 0 > pushf: autogen495 if ] bind: autogen496 
[ pick: child is_str pushf: autogen496 if ] bind: autogen497 
[ newfunc2 assign: child assign: indent 
  pick: child pick: node_class is_instance pushf: autogen494 pushf: autogen497 if-else return_no_value ] bind: print_child 
[ pick: indent 0 pick: self attr: children attr_call: get pprint 
  return_no_value2 ] bind: autogen498 
[ check: bad 1 + assign: bad ] bind: autogen499 
[ check: child str_len 0 == pushf: autogen499 if ] bind: autogen500 
[ check: child drop1 ] bind: autogen501 
[ check: bad 1 + assign: bad ] bind: autogen502 
[ check: child str_len 0 == pushf: autogen502 if ] bind: autogen503 
[ 1 pick: self attr: children attr_call: get assign: child 
  pick: child is_str pushf: autogen500 pushf: autogen501 if-else 
  0 pick: self attr: children attr_call: get assign: child 
  pick: child is_str pushf: autogen503 if ] bind: autogen504 
[ pick: self attr: children attr: len 2 == pushf: autogen504 if ] bind: autogen505 
[ pick: indent 0 pick: self attr: children attr_call: get pprint 
  None return3 ] bind: autogen506 
[ pick: bad pushf: autogen506 if ] bind: autogen507 
[ pick: indent 1 pick: self attr: children attr_call: get pprint 
  None return3 ] bind: autogen508 
[ pick: bad pushf: autogen508 if ] bind: autogen509 
[ pick: indent pick: children print_child ] bind: autogen510 
[ pick: indent pick: l pick: i - pick: children attr_call: get print_child 
  check: i 1 - assign: i ] bind: autogen511 
[ pick: children attr: len assign: l 
  pick: l assign: i 
  pushf: autogen511 repeat_if ] bind: autogen512 
[ newfunc2 assign: self assign: indent 
   pick: self attr: name push: exprsp string_equal pushf: autogen498 if 
   pick: False assign: bad 
    pick: self attr: children pick: resizable_class is_instance pushf: autogen505 if 
    pick: self attr: name push: exprs string_equal pushf: autogen507 if 
    pick: self attr: name push: suite string_equal pushf: autogen509 if 
   pick: indent print_indent 
   pick: self attr: name printraw 
   printeol 
   pick: self attr: children assign: children 
   pick: self attr: children pick: resizable_class is_instance not pushf: autogen510 pushf: autogen512 if-else return_no_value ] rebind: pprint 
 0 pick: output pprint 