
 [ push: + token ] bind: tempgen0
 [ push: - token ] bind: tempgen1
 [ push: / token ] bind: tempgen2
 [ push: == token ] bind: tempgen3
 [ push: < token ] bind: tempgen4
 [ push: > token ] bind: tempgen5
 [ push: . token ] bind: tempgen6
 [ push: in token ] bind: tempgen7
 [ push: || token ] bind: tempgen8
 [ push: && token ] bind: tempgen9
 [ push: ! token ] bind: tempgen10
 [ pushf: tempgen0 pushf: tempgen1 pushf: tempgen2 pushf: tempgen3 pushf: tempgen4 pushf: tempgen5 pushf: tempgen6 pushf: tempgen7 pushf: tempgen8 pushf: tempgen9 pushf: tempgen10 ] bind: tempgen11
 [ newfunc0
  pushf: tempgen11 or func_return ] bind: flpcg.rules.bin_op
 push: bin_op pick: flpcg.rules.bin_op pick: flpcg.rules hashtable.set