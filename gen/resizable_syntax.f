
 [ push: { token ] bind: tempgen0
 [ push: spaces apply ] bind: tempgen1
 [ push: expr apply ] bind: tempgen2
 [ push: spacesp apply ] bind: tempgen3
 [ push: expr apply ] bind: tempgen4
 [ pushf: tempgen4 out ] bind: tempgen5
 [ pushf: tempgen3 pushf: tempgen5 ] bind: tempgen6
 [ pushf: tempgen6 and ] bind: tempgen7
 [ pushf: tempgen7 push: * quantified ] bind: tempgen8
 [ pushf: tempgen2 pushf: tempgen8 ] bind: tempgen9
 [ pushf: tempgen9 and ] bind: tempgen10
 [ push: void apply ] bind: tempgen11
 [ pushf: tempgen10 pushf: tempgen11 ] bind: tempgen12
 [ pushf: tempgen12 or ] bind: tempgen13
 [ pushf: tempgen13 out ] bind: tempgen14
 [ push: } token ] bind: tempgen15
 [ pushf: tempgen0 pushf: tempgen1 pushf: tempgen14 pushf: tempgen15 ] bind: tempgen16
 [ newfunc0
  pushf: tempgen16 and return1 ] bind: flpcg.rules.make_resizable
 [ push: { token ] bind: tempgen17
 [ push: spaces apply ] bind: tempgen18
 [ push: expr apply ] bind: tempgen19
 [ pushf: tempgen19 out ] bind: tempgen20
 [ push: : token ] bind: tempgen21
 [ push: expr apply ] bind: tempgen22
 [ pushf: tempgen22 out ] bind: tempgen23
 [ push: , token ] bind: tempgen24
 [ push: spaces apply ] bind: tempgen25
 [ push: expr apply ] bind: tempgen26
 [ pushf: tempgen26 out ] bind: tempgen27
 [ push: : token ] bind: tempgen28
 [ push: expr apply ] bind: tempgen29
 [ pushf: tempgen29 out ] bind: tempgen30
 [ pushf: tempgen24 pushf: tempgen25 pushf: tempgen27 pushf: tempgen28 pushf: tempgen30 ] bind: tempgen31
 [ pushf: tempgen31 and ] bind: tempgen32
 [ pushf: tempgen32 push: * quantified ] bind: tempgen33
 [ pushf: tempgen33 out ] bind: tempgen34
 [ push: | token ] bind: tempgen35
 [ push: expr apply ] bind: tempgen36
 [ pushf: tempgen36 out ] bind: tempgen37
 [ push: } token ] bind: tempgen38
 [ pushf: tempgen17 pushf: tempgen18 pushf: tempgen20 pushf: tempgen21 pushf: tempgen23 pushf: tempgen34 pushf: tempgen35 pushf: tempgen37 pushf: tempgen38 ] bind: tempgen39
 [ newfunc0
  pushf: tempgen39 and return1 ] bind: flpcg.rules.make_dict
 [ push: make_dict apply ] bind: tempgen40
 [ push: make_resizable apply ] bind: tempgen41
 [ push: forth apply ] bind: tempgen42
 [ push: func_call apply ] bind: tempgen43
 [ push: name_quote apply ] bind: tempgen44
 [ push: quote apply ] bind: tempgen45
 [ push: parenthesis apply ] bind: tempgen46
 [ push: NUMBER apply ] bind: tempgen47
 [ push: TRIPLE_QUOTE apply ] bind: tempgen48
 [ push: STRING apply ] bind: tempgen49
 [ push: variable apply ] bind: tempgen50
 [ pushf: tempgen40 pushf: tempgen41 pushf: tempgen42 pushf: tempgen43 pushf: tempgen44 pushf: tempgen45 pushf: tempgen46 pushf: tempgen47 pushf: tempgen48 pushf: tempgen49 pushf: tempgen50 ] bind: tempgen51
 [ newfunc0
  pushf: tempgen51 or return1 ] bind: flpcg.rules.non_block_non_infix
 push: make_resizable pick: flpcg.rules.make_resizable pick: flpcg.rules hashtable.set
 push: make_resizable pick: flpcg.flagged attr_call: append
 push: make_dict pick: flpcg.rules.make_dict pick: flpcg.rules hashtable.set
 push: make_dict pick: flpcg.flagged attr_call: append
 push: non_block_non_infix pick: flpcg.rules.non_block_non_infix pick: flpcg.rules hashtable.set