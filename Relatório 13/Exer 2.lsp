;; 1. Definicao da Estrutura
;; Define a estrutura 'criatura' com os campos
(defstruct criatura
  nome
  ambiente
  periculosidade
  vida-media)

;; 2. Catalogo Inicial
;; Cria uma lista (catalogo) com pelo menos 4 criaturas
(defparameter *catalogo*
  (list
   ;; Um peixe Safe Shallows (Periculosidade Baixa).
   (make-criatura :nome "Peeper"
                  :ambiente "Safe Shallows"
                  :periculosidade "Baixa"
                  :vida-media 10)
   
   ;; Um Reaper Leviathan (Periculosidade Alta).
   (make-criatura :nome "Reaper Leviathan"
                  :ambiente "Dunes"
                  :periculosidade "Alta"
                  :vida-media 100)
   
   ;; Duas criaturas quaisquer com ambiente Deep.
   (make-criatura :nome "Ghost Leviathan"
                  :ambiente "Deep"
                  :periculosidade "Alta"
                  :vida-media 150)
   
   (make-criatura :nome "Ampeel"
                  :ambiente "Deep"
                  :periculosidade "Media"
                  :vida-media 50)))

;; 3. HOF: Filtro de Perigo
;; Funcao que retorna apenas criaturas cuja periculosidade NAO seja "Baixa".
;; Usamos 'remove-if' para remover os itens onde o predicado (teste) e verdadeiro.
(defun filtra-por-perigo (catalogo-lista)
  (remove-if
   #'(lambda (c)
       (string= (criatura-periculosidade c) "Baixa"))
   catalogo-lista))

;; 4. Mapeamento de Informacoes
;; Retorna uma lista de strings "[NOME]: Vive em [AMBIENTE]"
;; Apenas para criaturas do ambiente "Deep".
(defun relatorio-profundidade (catalogo-lista)
  
  ;; Dica: Voce pode usar o filtro antes de mapear
  
  ;; 4a. Filtrar primeiro para pegar apenas criaturas "Deep"
  ;; Usamos 'remove-if-not' para MANTER os itens onde o predicado e verdadeiro.
  (let ((criaturas-deep
          (remove-if-not
           #'(lambda (c)
               (string= (criatura-ambiente c) "Deep"))
           catalogo-lista)))
    
    ;; 4b. Mapear o resultado do filtro para o formato de string
    (mapcar
     #'(lambda (c)
         (format nil "~a: Vive em ~a"
                 (criatura-nome c)
                 (criatura-ambiente c)))
     criaturas-deep)))

;; --- Testes (como pedido no exercicio) ---
(format t "--- Catalogo de Fauna: Testes ---~%~%")

(format t "Catalogo Completo:~%")
(format t "~a~%~%" *catalogo*)

(format t "Funcao 3: Filtro de Perigo (sem 'Baixa'):~%")
(format t "~a~%~%" (filtra-por-perigo *catalogo*))

(format t "Funcao 4: Relatorio de Profundidade (ambiente 'Deep'):~%")
(format t "~a~%~%" (relatorio-profundidade *catalogo*))
