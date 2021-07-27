push: Generated_from_lib/stage0.flpc_lib/stage1a.flpc_lib/stage1b.flpc_lib/stage1b2.flpc_lib/stage1b3.flpc_lib/stage1c.flpc_lib/stage1d.flpc_lib/stage3a.flpc_lib/stage3b.flpc_lib/flpc_grammar.flpc_lib/stage6a.flpc_lib/stage6b.flpc_-o_precompiled/compiler.f print
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
 push: stage2.pkl load 
[ newfunc1 assign: root 
  push: Dummy\_function\_should\_not\_be\_called error return_no_value ] bind: to_flpc2 
[ pick: root printrepr return_no_value ] bind: autogen153 
[ 0 pick: root attr_call: get to_flpc2 return_no_value ] bind: autogen154 
[ 0 pick: root attr_call: get to_flpc2 return_no_value ] bind: autogen155 
[ 0 pick: root attr_call: get tprint 
  push: Unexpected\_child\_of\_exactly.\_Was\_expecting\_a\_escaped\_chart. error ] bind: autogen156 
[ 0 pick: root attr_call: get attr: name push: escaped_char string_equal not pushf: autogen156 if 
  pick: root attr: name 0 0 pick: root attr_call: get attr_call: get node to_flpc2 return_no_value ] bind: autogen157 
[ push: prefix pick: parseg attr_call: get printraw 
  push: .rules. print 
  0 0 pick: root attr_call: get attr_call: get printraw 
  push: \_<-\_fun[]:\n\_\_\_\_return( print 
  pushi: 3 pick: root attr_call: get to_flpc2 
  push: ) print return_no_value ] bind: autogen158 
[ push: out print ] bind: autogen159 
[ pick: name printraw ] bind: autogen160 
[ push: [ print ] bind: autogen161 
[ push: [ print ] bind: autogen162 
[ check: bracket 1 + assign: bracket ] bind: autogen163 
[ check: bracket 1 + assign: bracket ] bind: autogen164 
[ check: bracket 1 + assign: bracket ] bind: autogen165 
[ pick: child attr: name push: quantifier string_equal pushf: autogen164 if 
  pick: child attr: name push: inline string_equal pushf: autogen165 if ] bind: autogen166 
[ push: [ print ] bind: autogen167 
[ push: ] print ] bind: autogen168 
[ push: \_ print ] bind: autogen169 
[ pick: l pick: i - pick: root attr_call: get assign: child 
  0 assign: bracket 
   pick: child pick: node_class is_instance not pushf: autogen163 pushf: autogen166 if-else 
   pick: bracket not pushf: autogen167 if 
  s21 assign: child assign: bracket 
  check: child to_flpc2 
  check: bracket not pushf: autogen168 if 
  check: i 1 - assign: i 
  pick: i 0 > pushf: autogen169 if ] bind: autogen170 
[ push: ] print ] bind: autogen171 
[ push: ] print ] bind: autogen172 
[ newfunc1 assign: root 
   pick: root pick: node_class is_instance not pushf: autogen153 if 
   pick: root attr: name assign: name 
    pick: name push: quantifier string_equal pushf: autogen154 if 
    pick: name push: inline string_equal pushf: autogen155 if 
    pick: name push: exactly string_equal pick: name push: token string_equal || 0 pick: root attr_call: get pick: node_class is_instance && pushf: autogen157 if 
    pick: name push: rule string_equal pushf: autogen158 if 
    pick: name push: output string_equal pushf: autogen159 pushf: autogen160 if-else 
   push: ( print 
    pick: name push: and string_equal pushf: autogen161 if 
    pick: name push: or string_equal pushf: autogen162 if 
   pick: root attr: len assign: l 
   pick: l assign: i 
    pushf: autogen170 repeat_if 
    pick: name push: and string_equal pushf: autogen171 if 
    pick: name push: or string_equal pushf: autogen172 if 
   push: ) print return_no_value ] rebind: to_flpc2 
[ pick: l pick: i - pick: root attr_call: get to_flpc2 
  printeol 
  printeol 
  check: i 1 - assign: i ] bind: autogen173 
[ newfunc1 assign: root 
   pick: root attr: len assign: l 
   pick: l assign: i 
   pushf: autogen173 repeat_if return_no_value ] bind: print_grammar_funcs 
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
  check: i 1 - assign: i ] bind: autogen174 
[ newfunc0 
   push: prefix pick: parseg attr_call: get assign: prefix 
   pick: prefix printraw 
   push: .base\_<-\_resizable(0) print 
   printeol 
   push: base_rules pick: parseg attr_call: get attr: len assign: l 
   pick: l assign: i 
   pushf: autogen174 repeat_if 
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
  printeol ] bind: autogen175 
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
   1 pick: child attr_call: get attr: len 0 > pushf: autogen175 if return_no_value ] bind: print_child_setter 
[ pick: l pick: i - pick: root attr_call: get print_child_setter 
  check: i 1 - assign: i ] bind: autogen176 
[ pick: l pick: i - push: base_rules pick: parseg attr_call: get attr_call: get print_ruleset 
  check: i 1 - assign: i ] bind: autogen177 
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
   pushf: autogen176 repeat_if 
   push: base_rules pick: parseg attr_call: get attr: len assign: l 
   pick: l assign: i 
   pushf: autogen177 repeat_if return_no_value ] bind: print_grammar_setters 
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
  0 pick: output pick: wrapped attr_call: set ] bind: autogen178 
[ pick: output assign: wrapped ] bind: autogen179 
[ pick: l pick: i - pick: wrapped attr_call: get print_child_setter 
  check: i 1 - assign: i ] bind: autogen180 
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
   pick: output attr: name push: grammar string_equal not pushf: autogen178 pushf: autogen179 if-else 
   pick: wrapped print_grammar_funcs 
   pick: wrapped attr: len assign: l 
   pick: l assign: i 
   pushf: autogen180 repeat_if 
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
[ None func_return ] bind: autogen181 
[ newfunc0 
   pick: source attr_call: position assign: saved 
   push: hspaces apply make_string assign: s 
   push: indentation pick: parseg attr_call: get attr_call: top pick: s str_len == pushf: autogen181 if 
   pick: saved pick: source attr_call: position_set 
   push: Different\_indent MatchError func_return ] bind: base.rules.SAME_INDENT 
[ newfunc0 
   push: indentation pick: parseg attr_call: get attr_call: pop 
   None func_return ] bind: base.rules.DEDENT 
[ pick: saved pick: source attr_call: position_set 
  push: Missing\_newline\_before\_indent MatchError func_return ] bind: autogen182 
[ newfunc0 
   pick: source attr_call: position assign: saved 
   push: NEWLINE apply pick: MatchError_class is_instance pushf: autogen182 if 
   push: hspaces apply make_string assign: s 
   pick: saved pick: source attr_call: position_set 
   pick: s str_len push: indentation pick: parseg attr_call: get attr_call: append 
   None func_return ] bind: base.rules.INDENT 
[ check: output 1 + memory.get make_string assign: output ] bind: autogen183 
[ push: NAME apply assign: output 
  pick: output pick: node_class is_instance pushf: autogen183 if ] bind: autogen184 
[ push: Not\_token\_or\_EOF MatchError func_return ] bind: autogen185 
[ pick: s pick: source attr_call: startswith assign: output 
  pick: output None == pushf: autogen185 if 
  check: output func_return ] bind: autogen186 
[ pick: output func_return ] bind: autogen187 
[ push: End\_of\_file MatchError func_return ] bind: autogen188 
[ push: Not\_exactly\_token MatchError func_return ] bind: autogen189 
[ newfunc1 assign: s 
   pick: source attr_call: position assign: saved 
   push: spaces apply drop1 
    pick: s is_alpha pushf: autogen184 pushf: autogen186 if-else 
    pick: output pick: MatchError_class is_instance pushf: autogen187 if 
    pick: output None == pushf: autogen188 if 
    pick: output pick: s string_equal not pushf: autogen189 if 
   pick: output func_return ] rebind: token 
[ newfunc1 assign: rules 
   push: INDENT pick: base.rules.INDENT pick: rules hashtable.set 
   push: DEDENT pick: base.rules.DEDENT pick: rules hashtable.set 
   push: SAME_INDENT pick: base.rules.SAME_INDENT pick: rules hashtable.set return_no_value ] bind: add_indent_rules 
