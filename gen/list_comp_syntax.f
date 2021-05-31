
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
  pushf: tempgen10 and func_return ] bind: flpcg.rules.list_comp_var
 [ push: list\ucomp\uvar apply ] bind: tempgen11
 [ push: make\udict apply ] bind: tempgen12
 [ push: make\uresizable apply ] bind: tempgen13
 [ push: forth apply ] bind: tempgen14
 [ push: func\ucall apply ] bind: tempgen15
 [ push: name\uquote apply ] bind: tempgen16
 [ push: quote apply ] bind: tempgen17
 [ push: parenthesis apply ] bind: tempgen18
 [ push: NUMBER apply ] bind: tempgen19
 [ push: TRIPLE\uQUOTE apply ] bind: tempgen20
 [ push: STRING apply ] bind: tempgen21
 [ push: variable apply ] bind: tempgen22
 [ pushf: tempgen11 pushf: tempgen12 pushf: tempgen13 pushf: tempgen14 pushf: tempgen15 pushf: tempgen16 pushf: tempgen17 pushf: tempgen18 pushf: tempgen19 pushf: tempgen20 pushf: tempgen21 pushf: tempgen22 ] bind: tempgen23
 [ newfunc0
  pushf: tempgen23 or func_return ] bind: flpcg.rules.non_block_non_infix
 push: list\ucomp\uvar pick: flpcg.rules.list_comp_var pick: flpcg.rules hashtable.set
 push: non\ublock\unon\uinfix pick: flpcg.rules.non_block_non_infix pick: flpcg.rules hashtable.set