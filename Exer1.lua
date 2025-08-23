local function multiplos(m,n,x)   -- x valor base , n  até m é o intervalo
    --quero achar os múltiplos de x
    --incluindo n,m
    local i = m;
    while i<= n do
        if i%x == 0 then
            print(i)
        end
        i = i + 1
    end
    print("Fim da busca por múltiplos.")
end

local x;
local n;
local m;
--solicita ao usuario os valores de n, m e x
print("Digite o valor de n: ");
n = io.read("*n")
print("Digite o valor de m: ");
m = io.read("*n")
print("Digite o valor de x: ");
x = io.read("*n")

multiplos(m,n,x);

