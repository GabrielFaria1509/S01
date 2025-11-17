;; 1. Estrutura e Catalogo
(defstruct item
  nome
  tipo
  preco
  forca-magica)

;; Catalogo inicial com Arma, Pocao e Artefato
(defparameter *catalogo*
  (list
   (make-item :nome "Lamina Amaldicoada"
              :tipo "Arma"
              :preco 100
              :forca-magica 90) ; Forca > 80 para testar bonus
   (make-item :nome "Adaga Comum"
              :tipo "Arma"
              :preco 20
              :forca-magica 50) ; Forca < 80
   (make-item :nome "Pocao de Mana"
              :tipo "Pocao"
              :preco 15
              :forca-magica 0)
   (make-item :nome "Orbe do Poder"
              :tipo "Artefato"
              :preco 300
              :forca-magica 150)))

;; 2. Funcoes de Transformacao

;; Aumenta o preco em 15%
(defun adiciona-imposto (preco)
  (* preco 1.15))

;; Retorna forca * 1.5 se a forca-magica for maior que 80
(defun bonus-maldicao (forca)
  (if (> forca 80)
      (* forca 1.5)
      forca))

;; 3. Funcao de Venda (Pipeline)
;; Executa a ordem: a. Filtra, b. Transforma (Preco), c. Transforma (Forca)
(defun processa-venda (catalogo-lista)
  
  (let* (
         ;; a. Filtra: Mantem apenas os itens do tipo "Arma"
         (passo-a-filtro
           (remove-if-not #'(lambda (it) (string= (item-tipo it) "Arma"))
                          catalogo-lista))
         
         ;; b. Transforma (1): Aumenta o preco de cada arma (usando mapcar e lambda)
         ;; (Esta etapa cria uma nova lista de itens com precos atualizados)
         (passo-b-imposto
           (mapcar #'(lambda (arma)
                       ;; Cria uma copia do item com o preco novo
                       (make-item :nome (item-nome arma)
                                  :tipo (item-tipo arma)
                                  :preco (adiciona-imposto (item-preco arma))
                                  ;; Importante: mantem a forca-magica original
                                  :forca-magica (item-forca-magica arma))) 
                   passo-a-filtro))

         ;; c. Transforma (2): Retorna nome e novo valor de forca-magica
         ;; (Mapeia a lista do passo B, mas aplica o bonus na forca-magica original)
         (passo-c-relatorio
           (mapcar #'(lambda (arma-com-imposto)
                       (list (item-nome arma-com-imposto)
                             (bonus-maldicao (item-forca-magica arma-com-imposto))))
                   passo-b-imposto))
         )
    
    ;; Retorna o resultado final do passo C
    passo-c-relatorio))

;; --- Testes ---
(format t "--- A Loja de Iwai: Testes ---~%~%")

(format t "Catalogo Completo:~%")
(format t "~a~%~%" *catalogo*)

(format t "Funcao 3: Processa Venda (Resultado Final):~%")
(format t "(Lista de [Nome, Forca com Bonus])~%")
(format t "~a~%~%" (processa-venda *catalogo*))
