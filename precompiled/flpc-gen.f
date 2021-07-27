push: Generated_from_lib/stage0.flpc_lib/stage1a.flpc_lib/stage1b.flpc_lib/stage1b2.flpc_lib/stage1b3.flpc_lib/stage1c.flpc_lib/stage1d.flpc_lib/grammar.flpc_lib/stage2.flpc_lib/stage3a.flpc_test/stage3-test.flpc_-o_precompiled/flpc-gen.f print
[ input.next_token functions.add ] input.next_token bind: functions.add 
[ 
  pick: i Prim pick: i primitive_name functions.add ] bind: add_non_boot_primitive 
[ check: cond drop1 
  check: i 1 - assign: i 
  add_non_boot_primitive 
  pick: i pick: init_prims > assign: cond ] bind: autogen0 
[ newfunc0 
   pushi: 42 assign: init_prims 
   primitives.len assign: total_prims 
   pick: total_prims assign: i 
   pick: i pick: init_prims > assign: cond 
   pushf: autogen0 repeat_if return_no_value ] bind: add_non_boot_primitives 
 add_non_boot_primitives 
[ newfunc1 assign: func 
   input.next_token names.get assign: location 
   pick: location 1 + push: ] names.get memory.set 
   s21 memory.set return_no_value ] bind: rebind: 
[ newfunc0 
  input.next_token func_return ] bind: pushn: 
[ 
  print_state ] bind: ps 
[ None func_return ] bind: autogen1 
[ call_stack.len pushi: 6 - func_return ] bind: autogen2 
[ call_stack.len pushi: 7 - func_return ] bind: autogen3 
[ 0 func_return ] bind: autogen4 
[ print_state ] bind: autogen5 
[ print_state ] bind: autogen6 
[ push: Running\_ print 
  pick: name print 
  check: name names.get call ] bind: autogen7 
[ push: (dbg)\_ print 
  stdin.next_token assign: name 
   pick: name push: s string_equal pushf: autogen1 if 
   pick: name push: n string_equal pushf: autogen2 if 
   pick: name push: r string_equal pushf: autogen3 if 
   pick: name push: c string_equal pushf: autogen4 if 
   pick: name push: i string_equal pushf: autogen5 if 
   pick: name push: l string_equal pushf: autogen6 if 
   pick: name push: i string_equal not pushf: autogen7 if ] bind: autogen8 
[ newfunc0 
  pushf: autogen8 repeat return_no_value ] bind: debugger_inner 
[ newfunc0 
   print_state 
   debugger_inner debugger_waitlen_set return_no_value ] bind: debugger 
[ push: 125 shuffle assign: i assign: block 
  check: i 1 - assign: i ] bind: autogen9 
[ s21 assign: i assign: block 
  pushf: autogen9 repeat_if 
  check: block call 
  0 assign: i ] bind: autogen10 
[ check: block drop1 ] bind: autogen11 
[ check: i 1 - assign: i 
  push: 231 shuffle assign: cond assign: block assign: i 
  check: cond call pushf: autogen10 pushf: autogen11 if-else ] bind: autogen12 
[ pushi: 1 remove_top_names assign: i 
  pushf: autogen12 repeat_if ] bind: multi-if 
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
[ push: attr\_call\_on\_non\_string\_ print 
  pick: name print 
  printeol 
  push: attr\_call\_on\_non\_string error ] bind: autogen13 
[ 
   push: self assign2 
   next_token2 assign: name 
   pick: name is_str not pushf: autogen13 if 
   check: name pick: self pick: self pick: self 1 - memory.get call call ] bind: attr_call: 
[ newfunc3 assign: searcher assign: receiver assign: name 
   push: Cannot\_find\_ print 
   pick: name print 
   push: Lookup\_error error return_no_value ] bind: nullobj.attrib 
[ newfunc2 assign: parent assign: attrib 
   check: parent memory.append 
   check: attrib memory.append 
   push: ] names.get memory.append 
   memory.len 1 - Pointer func_return ] bind: subclass 
 pick: nullobj.attrib None subclass bind: nullobj 
[ push: Cannot\_find\_ print 
  pick: name print 
  printeol 
  push: Lookup\_error error ] bind: autogen14 
[ newfunc3 assign: searcher assign: receiver assign: name 
   pick: name push: parent string_equal pick: receiver 2 - memory.get return_if 
   pick: searcher attr: parent assign: parent 
   pick: parent pick: nullobj == pushf: autogen14 if 
   pick: name pick: receiver pick: parent pick1 assign: parent_copy 
   check: parent_copy 1 - memory.get call func_return ] bind: instance_attrib 
[ newfunc1 assign: self 
   push: Boot\_object\_at\_ func_return ] bind: minobj.str 
[ newfunc1 assign: parent 
  pick: instance_attrib pick: parent subclass func_return ] bind: minobj.instance 
[ newfunc3 assign: searcher assign: receiver assign: name 
  push: Dummy\_function\_should\_not\_be\_called error return_no_value ] bind: minobj.attrib 
[ push: Boot\_looking\_up\_ print 
  pick: name print 
  printeol ] bind: autogen15 
[ newfunc3 assign: searcher assign: receiver assign: name 
   pick: lookup_print pushf: autogen15 if 
   pick: name push: attrib_raw string_equal pick: receiver 1 - memory.get return_if 
   pick: name push: attrib string_equal pick: minobj.attrib return_if 
   pick: name push: instance string_equal pick: minobj.instance return_if 
   pick: name push: subclass string_equal pick: subclass return_if 
   pick: name push: str string_equal pick: minobj.str return_if 
   pick: name push: type string_equal push: minobj return_if 
   pick: name pick: receiver pick: searcher instance_attrib func_return ] rebind: minobj.attrib 
 pick: minobj.attrib pick: nullobj subclass bind: boot_obj 
[ 0 memory.append 
  check: i 1 - assign: i ] bind: autogen16 
[ newfunc1 assign: i 
  pushf: autogen16 repeat_if return_no_value ] bind: memory.extend 
[ pick: value print ] bind: autogen17 
[ pick: value print ] bind: autogen18 
[ pick: value attr_call: print ] bind: autogen19 
[ pick: value pick: obj_boundary < pushf: autogen18 pushf: autogen19 if-else ] bind: autogen20 
[ newfunc1 assign: value 
  pick: value is_basic pushf: autogen17 pushf: autogen20 if-else return_no_value ] bind: tprint 
[ newfunc2 assign: self assign: length 
   pick: boot_obj minobj.instance assign: new_obj 
   pick: new_obj 2 - pick: self memory.set 
   pick: new_obj pick: length memory.set 
   pick: length memory.extend 
   push: ] names.get memory.append 
   pick: new_obj func_return ] bind: boot_array.instance 
[ push: Index\_out\_of\_range error ] bind: autogen21 
[ push: Index\_out\_of\_range error ] bind: autogen22 
[ newfunc2 assign: self assign: key 
   pick: key 0 < pushf: autogen21 if 
   pick: key pick: self memory.get < not pushf: autogen22 if return_no_value ] bind: boot_array.in_range 
[ newfunc2 assign: self assign: key 
   pick: key pick: self boot_array.in_range 
   pick: self pick: key + 1 + memory.get func_return ] bind: boot_array.get 
[ newfunc3 assign: self assign: value assign: key 
   pick: key pick: self boot_array.in_range 
   pick: self pick: key + 1 + pick: value memory.set return_no_value ] bind: boot_array.set 
[ pick: l pick: i - pick: self boot_array.get tprint 
  printspace 
  check: i 1 - assign: i ] bind: autogen23 
[ newfunc1 assign: self 
   push: {\_ print 
   pick: self memory.get assign: l 
   pick: l assign: i 
   pushf: autogen23 repeat_if 
   push: } print return_no_value ] bind: boot_array.print 
