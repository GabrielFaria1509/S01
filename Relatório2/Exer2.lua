local vetor = {}
local x
local maior
print("Digite os valores do vetor, para finalizar digite uma letra")
while io.read("*n") do
    --inserção dos valores no vetor
    x = io.read("*n")
    table.insert(vetor,x)
end

maior = vetor[1]
--percorrer vetor e devolver o maior valor
for i = 1,#vetor,1 do
    if vetor[i] > maior then
        maior = vetor[i]
    end
end

print("O maior valor: " .. maior)
