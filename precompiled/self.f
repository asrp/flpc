push: Generated_from_lib/stage0.flpc_lib/stage1a.flpc_lib/stage1b.flpc_lib/stage1b2.flpc_lib/stage1b3.flpc_lib/stage1c.flpc_lib/stage1d.flpc_lib/stage3a.flpc_lib/stage3b.flpc_lib/flpc_grammar.flpc_lib/stage6a.flpc_lib/stage6b.flpc_test/self.flpc print
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
[ check: cond2_thunk call assign: cond ] bind: autogen493 
[ check: cond2_thunk drop1 
  pick: False assign: cond ] bind: autogen494 
[ assign: cond1 assign: cond2_thunk 
  check: cond1 pushf: autogen493 pushf: autogen494 if-else ] bind: lazy_and 
[ 
  1 drop1 ] bind: debugger2 
[ newfunc2 assign: value assign: title 
   pick: title print 
   pick: value tprint 
   printeol return_no_value ] bind: dprint 
[ check: cond drop1 
  pick: block call 
  check: index 1 + assign: index 
  pick: index pick: end < assign: cond ] bind: autogen495 
[ 
   push: 231 shuffle assign: index assign: end assign: block 
   pick: index pick: end < assign: cond 
   pushf: autogen495 repeat_if 
   check: index drop1 
   check: end drop1 
   check: block drop1 ] bind: simple_for 
[ 
   push: 51234 shuffle assign: elem assign: index assign: end assign: block assign: new_resizable 
   check: elem pick: new_resizable attr_call: append ] bind: autogen496 
[ 
   0 resizable assign: new_resizable 
   s21 assign: num assign: new_resizable 
   check: num 0 pushf: autogen496 simple_for 
   push: 12 shuffle ] bind: make_resizable 
[ 
   make_resizable assign: arr 
   pick: arr attr: array 1 + pick: arr attr: len str_join assign: joined 
   push: 13 shuffle ] bind: str_cat 
[ 
   pick: index pick: iterable attr_call: get assign: elem 
   pick: block2 call ] bind: autogen497 
[ 
   push: 12 shuffle assign: block2 assign: iterable 
   pick: iterable attr: len 0 pushf: autogen497 simple_for 
   check: block2 drop1 
   check: iterable drop1 ] bind: for_in 
[ 
   pick: block3 call pick: list_comp_out attr_call: append 
   check: elem drop1 ] bind: autogen498 
[ 
   push: 12 shuffle assign: iterable assign: block3 
   0 resizable assign: list_comp_out 
   pick: iterable pushf: autogen498 for_in 
   push: 14 shuffle ] bind: list_comp 
[ pick: block3 call pick: list_comp_out attr_call: append ] bind: autogen499 
[ 
   pick: condition call pushf: autogen499 if 
   check: elem drop1 ] bind: autogen500 
[ 
   push: 123 shuffle assign: condition assign: iterable assign: block3 
   0 resizable assign: list_comp_out 
   pick: iterable pushf: autogen500 for_in 
   push: 14 shuffle ] bind: list_comp_cond 
[ newfunc1 assign: bar 
  1 return1 ] bind: flist.foo 
[ push: FList_looking_up_ print 
  pick: name print 
  printeol ] bind: autogen501 
[ newfunc3 assign: searcher assign: receiver assign: name 
   pick: lookup_print pushf: autogen501 if 
   pick: name push: pos string_equal 0 return_if 
   pick: name pick: receiver pick: searcher instance_attrib return1 ] bind: flist.attrib 
 pick: resizable.attrib pick: boot_obj attr_call: subclass bind: FList_class 
 pick: FList_class attr: instance pick: FList_class closure bind: FList 
[ newfunc2 assign: new_class assign: obj 
  check: new_class pick: obj 2 - memory.set return_no_value ] bind: change_class 
[ 
   check: elem pick: out_list attr_call: append ] bind: autogen502 
[ newfunc2 assign: out_list assign: in_list 
  pick: in_list pushf: autogen502 for_in return_no_value ] bind: extend 
[ check: elem pick: out_list extend ] bind: autogen503 
[ check: elem pick: out_list attr_call: append ] bind: autogen504 
[ 
   pick: elem pick: class is_instance pushf: autogen503 pushf: autogen504 if-else ] bind: autogen505 
[ newfunc2 assign: class assign: in_list 
   0 resizable assign: out_list 
   pick: in_list pushf: autogen505 for_in 
   check: out_list return1 ] bind: flatten 