[ check: i func_return ] bind: autogen24 
[ check: i 1 - assign: i 
  pick: value pick: i pick: self boot_array.get string_equal pushf: autogen24 if ] bind: autogen25 
[ newfunc2 assign: self assign: value 
   pick: self memory.get assign: i 
   pushf: autogen25 repeat_if 
   None func_return ] bind: boot_array.string_index 
[ check: i func_return ] bind: autogen26 
[ None func_return ] bind: autogen27 
[ drop1 
  pick: self memory.get assign: i ] bind: autogen28 
[ pick: key pick: i pick: self boot_array.get string_equal pushf: autogen26 if 
   pick: i pick: self boot_array.get 0 == pushf: autogen27 if 
  check: i 1 - assign: i 
  pick: i 0 == pushf: autogen28 if ] bind: autogen29 
[ newfunc3 assign: self assign: i assign: key 
   s21 assign: i assign: self 
   pushf: autogen29 repeat return_no_value ] bind: boot_array.hash_index 
[ check: i func_return ] bind: autogen30 
[ drop1 
  pick: self memory.get assign: i ] bind: autogen31 
[ pick: i pick: self boot_array.get 0 == pushf: autogen30 if 
  check: i 1 - assign: i 
  pick: i 0 == pushf: autogen31 if ] bind: autogen32 
[ newfunc2 assign: self assign: i 
   s21 assign: i assign: self 
   pushf: autogen32 repeat return_no_value ] bind: boot_array.none_index 
[ check: i 1 - assign: i 
  pick: i pick: i pick: self boot_array.get pick: other boot_array.set ] bind: autogen33 
[ newfunc2 assign: self assign: other 
   pick: self memory.get assign: i 
   pushf: autogen33 repeat_if return_no_value ] bind: boot_array.copy_to 
[ push: Array\_looking\_up\_ print 
  pick: name print 
  printeol ] bind: autogen34 
[ newfunc3 assign: searcher assign: receiver assign: name 
   pick: lookup_print pushf: autogen34 if 
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
  push: :\_ print 
  pick: l pick: i - pick: values boot_array.get tprint 
  push: ,\_ print 
  check: i 1 - assign: i ] bind: autogen35 
[ newfunc1 assign: self 
   push: {\_ print 
   pick: self memory.get assign: l 
   pick: self 1 + memory.get assign: keys 
   pick: self 2 + memory.get assign: values 
   pick: l assign: i 
   pushf: autogen35 repeat_if 
   push: } print return_no_value ] bind: boot_dict.print 
[ push: Dict\_looking\_up\_ print 
  pick: name print 
  printeol ] bind: autogen36 
[ newfunc3 assign: searcher assign: receiver assign: name 
   pick: lookup_print pushf: autogen36 if 
   pick: name push: get string_equal pick: boot_dict.get return_if 
   pick: name push: set string_equal pick: boot_dict.set return_if 
   pick: name push: instance string_equal pick: boot_dict.instance return_if 
   pick: name push: print string_equal pick: boot_dict.print return_if 
   pick: name push: increase string_equal pick: boot_dict.increase return_if 
   pick: name push: len string_equal pick: receiver memory.get return_if 
   pick: name push: keys string_equal pick: receiver 1 + memory.get return_if 
   pick: name push: values string_equal pick: receiver 2 + memory.get return_if 
   pick: name push: type string_equal push: boot_dict return_if 
   pick: name pick: receiver pick: searcher instance_attrib func_return ] bind: boot_dict.attrib 
 pick: boot_dict.attrib pick: boot_obj attr_call: subclass bind: boot_dict_class 
 pick: boot_dict_class attr: instance pick: boot_dict_class closure bind: boot_dict 
[ pick: False func_return ] bind: autogen37 
[ newfunc2 assign: class assign: other 
   pick: other is_basic pushf: autogen37 if 
   check: class pick: other 2 - memory.get == func_return ] bind: is_instance 
 memory.len Pointer bind: obj_boundary 
[ pick: False func_return ] bind: autogen38 
[ drop1 
  pick: n pick: i mod 0 == pushf: autogen38 if 
  check: i 1 + assign: i 
  pick: i pick: n < assign: cond ] bind: autogen39 
[ newfunc1 assign: n 
   2 assign: i 
   pick: i pick: n < assign: cond 
   pushf: autogen39 repeat_if 
   pick: True func_return ] bind: is_prime 
[ check: n func_return ] bind: autogen40 
[ pick: n is_prime pushf: autogen40 if 
  check: n 1 + assign: n ] bind: autogen41 
[ newfunc1 assign: n 
  pushf: autogen41 repeat return_no_value ] bind: next_prime 
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
[ push: Index\_too\_big error ] bind: autogen42 
[ push: Index\_still\_too\_big error ] bind: autogen43 
[ push: Negative\_index error ] bind: autogen44 
[ drop1 
  pick: start pick: self 1 + memory.get boot_array.none_index assign: l ] bind: autogen45 
[ push: Error\_reading\_new\_key error ] bind: autogen46 
[ newfunc3 assign: self assign: value assign: key 
   pick: key hash pick: self memory.get mod assign: start 
    pick: self memory.get pick: start < pushf: autogen42 if 
    pick: self memory.get pick: start == pushf: autogen43 if 
    pick: start 0 < pushf: autogen44 if 
   pick: key pick: start pick: self 1 + memory.get boot_array.hash_index assign: l 
   pick: l None == pushf: autogen45 if 
   pick: l pick: key pick: self 1 + memory.get boot_array.set 
   pick: l pick: value pick: self 2 + memory.get boot_array.set 
   pick: key pick: start pick: self 1 + memory.get boot_array.hash_index pick: l == not pushf: autogen46 if return_no_value ] bind: hashtable.set 
[ pick: key tprint 
  push: :\_ print 
  pick: l pick: i - pick: values boot_array.get print 
  push: ,\_ print ] bind: autogen47 
[ pick: l pick: i - pick: keys boot_array.get assign: key 
  pick: key 0 > pushf: autogen47 if 
  drop1 
  check: i 1 - assign: i ] bind: autogen48 
[ newfunc1 assign: self 
   push: {\_ print 
   pick: self memory.get assign: l 
   pick: self 1 + memory.get assign: keys 
   pick: self 2 + memory.get assign: values 
   pick: l assign: i 
   pushf: autogen48 repeat_if 
   push: } print return_no_value ] bind: hashtable.print 
[ s21 assign: count assign: i 
  check: count 1 + assign: count 
  s21 assign: i assign: count ] bind: autogen49 
[ check: i 1 - assign: i 
  pick: i pick: keys boot_array.get assign: key 
  check: key 0 > pushf: autogen49 if ] bind: autogen50 
[ newfunc1 assign: self 
   pick: self 1 + memory.get assign: keys 
   0 assign: count 
   pick: self memory.get assign: i 
   pushf: autogen50 repeat_if 
   pick: count func_return ] bind: hashtable.num_elems 
[ push: Dict\_looking\_up\_ print 
  pick: name print 
  printeol ] bind: autogen51 
