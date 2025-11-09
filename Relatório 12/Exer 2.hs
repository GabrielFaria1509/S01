-- =========================================================================
-- =========================================================================

-- ** 1. Tipos Personalizados (data) **

-- Tipo que representa um item
data Item = Item { nome :: String, categoria :: String, preco :: Double }
    deriving (Show) -- permite exibir o valor no terminal

-- Tipo que representa uma compra de Link (CompraZelda)
data CompraZelda = CompraZelda { itensComprados :: [Item] }
    deriving (Show)

-- ** 2. Funções Puras (Auxiliares) **

-- Retorna o preço de um item (função pura)
precoItem :: Item -> Double
precoItem (Item _ _ p) = p -- usa pattern matching e ignora campos

-- Soma todos os preços de uma lista de itens (subtotal ou total bruto)
calculaTotalItens :: CompraZelda -> Double
calculaTotalItens compra = sum (map precoItem (itensComprados compra))
-- map aplica precoItem em cada item, e sum soma os resultados

-- ** 3. Condicional com Guards para Desconto **

-- Cria uma função calculaDesconto :: CompraZelda -> Double que retorna o VALOR do desconto (10%)
calculaDesconto :: CompraZelda -> Double
calculaDesconto compra
    -- Se o total for acima de 200, retorna 10% do total.
    | calculaTotalItens compra > 200.0 = calculaTotalItens compra * 0.10
    -- Caso contrário, o desconto é zero.
    | otherwise                        = 0.0

-- ** 4. Função principal de cálculo do valor final **

-- Usa Guards para aplicar o desconto (se > 200) ou o frete fixo (se <= 200).
valorFinal :: CompraZelda -> Double
valorFinal compra
    -- Se o total bruto for maior que 200, aplica o desconto (Total - Desconto)
    | calculaTotalItens compra > 200.0 = calculaTotalItens compra - calculaDesconto compra
    -- Caso contrário (total <= 200), adiciona o frete fixo de 15.0
    | otherwise                        = calculaTotalItens compra + 15.0

-- ** 5. Exemplos de dados **

itemA = Item "MasterSword" "Arma" 200.0
itemB = Item "Pocao Cura" "Poção" 50.0
itemC = Item "Flechas" "Equipamento" 10.0

-- Cria três compras diferentes
-- Total: 250.0. Aplica DESCONTO: 250.0 - 25.0 = 225.0
compra1 = CompraZelda [itemA, itemB]
-- Total: 60.0. Aplica FRETE: 60.0 + 15.0 = 75.0
compra2 = CompraZelda [itemB, itemC]
-- Total: 200.0. Aplica FRETE: 200.0 + 15.0 = 215.0 (o requisito é menor OU IGUAL a 200)
compra3 = CompraZelda [itemA, itemB, itemC] -- Adicionando mais um item para teste

-- ** 6. Função Principal (IO) **

main :: IO ()
main = do
    putStrLn "--- Simulação de Compras nas Lojas de Hyrule ---"
    
    putStrLn "\n--- Compra 1: Total Bruto 250.0 (DESCONTO) ---"
    putStr "Valor Total: R$ "
    print (valorFinal compra1)
    putStr "Desconto Aplicado: R$ "
    print (calculaDesconto compra1)

    putStrLn "\n--- Compra 2: Total Bruto 60.0 (FRETE) ---"
    putStr "Valor Total: R$ "
    print (valorFinal compra2)
    putStr "Frete Fixo: R$ 15.0"

    putStrLn "\n--- Compra 3: Total Bruto 260.0 (DESCONTO) ---"
    putStr "Valor Total: R$ "
    print (valorFinal (CompraZelda [itemA, itemB, itemC]))