[ newfunc1 assign: self 
  pick: self 1 + memory.get tprint return_no_value ] bind: forthe.print 
[ push: Forthe_looking_up_ print 
  pick: name print 
  printeol ] bind: autogen506 
[ newfunc3 assign: searcher assign: receiver assign: name 
   pick: lookup_print pushf: autogen506 if 
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
  printeol ] bind: autogen507 
[ newfunc3 assign: searcher assign: receiver assign: name 
   pick: lookup_print pushf: autogen507 if 
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
[ newfunc1 assign: root 
  push: Dummy_function error return_no_value ] bind: simplify 
[ pick: elem simplify ] bind: autogen508 
[ pick: root attr: name pushf: autogen508 pick: root list_comp node assign: output ] bind: autogen509 
[ pick: True ] bind: autogen510 
[ 0 resizable assign: output ] bind: autogen511 
[ pick: True ] bind: autogen512 
[ pick: elem simplify ] bind: autogen513 
[ pushf: autogen513 pick: root attr: children list_comp assign: output ] bind: autogen514 
[ pick: root attr: children None == not ] bind: autogen515 
[ pick: root attr: children simplify assign: output ] bind: autogen516 
[ pick: root attr: children pick: node_class is_instance ] bind: autogen517 
[ pushf: autogen511 pushf: autogen512 pushf: autogen514 pushf: autogen515 pushf: autogen516 pushf: autogen517 pushi: 3 multi-if ] bind: autogen518 
[ pick: root attr: name push: parameters string_equal pick: root attr: name push: exprs string_equal || ] bind: autogen519 
[ 0 pick: root attr_call: get simplify assign: output ] bind: autogen520 
[ 0 pick: root attr_call: get attr: name push: exprs string_equal ] bind: autogen521 
[ pushf: autogen521 pick: root attr: len 1 == 0 pick: root attr_call: get pick: node_class is_instance && lazy_and ] bind: autogen522 
[ pick: elem simplify ] bind: autogen523 
[ pick: True assign: cond ] bind: autogen524 
[ pick: elem attr: name push: EMPTY_LINE string_equal not assign: cond ] bind: autogen525 
[ 
   pick: elem pick: node_class is_instance not pushf: autogen524 pushf: autogen525 if-else ] bind: autogen526 
[ pushf: autogen523 pick: root pushf: autogen526 list_comp_cond assign: children 
  pick: root attr: name pick: children node assign: output ] bind: autogen527 
[ pick: root attr: name push: suite string_equal ] bind: autogen528 
[ 0 pick: root attr_call: get simplify assign: output ] bind: autogen529 
[ pick: root attr: name push: suite string_equal pick: root attr: len 1 == && ] bind: autogen530 
[ pick: child pick: children attr_call: append ] bind: autogen531 
[ pick: True ] bind: autogen532 
[ push: multi-if pick: last_child attr_call: set_name 
  push: if pick: last_child attr: children node 1 make_resizable pick: last_child attr_call: set_children ] bind: autogen533 
[ debugger2 
  pick: last_child attr: name push: if string_equal pushf: autogen533 if 
  pick: child pick: last_child attr: children attr_call: append 
  debugger2 
  check: child drop1 
  pick: last_child assign: bring_to_top ] bind: autogen534 
[ pick: child attr: name push: elif string_equal ] bind: autogen535 
[ pick: child attr: children pick: last_child attr: children attr_call: append 
  push: if-else pick: last_child attr_call: set_name ] bind: autogen536 
[ pick: last_child attr: name push: if string_equal pick: child attr: name push: else string_equal && ] bind: autogen537 
[ 
   pick: index pick: root attr_call: get simplify assign: child 
   pushf: autogen531 pushf: autogen532 pushf: autogen534 pushf: autogen535 pushf: autogen536 pushf: autogen537 pushi: 3 multi-if 
   debugger2 
   push: 23416 shuffle assign: index assign: end assign: block assign: last_child ] bind: autogen538 
[ push: multi-block-root:_ pick: root dprint 
  debugger2 
  0 resizable assign: children 
  push: dummy None node assign: last_child 
  pick: root attr: len 0 pushf: autogen538 simple_for 
  push: suite pick: children node assign: output ] bind: autogen539 
[ pick: root attr: name push: multi_block_call string_equal ] bind: autogen540 
[ check: cond drop1 
  check: i 2 + assign: i 
  0 pick: i 1 - pick: root attr_call: get attr_call: get pick: i pick: root attr_call: get simplify pick: output simplify 2 make_resizable node assign: output 
  push: 214 shuffle assign: i assign: output 
  pick: i pick: l < assign: cond ] bind: autogen541 
[ pick: root attr: len 2 - assign: l 
  0 pick: root attr_call: get assign: output 
  0 assign: i 
  pick: i pick: l < assign: cond 
  pushf: autogen541 repeat_if 
  check: i drop1 ] bind: autogen542 
[ pick: root attr: name push: infix string_equal ] bind: autogen543 
[ 0 0 pick: root attr_call: get attr_call: get 1 pick: root attr_call: get simplify node assign: output ] bind: autogen544 
[ pick: root attr: name push: func_call string_equal pick: root attr: name push: block_call string_equal || ] bind: autogen545 
[ pick: root assign: output ] bind: autogen546 
[ pick: root pick: node_class is_instance not ] bind: autogen547 
[ newfunc1 assign: root 
   pushf: autogen509 pushf: autogen510 pushf: autogen518 pushf: autogen519 pushf: autogen520 pushf: autogen522 pushf: autogen527 pushf: autogen528 pushf: autogen529 pushf: autogen530 pushf: autogen539 pushf: autogen540 pushf: autogen542 pushf: autogen543 pushf: autogen544 pushf: autogen545 pushf: autogen546 pushf: autogen547 pushi: 9 multi-if 
   check: output return1 ] rebind: simplify 
[ push: newfunc_called_with_unexpected_argument error ] bind: autogen548 
[ newfunc1 assign: i 
   pick: i pushi: 4 < not pushf: autogen548 if 
   pick: i int_to_str push: newfunc 2 str_cat return1 ] bind: newfunc_str 
[ newfunc1 assign: array 
   pick: array pick: FList_class change_class 
   check: array return1 ] rebind: to_flist 
[ newfunc1 assign: root 
  push: Dummy_function error return_no_value ] bind: last_call 
[ pick: root attr: value return3 ] bind: autogen549 
[ push: _ return3 ] bind: autogen550 
[ pick: root attr: name push: FCall string_equal pushf: autogen549 pushf: autogen550 if-else ] bind: autogen551 
[ pick: root attr: len 1 - pick: root attr_call: get last_call return2 ] bind: autogen552 
[ pick: root attr: value last_call return2 ] bind: autogen553 
[ newfunc1 assign: root 
   debugger2 
    pick: root pick: forthe_class is_instance pushf: autogen551 if 
    pick: root pick: FList_class is_instance pick: root pick: resizable_class is_instance || pushf: autogen552 if 
    pick: root pick: FQuote is_instance pushf: autogen553 if 
   push: _ return1 ] rebind: last_call 
[ newfunc1 assign: root 
  push: Dummy_function error return_no_value ] bind: to_forth 
 0 0 pick: nest attr_call: set 
[ push: root:_ pick: root dprint 
  push: type:_ pick: root attr: type dprint 
  debugger 
  push: Unexpected_non-node_root. error ] bind: autogen554 
[ pick: elem to_forth ] bind: autogen555 
[ pushf: autogen555 pick: root list_comp assign: output 
  check: output pick: FList_class flatten assign: output 
  push: FCall pick: root attr: name forthe pick: output attr_call: append 
  push: output: pick: output dprint 
  debugger2 
  pick: output pick: FList_class change_class ] bind: autogen556 
[ pick: True ] bind: autogen557 
[ pick: i 1 - pick: root attr_call: get assign: child 
  1 pick: child attr_call: get to_forth pick: output attr_call: append 
  push: quote 0 pick: child attr_call: get node to_forth pick: output attr_call: append 
  check: child drop1 
  check: i 1 - assign: i ] bind: autogen558 
[ debugger2 
  0 resizable assign: output 
  pick: root attr: len assign: i 
  pushf: autogen558 repeat_if 
  debugger2 
  pick: output pick: FList_class flatten assign: output 
  debugger2 
  push: FCall push: pushi: forthe pick: output attr_call: append 
  push: FStr pick: root attr: len int_to_str forthe pick: output attr_call: append 
  push: FCall pick: root attr: name forthe pick: output attr_call: append 
  pick: output pick: FList_class change_class 
  debugger2 ] bind: autogen559 
[ pick: root attr: name push: multi-if string_equal ] bind: autogen560 
[ pick: elem to_forth ] bind: autogen561 
[ pushf: autogen561 pick: root list_comp assign: output 
  check: output pick: FList_class flatten assign: output 
  pick: output pick: FList_class change_class ] bind: autogen562 
[ pick: root attr: name push: grammar string_equal pick: root attr: name push: exprsp string_equal || ] bind: autogen563 
[ 0 1 pick: root attr_call: get attr_call: get to_forth push: FCall push: attr: forthe 0 pick: root attr_call: get to_forth pushi: 3 make_resizable assign: children ] bind: autogen564 
[ pick: elem to_forth ] bind: autogen565 
[ pushf: autogen565 1 pick: root attr_call: get list_comp assign: children 
  push: FStr 1 pick: root attr_call: get attr: name forthe push: FCall push: attr_call: forthe 0 pick: root attr_call: get to_forth pushi: 3 make_resizable assign: calls 
  check: calls pick: children extend ] bind: autogen566 
[ 1 pick: root attr_call: get attr: name push: variable string_equal pushf: autogen564 pushf: autogen566 if-else 
  pick: children pick: FList_class flatten assign: output 
  pick: output pick: FList_class change_class ] bind: autogen567 
[ pick: root attr: name push: . string_equal ] bind: autogen568 
[ push: FStr pick: elem forthe ] bind: autogen569 
[ pushf: autogen569 pick: root list_comp pick: FList_class flatten assign: children 
  push: FComment pick: children forthe assign: output ] bind: autogen570 
[ pick: root attr: name push: comment string_equal ] bind: autogen571 
[ check: output 1 make_resizable assign: output 
  pick: output pick: FList_class change_class ] bind: autogen572 
[ push: root: pick: root dprint 
  debugger2 
  1 pick: root attr_call: get to_forth assign: output 
  push: output: pick: output dprint 
  push: root_name: pick: root attr: name dprint 
  debugger2 
  pick: output pick: FList_class is_instance not pushf: autogen572 if 
  push: FCall push: bind: forthe pick: output attr_call: append 
  0 0 pick: root attr_call: get attr_call: get to_forth pick: output attr_call: append 
  pick: output assign: output ] bind: autogen573 
[ pick: root attr: name push: bind string_equal ] bind: autogen574 
[ pick: elem to_forth ] bind: autogen575 
[ 0 pick: output attr_call: get attr: value assign: names ] bind: autogen576 
[ debugger 
  1 1 - 2 0 pick: output attr_call: get attr_call: slice assign: names ] bind: autogen577 
[ push: FCall pick: names attr: len newfunc_str forthe 1 make_resizable assign: decl ] bind: autogen578 
[ 0 resizable assign: decl ] bind: autogen579 
[ check: i 1 - assign: i 
  push: FCall push: assign: forthe pick: decl attr_call: append 
  pick: i pick: names attr_call: get pick: decl attr_call: append ] bind: autogen580 
[ push: FCall push: return_no_value forthe 1 pick: output attr_call: get attr: value attr_call: append ] bind: autogen581 
[ push: FCall push: return_no_value forthe 1 pick: output attr_call: get attr_call: append ] bind: autogen582 
[ 1 pick: output attr_call: get pick: FQuote_class is_instance pushf: autogen581 pushf: autogen582 if-else ] bind: autogen583 
[ 1 pick: output attr_call: get last_call assign: last 
  debugger2 
  pick: last push: return string_equal pick: last push: lookup_error string_equal || not pushf: autogen583 if ] bind: autogen584 
[ 0 pick: root attr_call: get attr: name push: simple_quote string_equal pushf: autogen576 pushf: autogen577 if-else 
   pick: inline not pushf: autogen578 pushf: autogen579 if-else 
  pick: decl pick: FList_class change_class 
  pick: names attr: len assign: i 
  pushf: autogen580 repeat_if 
  pick: decl tprint 
  printeol 
  debugger2 
  0 pick: decl pick: output attr: value attr_call: set 
  1 pick: output attr_call: get attr: value pick: FList_class change_class 
  1 1 pick: output attr_call: get attr: value pick: output attr: value attr_call: set 
  pick: inline not pushf: autogen584 if ] bind: autogen585 
[ push: _ pushf: autogen575 pick: root list_comp FQuote assign: output 
  pick: root attr: name push: inline string_equal assign: inline 
  pick: True assign: cond 
  check: cond pushf: autogen585 if 
  pick: output assign: output ] bind: autogen586 
[ pick: root attr: name push: fun string_equal pick: root attr: name push: inline string_equal || ] bind: autogen587 
[ check: output 1 make_resizable assign: output 
  pick: output pick: FList_class change_class ] bind: autogen588 
[ check: i 1 - assign: i 
  push: FCall push: assign: forthe pick: assignments attr_call: append 
  pick: i pick: names attr_call: get to_forth pick: assignments attr_call: append ] bind: autogen589 
[ 1 pick: root attr_call: get to_forth assign: output 
  pick: output pick: FList_class is_instance not pushf: autogen588 if 
  0 resizable assign: assignments 
  0 pick: root attr_call: get assign: names 
  pick: names attr: len assign: i 
  pushf: autogen589 repeat_if 
  pick: assignments pick: FList_class change_class 
  check: names drop1 
  check: assignments pick: output attr_call: append ] bind: autogen590 
[ pick: root attr: name push: assign string_equal ] bind: autogen591 
[ push: FCall 0 pick: elem attr_call: get forthe ] bind: autogen592 
[ pushf: autogen592 pick: root list_comp assign: output 
  pick: output pick: FList_class change_class ] bind: autogen593 
[ pick: root attr: name push: forth_line string_equal ] bind: autogen594 
[ push: FStr pick: child forthe assign: output ] bind: autogen595 
[ push: FStr pick: child forthe push: FCall push: pushi: forthe 2 make_resizable assign: output 
  pick: output pick: FList_class change_class ] bind: autogen596 
[ 0 pick: root attr: children attr_call: get assign: child 
  push: NUMBER_in:_ print 
  pick: root tprint 
  printeol 
  debugger2 
  pick: child push: 0 string_equal pick: child push: 1 string_equal || pick: child push: 2 string_equal || pushf: autogen595 pushf: autogen596 if-else 
  push: NUMBER_out:_ print 
  pick: output tprint 
  printeol 
  debugger2 ] bind: autogen597 
[ pick: root attr: name push: NUMBER string_equal ] bind: autogen598 
[ push: FStr 0 pick: root attr_call: get forthe push: FCall push: push: forthe 2 make_resizable assign: output 
  pick: output pick: FList_class change_class ] bind: autogen599 
[ pick: root attr: name push: STRING string_equal ] bind: autogen600 
[ 0 pick: root attr_call: get to_forth push: FCall push: check: forthe 2 make_resizable assign: output 
  pick: output pick: FList_class change_class ] bind: autogen601 
[ pick: root attr: name push: name_quote string_equal ] bind: autogen602 
[ push: FStr 0 pick: root attr_call: get forthe assign: output ] bind: autogen603 
[ pick: root attr: name push: NAME string_equal ] bind: autogen604 
[ 0 pick: root attr_call: get to_forth push: FCall push: pick: forthe 2 make_resizable assign: output 
  pick: output pick: FList_class change_class ] bind: autogen605 
[ pick: root attr: name push: variable string_equal ] bind: autogen606 
[ pick: elem to_forth ] bind: autogen607 
[ debugger2 
  pushf: autogen607 pick: root list_comp pick: FList_class flatten assign: children 
  push: Children:_ print 
  pick: children tprint 
  printeol 
  debugger2 
  pick: children attr_call: pop drop1 
  push: FComment pick: children forthe assign: output ] bind: autogen608 
[ pick: root attr: name push: simple_quote string_equal ] bind: autogen609 
[ pick: elem to_forth ] bind: autogen610 
[ push: _ pushf: autogen610 pick: root list_comp pick: FList_class flatten FQuote assign: output ] bind: autogen611 
[ pick: root attr: name push: quote string_equal ] bind: autogen612 
[ pick: elem to_forth ] bind: autogen613 
[ pushf: autogen613 pick: root list_comp assign: output 
  pick: output pick: FList_class change_class ] bind: autogen614 
[ pick: root attr: name push: suite string_equal pick: root attr: name push: forth string_equal || ] bind: autogen615 
[ newfunc1 assign: root 
   0 0 pick: nest attr_call: get 1 + pick: nest attr_call: set 
   0 pick: nest attr_call: get 0 pick: printspace simple_for 
   pick: root attr: name print 
   push: _<- print 
   printeol 
    pick: root pick: node_class is_instance not pushf: autogen554 if 
    pushf: autogen556 pushf: autogen557 pushf: autogen559 pushf: autogen560 pushf: autogen562 pushf: autogen563 pushf: autogen567 pushf: autogen568 pushf: autogen570 pushf: autogen571 pushf: autogen573 pushf: autogen574 pushf: autogen586 pushf: autogen587 pushf: autogen590 pushf: autogen591 pushf: autogen593 pushf: autogen594 pushf: autogen597 pushf: autogen598 pushf: autogen599 pushf: autogen600 pushf: autogen601 pushf: autogen602 pushf: autogen603 pushf: autogen604 pushf: autogen605 pushf: autogen606 pushf: autogen608 pushf: autogen609 pushf: autogen611 pushf: autogen612 pushf: autogen614 pushf: autogen615 pushi: 17 multi-if 
   0 pick: nest attr_call: get 0 pick: printspace simple_for 
   pick: root attr: name print 
   push: _->_ pick: output dprint 
   0 0 pick: nest attr_call: get 1 - pick: nest attr_call: set 
   check: output return1 ] rebind: to_forth 
 pushi: 11 hashtable bind: g 
[ push: file push: w pick: filename file.open pick: g attr_call: set ] bind: autogen616 
[ push: file None pick: g attr_call: set ] bind: autogen617 
[ newfunc1 assign: filename 
   push: written pushi: 5000 hashtable pick: g attr_call: set 
   push: nesting 0 pick: g attr_call: set 
   push: last_value push: _ pick: g attr_call: set 
   push: autogen_count 0 pick: g attr_call: set 
   pick: filename None == not pushf: autogen616 pushf: autogen617 if-else 
   push: init_g:_ pick: g dprint 
   debugger2 return_no_value ] bind: init_g 
[ 
  push: last_value None pick: g attr_call: set ] bind: write_eol 
[ pick: value push: ] string_equal not pick: value push: return_no_value string_equal not && ] bind: autogen618 
[ printeol 
  push: nesting pick: g attr_call: get 1 pick: printspace simple_for ] bind: autogen619 