[ newfunc3 assign: searcher assign: receiver assign: name 
   pick: lookup_print pushf: autogen51 if 
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
[ pick: index pushi: 3 + memory.get pick: index memory.get set_mem_hint ] bind: autogen52 
[ check: cond drop1 
  pick: index memory.get pick: index pushi: 3 + memory.get pick: names attr_call: set 
  pick: index pushi: 3 + memory.get type_of 2 == pushf: autogen52 if 
  check: index pushi: 7 + assign: index 
  pick: index pick: end > not assign: cond ] bind: autogen53 
[ newfunc0 
   functions.end assign: end 
   pick: names.get pushi: 5 + assign: index 
   pick: index pick: end > not assign: cond 
   pushf: autogen53 repeat_if return_no_value ] bind: convert_names 
[ push: Can't\_find\_global\_name:\_ print 
  pick: name printraw 
  printeol ] bind: autogen54 
[ pick: name is_str pushf: autogen54 if 
  push: Lookup\_error error assign: value ] bind: autogen55 
[ newfunc1 assign: name 
   pick: name names2 hashtable.get assign: value 
   pick: value None == pushf: autogen55 if 
   pick: value func_return ] bind: names.get 
[ newfunc1 assign: value 
   input.next_token assign: name 
   pick: name pick: value names2 hashtable.set 
   pick: value pick: name set_mem_hint return_no_value ] bind: new.bind 
 convert_names 
 push: bind: push: new.bind names2 hashtable.get names2 hashtable.set 
  push: bind: names2 hashtable.get rebind: bind: 
  push: names.get names2 hashtable.get rebind: names.get 
[ pick: index pick: func - func_return ] bind: autogen56 
[ pick: index memory.get pick: end_of_func == pushf: autogen56 if 
  check: index 1 + assign: index ] bind: autogen57 
[ newfunc1 assign: func 
   pick: func assign: index 
   pushf: autogen57 repeat return_no_value ] bind: func_len 
[ check: index func_return ] bind: autogen58 
[ check: index 1 + assign: index 
  pick: index memory.get pick: return_if == pushf: autogen58 if ] bind: autogen59 
[ newfunc1 assign: index 
  pushf: autogen59 repeat return_no_value ] bind: read_to_return_if 
[ None func_return ] bind: autogen60 
[ pick: index pushi: 3 + memory.get pick: index pushi: 5 + pick: attrib_hash attr_call: set ] bind: autogen61 
[ pick: index pick: end > pushf: autogen60 if 
  pick: index pushi: 3 + memory.get tprint 
  push: \_ print 
  pick: index pushi: 6 + memory.get tprint 
  printeol 
  pick: index pushi: 3 + memory.get pick: attrib_hash attr_call: get None == pushf: autogen61 if 
  check: index pushi: 5 + read_to_return_if assign: index 
  check: index 1 + assign: index ] bind: autogen62 
[ newfunc2 assign: attrib_hash assign: attrib 
   pick: attrib func_len assign: len 
   pick: attrib pick: len + pushi: 16 - assign: end 
   pick: attrib pushi: 12 + assign: index 
   pushf: autogen62 repeat return_no_value ] bind: add_attrib 
[ push: Total\_len:\_ print 
  pick: len print 
  printeol 
  pick: len func_return ] bind: autogen63 
[ pick: obj pick: nullobj_cached == pushf: autogen63 if 
  check: len pick: obj attr: attrib_raw func_len + assign: len 
  pick: obj attr: parent assign: parent 
  push: 214 shuffle assign: len assign: obj ] bind: autogen64 
[ newfunc1 assign: obj 
   pick: nullobj assign: nullobj_cached 
   s21 assign: obj assign: nullobj_cached 
   pick: obj attr: attrib_raw func_len assign: len 
   pushf: autogen64 repeat return_no_value ] bind: obj_total_len 
[ pick: attrib_hash func_return ] bind: autogen65 
[ pick: obj pick: nullobj_cached == pushf: autogen65 if 
  pick: obj attr: attrib_raw pick: attrib_hash add_attrib assign: attrib_hash 
  pick: obj attr: parent assign: parent 
  push: 315 shuffle assign: attrib_hash assign: obj ] bind: autogen66 
[ newfunc1 assign: obj 
   pick: nullobj assign: nullobj_cached 
   s21 assign: obj assign: nullobj_cached 
   pick: obj obj_total_len assign: len 
   check: len hashtable assign: attrib_hash 
   pushf: autogen66 repeat return_no_value ] bind: convert_attr 
  [ pick: True ] bind: hash_header 
 push: obj\_total\_len\_ print 
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
 push: total\_len\_is\_ print 
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
[ pick: self resizable.double ] bind: autogen67 
[ newfunc2 assign: self assign: value 
   pick: self memory.get pick: self resizable.max_len < not pushf: autogen67 if 
   pick: self memory.get pick: value pick: self resizable.set 
   pick: self resizable.increase return_no_value ] bind: resizable.append 
[ pick: l pick: i - pick: other resizable.get pick: self resizable.append 
  check: i 1 - assign: i ] bind: autogen68 
[ newfunc2 assign: self assign: other 
   pick: other attr: len assign: l 
   pick: l assign: i 
   pushf: autogen68 repeat_if return_no_value ] bind: resizable.extend 
[ return_no_value ] bind: autogen69 
[ pick: value pick: self resizable.extend ] bind: autogen70 
[ pick: value pick: self resizable.append ] bind: autogen71 
[ newfunc2 assign: self assign: value 
   pick: value None == pushf: autogen69 if 
   pick: value pick: resizable_class is_instance pushf: autogen70 pushf: autogen71 if-else return_no_value ] bind: resizable.append_array 
[ newfunc1 assign: self 
   pick: self pick: self memory.get 1 - memory.set 
   pick: self memory.get pick: self resizable.get func_return ] bind: resizable.pop 
[ newfunc1 assign: self 
  pick: self memory.get 1 - pick: self resizable.get func_return ] bind: resizable.top 
[ printspace ] bind: autogen72 
[ pick: l pick: i - pick: self resizable.get tprint 
  pick: i 1 > pushf: autogen72 if 
  check: i 1 - assign: i ] bind: autogen73 
[ newfunc1 assign: self 
   push: [ print 
   pick: self memory.get assign: l 
   pick: l assign: i 
   pushf: autogen73 repeat_if 
   push: ] print return_no_value ] bind: resizable.print 
[ newfunc1 assign: self 
  pick: self attr: array 1 + pick: self attr: len str_join func_return ] bind: resizable.join 
[ push: Resizable\_looking\_up\_ print 
  pick: name print 
  printeol ] bind: autogen74 
[ newfunc3 assign: searcher assign: receiver assign: name 
   pick: lookup_print pushf: autogen74 if 
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
   2 resizable memory.append 
   push: ] names.get memory.append 
   check: new_obj func_return ] bind: node.instance 
[ pick: key pick: children resizable.get func_return ] bind: autogen75 
[ pick: children func_return ] bind: autogen76 
[ pick: key 0 == pushf: autogen76 if 
  push: Out\_of\_bound\_index error ] bind: autogen77 
[ newfunc2 assign: self assign: key 
   pick: self 1 + memory.get assign: children 
   pick: children pick: resizable_class is_instance pushf: autogen75 pushf: autogen77 if-else return_no_value ] bind: node.get 
[ newfunc1 assign: self 
   pick: self memory.get printraw 
   push: { print 
   pick: self 1 + memory.get tprint 
   push: } print return_no_value ] bind: node.print 
[ pick: children memory.get func_return ] bind: autogen78 
[ 1 func_return ] bind: autogen79 
[ newfunc1 assign: self 
   pick: self 1 + memory.get assign: children 
   pick: children pick: resizable_class is_instance pushf: autogen78 pushf: autogen79 if-else return_no_value ] bind: node.len 
[ newfunc2 assign: self assign: new_name 
  pick: self pick: new_name memory.set return_no_value ] bind: node.set_name 
[ newfunc2 assign: self assign: new_children 
  pick: self 1 + pick: new_children memory.set return_no_value ] bind: node.set_children 
[ newfunc2 assign: self assign: pos 
  pick: self 2 + pick: pos memory.set return_no_value ] bind: node.set_pos 
[ push: Node\_looking\_up\_ print 
  pick: name print 
  printeol ] bind: autogen80 
