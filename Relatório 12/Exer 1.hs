-- Definições de Tipos (Data)
-- Um tipo Bebida com nome, tipo e preço
data Bebida = Bebida {nome::String, tipo::String, preco::Double}
    deriving(Show)
    
-- Um tipo enumerado para o Status do Pedido.
data StatusPedido = Aberto | Entregue | Cancelado
    deriving(Show, Eq) -- 'Eq' é necessário para usar '==' em Guards.

-- Um tipo Pedido que contém uma lista de bebidas e um status
data Pedido = Pedido {bebidas::[Bebida], status::StatusPedido}
    deriving(Show)

--- Funções Auxiliares ---

-- Função para extrair o preço de uma Bebida, usada no map/sum.
precoBebida :: Bebida -> Double
precoBebida (Bebida _ _ p) = p

--- Funções Solicitadas ---

-- Implementa a função valorTotalPedido, que soma os preços e aplica a lógica de taxa/cancelamento
-- Usa Guards para a lógica condicional, seguindo o estilo funcional.
valorTotalPedido :: Pedido -> Double
valorTotalPedido pedido
    -- Se o pedido estiver Cancelado, o valor deve ser 0
    | status pedido == Cancelado = 0.00 
    -- Caso contrário (Aberto ou Entregue), soma o total das bebidas e adiciona a taxa de R$5,00
    | otherwise                  = sum (map precoBebida (bebidas pedido)) + 5.00

-- Faz a função primeiraBebida :: Pedido -> String[cite: 68].
-- Usa Pattern Matching e 'case' para inspecionar a lista.
primeiraBebida :: Pedido -> String
primeiraBebida pedido =
    case bebidas pedido of
      -- Retorna mensagem caso a lista esteja vazia
      []    -> "Lista de pedidos vazia" 
      -- Retorna o nome da primeira bebida (x)
      (x:_) -> nome x

--- Demonstração (Main) ---

main :: IO ()
main = do
    -- Exemplos de Bebidas
    let cafe    = Bebida "Cafe" "Cafe" 3.50
    let cha     = Bebida "Cha de Limao" "Cha" 4.00
    let suco    = Bebida "Suco de Laranja" "Suco" 6.50

    -- Exemplos de Pedidos
    let pAberto = Pedido [cafe, cha] Aberto
    let pCancelado = Pedido [cafe, suco] Cancelado
    let pVazio  = Pedido [] Entregue

    putStrLn "Questão 1 (Café Leblanc) ☕"
    putStrLn "---------------------------------------------"

    putStrLn $ "Pedido Aberto (Itens: Cafe, Cha)" 
    putStrLn $ "  - Primeira Bebida: " ++ (primeiraBebida pAberto)
    -- Total: (3.50 + 4.00) + 5.00 = 12.50
    putStrLn $ "  - Valor Total: R$" ++ (show $ valorTotalPedido pAberto) 

    putStrLn "\nPedido Cancelado (Ignora itens/taxa)"
    putStrLn $ "  - Primeira Bebida: " ++ (primeiraBebida pCancelado)
    -- Total: 0.00
    putStrLn $ "  - Valor Total: R$" ++ (show $ valorTotalPedido pCancelado) 

    putStrLn "\nPedido Vazio (Status Entregue)"
    putStrLn $ "  - Primeira Bebida: " ++ (primeiraBebida pVazio)
    -- Total: 0.00 (itens) + 5.00 (taxa) = 5.00
    putStrLn $ "  - Valor Total: R$" ++ (show $ valorTotalPedido pVazio)