[ newfunc1 assign: value 
   push: file pick: g attr_call: get set_output 
   pushf: autogen618 push: last_value pick: g attr_call: get None == lazy_and pushf: autogen619 if 
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
  debugger ] bind: autogen620 
[ pick: True ] bind: autogen621 
[ 
   check: elem pick: depth write_string_body ] bind: autogen622 
[ push: nesting push: nesting pick: g attr_call: get 1 + pick: g attr_call: set 
  debugger2 
  pick: root pushf: autogen622 for_in 
  debugger2 
  push: nesting push: nesting pick: g attr_call: get 1 - pick: g attr_call: set 
  write_eol ] bind: autogen623 
[ pick: root pick: FList_class is_instance ] bind: autogen624 
[ push: pushf: write_sep 
  pick: root attr: name write_sep ] bind: autogen625 
[ pick: root pick: FQuote_class is_instance ] bind: autogen626 
[ pick: root attr: value write_sep ] bind: autogen627 
[ pick: root attr: name push: FStr string_equal ] bind: autogen628 
[ pick: depth int_to_str pick: root attr: value 2 str_cat write_sep ] bind: autogen629 
[ pick: root attr: value write_sep ] bind: autogen630 
[ pick: root attr: value push: return string_equal pick: root attr: value push: return_two string_equal || pushf: autogen629 pushf: autogen630 if-else ] bind: autogen631 
[ pick: root attr: name push: FCall string_equal ] bind: autogen632 
[ printspace ] bind: autogen633 
[ pick: root attr: name push: FComment string_equal ] bind: autogen634 
[ pushf: autogen627 pushf: autogen628 pushf: autogen631 pushf: autogen632 pushf: autogen633 pushf: autogen634 pushi: 3 multi-if ] bind: autogen635 
[ pick: root pick: forthe_class is_instance ] bind: autogen636 
[ newfunc2 assign: depth assign: root 
   debugger2 
   pushf: autogen620 pushf: autogen621 pushf: autogen623 pushf: autogen624 pushf: autogen625 pushf: autogen626 pushf: autogen635 pushf: autogen636 pushi: 4 multi-if return_no_value ] rebind: write_string_body 
