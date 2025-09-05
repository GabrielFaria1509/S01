10 PRINT "=== JOGO DE ADIVINHACAO ==="
20 PRINT "Tente adivinhar o numero entre 0 e 100!"
30 LET num2 = RND(100)
40 INPUT "Digite um numero:",num
60 IF num > num2 THEN PRINT "O numero eh menor": GOTO 40
70 IF num < num2 THEN PRINT "O numero eh maior": GOTO 40
80 IF num == num2 THEN PRINT "Acertou !"
90 END
