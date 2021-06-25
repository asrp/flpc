
 [ push: ' exactly ] bind: tempgen0
 [ push: ' exactly ] bind: tempgen1
 [ push: ' exactly ] bind: tempgen2
 [ pushf: tempgen0 pushf: tempgen1 pushf: tempgen2 ] bind: tempgen3
 [ newfunc0
  pushf: tempgen3 and func_return ] bind: flpcg.rules.single_quotes
 [ push: \\q exactly ] bind: tempgen4
 [ push: \\q exactly ] bind: tempgen5
 [ push: \\q exactly ] bind: tempgen6
 [ pushf: tempgen4 pushf: tempgen5 pushf: tempgen6 ] bind: tempgen7
 [ newfunc0
  pushf: tempgen7 and func_return ] bind: flpcg.rules.double_quotes
 [ push: hspaces apply ] bind: tempgen8
 [ push: single\uquotes apply ] bind: tempgen9
 [ push: single\uquotes apply ] bind: tempgen10
 [ pushf: tempgen10 negation ] bind: tempgen11
 [ push: anything apply ] bind: tempgen12
 [ pushf: tempgen11 pushf: tempgen12 ] bind: tempgen13
 [ pushf: tempgen13 and ] bind: tempgen14
 [ pushf: tempgen14 push: * quantified ] bind: tempgen15
 [ pushf: tempgen15 out ] bind: tempgen16
 [ push: single\uquotes apply ] bind: tempgen17
 [ pushf: tempgen9 pushf: tempgen16 pushf: tempgen17 ] bind: tempgen18
 [ pushf: tempgen18 and ] bind: tempgen19
 [ push: double\uquotes apply ] bind: tempgen20
 [ push: double\uquotes apply ] bind: tempgen21
 [ pushf: tempgen21 negation ] bind: tempgen22
 [ push: anything apply ] bind: tempgen23
 [ pushf: tempgen22 pushf: tempgen23 ] bind: tempgen24
 [ pushf: tempgen24 and ] bind: tempgen25
 [ pushf: tempgen25 push: * quantified ] bind: tempgen26
 [ pushf: tempgen26 out ] bind: tempgen27
 [ push: double\uquotes apply ] bind: tempgen28
 [ pushf: tempgen20 pushf: tempgen27 pushf: tempgen28 ] bind: tempgen29
 [ pushf: tempgen29 and ] bind: tempgen30
 [ pushf: tempgen19 pushf: tempgen30 ] bind: tempgen31
 [ pushf: tempgen31 or ] bind: tempgen32
 [ pushf: tempgen8 pushf: tempgen32 ] bind: tempgen33
 [ newfunc0
  pushf: tempgen33 and func_return ] bind: flpcg.rules.TRIPLE_QUOTE
 [ push: forth apply ] bind: tempgen34
 [ push: func\ucall apply ] bind: tempgen35
 [ push: name\uquote apply ] bind: tempgen36
 [ push: quote apply ] bind: tempgen37
 [ push: parenthesis apply ] bind: tempgen38
 [ push: NUMBER apply ] bind: tempgen39
 [ push: TRIPLE\uQUOTE apply ] bind: tempgen40
 [ push: STRING apply ] bind: tempgen41
 [ push: variable apply ] bind: tempgen42
 [ pushf: tempgen34 pushf: tempgen35 pushf: tempgen36 pushf: tempgen37 pushf: tempgen38 pushf: tempgen39 pushf: tempgen40 pushf: tempgen41 pushf: tempgen42 ] bind: tempgen43
 [ newfunc0
  pushf: tempgen43 or func_return ] bind: flpcg.rules.non_block_non_infix
 push: single\uquotes pick: flpcg.rules.single_quotes pick: flpcg.rules hashtable.set
 push: double\uquotes pick: flpcg.rules.double_quotes pick: flpcg.rules hashtable.set
 push: TRIPLE\uQUOTE pick: flpcg.rules.TRIPLE_QUOTE pick: flpcg.rules hashtable.set
 push: TRIPLE\uQUOTE pick: flpcg.flagged attr_call: append
 push: non\ublock\unon\uinfix pick: flpcg.rules.non_block_non_infix pick: flpcg.rules hashtable.set