[ newfunc2 assign: depth assign: root 
  push: Dummy_function error return_no_value ] bind: write_blocks 
[ push: root:_ pick: root dprint 
  push: root_is_quote:_ pick: root pick: FQuote_class is_instance dprint 
  push: root_is_list:_ pick: root pick: FList_class is_instance dprint 
  push: g:_ pick: g dprint ] bind: autogen637 
[ check: elem pick: depth 1 + write_blocks ] bind: autogen638 
[ check: elem pick: depth write_blocks ] bind: autogen639 
[ 
   pick: elem pick: FQuote_class is_instance pushf: autogen638 pushf: autogen639 if-else ] bind: autogen640 
[ push: nesting push: nesting pick: g attr_call: get 1 + pick: g attr_call: set 
  pick: root pushf: autogen640 for_in 
  push: nesting push: nesting pick: g attr_call: get 1 - pick: g attr_call: set 
  write_eol ] bind: autogen641 
[ push: autogen_count pick: g attr_call: get int_to_str push: autogen 2 str_cat assign: name 
  pick: name pick: root attr_call: set_name 
  push: autogen_count push: autogen_count pick: g attr_call: get 1 + pick: g attr_call: set ] bind: autogen642 
[ 
   check: elem pick: depth write_string_body ] bind: autogen643 
