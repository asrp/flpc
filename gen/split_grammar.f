
 [ push: \s exactly ] bind: split_grammar_gen0
 [ push: \t exactly ] bind: split_grammar_gen1
 [ pushf: split_grammar_gen0 pushf: split_grammar_gen1 ] bind: split_grammar_gen2
 [ newfunc0
  pushf: split_grammar_gen2 or return1 ] bind: splitg.rules.hspace
 [ push: \n exactly ] bind: split_grammar_gen3
 [ push: \r exactly ] bind: split_grammar_gen4
 [ push: hspace apply ] bind: split_grammar_gen5
 [ pushf: split_grammar_gen3 pushf: split_grammar_gen4 pushf: split_grammar_gen5 ] bind: split_grammar_gen6
 [ newfunc0
  pushf: split_grammar_gen6 or return1 ] bind: splitg.rules.space
 [ push: space apply ] bind: split_grammar_gen7
 [ newfunc0
  pushf: split_grammar_gen7 push: * quantified return1 ] bind: splitg.rules.spaces
 [ push: space apply ] bind: split_grammar_gen8
 [ pushf: split_grammar_gen8 negation ] bind: split_grammar_gen9
 [ push: anything apply ] bind: split_grammar_gen10
 [ pushf: split_grammar_gen9 pushf: split_grammar_gen10 ] bind: split_grammar_gen11
 [ pushf: split_grammar_gen11 and ] bind: split_grammar_gen12
 [ newfunc0
  pushf: split_grammar_gen12 push: + quantified return1 ] bind: splitg.rules.token
 [ push: spaces apply ] bind: split_grammar_gen13
 [ push: token apply ] bind: split_grammar_gen14
 [ pushf: split_grammar_gen14 out ] bind: split_grammar_gen15
 [ push: space apply ] bind: split_grammar_gen16
 [ push: spaces apply ] bind: split_grammar_gen17
 [ push: token apply ] bind: split_grammar_gen18
 [ pushf: split_grammar_gen18 out ] bind: split_grammar_gen19
 [ pushf: split_grammar_gen16 pushf: split_grammar_gen17 pushf: split_grammar_gen19 ] bind: split_grammar_gen20
 [ pushf: split_grammar_gen20 and ] bind: split_grammar_gen21
 [ pushf: split_grammar_gen21 push: * quantified ] bind: split_grammar_gen22
 [ pushf: split_grammar_gen22 out ] bind: split_grammar_gen23
 [ pushf: split_grammar_gen15 pushf: split_grammar_gen23 ] bind: split_grammar_gen24
 [ pushf: split_grammar_gen24 and ] bind: split_grammar_gen25
 [ pushf: split_grammar_gen25 push: ? quantified ] bind: split_grammar_gen26
 [ pushf: split_grammar_gen26 out ] bind: split_grammar_gen27
 [ push: spaces apply ] bind: split_grammar_gen28
 [ pushf: split_grammar_gen13 pushf: split_grammar_gen27 pushf: split_grammar_gen28 ] bind: split_grammar_gen29
 [ newfunc0
  pushf: split_grammar_gen29 and return1 ] bind: splitg.rules.grammar
 pushi: 20 hashtable bind: splitg.rules
 0 resizable bind: splitg.flagged
 push: hspace pick: splitg.rules.hspace pick: splitg.rules hashtable.set
 push: space pick: splitg.rules.space pick: splitg.rules hashtable.set
 push: spaces pick: splitg.rules.spaces pick: splitg.rules hashtable.set
 push: token pick: splitg.rules.token pick: splitg.rules hashtable.set
 push: token pick: splitg.flagged attr_call: append
 push: grammar pick: splitg.rules.grammar pick: splitg.rules hashtable.set
 pick: splitg.rules add_base_rules
 pick: splitg.rules add_escaped_char_rules
 0 resizable bind: splitg.base
 push: add_base_rules pick: splitg.base attr_call: append
 push: add_escaped_char_rules pick: splitg.base attr_call: append
 0 resizable bind: splitg
 push: splitg pick: splitg attr_call: append
 pick: splitg.rules pick: splitg attr_call: append
 pick: splitg.flagged pick: splitg attr_call: append
 pick: splitg.base pick: splitg attr_call: append