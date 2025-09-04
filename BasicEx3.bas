10 INPUT "Digite uma temperatura em Celsius : "; CEL$
20 LET Kelvin = VAL(CEL$) + 273
30 LET Fah = (VAL(CEL$) * 1.8) + 32
40 PRINT "Celsius : ", CEL$
50 PRINT "Kelvin : ", Kelvin
60 PRINT "Fahrenheit : ", Fah
70 END