[ push: # exactly ] bind: autogen190 
[ push: \n exactly ] bind: autogen191 
[ pushf: autogen191 negation ] bind: autogen192 
[ push: anything apply ] bind: autogen193 
[ pushf: autogen193 out ] bind: autogen194 
[ pushf: autogen192 pushf: autogen194 ] bind: autogen195 
[ pushf: autogen195 and ] bind: autogen196 
[ pushf: autogen196 push: * quantified ] bind: autogen197 
[ pushf: autogen197 out ] bind: autogen198 
[ pushf: autogen190 pushf: autogen198 ] bind: autogen199 
[ pushf: autogen199 and ] bind: autogen200 
[ newfunc0 
  pushf: autogen200 push: comment bound func_return ] bind: flpcg.rules.comment 
[ push: \n exactly ] bind: autogen201 
[ push: \r exactly ] bind: autogen202 
[ push: \_ exactly ] bind: autogen203 
[ push: \t exactly ] bind: autogen204 
[ pushf: autogen201 pushf: autogen202 pushf: autogen203 pushf: autogen204 ] bind: autogen205 
[ newfunc0 
  pushf: autogen205 or func_return ] bind: flpcg.rules.space 
[ push: space apply ] bind: autogen206 
[ newfunc0 
  pushf: autogen206 push: * quantified func_return ] bind: flpcg.rules.spaces 
[ push: space apply ] bind: autogen207 
[ newfunc0 
  pushf: autogen207 push: + quantified func_return ] bind: flpcg.rules.spacesp 
[ push: \_ exactly ] bind: autogen208 
[ push: \t exactly ] bind: autogen209 
[ pushf: autogen208 pushf: autogen209 ] bind: autogen210 
[ pushf: autogen210 or ] bind: autogen211 
[ newfunc0 
  pushf: autogen211 push: * quantified func_return ] bind: flpcg.rules.hspaces 
[ push: \_ exactly ] bind: autogen212 
[ push: \t exactly ] bind: autogen213 
[ pushf: autogen212 pushf: autogen213 ] bind: autogen214 
[ pushf: autogen214 or ] bind: autogen215 
[ newfunc0 
  pushf: autogen215 push: + quantified func_return ] bind: flpcg.rules.hspacesp 
[ push: hspaces apply ] bind: autogen216 
[ push: comment apply ] bind: autogen217 
[ pushf: autogen217 push: ? quantified ] bind: autogen218 
[ push: \n exactly ] bind: autogen219 
[ push: \r exactly ] bind: autogen220 
[ pushf: autogen219 pushf: autogen220 ] bind: autogen221 
[ pushf: autogen221 or ] bind: autogen222 
[ pushf: autogen216 pushf: autogen218 pushf: autogen222 ] bind: autogen223 
[ pushf: autogen223 and ] bind: autogen224 
[ newfunc0 
  pushf: autogen224 push: EMPTY_LINE bound func_return ] bind: flpcg.rules.EMPTY_LINE 
[ push: hspaces apply ] bind: autogen225 
[ push: - exactly ] bind: autogen226 
[ pushf: autogen226 push: ? quantified ] bind: autogen227 
[ push: digit apply ] bind: autogen228 
[ pushf: autogen228 push: + quantified ] bind: autogen229 
[ pushf: autogen227 pushf: autogen229 ] bind: autogen230 
[ pushf: autogen230 and ] bind: autogen231 
[ pushf: autogen231 out ] bind: autogen232 
[ pushf: autogen225 pushf: autogen232 ] bind: autogen233 
[ newfunc0 
  pushf: autogen233 and func_return ] bind: flpcg.rules.NUMBER 
[ push: hspaces apply ] bind: autogen234 
[ push: \q exactly ] bind: autogen235 
[ push: \q exactly ] bind: autogen236 
[ pushf: autogen236 negation ] bind: autogen237 
[ push: anything apply ] bind: autogen238 
[ pushf: autogen237 pushf: autogen238 ] bind: autogen239 
[ pushf: autogen239 and ] bind: autogen240 
[ pushf: autogen240 push: * quantified ] bind: autogen241 
[ pushf: autogen241 out ] bind: autogen242 
[ push: \q exactly ] bind: autogen243 
[ pushf: autogen235 pushf: autogen242 pushf: autogen243 ] bind: autogen244 
[ pushf: autogen244 and ] bind: autogen245 
[ push: ' exactly ] bind: autogen246 
[ push: ' exactly ] bind: autogen247 
[ pushf: autogen247 negation ] bind: autogen248 
[ push: anything apply ] bind: autogen249 
[ pushf: autogen248 pushf: autogen249 ] bind: autogen250 
[ pushf: autogen250 and ] bind: autogen251 
[ pushf: autogen251 push: * quantified ] bind: autogen252 
[ pushf: autogen252 out ] bind: autogen253 
[ push: ' exactly ] bind: autogen254 
[ pushf: autogen246 pushf: autogen253 pushf: autogen254 ] bind: autogen255 
[ pushf: autogen255 and ] bind: autogen256 
[ pushf: autogen245 pushf: autogen256 ] bind: autogen257 
[ pushf: autogen257 or ] bind: autogen258 
[ pushf: autogen258 out ] bind: autogen259 
[ pushf: autogen234 pushf: autogen259 ] bind: autogen260 
[ newfunc0 
  pushf: autogen260 and func_return ] bind: flpcg.rules.STRING 
[ push: hspaces apply ] bind: autogen261 
[ push: letter apply ] bind: autogen262 
[ push: _ exactly ] bind: autogen263 
[ pushf: autogen262 pushf: autogen263 ] bind: autogen264 
[ pushf: autogen264 or ] bind: autogen265 
[ push: space apply ] bind: autogen266 
[ pushf: autogen266 negation ] bind: autogen267 
[ push: ( exactly ] bind: autogen268 
[ pushf: autogen268 negation ] bind: autogen269 
[ push: = exactly ] bind: autogen270 
[ pushf: autogen270 negation ] bind: autogen271 
[ push: ) exactly ] bind: autogen272 
[ pushf: autogen272 negation ] bind: autogen273 
[ push: [ exactly ] bind: autogen274 
[ pushf: autogen274 negation ] bind: autogen275 
[ push: ] exactly ] bind: autogen276 
[ pushf: autogen276 negation ] bind: autogen277 
[ push: < exactly ] bind: autogen278 
[ pushf: autogen278 negation ] bind: autogen279 
[ push: : exactly ] bind: autogen280 
[ pushf: autogen280 negation ] bind: autogen281 
[ push: ' exactly ] bind: autogen282 
[ pushf: autogen282 negation ] bind: autogen283 
[ push: anything apply ] bind: autogen284 
[ pushf: autogen267 pushf: autogen269 pushf: autogen271 pushf: autogen273 pushf: autogen275 pushf: autogen277 pushf: autogen279 pushf: autogen281 pushf: autogen283 pushf: autogen284 ] bind: autogen285 
[ pushf: autogen285 and ] bind: autogen286 
[ pushf: autogen286 push: * quantified ] bind: autogen287 
[ pushf: autogen265 pushf: autogen287 ] bind: autogen288 
[ pushf: autogen288 and ] bind: autogen289 
[ pushf: autogen289 out ] bind: autogen290 
[ pushf: autogen261 pushf: autogen290 ] bind: autogen291 
[ newfunc0 
  pushf: autogen291 and func_return ] bind: flpcg.rules.NAME 
[ push: hspacesp apply ] bind: autogen292 
[ push: 'F token ] bind: autogen293 
[ pushf: autogen293 negation ] bind: autogen294 
[ push: space apply ] bind: autogen295 
[ pushf: autogen295 negation ] bind: autogen296 
[ push: anything apply ] bind: autogen297 
[ pushf: autogen296 pushf: autogen297 ] bind: autogen298 
[ pushf: autogen298 and ] bind: autogen299 
[ pushf: autogen299 push: * quantified ] bind: autogen300 
[ pushf: autogen300 out ] bind: autogen301 
[ pushf: autogen292 pushf: autogen294 pushf: autogen301 ] bind: autogen302 
[ newfunc0 
  pushf: autogen302 and func_return ] bind: flpcg.rules.FORTH_NAME 
[ push: + token ] bind: autogen303 
[ push: - token ] bind: autogen304 
[ push: / token ] bind: autogen305 
[ push: == token ] bind: autogen306 
[ push: < token ] bind: autogen307 
[ push: > token ] bind: autogen308 
[ push: . token ] bind: autogen309 
[ push: in token ] bind: autogen310 
[ push: || token ] bind: autogen311 
[ push: && token ] bind: autogen312 
[ pushf: autogen303 pushf: autogen304 pushf: autogen305 pushf: autogen306 pushf: autogen307 pushf: autogen308 pushf: autogen309 pushf: autogen310 pushf: autogen311 pushf: autogen312 ] bind: autogen313 
[ newfunc0 
  pushf: autogen313 or func_return ] bind: flpcg.rules.bin_op 
[ push: NAME apply ] bind: autogen314 
[ newfunc0 
  pushf: autogen314 push: * quantified func_return ] bind: flpcg.rules.names 
[ newfunc0 
  push: NAME apply func_return ] bind: flpcg.rules.variable 
[ push: ` token ] bind: autogen315 
[ push: NAME apply ] bind: autogen316 
[ pushf: autogen316 out ] bind: autogen317 
[ pushf: autogen315 pushf: autogen317 ] bind: autogen318 
[ newfunc0 
  pushf: autogen318 and func_return ] bind: flpcg.rules.name_quote 
[ push: [ token ] bind: autogen319 
[ push: ] token ] bind: autogen320 
[ pushf: autogen320 negation ] bind: autogen321 
[ push: spaces apply ] bind: autogen322 
[ push: statement apply ] bind: autogen323 
[ pushf: autogen323 out ] bind: autogen324 
[ pushf: autogen321 pushf: autogen322 pushf: autogen324 ] bind: autogen325 
[ pushf: autogen325 and ] bind: autogen326 
[ pushf: autogen326 push: + quantified ] bind: autogen327 
[ pushf: autogen327 out ] bind: autogen328 
[ push: ] token ] bind: autogen329 
[ pushf: autogen319 pushf: autogen328 pushf: autogen329 ] bind: autogen330 
[ newfunc0 
  pushf: autogen330 and func_return ] bind: flpcg.rules.quote 
[ push: F' token ] bind: autogen331 
[ push: forth_line apply ] bind: autogen332 
[ push: hspaces apply ] bind: autogen333 
[ push: \n exactly ] bind: autogen334 
[ push: \r exactly ] bind: autogen335 
[ pushf: autogen334 pushf: autogen335 ] bind: autogen336 
[ pushf: autogen336 or ] bind: autogen337 
[ push: forth_line apply ] bind: autogen338 
[ pushf: autogen338 out ] bind: autogen339 
[ pushf: autogen333 pushf: autogen337 pushf: autogen339 ] bind: autogen340 
[ pushf: autogen340 and ] bind: autogen341 
[ pushf: autogen341 push: * quantified ] bind: autogen342 
[ pushf: autogen332 pushf: autogen342 ] bind: autogen343 
[ pushf: autogen343 and ] bind: autogen344 
[ pushf: autogen344 out ] bind: autogen345 
[ push: spaces apply ] bind: autogen346 
[ push: 'F token ] bind: autogen347 
[ pushf: autogen331 pushf: autogen345 pushf: autogen346 pushf: autogen347 ] bind: autogen348 
[ newfunc0 
  pushf: autogen348 and func_return ] bind: flpcg.rules.forth 
[ push: FORTH_NAME apply ] bind: autogen349 
[ pushf: autogen349 push: NAME bound ] bind: autogen350 
[ newfunc0 
  pushf: autogen350 push: * quantified func_return ] bind: flpcg.rules.forth_line 
[ push: [ token ] bind: autogen351 
[ push: names apply ] bind: autogen352 
[ pushf: autogen352 out ] bind: autogen353 
[ push: ] token ] bind: autogen354 
[ pushf: autogen351 pushf: autogen353 pushf: autogen354 ] bind: autogen355 
[ newfunc0 
  pushf: autogen355 and func_return ] bind: flpcg.rules.simple_quote 
[ push: ( token ] bind: autogen356 
[ push: expr apply ] bind: autogen357 
[ pushf: autogen357 out ] bind: autogen358 
[ push: ) token ] bind: autogen359 
[ pushf: autogen356 pushf: autogen358 pushf: autogen359 ] bind: autogen360 
[ newfunc0 
  pushf: autogen360 and func_return ] bind: flpcg.rules.parenthesis 
[ push: NAME apply ] bind: autogen361 
[ push: bin_op apply ] bind: autogen362 
[ pushf: autogen362 push: NAME bound ] bind: autogen363 
[ pushf: autogen361 pushf: autogen363 ] bind: autogen364 
[ pushf: autogen364 or ] bind: autogen365 
[ pushf: autogen365 out ] bind: autogen366 
[ push: ( exactly ] bind: autogen367 
[ push: exprs apply ] bind: autogen368 
[ pushf: autogen368 push: parameters bound ] bind: autogen369 
[ pushf: autogen369 out ] bind: autogen370 
[ push: ) token ] bind: autogen371 
[ pushf: autogen366 pushf: autogen367 pushf: autogen370 pushf: autogen371 ] bind: autogen372 
[ newfunc0 
  pushf: autogen372 and func_return ] bind: flpcg.rules.func_call 
[ push: NAME apply ] bind: autogen373 
[ push: simple_quote apply ] bind: autogen374 
[ push: non_block apply ] bind: autogen375 
[ push: void apply ] bind: autogen376 
[ pushf: autogen374 pushf: autogen375 pushf: autogen376 ] bind: autogen377 
[ pushf: autogen377 or ] bind: autogen378 
[ pushf: autogen378 out ] bind: autogen379 
[ push: : token ] bind: autogen380 
[ push: suite apply ] bind: autogen381 
[ pushf: autogen381 push: quote bound ] bind: autogen382 
[ pushf: autogen382 out ] bind: autogen383 
[ pushf: autogen379 pushf: autogen380 pushf: autogen383 ] bind: autogen384 
[ pushf: autogen384 and ] bind: autogen385 
[ pushf: autogen385 push: parameters bound ] bind: autogen386 
[ pushf: autogen373 pushf: autogen386 ] bind: autogen387 
[ newfunc0 
  pushf: autogen387 and func_return ] bind: flpcg.rules.block_call 
[ push: block_call apply ] bind: autogen388 
[ push: NEWLINE apply ] bind: autogen389 
[ pushf: autogen389 push: + quantified ] bind: autogen390 
[ push: SAME_INDENT apply ] bind: autogen391 
[ push: block_call apply ] bind: autogen392 
[ pushf: autogen392 out ] bind: autogen393 
[ pushf: autogen390 pushf: autogen391 pushf: autogen393 ] bind: autogen394 
[ pushf: autogen394 and ] bind: autogen395 
[ pushf: autogen395 push: + quantified ] bind: autogen396 
[ pushf: autogen388 pushf: autogen396 ] bind: autogen397 
[ newfunc0 
  pushf: autogen397 and func_return ] bind: flpcg.rules.multi_block_call 
[ push: forth apply ] bind: autogen398 
[ push: func_call apply ] bind: autogen399 
[ push: name_quote apply ] bind: autogen400 
[ push: quote apply ] bind: autogen401 
[ push: parenthesis apply ] bind: autogen402 
[ push: NUMBER apply ] bind: autogen403 
[ push: STRING apply ] bind: autogen404 
[ push: variable apply ] bind: autogen405 
[ pushf: autogen398 pushf: autogen399 pushf: autogen400 pushf: autogen401 pushf: autogen402 pushf: autogen403 pushf: autogen404 pushf: autogen405 ] bind: autogen406 
[ newfunc0 
  pushf: autogen406 or func_return ] bind: flpcg.rules.non_block_non_infix 
[ push: infix apply ] bind: autogen407 
[ push: non_block_non_infix apply ] bind: autogen408 
[ pushf: autogen407 pushf: autogen408 ] bind: autogen409 
[ newfunc0 
  pushf: autogen409 or func_return ] bind: flpcg.rules.non_block 
[ push: non_block_non_infix apply ] bind: autogen410 
[ push: bin_op apply ] bind: autogen411 
[ pushf: autogen411 push: op bound ] bind: autogen412 
[ push: non_block_non_infix apply ] bind: autogen413 
[ pushf: autogen412 pushf: autogen413 ] bind: autogen414 
[ pushf: autogen414 and ] bind: autogen415 
[ pushf: autogen415 push: + quantified ] bind: autogen416 
[ pushf: autogen410 pushf: autogen416 ] bind: autogen417 
[ newfunc0 
  pushf: autogen417 and func_return ] bind: flpcg.rules.infix 
[ push: block_call apply ] bind: autogen418 
[ push: non_block_non_infix apply ] bind: autogen419 
[ pushf: autogen418 pushf: autogen419 ] bind: autogen420 
[ newfunc0 
  pushf: autogen420 or func_return ] bind: flpcg.rules.non_infix 
[ push: infix apply ] bind: autogen421 
[ push: non_infix apply ] bind: autogen422 
[ pushf: autogen421 pushf: autogen422 ] bind: autogen423 
[ newfunc0 
  pushf: autogen423 or func_return ] bind: flpcg.rules.expr 
[ push: expr apply ] bind: autogen424 
[ push: spacesp apply ] bind: autogen425 
[ push: expr apply ] bind: autogen426 
[ pushf: autogen426 out ] bind: autogen427 
[ pushf: autogen425 pushf: autogen427 ] bind: autogen428 
[ pushf: autogen428 and ] bind: autogen429 
[ pushf: autogen429 push: * quantified ] bind: autogen430 
[ pushf: autogen424 pushf: autogen430 ] bind: autogen431 
[ pushf: autogen431 and ] bind: autogen432 
[ push: void apply ] bind: autogen433 
[ pushf: autogen432 pushf: autogen433 ] bind: autogen434 
[ newfunc0 
  pushf: autogen434 or func_return ] bind: flpcg.rules.exprs 
[ push: expr apply ] bind: autogen435 
[ push: hspacesp apply ] bind: autogen436 
[ push: expr apply ] bind: autogen437 
[ pushf: autogen437 out ] bind: autogen438 
[ pushf: autogen436 pushf: autogen438 ] bind: autogen439 
[ pushf: autogen439 and ] bind: autogen440 
[ pushf: autogen440 push: * quantified ] bind: autogen441 
[ pushf: autogen435 pushf: autogen441 ] bind: autogen442 
[ newfunc0 
  pushf: autogen442 and func_return ] bind: flpcg.rules.exprsp 
[ push: names apply ] bind: autogen443 
[ pushf: autogen443 out ] bind: autogen444 
[ push: = token ] bind: autogen445 
[ push: space apply ] bind: autogen446 
[ pushf: autogen444 pushf: autogen445 pushf: autogen446 ] bind: autogen447 
[ pushf: autogen447 and ] bind: autogen448 
[ push: void apply ] bind: autogen449 
[ pushf: autogen448 pushf: autogen449 ] bind: autogen450 
[ pushf: autogen450 or ] bind: autogen451 
[ push: exprsp apply ] bind: autogen452 
[ pushf: autogen451 pushf: autogen452 ] bind: autogen453 
[ newfunc0 
  pushf: autogen453 and func_return ] bind: flpcg.rules.assign 
[ push: names apply ] bind: autogen454 
[ pushf: autogen454 out ] bind: autogen455 
[ push: <- token ] bind: autogen456 
[ push: exprsp apply ] bind: autogen457 
[ pushf: autogen457 out ] bind: autogen458 
[ pushf: autogen455 pushf: autogen456 pushf: autogen458 ] bind: autogen459 
[ newfunc0 
  pushf: autogen459 and func_return ] bind: flpcg.rules.bind 
[ push: multi_block_call apply ] bind: autogen460 
[ push: bind apply ] bind: autogen461 
[ push: assign apply ] bind: autogen462 
[ pushf: autogen460 pushf: autogen461 pushf: autogen462 ] bind: autogen463 
[ newfunc0 
  pushf: autogen463 or func_return ] bind: flpcg.rules.statement 
[ push: INDENT apply ] bind: autogen464 
[ push: NEWLINE apply ] bind: autogen465 
[ pushf: autogen465 push: + quantified ] bind: autogen466 
[ push: SAME_INDENT apply ] bind: autogen467 
[ push: statement apply ] bind: autogen468 
[ pushf: autogen466 pushf: autogen467 pushf: autogen468 ] bind: autogen469 
[ pushf: autogen469 and ] bind: autogen470 
[ pushf: autogen470 push: + quantified ] bind: autogen471 
[ push: DEDENT apply ] bind: autogen472 
[ pushf: autogen464 pushf: autogen471 pushf: autogen472 ] bind: autogen473 
[ pushf: autogen473 and ] bind: autogen474 
[ push: statement apply ] bind: autogen475 
[ pushf: autogen474 pushf: autogen475 ] bind: autogen476 
[ newfunc0 
  pushf: autogen476 or func_return ] bind: flpcg.rules.suite 
[ push: hspaces apply ] bind: autogen477 
[ push: \n exactly ] bind: autogen478 
[ push: \r exactly ] bind: autogen479 
[ pushf: autogen478 pushf: autogen479 ] bind: autogen480 
[ pushf: autogen480 or ] bind: autogen481 
[ pick: None out ] bind: autogen482 
[ pushf: autogen477 pushf: autogen481 pushf: autogen482 ] bind: autogen483 
[ pushf: autogen483 and ] bind: autogen484 
[ push: COMMENT_LINE apply ] bind: autogen485 
[ pushf: autogen484 pushf: autogen485 ] bind: autogen486 
[ newfunc0 
  pushf: autogen486 or func_return ] bind: flpcg.rules.NEWLINE 
[ push: hspaces apply ] bind: autogen487 
[ push: comment apply ] bind: autogen488 
[ pushf: autogen488 out ] bind: autogen489 
[ push: hspaces apply ] bind: autogen490 
[ push: \n exactly ] bind: autogen491 
[ push: \r exactly ] bind: autogen492 
[ pushf: autogen491 pushf: autogen492 ] bind: autogen493 
[ pushf: autogen493 or ] bind: autogen494 
[ pushf: autogen487 pushf: autogen489 pushf: autogen490 pushf: autogen494 ] bind: autogen495 
[ newfunc0 
  pushf: autogen495 and func_return ] bind: flpcg.rules.COMMENT_LINE 
[ push: NEWLINE apply ] bind: autogen496 
[ pushf: autogen496 push: * quantified ] bind: autogen497 
[ push: SAME_INDENT apply ] bind: autogen498 
[ push: statement apply ] bind: autogen499 
[ push: NEWLINE apply ] bind: autogen500 
[ pushf: autogen500 push: + quantified ] bind: autogen501 
[ push: anything apply ] bind: autogen502 
[ pushf: autogen502 negation ] bind: autogen503 
[ pushf: autogen501 pushf: autogen503 ] bind: autogen504 
[ pushf: autogen504 or ] bind: autogen505 
[ pushf: autogen497 pushf: autogen498 pushf: autogen499 pushf: autogen505 ] bind: autogen506 
[ pushf: autogen506 and ] bind: autogen507 
[ pushf: autogen507 push: + quantified ] bind: autogen508 
[ pushf: autogen508 push: suite bound ] bind: autogen509 
[ push: statement apply ] bind: autogen510 
[ pushf: autogen510 push: suite bound ] bind: autogen511 
[ pushf: autogen509 pushf: autogen511 ] bind: autogen512 
[ newfunc0 
  pushf: autogen512 or func_return ] bind: flpcg.rules.grammar 
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
[ check: cond2_thunk call assign: cond ] bind: autogen513 
[ check: cond2_thunk drop1 
  pick: False assign: cond ] bind: autogen514 
[ pushi: 2 remove_top_names assign: cond1 assign: cond2_thunk 
  check: cond1 pushf: autogen513 pushf: autogen514 if-else ] bind: lazy_and 
[ 
  1 drop1 ] bind: debugger2 
[ newfunc2 assign: value assign: title 
   pick: title print 
   pick: value tprint 
   printeol return_no_value ] bind: dprint 
[ check: cond drop1 
  pick: block call 
  check: index 1 + assign: index 
  pick: index pick: end < assign: cond ] bind: autogen515 
[ 
   push: 231 shuffle assign: index assign: end assign: block 
   pick: index pick: end < assign: cond 
   pushf: autogen515 repeat_if 
   check: index drop1 
   check: end drop1 
   check: block drop1 ] bind: simple_for 
 None memory.append 
 memory.len 1 - Pointer bind: Done 
[ drop1 
  check: elem pick: new_resizable attr_call: append 
  s21 assign: elem assign: new_resizable 
  pick1 pick: Done == not ] bind: autogen516 
[ 
   0 resizable assign: new_resizable 
   s21 assign: elem assign: new_resizable 
   pick1 pick: Done == not 
   pushf: autogen516 repeat_if 
   push: 23 shuffle ] bind: make_resizable 
[ 
   push: 51234 shuffle assign: elem assign: index assign: end assign: block assign: new_resizable 
   check: elem pick: new_resizable attr_call: append ] bind: autogen517 
[ 
   0 resizable assign: new_resizable 
   s21 assign: num assign: new_resizable 
   check: num 0 pushf: autogen517 simple_for 
   push: 12 shuffle ] bind: make_resizable_len 
[ check: i 1 - assign: i 
  pick: i pick: res attr_call: get assign: tmp 
  pick: i pick: l pick: i - pick: res attr_call: get pick: res attr_call: set 
  pick: l pick: i - pick: tmp pick: res attr_call: set 
  check: tmp drop1 ] bind: autogen518 
[ 
   make_resizable assign: res 
   pick: res attr: len 1 - assign: l 
   pick: l 1 + 2 / assign: i 
   pushf: autogen518 repeat_if 
   push: 23 shuffle ] bind: make_resizable_rev 
[ 
   make_resizable assign: arr 
   pick: arr attr: array 1 + pick: arr attr: len str_join assign: joined 
   push: 13 shuffle ] bind: str_cat 
[ 
   make_resizable_rev assign: arr 
   pick: arr attr: array 1 + pick: arr attr: len str_join assign: joined 
   push: 13 shuffle ] bind: str_cat2 
[ 
   pick: index pick: iterable attr_call: get assign: elem 
   pick: block2 call ] bind: autogen519 
[ pushi: 2 remove_top_names assign: block2 assign: iterable 
   pick: iterable attr: len 0 pushf: autogen519 simple_for 
   check: block2 drop1 
   check: iterable drop1 ] bind: for_in 
[ 
   pick: block3 call pick: list_comp_out attr_call: append 
   check: elem drop1 ] bind: autogen520 
[ pushi: 2 remove_top_names assign: iterable assign: block3 
   0 resizable assign: list_comp_out 
   pick: iterable pushf: autogen520 for_in 
   push: 14 shuffle ] bind: list_comp 
[ 
   pick: elem pick: var_name assign2 
   pick: block3 call pick: list_comp_out attr_call: append 
   drop1 
   check: elem drop1 ] bind: autogen521 
[ pushi: 3 remove_top_names assign: iterable assign: var_name assign: block3 
   0 resizable assign: list_comp_out 
   pick: iterable pushf: autogen521 for_in 
   push: 15 shuffle ] bind: list_comp_var 
[ pick: block3 call pick: list_comp_out attr_call: append ] bind: autogen522 
[ 
   pick: condition call pushf: autogen522 if 
   check: elem drop1 ] bind: autogen523 
[ pushi: 3 remove_top_names assign: condition assign: iterable assign: block3 
   0 resizable assign: list_comp_out 
   pick: iterable pushf: autogen523 for_in 
   push: 14 shuffle ] bind: list_comp_cond 
 pick: resizable.attrib pick: boot_obj attr_call: subclass bind: FList_class 
 pick: FList_class attr: instance pick: FList_class closure bind: FList 
[ newfunc2 assign: new_class assign: obj 
  pick: obj 2 - pick: new_class memory.set return_no_value ] bind: change_class 
[ 
  check: elem pick: out_list attr_call: append ] bind: autogen524 
[ newfunc2 assign: out_list assign: in_list 
  pick: in_list pushf: autogen524 for_in return_no_value ] bind: extend 
[ check: elem pick: out_list extend ] bind: autogen525 
[ check: elem pick: out_list attr_call: append ] bind: autogen526 
[ 
  pick: elem pick: class is_instance pushf: autogen525 pushf: autogen526 if-else ] bind: autogen527 
[ newfunc2 assign: class assign: in_list 
   0 resizable assign: out_list 
   pick: in_list pushf: autogen527 for_in 
   check: out_list func_return ] bind: flatten 
[ newfunc1 assign: self 
  pick: self 1 + memory.get tprint return_no_value ] bind: forthe.print 
[ push: Forthe\_looking\_up\_ print 
  pick: name print 
  printeol ] bind: autogen528 
[ newfunc3 assign: searcher assign: receiver assign: name 
   pick: lookup_print pushf: autogen528 if 
   pick: name push: get string_equal pick: node.get return_if 
   pick: name push: instance string_equal pick: node.instance return_if 
   pick: name push: print string_equal pick: forthe.print return_if 
   pick: name push: len string_equal pick: receiver node.len return_if 
   pick: name push: name string_equal pick: receiver memory.get return_if 
   pick: name push: value string_equal pick: receiver 1 + memory.get return_if 
   pick: name push: pos string_equal pick: receiver 2 + memory.get return_if 
   pick: name push: set_pos string_equal pick: node.set_pos return_if 
   pick: name push: type string_equal push: forthe return_if 
   pick: name pick: receiver pick: searcher instance_attrib func_return ] bind: forthe.attrib 
 pick: forthe.attrib pick: boot_obj attr_call: subclass bind: forthe_class 
 pick: forthe_class attr: instance pick: forthe_class closure bind: forthe 
[ newfunc3 assign: pos assign: value assign: name 
   pick: name pick: value forthe assign: res 
   pick: pos pick: res attr_call: set_pos 
   pick: res func_return ] bind: forthep 
[ newfunc2 assign: self assign: new_name 
  s21 memory.set return_no_value ] bind: FQuote.set_name 
[ push: FQuote\_looking\_up\_ print 
  pick: name print 
  printeol ] bind: autogen529 
[ newfunc3 assign: searcher assign: receiver assign: name 
   pick: lookup_print pushf: autogen529 if 
   pick: name push: get string_equal pick: node.get return_if 
   pick: name push: instance string_equal pick: node.instance return_if 
   pick: name push: print string_equal pick: node.print return_if 
   pick: name push: set_name string_equal pick: FQuote.set_name return_if 
   pick: name push: len string_equal pick: receiver node.len return_if 
   pick: name push: name string_equal pick: receiver memory.get return_if 
   pick: name push: value string_equal pick: receiver 1 + memory.get return_if 
   pick: name push: pos string_equal pick: receiver 2 + memory.get return_if 
   pick: name push: set_pos string_equal pick: node.set_pos return_if 
   pick: name push: type string_equal push: FQuote return_if 
   pick: name pick: receiver pick: searcher instance_attrib func_return ] bind: FQuote.attrib 
 pick: FQuote.attrib pick: boot_obj attr_call: subclass bind: FQuote_class 
 pick: FQuote_class attr: instance pick: FQuote_class closure bind: FQuote 
 pick: FQuote_class convert_attr bind: FQuote.hash 
[ newfunc3 assign: searcher assign: receiver assign: name 
   hash_header 
   pick: name pick: FQuote.hash hashtable.get call return_no_value ] rebind: FQuote.attrib 
[ newfunc3 assign: pos assign: value assign: name 
   pick: name pick: value FQuote assign: res 
   pick: pos pick: res attr_call: set_pos 
   pick: res func_return ] bind: FQuotep 
[ newfunc1 assign: array 
   pick: array pick: FList_class change_class 
   check: array func_return ] bind: to_flist 
[ pick: self pick: i + 1 + 0 memory.set 
  check: i 1 - assign: i ] bind: autogen530 
[ newfunc1 assign: self 
   pick: self memory.get assign: i 
   pushf: autogen530 repeat_if return_no_value ] bind: array.clear 
[ newfunc1 assign: root 
  push: Dummy\_function error return_no_value ] bind: simplify 
[ pick: elem simplify ] bind: autogen531 
[ pick: root attr: name pushf: autogen531 pick: root list_comp node assign: output ] bind: autogen532 
[ pick: True ] bind: autogen533 
[ 0 resizable assign: output ] bind: autogen534 
[ pick: True ] bind: autogen535 
[ pick: elem simplify ] bind: autogen536 
[ pushf: autogen536 pick: root attr: children list_comp assign: output ] bind: autogen537 
[ pick: root attr: children None == not ] bind: autogen538 
[ pick: root attr: children simplify assign: output ] bind: autogen539 
[ pick: root attr: children pick: node_class is_instance ] bind: autogen540 
[ pushf: autogen534 pushf: autogen535 pushf: autogen537 pushf: autogen538 pushf: autogen539 pushf: autogen540 pushi: 3 multi-if ] bind: autogen541 
[ pick: root attr: name push: parameters string_equal pick: root attr: name push: exprs string_equal || ] bind: autogen542 
[ 0 pick: root attr_call: get simplify assign: output ] bind: autogen543 
[ 0 pick: root attr_call: get attr: name push: exprs string_equal ] bind: autogen544 
[ pushf: autogen544 pick: root attr: len 1 == 0 pick: root attr_call: get pick: node_class is_instance && lazy_and ] bind: autogen545 
[ pick: elem simplify ] bind: autogen546 
[ pick: True assign: cond ] bind: autogen547 
[ pick: elem attr: name push: EMPTY_LINE string_equal not assign: cond ] bind: autogen548 
[ 
  pick: elem pick: node_class is_instance not pushf: autogen547 pushf: autogen548 if-else ] bind: autogen549 
[ pushf: autogen546 pick: root pushf: autogen549 list_comp_cond assign: children 
  pick: root attr: name pick: children pick: root attr: pos nodep assign: output ] bind: autogen550 
[ pick: root attr: name push: suite string_equal ] bind: autogen551 
[ 0 pick: root attr_call: get simplify assign: output ] bind: autogen552 
[ pick: root attr: name push: suite string_equal pick: root attr: len 1 == && ] bind: autogen553 
[ pick: child pick: children attr_call: append ] bind: autogen554 
[ pick: True ] bind: autogen555 
[ push: multi_if pick: last_child attr_call: set_name 
  pick: Done push: if pick: last_child attr: children pick: last_child attr: pos nodep make_resizable pick: last_child attr_call: set_children ] bind: autogen556 
[ debugger2 
  pick: last_child attr: name push: if string_equal pushf: autogen556 if 
  pick: child pick: last_child attr: children attr_call: append 
  debugger2 
  check: child drop1 
  pick: last_child assign: bring_to_top ] bind: autogen557 
[ pick: child attr: name push: elif string_equal ] bind: autogen558 
[ pick: child attr: children pick: last_child attr: children attr_call: append 
  push: if-else pick: last_child attr_call: set_name 
  0 pick: last_child attr: pos attr_call: get 1 pick: child attr: pos attr_call: get pair pick: last_child attr_call: set_pos ] bind: autogen559 
[ pick: last_child attr: name push: if string_equal pick: child attr: name push: else string_equal && ] bind: autogen560 
[ 
   pick: index pick: root attr_call: get simplify assign: child 
   pushf: autogen554 pushf: autogen555 pushf: autogen557 pushf: autogen558 pushf: autogen559 pushf: autogen560 pushi: 3 multi-if 
   debugger2 
   push: 23416 shuffle assign: index assign: end assign: block assign: last_child ] bind: autogen561 
[ push: multi-block-root:\_ pick: root dprint 
  debugger2 
  0 resizable assign: children 
  push: dummy None node assign: last_child 
  pick: root attr: len 0 pushf: autogen561 simple_for 
  push: suite pick: children node assign: output ] bind: autogen562 
[ pick: root attr: name push: multi_block_call string_equal ] bind: autogen563 
[ check: cond drop1 
  check: i 2 + assign: i 
  0 pick: i 1 - pick: root attr_call: get attr_call: get pick: Done pick: i pick: root attr_call: get simplify pick: output simplify make_resizable pick: i 1 - pick: root attr_call: get attr: pos nodep assign: output 
  push: 214 shuffle assign: i assign: output 
  pick: i pick: l < assign: cond ] bind: autogen564 
[ pick: root attr: len 2 - assign: l 
  0 pick: root attr_call: get assign: output 
  0 assign: i 
  pick: i pick: l < assign: cond 
  pushf: autogen564 repeat_if 
  check: i drop1 ] bind: autogen565 
[ pick: root attr: name push: infix string_equal ] bind: autogen566 
[ 0 0 pick: root attr_call: get attr_call: get 1 pick: root attr_call: get simplify node assign: output ] bind: autogen567 
[ pick: root attr: name push: func_call string_equal pick: root attr: name push: block_call string_equal || ] bind: autogen568 
[ pick: root assign: output ] bind: autogen569 
[ pick: root pick: node_class is_instance not ] bind: autogen570 
[ pick: root attr: pos pick: output attr_call: set_pos ] bind: autogen571 
[ newfunc1 assign: root 
    pushf: autogen532 pushf: autogen533 pushf: autogen541 pushf: autogen542 pushf: autogen543 pushf: autogen545 pushf: autogen550 pushf: autogen551 pushf: autogen552 pushf: autogen553 pushf: autogen562 pushf: autogen563 pushf: autogen565 pushf: autogen566 pushf: autogen567 pushf: autogen568 pushf: autogen569 pushf: autogen570 pushi: 9 multi-if 
    pick: root pick: node_class is_instance pick: output pick: node_class is_instance && pushf: autogen571 if 
   check: output func_return ] rebind: simplify 
[ push: newfunc\_called\_with\_unexpected\_argument error ] bind: autogen572 
[ newfunc1 assign: i 
   pick: i pushi: 4 < not pushf: autogen572 if 
   pick: Done pick: i int_to_str push: newfunc str_cat func_return ] bind: newfunc_str 
[ newfunc1 assign: array 
   pick: array pick: FList_class change_class 
   check: array func_return ] rebind: to_flist 
[ newfunc1 assign: root 
  push: Dummy\_function error return_no_value ] bind: last_call 
[ pick: root func_return ] bind: autogen573 
[ push: \_ func_return ] bind: autogen574 
[ pick: root attr: name push: FCall string_equal pushf: autogen573 pushf: autogen574 if-else ] bind: autogen575 
[ pick: root attr: len 1 - pick: root attr_call: get last_call func_return ] bind: autogen576 
[ pick: root attr: value last_call func_return ] bind: autogen577 
[ newfunc1 assign: root 
   debugger2 
    pick: root pick: forthe_class is_instance pushf: autogen575 if 
    pick: root pick: FList_class is_instance pick: root pick: resizable_class is_instance || pushf: autogen576 if 
    pick: root pick: FQuote is_instance pushf: autogen577 if 
   push: \_ func_return ] rebind: last_call 
[ newfunc1 assign: root 
  push: Dummy\_function error return_no_value ] bind: to_forth 
[ newfunc2 assign: obj assign: new_class 
   pick: obj 2 - pick: new_class memory.set 
   pick: obj func_return ] bind: changed_class 
[ pick: elem to_forth ] bind: autogen578 
[ newfunc1 assign: root 
  pick: FList_class pushf: autogen578 pick: root list_comp changed_class func_return ] bind: to_forth_conv.suite 
[ pick: elem to_forth ] bind: autogen579 
[ newfunc1 assign: root 
  push: \_ pushf: autogen579 pick: root list_comp pick: FList_class flatten pick: root attr: pos FQuotep func_return ] bind: to_forth_conv.quote 
[ pick: elem to_forth ] bind: autogen580 
[ newfunc1 assign: root 
   debugger2 
   pushf: autogen580 pick: root list_comp pick: FList_class flatten assign: children 
   push: Children:\_ print 
   pick: children tprint 
   printeol 
   debugger2 
   pick: children attr_call: pop drop1 
   push: FComment pick: children pick: root attr: pos forthep func_return ] bind: to_forth_conv.simple_quote 
[ newfunc1 assign: root 
  pick: FList_class pick: Done 0 pick: root attr_call: get to_forth push: FCall push: pick: pick: root attr: pos forthep make_resizable changed_class func_return ] bind: to_forth_conv.variable 
[ newfunc1 assign: root 
  push: FStr 0 pick: root attr_call: get pick: root attr: pos forthep func_return ] bind: to_forth_conv.NAME 
[ newfunc1 assign: root 
  pick: FList_class pick: Done 0 pick: root attr_call: get to_forth push: FCall push: check: pick: root attr: pos forthep make_resizable changed_class func_return ] bind: to_forth_conv.name_quote 
[ newfunc1 assign: root 
  pick: FList_class pick: Done push: FStr 0 pick: root attr_call: get string_escape pick: root attr: pos forthep push: FCall push: push: pick: root attr: pos forthep make_resizable changed_class func_return ] bind: to_forth_conv.STRING 
[ push: FStr pick: child pick: root attr: pos forthep assign: output ] bind: autogen581 
[ pick: FList_class pick: Done push: FStr pick: child pick: root attr: pos forthep push: FCall push: pushi: pick: root attr: pos forthep make_resizable changed_class assign: output ] bind: autogen582 
[ newfunc1 assign: root 
   0 pick: root attr: children attr_call: get assign: child 
   push: NUMBER\_in:\_ print 
   pick: root tprint 
   printeol 
   debugger2 
   pick: child push: 0 string_equal pick: child push: 1 string_equal || pick: child push: 2 string_equal || pushf: autogen581 pushf: autogen582 if-else 
   push: NUMBER\_out:\_ print 
   pick: output tprint 
   printeol 
   debugger2 
   pick: output func_return ] bind: to_forth_conv.NUMBER 
[ push: FCall 0 pick: elem attr_call: get pick: elem attr: pos forthep ] bind: autogen583 
[ newfunc1 assign: root 
  pick: FList_class pushf: autogen583 pick: root list_comp changed_class func_return ] bind: to_forth_conv.forth_line 
[ pick: FList_class pick: Done pick: output make_resizable changed_class assign: output 
  s21 drop1 assign: output ] bind: autogen584 
[ check: i 1 - assign: i 
  push: FCall push: assign: pick: i pick: names attr_call: get attr: pos forthep pick: assignments attr_call: append 
  pick: i pick: names attr_call: get to_forth pick: assignments attr_call: append ] bind: autogen585 
[ newfunc1 assign: root 
   1 pick: root attr_call: get to_forth assign: output 
   pick: output pick: FList_class is_instance not pushf: autogen584 if 
   0 resizable assign: assignments 
   0 pick: root attr_call: get assign: names 
   pick: names attr: len assign: i 
   pushf: autogen585 repeat_if 
   pick: FList_class pick: assignments changed_class pick: output attr_call: append 
   pick: output func_return ] bind: to_forth_conv.assign 
[ pick: elem to_forth ] bind: autogen586 
[ 0 pick: output attr_call: get attr: value assign: names ] bind: autogen587 
[ debugger 
  1 1 - 2 0 pick: output attr_call: get attr_call: slice assign: names ] bind: autogen588 
[ 0 resizable assign: decl ] bind: autogen589 
[ pick: is_fast_fun pick: is_inline || ] bind: autogen590 
[ pick: Done push: FCall push: remove_top_names pick: pos forthep push: FStr pick: names attr: len int_to_str pick: pos forthep push: FCall push: pushi: pick: pos forthep make_resizable assign: decl ] bind: autogen591 
[ pick: is_local_fun ] bind: autogen592 
[ pick: Done push: FCall pick: names attr: len newfunc_str pick: pos forthep make_resizable assign: decl ] bind: autogen593 
[ pick: Done push: FCall push: newfunc pick: pos forthep push: FStr pick: names attr: len int_to_str pick: pos forthep push: FCall push: pushi: pick: pos forthep make_resizable assign: decl ] bind: autogen594 
[ pick: names attr: len pushi: 4 < pushf: autogen593 pushf: autogen594 if-else ] bind: autogen595 
[ pick: is_fun ] bind: autogen596 
[ check: i 1 - assign: i 
  push: FCall push: assign: pick: i pick: names attr_call: get attr: pos forthep pick: decl attr_call: append 
  pick: i pick: names attr_call: get pick: decl attr_call: append ] bind: autogen597 
[ pick: names attr: len assign: i 
  pushf: autogen597 repeat_if ] bind: autogen598 
[ pick: last_called attr: value assign: last ] bind: autogen599 
[ push: \_ assign: last ] bind: autogen600 
[ push: FCall push: return_no_value pick: last_pos forthep 1 pick: output attr_call: get attr: value attr_call: append ] bind: autogen601 
[ push: FCall push: return_no_value pick: last_pos forthep 1 pick: output attr_call: get attr_call: append ] bind: autogen602 
[ 1 pick: last_called attr: pos attr_call: get 1 pick: last_called attr: pos attr_call: get pair assign: last_pos 
  1 pick: output attr_call: get pick: FQuote_class is_instance pushf: autogen601 pushf: autogen602 if-else 
  check: last_pos drop1 ] bind: autogen603 
[ 1 pick: output attr_call: get last_call assign: last_called 
  pick: last_called push: \_ string_equal not pushf: autogen599 pushf: autogen600 if-else 
  debugger2 
  pick: last push: return string_equal pick: last push: lookup_error string_equal || not pushf: autogen603 if 
  check: last drop1 
  check: last_called drop1 ] bind: autogen604 
[ 0 pick: root attr_call: get attr: name push: simple_quote string_equal pushf: autogen587 pushf: autogen588 if-else 
  0 pick: root attr_call: get attr: pos assign: pos 
  pushf: autogen589 pushf: autogen590 pushf: autogen591 pushf: autogen592 pushf: autogen595 pushf: autogen596 pushi: 3 multi-if 
  pick: decl pick: FList_class change_class 
  pick: is_fast_fun not pushf: autogen598 if 
  pick: decl tprint 
  printeol 
  debugger2 
  0 pick: decl pick: output attr: value attr_call: set 
  1 pick: output attr_call: get attr: value pick: FList_class change_class 
  1 1 pick: output attr_call: get attr: value pick: output attr: value attr_call: set 
  pick: is_fun pushf: autogen604 if ] bind: autogen605 
[ newfunc1 assign: root 
   push: \_ pushf: autogen586 pick: root list_comp pick: root attr: pos FQuotep assign: output 
   pick: root attr: name push: inline string_equal assign: is_inline 
   pick: root attr: name push: fun string_equal assign: is_fun 
   pick: root attr: name push: local_fun string_equal assign: is_local_fun 
   pick: root attr: name push: fast_fun string_equal assign: is_fast_fun 
   pick: True assign: cond 
   check: cond pushf: autogen605 if 
   pick: output func_return ] bind: to_forth_conv.fun 
[ check: output pick: Done s21 make_resizable assign: output 
  pick: output pick: FList_class change_class ] bind: autogen606 
[ newfunc1 assign: root 
   push: root: pick: root dprint 
   debugger2 
   1 pick: root attr_call: get to_forth assign: output 
   push: output: pick: output dprint 
   push: root\_name: pick: root attr: name dprint 
   debugger2 
   pick: output pick: FList_class is_instance not pushf: autogen606 if 
   push: FCall push: bind: pick: root attr: pos forthep pick: output attr_call: append 
   0 0 pick: root attr_call: get attr_call: get to_forth pick: output attr_call: append 
   pick: output func_return ] bind: to_forth_conv.bind 
[ push: FStr pick: elem pick: root attr: pos forthep ] bind: autogen607 
[ newfunc1 assign: root 
   pushf: autogen607 pick: root list_comp pick: FList_class flatten assign: children 
   push: FComment pick: children pick: root attr: pos forthep func_return ] bind: to_forth_conv.comment 
[ pick: Done 0 1 pick: root attr_call: get attr_call: get to_forth push: FCall push: attr: pick: root attr: pos forthep 0 pick: root attr_call: get to_forth make_resizable assign: children ] bind: autogen608 
[ pick: elem to_forth ] bind: autogen609 
[ pushf: autogen609 1 pick: root attr_call: get list_comp assign: children 
  pick: Done push: FStr 1 pick: root attr_call: get attr: name pick: root attr: pos forthep push: FCall push: attr_call: pick: root attr: pos forthep 0 pick: root attr_call: get to_forth make_resizable assign: calls 
  check: calls pick: children extend ] bind: autogen610 
[ newfunc1 assign: root 
   1 pick: root attr_call: get attr: name push: variable string_equal pushf: autogen608 pushf: autogen610 if-else 
   pick: FList_class pick: children pick: FList_class flatten changed_class func_return ] bind: to_forth_conv.dot 
[ pick: elem to_forth ] bind: autogen611 
[ newfunc1 assign: root 
   pushf: autogen611 pick: root list_comp assign: output 
   pick: FList_class pick: output pick: FList_class flatten changed_class func_return ] bind: to_forth_conv.grammar 
[ pick: i 1 - pick: root attr_call: get assign: child 
  1 pick: child attr_call: get to_forth pick: output attr_call: append 
  push: quote 0 pick: child attr_call: get node to_forth pick: output attr_call: append 
  check: child drop1 
  check: i 1 - assign: i ] bind: autogen612 
[ newfunc1 assign: root 
   debugger2 
   0 resizable assign: output 
   pick: root attr: len assign: i 
   pushf: autogen612 repeat_if 
   debugger2 
   pick: output pick: FList_class flatten assign: output 
   debugger2 
   push: FCall push: pushi: pick: root attr: pos forthep pick: output attr_call: append 
   push: FStr pick: root attr: len int_to_str pick: root attr: pos forthep pick: output attr_call: append 
   push: FCall pick: root attr: name pick: root attr: pos forthep pick: output attr_call: append 
   pick: output pick: FList_class change_class 
   debugger2 
   pick: output func_return ] bind: to_forth_conv.multi_if 
[ pick: elem to_forth ] bind: autogen613 
[ newfunc1 assign: root 
   pushf: autogen613 pick: root list_comp assign: output 
   check: output pick: FList_class flatten assign: output 
   push: FCall pick: root attr: name pick: root attr: pos forthep pick: output attr_call: append 
   push: output: pick: output dprint 
   debugger2 
   pick: FList_class pick: output changed_class func_return ] bind: to_forth_conv.default 
 pushi: 200 hashtable bind: to_forth_conv_hash 
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
 push: local_fun pick: to_forth_conv.fun pick: to_forth_conv_hash attr_call: set 
 push: fast_fun pick: to_forth_conv.fun pick: to_forth_conv_hash attr_call: set 
 push: bind pick: to_forth_conv.bind pick: to_forth_conv_hash attr_call: set 
 push: comment pick: to_forth_conv.comment pick: to_forth_conv_hash attr_call: set 
 push: . pick: to_forth_conv.dot pick: to_forth_conv_hash attr_call: set 
 push: grammar pick: to_forth_conv.grammar pick: to_forth_conv_hash attr_call: set 
 push: exprsp pick: to_forth_conv.grammar pick: to_forth_conv_hash attr_call: set 
 push: multi_if pick: to_forth_conv.multi_if pick: to_forth_conv_hash attr_call: set 
 push: default pick: to_forth_conv.default pick: to_forth_conv_hash attr_call: set 
[ push: root:\_ pick: root dprint 
  push: type:\_ pick: root attr: type dprint 
  debugger 
  push: Unexpected\_non-node\_root. error ] bind: autogen614 
[ check: converter drop1 
  push: default pick: to_forth_conv_hash attr_call: get assign: converter ] bind: autogen615 
[ newfunc1 assign: root 
   push: nest push: nest pick: parseg attr_call: get 1 + pick: parseg attr_call: set 
   push: nest pick: parseg attr_call: get 0 pick: printspace simple_for 
   pick: root attr: name print 
   push: \_<- print 
   printeol 
   pick: root pick: node_class is_instance not pushf: autogen614 if 
   pick: root attr: name pick: to_forth_conv_hash attr_call: get assign: converter 
   pick: converter None == pushf: autogen615 if 
   pick: root pick: converter call assign: output 
   push: nest pick: parseg attr_call: get 0 pick: printspace simple_for 
   pick: root attr: name print 
   push: \_->\_ pick: output dprint 
   push: nest push: nest pick: parseg attr_call: get 1 - pick: parseg attr_call: set 
   check: output func_return ] rebind: to_forth 
 pushi: 13 hashtable bind: g 
 push: written pushi: 5000 hashtable pick: g attr_call: set 
[ push: file push: w pick: filename file.open pick: g attr_call: set 
  push: pos_file push: w pick: Done push: .pos_map pick: filename str_cat file.open pick: g attr_call: set ] bind: autogen616 
[ push: file None pick: g attr_call: set 
  push: pos_file None pick: g attr_call: set ] bind: autogen617 
[ newfunc1 assign: filename 
   push: written pick: g attr_call: get attr: keys array.clear 
   push: nesting 0 pick: g attr_call: set 
   push: last_value push: \_ pick: g attr_call: set 
   push: autogen_count 0 pick: g attr_call: set 
   push: autogen_name push: autogen pick: g attr_call: set 
   pick: filename None == not pushf: autogen616 pushf: autogen617 if-else 
   push: init\_g:\_ pick: g dprint 
   debugger2 return_no_value ] bind: init_g 
[ 
  push: last_value None pick: g attr_call: set ] bind: write_eol 
[ pick: value push: ] string_equal not pick: value push: return_no_value string_equal not && ] bind: autogen618 
[ printeol 
  push: nesting pick: g attr_call: get 1 pick: printspace simple_for ] bind: autogen619 
[ newfunc2 assign: pos assign: value 
   push: file pick: g attr_call: get set_output 
   push: file pick: g attr_call: get fd_position assign: start 
   pushf: autogen618 push: last_value pick: g attr_call: get None == lazy_and pushf: autogen619 if 
   printspace 
   pick: value printraw 
   push: last_value pick: value pick: g attr_call: set 
   push: file pick: g attr_call: get fd_position assign: end 
   push: pos_file pick: g attr_call: get set_output 
   pick: Done push: \_ push: input_file pick: g attr_call: get push: \_ pick: start int_to_str str_cat print 
   0 pick: pos attr_call: get print push: \_ print 1 pick: pos attr_call: get print printeol 
   None set_output return_no_value ] bind: write_sep 
[ newfunc2 assign: depth assign: root 
  push: Dummy\_function error return_no_value ] bind: write_string_body 
[ push: write_string_body\_doesn't\_know\_how\_to\_handle\_this\_kind\_of\_node\n print 
  push: ws\_root:\_ pick: root dprint 
  push: ws\_depth:\_ pick: depth dprint 
  push: ws\_is\_str:\_ pick: root is_str dprint 
  push: ws\_type:\_ pick: root attr: type dprint 
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
[ push: pushf: pick: root attr: pos write_sep 
  pick: root attr: name pick: root attr: pos write_sep ] bind: autogen625 
[ pick: root pick: FQuote_class is_instance ] bind: autogen626 
[ pick: root attr: value pick: root attr: pos write_sep ] bind: autogen627 
[ pick: root attr: name push: FStr string_equal ] bind: autogen628 
[ pick: Done pick: root attr: value push: func_ str_cat pick: root attr: pos write_sep ] bind: autogen629 
[ pick: root attr: value pick: root attr: pos write_sep ] bind: autogen630 
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
  push: Dummy\_function error return_no_value ] bind: write_blocks 
[ push: root:\_ pick: root dprint 
  push: root\_is\_quote:\_ pick: root pick: FQuote_class is_instance dprint 
  push: root\_is\_list:\_ pick: root pick: FList_class is_instance dprint 
  push: g:\_ pick: g dprint ] bind: autogen637 
[ check: elem pick: depth 1 + write_blocks ] bind: autogen638 
[ check: elem pick: depth write_blocks ] bind: autogen639 
[ 
  pick: elem pick: FQuote_class is_instance pushf: autogen638 pushf: autogen639 if-else ] bind: autogen640 
[ push: nesting push: nesting pick: g attr_call: get 1 + pick: g attr_call: set 
  pick: root pushf: autogen640 for_in 
  push: nesting push: nesting pick: g attr_call: get 1 - pick: g attr_call: set 
  write_eol ] bind: autogen641 
[ pick: Done push: autogen_count pick: g attr_call: get int_to_str push: autogen_name pick: g attr_call: get str_cat assign: name 
  check: name pick: root attr_call: set_name 
  push: autogen_count push: autogen_count pick: g attr_call: get 1 + pick: g attr_call: set ] bind: autogen642 
[ 
  check: elem pick: depth write_string_body ] bind: autogen643 
[ push: bind: pick: root attr: pos write_sep 
  pick: root attr: name pick: True push: written pick: g attr_call: get attr_call: set ] bind: autogen644 
[ push: rebind: pick: root attr: pos write_sep ] bind: autogen645 
[ push: nesting pick: g attr_call: get assign: nesting 
  debugger2 
  pick: root attr: name push: \_ string_equal pushf: autogen642 if 
  push: nesting 0 pick: g attr_call: set 
  push: [ pick: root attr: pos write_sep 
  push: nesting 1 pick: g attr_call: set 
  pick: root pushf: autogen643 for_in 
  push: ] pick: root attr: pos write_sep 
  pick: root attr: name push: written pick: g attr_call: get attr_call: get None == pushf: autogen644 pushf: autogen645 if-else 
  pick: root attr: name pick: root attr: pos write_sep 
  write_eol 
  push: nesting pick: nesting pick: g attr_call: set ] bind: autogen646 
[ newfunc2 assign: depth assign: root 
   pick: False pushf: autogen637 if 
   pick: root pick: FQuote_class is_instance pick: root pick: FList_class is_instance || pushf: autogen641 if 
   pick: root pick: FQuote_class is_instance pushf: autogen646 if return_no_value ] rebind: write_blocks 
[ push: is\_bind:\_ pick: child attr: len 2 - pick: child attr_call: get attr: value dprint ] bind: autogen647 
[ pick: child attr: len pushi: 4 - pick: child attr_call: get attr: value push: class string_equal ] bind: autogen648 
[ push: is\_class:\_ pick: child attr: len pushi: 4 - pick: child attr_call: get attr: value dprint 
  push: is\_str:\_ pick: child attr: len pushi: 4 - pick: child attr_call: get attr: value is_str dprint 
  push: str\_eq:\_ pick: child attr: len pushi: 4 - pick: child attr_call: get attr: value push: class string_equal dprint 
  push: lazy\_cond:\_ pushf: autogen648 pick: child attr: len pushi: 4 > lazy_and dprint ] bind: autogen649 
[ printeol 
  push: child:\_ pick: child dprint 
  push: child.len:\_ pick: child attr: len dprint 
   pick: child attr: len 2 > pushf: autogen647 if 
   pick: child attr: len pushi: 5 > pushf: autogen649 if ] bind: autogen650 
[ 
   pick: child pick: FList_class is_instance pushf: autogen650 if 
   debugger2 ] bind: print_child 
[ debugger2 ] bind: autogen651 
[ pick: s pick: s str_len pushi: 6 - pick: s str_len sub_str push: _colon string_equal ] bind: autogen652 
[ pick: Done push: : pick: s 0 pick: s str_len pushi: 6 - sub_str str_cat func_return ] bind: autogen653 
[ newfunc1 assign: s 
    pick: s str_len pushi: 6 > pushf: autogen651 if 
    pushf: autogen652 pick: s str_len pushi: 6 > lazy_and pushf: autogen653 if 
   pick: s func_return ] bind: replace_name 
[ newfunc2 assign: prefix assign: root 
  push: Dummy\_function error return_no_value ] bind: write_suite 
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
[ push: Unexpected\_bind\_body\_length error ] bind: autogen661 
[ pick: child attr: len 1 - pick: child attr_call: get attr: value assign: func_name ] bind: autogen662 
[ pick: Done pick: child attr: len 1 - pick: child attr_call: get attr: value push: . pick: prefix str_cat assign: func_name ] bind: autogen663 
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
[ newfunc1 assign: n 
  push: Dummy\_function error return_no_value ] bind: convert_py_node 
[ check: child convert_py_node pick: new_node attr_call: append ] bind: autogen675 
[ check: child pick: new_node attr_call: append ] bind: autogen676 
[ 
   pick: n pick: index py_get py_convert assign: type assign: child 
   check: type push: Node == pushf: autogen675 pushf: autogen676 if-else ] bind: autogen677 
[ 0 pick: new_node attr_call: get assign: new_node ] bind: autogen678 
[ newfunc1 assign: n 
   pick: n py_len assign: l 
   0 resizable assign: new_node 
   pick: l 0 pushf: autogen677 simple_for 
   pick: l 1 == pushf: autogen678 if 
   pick: n py_name pick: new_node pick: n py_pos pair nodep func_return ] rebind: convert_py_node 
[ pick: filename py_parse convert_py_node assign: parsed ] bind: autogen679 
[ push: source pick: filename Input names2 hashtable.set 
  pick: flpcg init_parseg 
  printeol 
  push: Running\_flpc\_grammar\_on\_input\_ print 
  pick: filename printraw 
  printeol 
  push: grammar apply assign: parsed ] bind: autogen680 
[ push: Parse\_error\_at\_simplification\_step. error ] bind: autogen681 
[ newfunc1 assign: filename 
   push: input_file pick: filename pick: g attr_call: set 
   push: compiling\_file\_ print 
   pick: filename printraw 
   printeol 
   use_py_opt pushf: autogen679 pushf: autogen680 if-else 
   push: Input:\_ print 
   pick: parsed tprint 
   printeol 
   pick: parsed simplify assign: simplified 
   push: Simplified:\_ print 
   pick: simplified attr_call: print 
   printeol 
   pick: simplified pick: MatchError_class is_instance pushf: autogen681 if 
   push: nest 0 pick: parseg attr_call: set 
   pick: simplified to_forth assign: forthed 
   push: ToForth:\_ print 
   pick: forthed attr_call: print 
   printeol 
   printeol 
   pick: forthed None write_suite 
   printeol return_no_value ] bind: compile_file 
[ 
   push: _ printraw 
   check: elem printraw ] bind: autogen682 
[ 
   push: \_ print 
   check: elem printraw ] bind: autogen683 
[ check: elem compile_file ] bind: autogen684 
[ newfunc2 assign: output assign: filenames 
   pick: output init_g 
   push: file pick: g attr_call: get set_output 
   push: push:\_ print 
   push: Generated_from printraw 
   pick: filenames pushf: autogen682 for_in 
   push: _print print 
   printeol 
   push: pos_file pick: g attr_call: get set_output 
   pick: filenames attr: len print 
   pick: filenames pushf: autogen683 for_in 
   push: \n print 
   None set_output 
   pick: filenames pushf: autogen684 for_in return_no_value ] bind: compile_all 