10 INPUT "Digite seu peso : "; peso$
20 INPUT "Digite sua altura : "; altura$
30 LET imc = VAL(peso$) / (VAL(altura$) * VAL(altura$))
40 PRINT "O seu IMC é : ", imc
70 END
