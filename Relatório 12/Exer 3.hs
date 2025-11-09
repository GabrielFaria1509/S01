-- =========================================================================
-- Simulação de um Evento em Casa de Shows usando Haskell
-- Demonstra tipos personalizados, Funções de Alta Ordem, Guards e Pattern Matching.
-- =========================================================================

-- ** 1. Tipos Personalizados (data) **

-- Tipo que representa uma Banda
data Banda = Banda { nomeBanda :: String, genero :: String, cache :: Double }
    deriving (Show)

-- Tipo enumerado com possíveis status de um Evento
data StatusEvento = Ativo | Encerrado | Cancelado
    deriving (Show, Eq) -- Eq permite comparar com ==

-- Tipo que representa um Evento com lista de bandas e status
data Evento = Evento { bandasNoEvento :: [Banda], statusEvento :: StatusEvento }
    deriving (Show)

-- ** 2. Funções Puras (Auxiliares de Cálculo) **

-- Retorna o valor do cachê de uma banda (função pura)
valorCache :: Banda -> Double
valorCache (Banda _ _ c) = c -- usa pattern matching e ignora campos

-- Soma todos os cachês de uma lista de bandas (total bruto)
calculaCacheTotal :: Evento -> Double
calculaCacheTotal evento = sum (map valorCache (bandasNoEvento evento))
-- map aplica valorCache em cada item, e sum soma os resultados

-- ** 3. Condicional com Guards **

-- Calcula a taxa de produção: 20% do cachê total.
-- Usa Guards para a lógica de aplicação da taxa.
calculaTaxaProducao :: Evento -> Double
calculaTaxaProducao evento
    | calculaCacheTotal evento > 0.0 = calculaCacheTotal evento * 0.20 -- 20%
    | otherwise                      = 0.0

-- ** 4. Função principal de cálculo do custo total **

-- Implementa custoTotalEvento :: Evento -> Double.
-- Retorna 0.0 se for Cancelado, ou (Total Cache + 20% Taxa de Produção)
custoTotalEvento :: Evento -> Double
custoTotalEvento evento
    -- Devolvida: valor zero
    | statusEvento evento == Cancelado = 0.0
    -- Caso contrário, soma o cachê total com a taxa de produção
    | otherwise                        = calculaCacheTotal evento + calculaTaxaProducao evento

-- ** 5. Uso de Pattern Matching em Listas **

-- Retorna o nome da primeira banda (abertura)
bandaAbertura :: Evento -> String
bandaAbertura evento =
    case bandasNoEvento evento of
        []    -> "Nenhuma banda escalada para a abertura."
        (x:_) -> nomeBanda x

-- Retorna o nome da última banda (fechamento)
bandaFechamento :: Evento -> String
bandaFechamento evento =
    case reverse (bandasNoEvento evento) of -- Inverte a lista e pega o primeiro item
        []    -> "Nenhuma banda escalada para o fechamento."
        (x:_) -> nomeBanda x

-- ** 6. Exemplos de dados **

bandaRock   = Banda "Linkin Park" "Rock" 450000.0
bandaPunk   = Banda "Fall Out Boy" "Punk Rock" 766660.0
bandaPop    = Banda "Taylor Swift" "Pop" 500000

-- Cria três eventos diferentes

eventoAtivo = Evento [bandaRock, bandaPunk] Ativo

eventoEncerrado = Evento [bandaPunk, bandaPop] Encerrado
-- Cancelado: Valor 0.0
eventoCancelado = Evento [bandaRock, bandaPop] Cancelado

-- ** 7. Função Principal (IO) **

main :: IO ()
main = do
    putStrLn "--- Simulação de Custos de Eventos (Casa de Shows) ---"
    putStrLn "------------------------------------------------------"

    putStrLn "\n--- Evento Ativo ---"
    putStrLn $ "Banda de Abertura: " ++ (bandaAbertura eventoAtivo)
    putStrLn $ "Banda de Fechamento: " ++ (bandaFechamento eventoAtivo)
    putStr $ "Custo Total: R$ "
    print (custoTotalEvento eventoAtivo)

    putStrLn "\n--- Evento Encerrado ---"
    putStrLn $ "Banda de Abertura: " ++ (bandaAbertura eventoEncerrado)
    putStr $ "Custo Total: R$ "
    print (custoTotalEvento eventoEncerrado)

    putStrLn "\n--- Evento Cancelado ---"
    putStr $ "Custo Total (deve ser 0.0): R$ "
    print (custoTotalEvento eventoCancelado)
