
 [ push: { exactly ] bind: tempgen0
 [ push: exprsp apply ] bind: tempgen1
 [ pushf: tempgen1 out ] bind: tempgen2
 [ push: hspaces apply ] bind: tempgen3
 [ push: } exactly ] bind: tempgen4
 [ pushf: tempgen0 pushf: tempgen2 pushf: tempgen3 pushf: tempgen4 ] bind: tempgen5
 [ newfunc0
  pushf: tempgen5 and func_return ] bind: flpcg.rules.string_expr
 [ push: ' exactly ] bind: tempgen6
 [ pushf: tempgen6 negation ] bind: tempgen7
 [ push: { exactly ] bind: tempgen8
 [ pushf: tempgen8 negation ] bind: tempgen9
 [ push: anything apply ] bind: tempgen10
 [ pushf: tempgen7 pushf: tempgen9 pushf: tempgen10 ] bind: tempgen11
 [ pushf: tempgen11 and ] bind: tempgen12
 [ pushf: tempgen12 push: * quantified ] bind: tempgen13
 [ push: void apply ] bind: tempgen14
 [ pushf: tempgen13 pushf: tempgen14 ] bind: tempgen15
 [ pushf: tempgen15 and ] bind: tempgen16
 [ newfunc0
  pushf: tempgen16 push: STRING bound func_return ] bind: flpcg.rules.f_string_chars_s
 [ push: \q exactly ] bind: tempgen17
 [ pushf: tempgen17 negation ] bind: tempgen18
 [ push: { exactly ] bind: tempgen19
 [ pushf: tempgen19 negation ] bind: tempgen20
 [ push: anything apply ] bind: tempgen21
 [ pushf: tempgen18 pushf: tempgen20 pushf: tempgen21 ] bind: tempgen22
 [ pushf: tempgen22 and ] bind: tempgen23
 [ pushf: tempgen23 push: * quantified ] bind: tempgen24
 [ push: void apply ] bind: tempgen25
 [ pushf: tempgen24 pushf: tempgen25 ] bind: tempgen26
 [ pushf: tempgen26 and ] bind: tempgen27
 [ newfunc0
  pushf: tempgen27 push: STRING bound func_return ] bind: flpcg.rules.f_string_chars_d
 [ push: f exactly ] bind: tempgen28
 [ push: ' exactly ] bind: tempgen29
 [ push: f_string_chars_s apply ] bind: tempgen30
 [ pushf: tempgen30 out ] bind: tempgen31
 [ push: string_expr apply ] bind: tempgen32
 [ push: f_string_chars_s apply ] bind: tempgen33
 [ pushf: tempgen32 pushf: tempgen33 ] bind: tempgen34
 [ pushf: tempgen34 and ] bind: tempgen35
 [ pushf: tempgen35 push: * quantified ] bind: tempgen36
 [ pushf: tempgen36 out ] bind: tempgen37
 [ push: ' exactly ] bind: tempgen38
 [ pushf: tempgen28 pushf: tempgen29 pushf: tempgen31 pushf: tempgen37 pushf: tempgen38 ] bind: tempgen39
 [ pushf: tempgen39 and ] bind: tempgen40
 [ newfunc0
  pushf: tempgen40 push: fmt bound func_return ] bind: flpcg.rules.F_QUOTE_S
 [ push: f exactly ] bind: tempgen41
 [ push: \q exactly ] bind: tempgen42
 [ push: f_string_chars_d apply ] bind: tempgen43
 [ pushf: tempgen43 out ] bind: tempgen44
 [ push: string_expr apply ] bind: tempgen45
 [ push: f_string_chars_d apply ] bind: tempgen46
 [ pushf: tempgen45 pushf: tempgen46 ] bind: tempgen47
 [ pushf: tempgen47 and ] bind: tempgen48
 [ pushf: tempgen48 push: * quantified ] bind: tempgen49
 [ pushf: tempgen49 out ] bind: tempgen50
 [ push: \q exactly ] bind: tempgen51
 [ pushf: tempgen41 pushf: tempgen42 pushf: tempgen44 pushf: tempgen50 pushf: tempgen51 ] bind: tempgen52
 [ pushf: tempgen52 and ] bind: tempgen53
 [ newfunc0
  pushf: tempgen53 push: fmt bound func_return ] bind: flpcg.rules.F_QUOTE_D
 [ push: hspaces apply ] bind: tempgen54
 [ push: F_QUOTE_S apply ] bind: tempgen55
 [ push: F_QUOTE_D apply ] bind: tempgen56
 [ pushf: tempgen55 pushf: tempgen56 ] bind: tempgen57
 [ pushf: tempgen57 or ] bind: tempgen58
 [ pushf: tempgen54 pushf: tempgen58 ] bind: tempgen59
 [ newfunc0
  pushf: tempgen59 and func_return ] bind: flpcg.rules.F_QUOTE
 [ push: single_quotes apply ] bind: tempgen60
 [ pushf: tempgen60 negation ] bind: tempgen61
 [ push: { exactly ] bind: tempgen62
 [ pushf: tempgen62 negation ] bind: tempgen63
 [ push: anything apply ] bind: tempgen64
 [ pushf: tempgen61 pushf: tempgen63 pushf: tempgen64 ] bind: tempgen65
 [ pushf: tempgen65 and ] bind: tempgen66
 [ pushf: tempgen66 push: * quantified ] bind: tempgen67
 [ push: void apply ] bind: tempgen68
 [ pushf: tempgen67 pushf: tempgen68 ] bind: tempgen69
 [ pushf: tempgen69 and ] bind: tempgen70
 [ newfunc0
  pushf: tempgen70 push: TRIPLE_QUOTE bound func_return ] bind: flpcg.rules.f_triple_quote_s
 [ push: double_quotes apply ] bind: tempgen71
 [ pushf: tempgen71 negation ] bind: tempgen72
 [ push: { exactly ] bind: tempgen73
 [ pushf: tempgen73 negation ] bind: tempgen74
 [ push: anything apply ] bind: tempgen75
 [ pushf: tempgen72 pushf: tempgen74 pushf: tempgen75 ] bind: tempgen76
 [ pushf: tempgen76 and ] bind: tempgen77
 [ pushf: tempgen77 push: * quantified ] bind: tempgen78
 [ push: void apply ] bind: tempgen79
 [ pushf: tempgen78 pushf: tempgen79 ] bind: tempgen80
 [ pushf: tempgen80 and ] bind: tempgen81
 [ newfunc0
  pushf: tempgen81 push: TRIPLE_QUOTE bound func_return ] bind: flpcg.rules.f_triple_quote_d
 [ push: f exactly ] bind: tempgen82
 [ push: single_quotes apply ] bind: tempgen83
 [ push: f_triple_quote_s apply ] bind: tempgen84
 [ pushf: tempgen84 out ] bind: tempgen85
 [ push: string_expr apply ] bind: tempgen86
 [ push: f_triple_quote_s apply ] bind: tempgen87
 [ pushf: tempgen86 pushf: tempgen87 ] bind: tempgen88
 [ pushf: tempgen88 and ] bind: tempgen89
 [ pushf: tempgen89 push: * quantified ] bind: tempgen90
 [ pushf: tempgen90 out ] bind: tempgen91
 [ push: single_quotes apply ] bind: tempgen92
 [ pushf: tempgen82 pushf: tempgen83 pushf: tempgen85 pushf: tempgen91 pushf: tempgen92 ] bind: tempgen93
 [ pushf: tempgen93 and ] bind: tempgen94
 [ newfunc0
  pushf: tempgen94 push: fmt bound func_return ] bind: flpcg.rules.F_TRIPLE_QUOTE_S
 [ push: f exactly ] bind: tempgen95
 [ push: double_quotes apply ] bind: tempgen96
 [ push: f_triple_quote_d apply ] bind: tempgen97
 [ pushf: tempgen97 out ] bind: tempgen98
 [ push: string_expr apply ] bind: tempgen99
 [ push: f_triple_quote_d apply ] bind: tempgen100
 [ pushf: tempgen99 pushf: tempgen100 ] bind: tempgen101
 [ pushf: tempgen101 and ] bind: tempgen102
 [ pushf: tempgen102 push: * quantified ] bind: tempgen103
 [ pushf: tempgen103 out ] bind: tempgen104
 [ push: double_quotes apply ] bind: tempgen105
 [ pushf: tempgen95 pushf: tempgen96 pushf: tempgen98 pushf: tempgen104 pushf: tempgen105 ] bind: tempgen106
 [ pushf: tempgen106 and ] bind: tempgen107
 [ newfunc0
  pushf: tempgen107 push: fmt bound func_return ] bind: flpcg.rules.F_TRIPLE_QUOTE_D
 [ push: hspaces apply ] bind: tempgen108
 [ push: F_TRIPLE_QUOTE_S apply ] bind: tempgen109
 [ push: F_TRIPLE_QUOTE_D apply ] bind: tempgen110
 [ pushf: tempgen109 pushf: tempgen110 ] bind: tempgen111
 [ pushf: tempgen111 or ] bind: tempgen112
 [ pushf: tempgen108 pushf: tempgen112 ] bind: tempgen113
 [ newfunc0
  pushf: tempgen113 and func_return ] bind: flpcg.rules.F_TRIPLE_QUOTE
 [ push: F_TRIPLE_QUOTE apply ] bind: tempgen114
 [ push: F_QUOTE apply ] bind: tempgen115
 [ push: list_comp_var apply ] bind: tempgen116
 [ push: make_dict apply ] bind: tempgen117
 [ push: make_resizable apply ] bind: tempgen118
 [ push: forth apply ] bind: tempgen119
 [ push: func_call apply ] bind: tempgen120
 [ push: name_quote apply ] bind: tempgen121
 [ push: quote apply ] bind: tempgen122
 [ push: parenthesis apply ] bind: tempgen123
 [ push: NUMBER apply ] bind: tempgen124
 [ push: TRIPLE_QUOTE apply ] bind: tempgen125
 [ push: STRING apply ] bind: tempgen126
 [ push: variable apply ] bind: tempgen127
 [ pushf: tempgen114 pushf: tempgen115 pushf: tempgen116 pushf: tempgen117 pushf: tempgen118 pushf: tempgen119 pushf: tempgen120 pushf: tempgen121 pushf: tempgen122 pushf: tempgen123 pushf: tempgen124 pushf: tempgen125 pushf: tempgen126 pushf: tempgen127 ] bind: tempgen128
 [ newfunc0
  pushf: tempgen128 or func_return ] bind: flpcg.rules.non_block_non_infix
 push: string_expr pick: flpcg.rules.string_expr pick: flpcg.rules hashtable.set
 push: f_string_chars_s pick: flpcg.rules.f_string_chars_s pick: flpcg.rules hashtable.set
 push: f_string_chars_d pick: flpcg.rules.f_string_chars_d pick: flpcg.rules hashtable.set
 push: F_QUOTE_S pick: flpcg.rules.F_QUOTE_S pick: flpcg.rules hashtable.set
 push: F_QUOTE_D pick: flpcg.rules.F_QUOTE_D pick: flpcg.rules hashtable.set
 push: F_QUOTE pick: flpcg.rules.F_QUOTE pick: flpcg.rules hashtable.set
 push: f_triple_quote_s pick: flpcg.rules.f_triple_quote_s pick: flpcg.rules hashtable.set
 push: f_triple_quote_d pick: flpcg.rules.f_triple_quote_d pick: flpcg.rules hashtable.set
 push: F_TRIPLE_QUOTE_S pick: flpcg.rules.F_TRIPLE_QUOTE_S pick: flpcg.rules hashtable.set
 push: F_TRIPLE_QUOTE_D pick: flpcg.rules.F_TRIPLE_QUOTE_D pick: flpcg.rules hashtable.set
 push: F_TRIPLE_QUOTE pick: flpcg.rules.F_TRIPLE_QUOTE pick: flpcg.rules hashtable.set
 push: non_block_non_infix pick: flpcg.rules.non_block_non_infix pick: flpcg.rules hashtable.set