[ newfunc3 assign: searcher assign: receiver assign: name 
   pick: lookup_print pushf: autogen80 if 
   pick: name push: get string_equal pick: node.get return_if 
   pick: name push: instance string_equal pick: node.instance return_if 
   pick: name push: print string_equal pick: node.print return_if 
   pick: name push: set_name string_equal pick: node.set_name return_if 
   pick: name push: set_children string_equal pick: node.set_children return_if 
   pick: name push: set_pos string_equal pick: node.set_pos return_if 
   pick: name push: len string_equal pick: receiver node.len return_if 
   pick: name push: name string_equal pick: receiver memory.get return_if 
   pick: name push: children string_equal pick: receiver 1 + memory.get return_if 
   pick: name push: pos string_equal pick: receiver 2 + memory.get return_if 
   pick: name push: type string_equal push: node return_if 
   pick: name pick: receiver pick: searcher instance_attrib func_return ] bind: node.attrib 
 pick: node.attrib pick: boot_obj attr_call: subclass bind: node_class 
 pick: node_class attr: instance pick: node_class closure bind: node 
 pick: node_class convert_attr bind: node.hash 
[ newfunc3 assign: searcher assign: receiver assign: name 
   hash_header 
   pick: name pick: node.hash hashtable.get call return_no_value ] rebind: node.attrib 
[ newfunc3 assign: pos assign: children assign: name 
   pick: name pick: children node assign: res 
   pick: pos pick: res attr_call: set_pos 
   pick: res func_return ] bind: nodep 
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
[ push: Input\_looking\_up\_ print 
  pick: name print 
  printeol ] bind: autogen81 
[ newfunc3 assign: searcher assign: receiver assign: name 
   pick: lookup_print pushf: autogen81 if 
   pick: name push: instance string_equal pick: Input.instance return_if 
   pick: name push: ended string_equal pick: Input.ended return_if 
   pick: name push: next string_equal pick: Input.next return_if 
   pick: name push: next_char string_equal pick: Input.next_char return_if 
   pick: name push: startswith string_equal pick: Input.startswith return_if 
   pick: name push: position string_equal pick: Input.position return_if 
   pick: name push: position_set string_equal pick: Input.position_set return_if 
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
[ push: CheatDict\_looking\_up\_ print 
  pick: name print 
  printeol ] bind: autogen82 
[ newfunc3 assign: searcher assign: receiver assign: name 
   pick: lookup_print pushf: autogen82 if 
   pick: name push: instance string_equal pick: cheat_dict.instance return_if 
   pick: name push: get string_equal pick: _cheat_dict.get return_if 
   pick: name push: set string_equal pick: _cheat_dict.set return_if 
   pick: name pick: receiver pick: searcher instance_attrib func_return ] bind: cheat_dict.attrib 
 pick: cheat_dict.attrib pick: boot_obj attr_call: subclass bind: cheat_dict_class 
 pick: cheat_dict_class attr: instance pick: cheat_dict_class closure bind: cheat_dict 
[ newfunc2 assign: end assign: start 
   0 resizable assign: pos 
   pick: start pick: pos attr_call: append 
   pick: end pick: pos attr_call: append 
   pick: pos func_return ] bind: pair 
[ newfunc2 assign: self assign: message 
   pick: boot_obj minobj.instance assign: new_obj 
   pick: new_obj 2 - pick: self memory.set 
   pick: new_obj pick: message memory.set 
   push: ] names.get memory.append 
   pick: new_obj func_return ] bind: MatchError.instance 
[ newfunc1 assign: self 
   push: Match\_error: print 
   check: self memory.get print return_no_value ] bind: MatchError.print 
[ push: MatchError\_looking\_up\_ print 
  pick: name print 
  printeol ] bind: autogen83 
[ newfunc3 assign: searcher assign: receiver assign: name 
   pick: lookup_print pushf: autogen83 if 
   pick: name push: instance string_equal pick: MatchError.instance return_if 
   pick: name push: print string_equal pick: MatchError.print return_if 
   pick: name push: type string_equal push: MatchError return_if 
   pick: name pick: receiver pick: searcher instance_attrib func_return ] bind: MatchError.attrib 
 pick: MatchError.attrib pick: boot_obj attr_call: subclass bind: MatchError_class 
 pick: MatchError_class attr: instance pick: MatchError_class closure bind: MatchError 
[ push: End\_of\_file MatchError func_return ] bind: autogen84 
[ push: Not\_exactly MatchError func_return ] bind: autogen85 
[ newfunc1 assign: char 
   pick: source attr_call: next_char assign: input_char 
    pick: input_char None == pushf: autogen84 if 
    pick: char pick: input_char string_equal not pushf: autogen85 if 
   check: input_char func_return ] bind: exactly 
[ push: End\_of\_file MatchError func_return ] bind: autogen86 
[ push: Not\_between MatchError func_return ] bind: autogen87 
[ newfunc2 assign: end assign: start 
   pick: source attr_call: next_char assign: input_char 
    pick: input_char None == pushf: autogen86 if 
    pick: start pick: end pick: input_char char_between not pushf: autogen87 if 
   check: input_char func_return ] bind: between 
[ push: End\_of\_file MatchError func_return ] bind: autogen88 
[ push: Not\_exactly MatchError func_return ] bind: autogen89 
[ newfunc1 assign: char 
   pick: source attr_call: next assign: input_char 
    pick: input_char None == pushf: autogen88 if 
    pick: char pick: input_char string_equal not pushf: autogen89 if 
   check: input_char func_return ] bind: token 
[ 0 0 func_return_two ] bind: autogen90 
[ newfunc1 assign: children 
   pick: children memory.get pick: end_of_func == pushf: autogen90 if 
   pick: children 2 + pick: children 1 + memory.get func_return_two return_no_value ] bind: next_child 
[ check: output func_return ] bind: autogen91 
[ check: child call assign: output 
  pick: output pick: MatchError_class is_instance not pushf: autogen91 if 
  check: output drop1 
  pick: saved pick: source attr_call: position_set 
  check: children next_child assign: child assign: children ] bind: autogen92 
[ newfunc1 assign: children 
   pick: source attr_call: position assign: saved 
   s21 assign: children assign: saved 
   check: children next_child assign: child assign: children 
   pushf: autogen92 repeat_if 
   push: No\_OR\_child\_matches MatchError func_return ] bind: or 
[ check: output func_return ] bind: autogen93 
[ newfunc1 assign: child 
   check: child call assign: output 
   pick: output pick: MatchError_class is_instance pushf: autogen93 if 
   push: out pick: output node func_return ] bind: out 
[ pick: output attr: name push: out string_equal func_return ] bind: autogen94 
[ newfunc1 assign: output 
   pick: output pick: node_class is_instance pushf: autogen94 if 
   pick: False func_return ] bind: is_output 
[ pick: outputs func_return ] bind: autogen95 
[ pick: outputs attr: array 1 + pick: length str_join func_return ] bind: autogen96 
[ pick: output str_len 1 == pushf: autogen96 if ] bind: autogen97 
[ pick: output func_return ] bind: autogen98 
[ pick: outputs attr: len assign: length 
  pick: length 0 == pushf: autogen95 if 
  0 pick: outputs attr_call: get assign: output 
   pick: output is_str pushf: autogen97 if 
   pick: length 1 == pushf: autogen98 if 
  pick: outputs func_return ] bind: autogen99 
[ pick: outputs attr: children func_return ] bind: autogen100 
[ pick: outputs attr: children is_str pushf: autogen100 if ] bind: autogen101 
[ pick: outputs pick: node_class is_instance pushf: autogen101 if 
  pick: outputs func_return ] bind: autogen102 
[ newfunc1 assign: outputs 
  pick: outputs pick: resizable_class is_instance pushf: autogen99 pushf: autogen102 if-else return_no_value ] bind: make_string 
[ pick: saved pick: source attr_call: position_set 
  push: And\_match\_failed MatchError func_return ] bind: autogen103 
[ pick: output attr: children pick: outputs attr_call: append_array ] bind: autogen104 
[ pick: output is_output pushf: autogen104 if 
  check: output drop1 ] bind: autogen105 
