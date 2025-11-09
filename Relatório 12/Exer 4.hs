-- =========================================================================
-- Simulação da Casa de Banhos (Yubaba) usando Haskell
-- Demonstra tipos personalizados, Guards para cálculo de bônus/desconto, e Pattern Matching.
-- =========================================================================

-- ** 1. Tipos Personalizados (data) **

-- Tipo que representa um serviço
data Servico = Servico { nome :: String, tipo :: String, preco :: Double }
    deriving (Show)

-- Tipo enumerado com possíveis status de um Atendimento
data StatusAtendimento = EmAndamento | Finalizado | Cancelado
    deriving (Show, Eq) -- Eq permite comparar com ==

-- Tipo que representa um Atendimento com lista de serviços e status
data Atendimento = Atendimento { servicosRealizados :: [Servico], statusAtendimento :: StatusAtendimento }
    deriving (Show)

-- ** 2. Funções Puras (Auxiliares) **

-- Retorna o preço de um serviço (função pura)
precoServico :: Servico -> Double
precoServico (Servico _ _ p) = p -- usa pattern matching

-- Soma todos os preços de uma lista de serviços (total base)
calculaTotalBase :: Atendimento -> Double
calculaTotalBase atendimento = sum (map precoServico (servicosRealizados atendimento))
-- map aplica precoServico em cada item, e sum soma os resultados

-- Retorna a quantidade de serviços em um atendimento
quantidadeServicos :: Atendimento -> Int
quantidadeServicos atendimento = length (servicosRealizados atendimento)

-- ** 3. Função de Cálculo de Bônus e Desconto **

-- Cria uma função bonusEspiritual :: Atendimento -> Double que retorna o valor final APÓS aplicar
-- Bônus de 25% (se houver > 3 serviços) OU Desconto de 10% (se o total > 500).
bonusEspiritual :: Atendimento -> Double
bonusEspiritual atendimento
    -- Se tiver mais de 3 serviços, aplica bônus de 25% (Total * 1.25)
    | quantidadeServicos atendimento > 3 = calculaTotalBase atendimento * 1.25
    -- Se o total base ultrapassar 500 (e não teve bônus), aplica desconto de 10% (Total * 0.90)
    | calculaTotalBase atendimento > 500.0 = calculaTotalBase atendimento * 0.90
    -- Caso contrário, retorna o total base.
    | otherwise                          = calculaTotalBase atendimento

-- ** 4. Função principal de cálculo do valor final **

-- Implementa valorFinalAtendimento :: Atendimento -> Double.
valorFinalAtendimento :: Atendimento -> Double
valorFinalAtendimento atendimento
    -- Se Cancelado, o valor final é zero.
    | statusAtendimento atendimento == Cancelado = 0.0
    -- Caso contrário, aplica as regras de bônus/desconto calculadas em bonusEspiritual.
    | otherwise                                = bonusEspiritual atendimento

-- ** 5. Uso de Pattern Matching em Listas **

-- Retorna o nome e o tipo do primeiro serviço
descricaoPrimeiroServico :: Atendimento -> String
descricaoPrimeiroServico atendimento =
    case servicosRealizados atendimento of
        []    -> "Nenhum serviço registrado."
        (x:_) -> "Serviço: " ++ nome x ++ ", Tipo: " ++ tipo x

-- ** 6. Exemplos de dados **

sBanho      = Servico "Banho Purificador" "Banho" 150.0
sMassagem   = Servico "Massagem Espectral" "Massagem" 200.0
sBanquete   = Servico "Banquete Flutuante" "Banquete" 250.0
sChas       = Servico "Chá de Ervas" "Banho" 50.0

-- Cria quatro atendimentos diferentes
-- 1. Bônus (5 serviços): Total 700.0 * 1.25 = 875.0
atendimento1 = Atendimento [sBanho, sMassagem, sBanquete, sChas, sChas] Finalizado
-- 2. Desconto (Total 600.0): 600.0 * 0.90 = 540.0
atendimento2 = Atendimento [sBanho, sMassagem, sBanquete] EmAndamento
-- 3. Sem Bônus/Desconto (Total 400.0)
atendimento3 = Atendimento [sMassagem, sBanquete] EmAndamento
-- 4. Cancelado (Valor 0.0)
atendimento4 = Atendimento [sBanho, sMassagem] Cancelado

-- ** 7. Função Principal (IO) **

main :: IO ()
main = do
    putStrLn "--- Simulação de Atendimentos na Casa de Banhos ---"
    
    putStrLn "\n--- Atendimento 1: Bônus de 25% (5 Serviços) ---"
    putStrLn (descricaoPrimeiroServico atendimento1)
    putStr $ "Valor Final: R$ "
    print (valorFinalAtendimento atendimento1)
    
    putStrLn "\n--- Atendimento 2: Desconto de 10% (Total 600) ---"
    putStrLn (descricaoPrimeiroServico atendimento2)
    putStr $ "Valor Final: R$ "
    print (valorFinalAtendimento atendimento2)

    putStrLn "\n--- Atendimento 3: Sem Bônus/Desconto (Total 400) ---"
    putStr $ "Valor Final: R$ "
    print (valorFinalAtendimento atendimento3)
    
    putStrLn "\n--- Atendimento 4: Cancelado ---"
    putStr $ "Valor Final: R$ "
    print (valorFinalAtendimento atendimento4)