[ push: bind: write_sep 
  pick: root attr: name pick: True push: written pick: g attr_call: get attr_call: set ] bind: autogen644 
[ push: rebind: write_sep ] bind: autogen645 
[ push: nesting pick: g attr_call: get assign: nesting 
  debugger2 
  pick: root attr: name push: _ string_equal pushf: autogen642 if 
  push: nesting 0 pick: g attr_call: set 
  push: [ write_sep 
  push: nesting 1 pick: g attr_call: set 
  pick: root pushf: autogen643 for_in 
  push: ] write_sep 
  pick: root attr: name push: written pick: g attr_call: get attr_call: get None == pushf: autogen644 pushf: autogen645 if-else 
  pick: root attr: name write_sep 
  write_eol 
  push: nesting pick: nesting pick: g attr_call: set ] bind: autogen646 
[ newfunc2 assign: depth assign: root 
   pick: False pushf: autogen637 if 
   pick: root pick: FQuote_class is_instance pick: root pick: FList_class is_instance || pushf: autogen641 if 
   pick: root pick: FQuote_class is_instance pushf: autogen646 if return_no_value ] rebind: write_blocks 
[ push: is_bind:_ pick: child attr: len 2 - pick: child attr_call: get attr: value dprint ] bind: autogen647 
[ pick: child attr: len pushi: 4 - pick: child attr_call: get attr: value push: class string_equal ] bind: autogen648 
[ push: is_class:_ pick: child attr: len pushi: 4 - pick: child attr_call: get attr: value dprint 
  push: is_str:_ pick: child attr: len pushi: 4 - pick: child attr_call: get attr: value is_str dprint 
  push: str_eq:_ pick: child attr: len pushi: 4 - pick: child attr_call: get attr: value push: class string_equal dprint 
  push: lazy_cond:_ pushf: autogen648 pick: child attr: len pushi: 4 > lazy_and dprint ] bind: autogen649 