[ 0 resizable assign: outputs 
  pick: output attr: children pick: outputs attr_call: append_array 
  pick: True assign: output_mode 
  s4127 assign: children assign: output_mode assign: outputs ] bind: autogen106 
[ pick: output pick: outputs attr_call: append_array 
  check: output drop1 ] bind: autogen107 
[ pick: output is_output pushf: autogen106 pushf: autogen107 if-else ] bind: autogen108 
[ check: child call assign: output 
   pick: output pick: MatchError_class is_instance pushf: autogen103 if 
   pick: output_mode pushf: autogen105 pushf: autogen108 if-else 
  check: children next_child assign: child assign: children ] bind: autogen109 
[ newfunc1 assign: init_children 
   pick: source attr_call: position assign: saved 
   0 resizable assign: outputs 
   pick: False assign: output_mode 
   pick: init_children assign: children 
   check: children next_child assign: child assign: children 
   pushf: autogen109 repeat_if 
   pick: outputs make_string func_return ] bind: and 
[ 0 c.infinity func_return_two ] bind: autogen110 
[ 1 c.infinity func_return_two ] bind: autogen111 
[ 0 1 func_return_two ] bind: autogen112 
[ newfunc1 assign: quantifier 
    pick: quantifier push: * string_equal pushf: autogen110 if 
    pick: quantifier push: + string_equal pushf: autogen111 if 
    pick: quantifier push: ? string_equal pushf: autogen112 if 
   push: Unknown\_quantifier error return_no_value ] bind: get_bounds 
[ pick: start_saved pick: source attr_call: position_set 
  push: Quantified\_undermatch MatchError func_return ] bind: autogen113 
[ pick: count pick: lower < pushf: autogen113 if 
  pick: saved pick: source attr_call: position_set 
  pick: outputs make_string func_return ] bind: autogen114 
[ pick: outputs make_string func_return ] bind: autogen115 
[ pick: source attr_call: position assign: saved 
  pick: child call assign: output 
  pick: output pick: MatchError_class is_instance pushf: autogen114 if 
  check: output pick: outputs attr_call: append_array 
  check: saved drop1 
  check: count 1 + assign: count 
  pick: count pick: upper == pushf: autogen115 if ] bind: autogen116 
[ newfunc2 assign: quantifier assign: child 
   check: quantifier get_bounds assign: upper assign: lower 
   0 resizable assign: outputs 
   pick: source attr_call: position assign: start_saved 
   0 assign: count 
   pushf: autogen116 repeat return_no_value ] bind: quantified 
[ None func_return ] bind: autogen117 
[ newfunc1 assign: child 
   pick: source attr_call: position assign: saved 
   s21 assign: child assign: saved 
   check: child call assign: output 
   pick: saved pick: source attr_call: position_set 
   pick: output pick: MatchError_class is_instance pushf: autogen117 if 
   push: Negation\_is\_true MatchError func_return ] bind: negation 
[ pick: output func_return ] bind: autogen118 
[ newfunc2 assign: name assign: child 
   pick: source attr_call: position assign: saved 
   pick: child call assign: output 
   pick: output pick: MatchError_class is_instance pushf: autogen118 if 
   pick: name pick: output pick: saved pick: source attr_call: position pair nodep func_return ] bind: bound 
[ pick: output attr: len 1 > func_return ] bind: autogen119 
[ newfunc1 assign: output 
   pick: output pick: resizable_class is_instance pushf: autogen119 if 
   pick: False func_return ] bind: should_make_node 
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
  check: i 1 - assign: i ] bind: autogen120 
[ pick: nesting assign: i 
  pushf: autogen120 repeat_if 
  pick: name print 
  printspace 
  pick: source attr_call: position tprint 
  printeol ] bind: autogen121 
[ printspace 
  check: i 1 - assign: i ] bind: autogen122 
[ pick: nesting assign: i 
  pushf: autogen122 repeat_if 
  pick: name print 
  printspace 
  pick: source attr_call: position tprint 
  push: \_->\_ print 
  pick: output tprint 
  printeol ] bind: autogen123 
[ printspace 
  check: i 1 - assign: i ] bind: autogen124 
[ pick: nesting assign: i 
  pushf: autogen124 repeat_if 
  pick: name print 
  push: \_->\_ print 
  pick: output tprint 
  printeol ] bind: autogen125 
[ pick: output func_return ] bind: autogen126 
[ push: Making\_node\_ print 
  pick: name printraw 
  printeol 
  pick: name pick: output pick: saved pick: source attr_call: position pair nodep func_return ] bind: autogen127 
[ pick: output func_return ] bind: autogen128 
[ newfunc1 assign: name 
   push: nest pick: parseg attr_call: get assign: nesting 
   pick: source attr_call: position assign: saved 
   push: apply_print pick: parseg attr_call: get pushf: autogen121 if 
   push: nest pick: nesting 1 + pick: parseg attr_call: set 
   pick: name push: rules pick: parseg attr_call: get hashtable.get call assign: output 
   push: nest pick: nesting pick: parseg attr_call: set 
    push: apply_print pick: parseg attr_call: get pushf: autogen123 if 
    pick: name push: statement string_equal pushf: autogen125 if 
    pick: output pick: MatchError_class is_instance pushf: autogen126 if 
    pick: output should_make_node pushf: autogen127 if 
    pick: name push: flagged pick: parseg attr_call: get attr_call: string_index None == pushf: autogen128 if 
   pick: name pick: output pick: saved pick: source attr_call: position pair nodep func_return ] rebind: _apply 
[ check: new_pos pick: source attr_call: position_set 
  check: mem_out func_return ] bind: autogen129 
[ pick: source attr_call: position assign: saved 
  pick: name _apply assign: output 
  pick: name pick: saved push: indentation pick: parseg attr_call: get pick: output pick: source attr_call: position memoizer.set 
  check: output func_return ] bind: autogen130 
[ newfunc1 assign: name 
   pick: name pick: source attr_call: position push: indentation pick: parseg attr_call: get memoizer.get assign: memoized assign: new_pos assign: mem_out 
   check: memoized pushf: autogen129 pushf: autogen130 if-else return_no_value ] bind: apply 
[ push: End\_of\_file MatchError func_return ] bind: autogen131 
[ newfunc0 
   pick: source attr_call: next_char assign: char 
   pick: char None == pushf: autogen131 if 
   check: char func_return ] bind: base.rules.anything 
[ newfunc0 
  None func_return ] bind: base.rules.void 
[ push: a push: z between ] bind: autogen132 
[ push: A push: Z between ] bind: autogen133 
[ pushf: autogen132 pushf: autogen133 ] bind: autogen134 
[ newfunc0 
  pushf: autogen134 or func_return ] bind: base.rules.letter 
[ newfunc0 
  push: 0 push: 9 between func_return ] bind: base.rules.digit 
[ push: rule.letter apply ] bind: autogen135 
[ push: _ exactly ] bind: autogen136 
[ pushf: autogen135 pushf: autogen136 ] bind: autogen137 
[ pushf: autogen137 or ] bind: autogen138 
[ push: rule.letter apply ] bind: autogen139 
[ push: rule.digit apply ] bind: autogen140 
[ push: _ exactly ] bind: autogen141 
[ pushf: autogen139 pushf: autogen140 pushf: autogen141 ] bind: autogen142 
[ pushf: autogen142 or ] bind: autogen143 
[ pushf: autogen143 push: * quantified ] bind: autogen144 
[ pushf: autogen138 pushf: autogen144 ] bind: autogen145 
[ newfunc0 
  pushf: autogen145 and func_return ] bind: base.rules.name 
