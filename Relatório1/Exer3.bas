10 INPUT "Digite uma temperatura em Celsius : ", CEL
20 LET Kelvin = CEL + 273.15
30 LET Fah = (CEL * 1.8 + 32)
40 PRINT USING "##.##"; "Celsius: "; CEL
50 PRINT USING "##.##"; "Kelvin: "; Kelvin
60 PRINT USING "##.##"; "Fahrenheit: "; Fah
70 END
