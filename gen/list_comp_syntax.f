
 [ push: { token ] bind: tempgen0
 [ push: expr apply ] bind: tempgen1
 [ pushf: tempgen1 out ] bind: tempgen2
 [ push: for token ] bind: tempgen3
 [ push: NAME apply ] bind: tempgen4
 [ pushf: tempgen4 out ] bind: tempgen5
 [ push: in token ] bind: tempgen6
 [ push: expr apply ] bind: tempgen7
 [ pushf: tempgen7 out ] bind: tempgen8
 [ push: } token ] bind: tempgen9
 [ pushf: tempgen0 pushf: tempgen2 pushf: tempgen3 pushf: tempgen5 pushf: tempgen6 pushf: tempgen8 pushf: tempgen9 ] bind: tempgen10
 [ newfunc0
  pushf: tempgen10 and return1 ] bind: flpcg.rules.list_comp_var
 [ push: list_comp_var apply ] bind: tempgen11
 [ push: make_dict apply ] bind: tempgen12
 [ push: make_resizable apply ] bind: tempgen13
 [ push: forth apply ] bind: tempgen14
 [ push: func_call apply ] bind: tempgen15
 [ push: name_quote apply ] bind: tempgen16
 [ push: quote apply ] bind: tempgen17
 [ push: parenthesis apply ] bind: tempgen18
 [ push: NUMBER apply ] bind: tempgen19
 [ push: TRIPLE_QUOTE apply ] bind: tempgen20
 [ push: STRING apply ] bind: tempgen21
 [ push: variable apply ] bind: tempgen22
 [ pushf: tempgen11 pushf: tempgen12 pushf: tempgen13 pushf: tempgen14 pushf: tempgen15 pushf: tempgen16 pushf: tempgen17 pushf: tempgen18 pushf: tempgen19 pushf: tempgen20 pushf: tempgen21 pushf: tempgen22 ] bind: tempgen23
 [ newfunc0
  pushf: tempgen23 or return1 ] bind: flpcg.rules.non_block_non_infix
 push: list_comp_var pick: flpcg.rules.list_comp_var pick: flpcg.rules hashtable.set
 push: non_block_non_infix pick: flpcg.rules.non_block_non_infix pick: flpcg.rules hashtable.set