[ printeol 
  push: child:_ pick: child dprint 
  push: child.len:_ pick: child attr: len dprint 
   pick: child attr: len 2 > pushf: autogen647 if 
   pick: child attr: len pushi: 5 > pushf: autogen649 if ] bind: autogen650 
[ 
   pick: child pick: FList_class is_instance pushf: autogen650 if 
   debugger2 ] bind: print_child 
[ debugger2 ] bind: autogen651 
[ pick: s pick: s str_len pushi: 6 - pick: s str_len sub_str push: _colon string_equal ] bind: autogen652 
[ push: : pick: s 0 pick: s str_len pushi: 6 - sub_str 2 str_cat return2 ] bind: autogen653 
[ newfunc1 assign: s 
    pick: s str_len pushi: 6 > pushf: autogen651 if 
    pushf: autogen652 pick: s str_len pushi: 6 > lazy_and pushf: autogen653 if 
   pick: s return1 ] bind: replace_name 
[ newfunc2 assign: prefix assign: root 
  push: Dummy_function error return_no_value ] bind: write_suite 
[ push: nesting 0 pick: g attr_call: set 
  pick: child 0 write_string_body 
  write_eol ] bind: autogen654 
[ pick: child pick: FList_class is_instance ] bind: autogen655 
[ 1 drop1 ] bind: autogen656 
[ pick: child attr: name push: FComment string_equal not ] bind: autogen657 
[ pushf: autogen657 pick: child pick: forthe_class is_instance lazy_and ] bind: autogen658 
[ pick: body attr: name push: FStr string_equal pick: body attr: name push: FCall string_equal || ] bind: autogen659 
[ pick: child 0 write_string_body 
  write_eol ] bind: autogen660 
