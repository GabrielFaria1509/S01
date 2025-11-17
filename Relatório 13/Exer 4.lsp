;; 1. Estrutura
;; Define a estrutura 'ocorrencia' com os campos
(defstruct ocorrencia
  nome
  ritual
  nivel-medo
  agentes-enviados) ; Este campo sera uma lista de nomes

;; 2. Funcao Recursiva: soma-medo-recursiva
;; Retorna a soma total do campo nivel-medo de todas as ocorrencias
(defun soma-medo-recursiva (lista-ocorrencias)
  (if (null lista-ocorrencias)
      ;; Caso Base: Se a lista esta vazia, a soma e 0.
      0
      ;; Caso Recursivo: Soma o nivel-medo do primeiro item (car)
      ;; com a soma do resto da lista (cdr).
      (+ (ocorrencia-nivel-medo (car lista-ocorrencias))
         (soma-medo-recursiva (cdr lista-ocorrencias)))))

;; Teste Final: Criar a lista de ocorrencias (Feito antes da Funcao 3 para testes)
(defparameter *lista-missoes*
  (list
   (make-ocorrencia :nome "Sussurros na Praca"
                    :ritual "Nenhum"
                    :nivel-medo 10
                    :agentes-enviados (list "Cesar" "Liz"))
   
   (make-ocorrencia :nome "Manuscrito Espiral"
                    :ritual "Presente"
                    :nivel-medo 50
                    :agentes-enviados (list "Arthur" "Dante" "Joui" "Kaiser"))
   
   (make-ocorrencia :nome "Eco do Passado"
                    :ritual "Presente"
                    :nivel-medo 20
                    :agentes-enviados (list "Gal" "Tristan" "Erin" "Milo" "Luciano"))
   
   (make-ocorrencia :nome "Ameaca Abissal"
                    :ritual "Nenhum"
                    :nivel-medo 100
                    :agentes-enviados (list "Damir" "Amelie" "Balu"))
   ))

;; 3. Funcao de Alto Nivel (Composicao e Local Scope)
(defun analise-final (lista-ocorrencias)
  ;; 'let*' e usado para que 'media-medo' possa usar 'soma-total' e 'total-itens'
  (let* (
         ;; a. Calcula Media (em escopo local)
         (soma-total (soma-medo-recursiva lista-ocorrencias))
         (total-itens (length lista-ocorrencias))
         
         ;; Garante divisao com ponto flutuante (float)
         (media-medo (if (> total-itens 0) 
                         (/ (float soma-total) total-itens)
                         0))
         
         ;; b. Filtra Ocorrencias Criticas
         (ocorrencias-criticas
           (remove-if-not
            #'(lambda (o)
                (and 
                 ;; Condicao 1: Mais de 3 agentes (length > 3)
                 (> (length (ocorrencia-agentes-enviados o)) 3)
                 ;; Condicao 2: Nivel-medo acima da media
                 (> (ocorrencia-nivel-medo o) media-medo)))
            lista-ocorrencias))
         )
    
    ;; c. Composicao: Retorna APENAS a lista de nomes das criticas
    (mapcar #'(lambda (o-critica) (ocorrencia-nome o-critica))
            ocorrencias-criticas)))


;; --- Teste Final (Execucao) ---
(format t "--- Gerenciamento de Ocorrencias (Ordem) ---~%~%")
(format t "Missoes Registradas (~a):~%" (length *lista-missoes*))
;(format t "~a~%~%" *lista-missoes*) ; (Opcional: Descomente para ver a lista inteira)

(format t "Calculando Media de Medo...~%")
(format t "  Soma Total: ~a~%" (soma-medo-recursiva *lista-missoes*))
(format t "  Media: ~a~%~%" (/ (float (soma-medo-recursiva *lista-missoes*)) (length *lista-missoes*)))

(format t "Funcao 3: Analise Final (Ocorrencias Criticas):~%")
(format t "~a~%" (analise-final *lista-missoes*))
