;; 1. Funcao Pura: calcula-dosagem
;; Recebe peso (kg) e idade (anos) e retorna a dosagem em ml.
(defun calcula-dosagem (peso-kg idade-anos)
  (cond
    ;; Se a idade for menor que 5 OU o peso for menor que 20kg, a dosagem e 10ml.
    ((or (< idade-anos 5) (< peso-kg 20))
     10)
    
    ;; Se a idade for entre 5 e 12 (inclusive) E o peso for maior ou igual a 20kg, a dosagem e 25ml.
    ((and (>= idade-anos 5) (<= idade-anos 12) (>= peso-kg 20))
     25)
    
    ;; Caso contrario, a dosagem e 50ml.
    (t 50)))

;; 2. Funcao Pura: ajusta-preco
;; Recebe o preco base e o nome da erva, e retorna o preco ajustado.
(defun ajusta-preco (preco-base nome-da-erva)
  (cond
    ;; Se o nome for "Ginseng", multiplica o preco por 3.0.
    ((string= nome-da-erva "Ginseng")
     (* preco-base 3.0))
    
    ;; Se o nome for "Lotus", multiplica o preco por 1.5.
    ((string= nome-da-erva "Lotus")
     (* preco-base 1.5))
    
    ;; Caso contrario, retorna o preco-base.
    (t preco-base)))

;; 3. Calcule o preco final e teste os outros casos
(format t "--- Farmacia da Maomao: Testes ---~%")

;; Caso principal do exercicio: Paciente de 14 anos e 60kg.
(format t "Caso 1 (Paciente: 14 anos, 60kg):~%")
(format t "  Dosagem: ~a ml~%" (calcula-dosagem 60 14))
(format t "  Preco (Lotus, base 10): ~a moedas~%" (ajusta-preco 10 "Lotus"))

(format t "------------------------------------~%")

;; Outros casos de teste para mostrar as regras:

;; Teste Dosagem (Regra 1: Menor que 5 anos)
(format t "Caso 2 (Paciente: 4 anos, 18kg):~%")
(format t "  Dosagem: ~a ml~%" (calcula-dosagem 18 4))

;; Teste Dosagem (Regra 1: Menor que 20kg)
(format t "Caso 3 (Paciente: 8 anos, 19kg):~%")
(format t "  Dosagem: ~a ml~%" (calcula-dosagem 19 8))

;; Teste Dosagem (Regra 2: Entre 5-12 anos e >= 20kg)
(format t "Caso 4 (Paciente: 10 anos, 25kg):~%")
(format t "  Dosagem: ~a ml~%" (calcula-dosagem 25 10))

;; Teste Preco (Regra 1: Ginseng)
(format t "Caso 5 (Preco Erva):~%")
(format t "  Preco (Ginseng, base 10): ~a moedas~%" (ajusta-preco 10 "Ginseng"))

;; Teste Preco (Regra 3: Erva comum)
(format t "Caso 6 (Preco Erva):~%")
(format t "  Preco (Camomila, base 10): ~a moedas~%" (ajusta-preco 10 "Camomila"))