[ pick: output func_return ] bind: autogen146 
[ push: \t func_return ] bind: autogen147 
[ push: \n func_return ] bind: autogen148 
[ push: \r func_return ] bind: autogen149 
[ push: \\ func_return ] bind: autogen150 
[ push: ' func_return ] bind: autogen151 
[ push: " func_return ] bind: autogen152 
[ newfunc0 
   push: raw_escaped_char apply assign: output 
    pick: output pick: MatchError_class is_instance pushf: autogen146 if 
    pick: output push: t string_equal pushf: autogen147 if 
    pick: output push: n string_equal pushf: autogen148 if 
    pick: output push: r string_equal pushf: autogen149 if 
    pick: output push: \\ string_equal pushf: autogen150 if 
    pick: output push: ' string_equal pushf: autogen151 if 
    pick: output push: " string_equal pushf: autogen152 if 
   push: Unknown\_escaped\_char error return_no_value ] bind: base.rules.wrapped_escaped_char 
[ newfunc1 assign: rules 
   push: letter pick: base.rules.letter pick: rules hashtable.set 
   push: digit pick: base.rules.digit pick: rules hashtable.set 
   push: anything pick: base.rules.anything pick: rules hashtable.set 
   push: void pick: base.rules.void pick: rules hashtable.set return_no_value ] bind: add_base_rules 
[ newfunc1 assign: rules 
   push: raw_escaped_char push: escaped_char pick: rules attr_call: get pick: rules hashtable.set 
   push: escaped_char pick: base.rules.wrapped_escaped_char pick: rules hashtable.set return_no_value ] bind: add_escaped_char_rules 
 None bind: source 
[ push: letter apply ] bind: autogen153 
[ push: _ exactly ] bind: autogen154 
[ pushf: autogen153 pushf: autogen154 ] bind: autogen155 
[ pushf: autogen155 or ] bind: autogen156 
[ push: letter apply ] bind: autogen157 
[ push: digit apply ] bind: autogen158 
[ push: _ exactly ] bind: autogen159 
[ pushf: autogen157 pushf: autogen158 pushf: autogen159 ] bind: autogen160 
[ pushf: autogen160 or ] bind: autogen161 
[ pushf: autogen161 push: * quantified ] bind: autogen162 
[ pushf: autogen156 pushf: autogen162 ] bind: autogen163 
[ newfunc0 
  pushf: autogen163 and func_return ] bind: bootg.rules.name 
[ push: apply apply ] bind: autogen164 
[ push: exactly apply ] bind: autogen165 
[ push: token apply ] bind: autogen166 
[ push: parenthesis apply ] bind: autogen167 
[ push: output apply ] bind: autogen168 
[ pushf: autogen164 pushf: autogen165 pushf: autogen166 pushf: autogen167 pushf: autogen168 ] bind: autogen169 
[ newfunc0 
  pushf: autogen169 or func_return ] bind: bootg.rules.expr 
[ push: ' token ] bind: autogen170 
[ push: escaped_char apply ] bind: autogen171 
[ push: ' exactly ] bind: autogen172 
[ pushf: autogen172 negation ] bind: autogen173 
[ push: anything apply ] bind: autogen174 
[ pushf: autogen173 pushf: autogen174 ] bind: autogen175 
[ pushf: autogen175 and ] bind: autogen176 
[ pushf: autogen171 pushf: autogen176 ] bind: autogen177 
[ pushf: autogen177 or ] bind: autogen178 
[ pushf: autogen178 push: * quantified ] bind: autogen179 
[ pushf: autogen179 out ] bind: autogen180 
[ push: ' token ] bind: autogen181 
[ pushf: autogen170 pushf: autogen180 pushf: autogen181 ] bind: autogen182 
[ newfunc0 
  pushf: autogen182 and func_return ] bind: bootg.rules.exactly 
[ push: \q token ] bind: autogen183 
[ push: escaped_char apply ] bind: autogen184 
[ push: \q exactly ] bind: autogen185 
[ pushf: autogen185 negation ] bind: autogen186 
[ push: anything apply ] bind: autogen187 
[ pushf: autogen186 pushf: autogen187 ] bind: autogen188 
[ pushf: autogen188 and ] bind: autogen189 
[ pushf: autogen184 pushf: autogen189 ] bind: autogen190 
[ pushf: autogen190 or ] bind: autogen191 
[ pushf: autogen191 push: * quantified ] bind: autogen192 
[ pushf: autogen192 out ] bind: autogen193 
[ push: \q token ] bind: autogen194 
[ pushf: autogen183 pushf: autogen193 pushf: autogen194 ] bind: autogen195 
[ newfunc0 
  pushf: autogen195 and func_return ] bind: bootg.rules.token 
[ push: \\ exactly ] bind: autogen196 
[ push: n exactly ] bind: autogen197 
[ push: r exactly ] bind: autogen198 
[ push: t exactly ] bind: autogen199 
[ push: b exactly ] bind: autogen200 
[ push: f exactly ] bind: autogen201 
[ push: \q exactly ] bind: autogen202 
[ push: ' exactly ] bind: autogen203 
[ push: \\ exactly ] bind: autogen204 
[ pushf: autogen197 pushf: autogen198 pushf: autogen199 pushf: autogen200 pushf: autogen201 pushf: autogen202 pushf: autogen203 pushf: autogen204 ] bind: autogen205 
[ pushf: autogen205 or ] bind: autogen206 
[ pushf: autogen206 out ] bind: autogen207 
[ pushf: autogen196 pushf: autogen207 ] bind: autogen208 
[ newfunc0 
  pushf: autogen208 and func_return ] bind: bootg.rules.escaped_char 
[ push: \t exactly ] bind: autogen209 
[ push: \_ exactly ] bind: autogen210 
[ pushf: autogen209 pushf: autogen210 ] bind: autogen211 
[ pushf: autogen211 or ] bind: autogen212 
[ pushf: autogen212 push: * quantified ] bind: autogen213 
[ push: name apply ] bind: autogen214 
[ pushf: autogen214 out ] bind: autogen215 
[ pushf: autogen213 pushf: autogen215 ] bind: autogen216 
[ newfunc0 
  pushf: autogen216 and func_return ] bind: bootg.rules.apply 
[ push: ( token ] bind: autogen217 
[ push: or apply ] bind: autogen218 
[ pushf: autogen218 out ] bind: autogen219 
[ push: ) token ] bind: autogen220 
[ pushf: autogen217 pushf: autogen219 pushf: autogen220 ] bind: autogen221 
[ newfunc0 
  pushf: autogen221 and func_return ] bind: bootg.rules.parenthesis 
[ push: { token ] bind: autogen222 
[ push: or apply ] bind: autogen223 
[ pushf: autogen223 out ] bind: autogen224 
[ push: } token ] bind: autogen225 
[ pushf: autogen222 pushf: autogen224 pushf: autogen225 ] bind: autogen226 
[ newfunc0 
  pushf: autogen226 and func_return ] bind: bootg.rules.output 
[ push: ~ token ] bind: autogen227 
[ push: expr apply ] bind: autogen228 
[ pushf: autogen228 push: negation bound ] bind: autogen229 
[ pushf: autogen229 out ] bind: autogen230 
[ pushf: autogen227 pushf: autogen230 ] bind: autogen231 
[ pushf: autogen231 and ] bind: autogen232 
[ push: expr apply ] bind: autogen233 
[ pushf: autogen232 pushf: autogen233 ] bind: autogen234 
[ newfunc0 
  pushf: autogen234 or func_return ] bind: bootg.rules.not 
[ push: not apply ] bind: autogen235 
[ push: * exactly ] bind: autogen236 
[ push: + exactly ] bind: autogen237 
[ push: ? exactly ] bind: autogen238 
[ pushf: autogen236 pushf: autogen237 pushf: autogen238 ] bind: autogen239 
[ pushf: autogen239 or ] bind: autogen240 
[ pushf: autogen240 push: ? quantified ] bind: autogen241 
[ pushf: autogen235 pushf: autogen241 ] bind: autogen242 
[ newfunc0 
  pushf: autogen242 and func_return ] bind: bootg.rules.quantified 
[ push: quantified apply ] bind: autogen243 
[ push: = exactly ] bind: autogen244 
[ push: name apply ] bind: autogen245 
[ pushf: autogen245 out ] bind: autogen246 
[ pushf: autogen244 pushf: autogen246 ] bind: autogen247 
[ pushf: autogen247 and ] bind: autogen248 
[ pushf: autogen248 push: ? quantified ] bind: autogen249 
[ pushf: autogen243 pushf: autogen249 ] bind: autogen250 
[ newfunc0 
  pushf: autogen250 and func_return ] bind: bootg.rules.bound 
[ push: bound apply ] bind: autogen251 
[ newfunc0 
  pushf: autogen251 push: * quantified func_return ] bind: bootg.rules.and 
[ push: and apply ] bind: autogen252 
[ push: | token ] bind: autogen253 
[ push: and apply ] bind: autogen254 
[ pushf: autogen254 out ] bind: autogen255 
[ pushf: autogen253 pushf: autogen255 ] bind: autogen256 
[ pushf: autogen256 and ] bind: autogen257 
[ pushf: autogen257 push: * quantified ] bind: autogen258 
[ pushf: autogen252 pushf: autogen258 ] bind: autogen259 
[ newfunc0 
  pushf: autogen259 and func_return ] bind: bootg.rules.or 
[ push: spaces apply ] bind: autogen260 
[ push: name apply ] bind: autogen261 
[ pushf: autogen261 push: rule_name bound ] bind: autogen262 
[ push: ! exactly ] bind: autogen263 
[ pushf: autogen263 push: ? quantified ] bind: autogen264 
[ pushf: autogen264 push: flags bound ] bind: autogen265 
[ push: and apply ] bind: autogen266 
[ pushf: autogen266 push: args bound ] bind: autogen267 
[ push: = token ] bind: autogen268 
[ push: or apply ] bind: autogen269 
[ pushf: autogen269 out ] bind: autogen270 
[ pushf: autogen268 pushf: autogen270 ] bind: autogen271 
[ pushf: autogen271 and ] bind: autogen272 
[ pushf: autogen262 pushf: autogen265 pushf: autogen267 pushf: autogen272 ] bind: autogen273 
[ pushf: autogen273 and ] bind: autogen274 
[ pushf: autogen274 out ] bind: autogen275 
[ pushf: autogen260 pushf: autogen275 ] bind: autogen276 
[ newfunc0 
  pushf: autogen276 and func_return ] bind: bootg.rules.rule 
[ push: rule apply ] bind: autogen277 
[ pushf: autogen277 push: * quantified ] bind: autogen278 
[ pushf: autogen278 out ] bind: autogen279 
[ push: spaces apply ] bind: autogen280 
[ pushf: autogen279 pushf: autogen280 ] bind: autogen281 
[ newfunc0 
  pushf: autogen281 and func_return ] bind: bootg.rules.grammar 
[ push: # exactly ] bind: autogen282 
[ push: \n exactly ] bind: autogen283 
[ pushf: autogen283 negation ] bind: autogen284 
[ push: anything apply ] bind: autogen285 
[ pushf: autogen284 pushf: autogen285 ] bind: autogen286 
[ pushf: autogen286 and ] bind: autogen287 
[ pushf: autogen287 push: * quantified ] bind: autogen288 
[ pushf: autogen282 pushf: autogen288 ] bind: autogen289 
[ newfunc0 
  pushf: autogen289 and func_return ] bind: bootg.rules.comment 
[ push: \_ exactly ] bind: autogen290 
[ push: \t exactly ] bind: autogen291 
[ push: comment apply ] bind: autogen292 
[ pushf: autogen290 pushf: autogen291 pushf: autogen292 ] bind: autogen293 
[ newfunc0 
  pushf: autogen293 or func_return ] bind: bootg.rules.hspace 
[ push: hspace apply ] bind: autogen294 
[ pushf: autogen294 push: * quantified ] bind: autogen295 
[ push: \r exactly ] bind: autogen296 
[ push: \n exactly ] bind: autogen297 
[ pushf: autogen296 pushf: autogen297 ] bind: autogen298 
[ pushf: autogen298 and ] bind: autogen299 
[ push: \r exactly ] bind: autogen300 
[ push: \n exactly ] bind: autogen301 
[ pushf: autogen299 pushf: autogen300 pushf: autogen301 ] bind: autogen302 
[ pushf: autogen302 or ] bind: autogen303 
[ pushf: autogen295 pushf: autogen303 ] bind: autogen304 
[ pushf: autogen304 and ] bind: autogen305 
[ pushf: autogen305 push: * quantified ] bind: autogen306 
[ push: hspace apply ] bind: autogen307 
[ pushf: autogen307 push: + quantified ] bind: autogen308 
[ pushf: autogen306 pushf: autogen308 ] bind: autogen309 
[ newfunc0 
  pushf: autogen309 and func_return ] bind: bootg.rules.indentation 
[ push: \n exactly ] bind: autogen310 
[ push: \r exactly ] bind: autogen311 
[ push: hspace apply ] bind: autogen312 
[ pushf: autogen310 pushf: autogen311 pushf: autogen312 ] bind: autogen313 
[ newfunc0 
  pushf: autogen313 or func_return ] bind: bootg.rules.space 
[ push: space apply ] bind: autogen314 
[ newfunc0 
  pushf: autogen314 push: * quantified func_return ] bind: bootg.rules.spaces 
 pushi: 200 hashtable bind: bootg.rules 
 0 resizable bind: bootg.flagged 
 push: name pick: bootg.rules.name pick: bootg.rules hashtable.set 
 push: expr pick: bootg.rules.expr pick: bootg.rules hashtable.set 
 push: exactly pick: bootg.rules.exactly pick: bootg.rules hashtable.set 
 push: exactly pick: bootg.flagged attr_call: append 
 push: token pick: bootg.rules.token pick: bootg.rules hashtable.set 
 push: token pick: bootg.flagged attr_call: append 
 push: escaped_char pick: bootg.rules.escaped_char pick: bootg.rules hashtable.set 
 push: escaped_char pick: bootg.flagged attr_call: append 
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
 push: add_base_rules pick: bootg.base attr_call: append 
 push: add_escaped_char_rules pick: bootg.base attr_call: append 
 0 resizable bind: bootg 
 push: bootg pick: bootg attr_call: append 
 pick: bootg.rules pick: bootg attr_call: append 
 pick: bootg.flagged pick: bootg attr_call: append 
 pick: bootg.base pick: bootg attr_call: append 
 memoizer.reset 
 push: Running_grammar print 
 printeol 
 push: stage2.pkl save 
 push: stage2.pkl load 
[ newfunc1 assign: root 
  push: Dummy\_function\_should\_not\_be\_called error return_no_value ] bind: to_flpc2 
[ pick: root printrepr return_no_value ] bind: autogen315 
[ 0 pick: root attr_call: get to_flpc2 return_no_value ] bind: autogen316 
[ 0 pick: root attr_call: get to_flpc2 return_no_value ] bind: autogen317 
[ 0 pick: root attr_call: get tprint 
  push: Unexpected\_child\_of\_exactly.\_Was\_expecting\_a\_escaped\_chart. error ] bind: autogen318 
[ 0 pick: root attr_call: get attr: name push: escaped_char string_equal not pushf: autogen318 if 
  pick: root attr: name 0 0 pick: root attr_call: get attr_call: get node to_flpc2 return_no_value ] bind: autogen319 
[ push: prefix pick: parseg attr_call: get printraw 
  push: .rules. print 
  0 0 pick: root attr_call: get attr_call: get printraw 
  push: \_<-\_fun[]:\n\_\_\_\_return( print 
  pushi: 3 pick: root attr_call: get to_flpc2 
  push: ) print return_no_value ] bind: autogen320 
[ push: out print ] bind: autogen321 
[ pick: name printraw ] bind: autogen322 
[ push: [ print ] bind: autogen323 
[ push: [ print ] bind: autogen324 
[ check: bracket 1 + assign: bracket ] bind: autogen325 
[ check: bracket 1 + assign: bracket ] bind: autogen326 
[ check: bracket 1 + assign: bracket ] bind: autogen327 
[ pick: child attr: name push: quantifier string_equal pushf: autogen326 if 
  pick: child attr: name push: inline string_equal pushf: autogen327 if ] bind: autogen328 
[ push: [ print ] bind: autogen329 
[ push: ] print ] bind: autogen330 
[ push: \_ print ] bind: autogen331 
[ pick: l pick: i - pick: root attr_call: get assign: child 
  0 assign: bracket 
   pick: child pick: node_class is_instance not pushf: autogen325 pushf: autogen328 if-else 
   pick: bracket not pushf: autogen329 if 
  s21 assign: child assign: bracket 
  check: child to_flpc2 
  check: bracket not pushf: autogen330 if 
  check: i 1 - assign: i 
  pick: i 0 > pushf: autogen331 if ] bind: autogen332 
[ push: ] print ] bind: autogen333 
[ push: ] print ] bind: autogen334 
[ newfunc1 assign: root 
   pick: root pick: node_class is_instance not pushf: autogen315 if 
   pick: root attr: name assign: name 
    pick: name push: quantifier string_equal pushf: autogen316 if 
    pick: name push: inline string_equal pushf: autogen317 if 
    pick: name push: exactly string_equal pick: name push: token string_equal || 0 pick: root attr_call: get pick: node_class is_instance && pushf: autogen319 if 
    pick: name push: rule string_equal pushf: autogen320 if 
    pick: name push: output string_equal pushf: autogen321 pushf: autogen322 if-else 
   push: ( print 
    pick: name push: and string_equal pushf: autogen323 if 
    pick: name push: or string_equal pushf: autogen324 if 
   pick: root attr: len assign: l 
   pick: l assign: i 
    pushf: autogen332 repeat_if 
    pick: name push: and string_equal pushf: autogen333 if 
    pick: name push: or string_equal pushf: autogen334 if 
   push: ) print return_no_value ] rebind: to_flpc2 
[ pick: l pick: i - pick: root attr_call: get to_flpc2 
  printeol 
  printeol 
  check: i 1 - assign: i ] bind: autogen335 
[ newfunc1 assign: root 
   pick: root attr: len assign: l 
   pick: l assign: i 
   pushf: autogen335 repeat_if return_no_value ] bind: print_grammar_funcs 
[ newfunc1 assign: ruleset 
   pick: ruleset printraw 
   push: ( print 
   push: prefix pick: parseg attr_call: get printraw 
   push: .rules) print 
   printeol return_no_value ] bind: print_ruleset 
[ pick: prefix printraw 
  push: .base\_.\_append(" print 
  pick: l pick: i - push: base_rules pick: parseg attr_call: get attr_call: get printraw 
  push: ") print 
  printeol 
  check: i 1 - assign: i ] bind: autogen336 
[ newfunc0 
   push: prefix pick: parseg attr_call: get assign: prefix 
   pick: prefix printraw 
   push: .base\_<-\_resizable(0) print 
   printeol 
   push: base_rules pick: parseg attr_call: get attr: len assign: l 
   pick: l assign: i 
   pushf: autogen336 repeat_if 
   pick: prefix printraw 
   push: \_<-\_resizable(0) print 
   printeol 
   pick: prefix printraw 
   push: \_.\_append(" print 
   pick: prefix printraw 
   push: ") print 
   printeol 
   pick: prefix printraw 
   push: \_.\_append( print 
   pick: prefix printraw 
   push: .rules) print 
   printeol 
   pick: prefix printraw 
   push: \_.\_append( print 
   pick: prefix printraw 
   push: .flagged) print 
   printeol 
   pick: prefix printraw 
   push: \_.\_append( print 
   pick: prefix printraw 
   push: .base) print 
   printeol return_no_value ] bind: print_grammar_obj 
[ push: prefix pick: parseg attr_call: get printraw 
  push: .flagged\_.\_append(" print 
  pick: name printraw 
  push: ") print 
  printeol ] bind: autogen337 
[ newfunc1 assign: child 
   0 0 pick: child attr_call: get attr_call: get assign: name 
   push: hashtable.set(" print 
   pick: name printraw 
   push: "\_ print 
   push: prefix pick: parseg attr_call: get printraw 
   push: .rules. print 
   pick: name printraw 
   push: \_ print 
   push: prefix pick: parseg attr_call: get printraw 
   push: .rules) print 
   printeol 
   1 pick: child attr_call: get attr: len 0 > pushf: autogen337 if return_no_value ] bind: print_child_setter 
[ pick: l pick: i - pick: root attr_call: get print_child_setter 
  check: i 1 - assign: i ] bind: autogen338 
[ pick: l pick: i - push: base_rules pick: parseg attr_call: get attr_call: get print_ruleset 
  check: i 1 - assign: i ] bind: autogen339 
[ newfunc1 assign: root 
   pick: root attr: len assign: l 
   push: prefix pick: parseg attr_call: get printraw 
   push: .rules\_<-\_hashtable( print 
   pick: l pick: l + pick: l + pick: l + int_to_str print 
   push: ) print 
   printeol 
   push: prefix pick: parseg attr_call: get printraw 
   push: .flagged\_<-\_resizable(0) print 
   printeol 
   pick: l assign: i 
   pushf: autogen338 repeat_if 
   push: base_rules pick: parseg attr_call: get attr: len assign: l 
   pick: l assign: i 
   pushf: autogen339 repeat_if return_no_value ] bind: print_grammar_setters 
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
  0 pick: output pick: wrapped attr_call: set ] bind: autogen340 
[ pick: output assign: wrapped ] bind: autogen341 
[ pick: l pick: i - pick: wrapped attr_call: get print_child_setter 
  check: i 1 - assign: i ] bind: autogen342 
[ newfunc3 assign: output_filename assign: input_filename assign: grammar_obj 
   pick: grammar_obj pick: input_filename parse_grammar assign: output 
   pick: output attr_call: print 
   printeol 
   push: Writing\_ print 
   pick: output_filename printraw 
   printeol 
   pick: output attr: name print 
   printeol 
   push: w pick: output_filename file.open assign: outf 
   pick: outf set_output 
   pick: output attr: name push: grammar string_equal not pushf: autogen340 pushf: autogen341 if-else 
   pick: wrapped print_grammar_funcs 
   pick: wrapped attr: len assign: l 
   pick: l assign: i 
   pushf: autogen342 repeat_if 
   None set_output 
   pick: outf file.close return_no_value ] bind: write_parsed_funcs 
[ newfunc3 assign: output_filename assign: input_filename assign: grammar_obj 
   pick: grammar_obj pick: input_filename parse_grammar assign: output 
   pick: output attr_call: print 
   printeol 
   push: Writing\_ print 
   pick: output_filename printraw 
   printeol 
   push: w pick: output_filename file.open assign: outf 
   pick: outf set_output 
   pick: output print_grammar_all 
   None set_output 
   pick: outf file.close return_no_value ] bind: write_parsed 
 pick: bootg push: grammar/boot.grammar push: gen/grammar.flpc write_parsed 
 push: add_indent_rules pick: bootg.base attr_call: append 
 0 push: flpcg pick: bootg attr_call: set 
 pick: bootg push: grammar/flpc.grammar push: gen/flpc_grammar.flpc write_parsed 