[ push: Unexpected_bind_body_length error ] bind: autogen661 
[ pick: child attr: len 1 - pick: child attr_call: get attr: value assign: func_name ] bind: autogen662 
[ pick: child attr: len 1 - pick: child attr_call: get attr: value push: . pick: prefix pushi: 3 str_cat assign: func_name ] bind: autogen663 
[ pick: child attr: len pushi: 4 == pushf: autogen661 if 
   pick: prefix None == pushf: autogen662 pushf: autogen663 if-else 
  check: func_name replace_name assign: func_name 
  pick: func_name pick: body attr_call: set_name 
  push: nesting 0 pick: g attr_call: set 
  pick: body 1 write_blocks ] bind: autogen664 
[ debugger2 
  0 pick: child attr_call: get assign: body 
  pushf: autogen659 pick: body pick: forthe_class is_instance lazy_and pushf: autogen660 pushf: autogen664 if-else ] bind: autogen665 
[ pick: child attr: len 2 - pick: child attr_call: get attr: value push: bind: string_equal pick: child attr: len pushi: 3 - pick: child attr_call: get pick: FQuote_class is_instance && ] bind: autogen666 
[ pushf: autogen666 pick: child attr: len 2 > lazy_and ] bind: autogen667 
[ pushf: autogen667 pick: child pick: FList_class is_instance lazy_and ] bind: autogen668 
[ debugger2 
  pick: child attr: len pushi: 4 - pick: child attr_call: get attr: value pick: child attr: len 1 - pick: child attr_call: get attr: value write_suite ] bind: autogen669 
