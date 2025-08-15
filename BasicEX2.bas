10 PRINT "=== JOGO DE ADIVINHACAO ==="
20 PRINT "Tente adivinhar o numero entre 0 e 100!"
30 LET num2 = INT(RND*101)
40 PRINT "Digite um numero:"
50 INPUT num
60 IF num > num2 THEN PRINT "O número é menor": GOTO 50
70 IF num < num2 THEN PRINT "O número é maior": GOTO 50
80 PRINT "Parabéns! Você acertou! O número era "; num2
90 END
