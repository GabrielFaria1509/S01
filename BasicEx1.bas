10 INPUT "Coloque a primeira nota : "; NP1$
20 INPUT "Coloque a segunda nota : "; NP2$
30 LET soma = VAL(NP1$) + VAL(NP2$)
40 LET media = soma / 2
50 IF media >= 60 THEN PRINT "Aprovado direto"
51 IF media >= 60 THEN END
60 IF media < 30 THEN PRINT "Reprovado direto"
61 IF media < 30 THEN END
70 INPUT "Insira nova nota : "; NP3$
80 LET media_nova = (media + VAL(NP3$)) / 2
90 IF media_nova >= 50 THEN PRINT "Aprovado pela NP3"
  91 END
93 IF media_nova < 50 THEN GOTO 100
100 PRINT "Reprovado na NP3"
110 END