[ pick: child attr: len pushi: 3 - pick: child attr_call: get attr: value push: class string_equal ] bind: autogen670 
[ pushf: autogen670 pick: child attr: len pushi: 3 > lazy_and ] bind: autogen671 
[ pushf: autogen671 pick: child pick: FList_class is_instance lazy_and ] bind: autogen672 
[ newfunc2 assign: prefix assign: child 
   pushf: autogen654 pushf: autogen655 pushf: autogen656 pushf: autogen658 pushf: autogen665 pushf: autogen668 pushf: autogen669 pushf: autogen672 pushi: 4 multi-if 
   debugger2 return_no_value ] bind: write_child 
[ 
   check: elem pick: prefix write_child ] bind: autogen673 
[ newfunc2 assign: prefix assign: root 
  pick: root pushf: autogen673 for_in return_no_value ] rebind: write_suite 
[ push: - print ] bind: autogen674 
[ newfunc2 assign: filename assign: sep 
   pushi: 50 0 pushf: autogen674 simple_for 
   pick: sep print 
   pick: filename print 
   printeol return_no_value ] bind: print_separator 
[ newfunc1 assign: filename 
   push: compile_file print 
   printeol 
   push: source pick: filename Input names2 hashtable.set 
   memoizer.reset 
   printeol 
   push: Running_flpc_grammar_on_input_ print 
   pick: filename print 
   printeol 
   push: grammar apply assign: parsed 
   push: Input:_ print 
   pick: parsed tprint 
   printeol 
   pick: parsed simplify assign: simplified 
   push: Simplified:_ print 
   pick: simplified attr_call: print 
   printeol 
   pick: simplified to_forth assign: forthed 
   push: ToForth:_ print 
   pick: forthed attr_call: print 
   printeol 
   printeol 
   pick: forthed None write_suite 
   printeol return_no_value ] bind: compile_file 
[ 
   push: _ printraw 
   check: elem printraw ] bind: autogen675 
[ check: elem compile_file ] bind: autogen676 
[ newfunc2 assign: output assign: filenames 
   pick: output init_g 
   push: file pick: g attr_call: get set_output 
   push: push:_ print 
   push: Generated_from printraw 
   pick: filenames pushf: autogen675 for_in 
   push: print print 
   printeol 
   None set_output 
   pick: filenames pushf: autogen676 for_in return_no_value ] bind: compile_all 
[ newfunc0 
   push: test/self.flpc push: lib/stage6b.flpc push: lib/stage6a.flpc push: lib/flpc_grammar.flpc push: lib/stage3b.flpc push: lib/stage3a.flpc push: lib/stage1d.flpc push: lib/stage1c.flpc push: lib/stage1b3.flpc push: lib/stage1b2.flpc push: lib/stage1b.flpc push: lib/stage1a.flpc push: lib/stage0.flpc pushi: 13 make_resizable assign: filenames 
   pick: filenames push: gen/output.f compile_all return_no_value ] bind: compile_self 
 compile_self 