local vetor = {}
local x
local pares = {}
print("Digite os valores do vetor, para finalizar digite uma letra")
while true do
    --inserção dos valores no vetor
    x = io.read("*n")
    if not x then break end
    table.insert(vetor,x)
end


--percorrer vetor e achar os pares
for i = 1,#vetor,1 do
    if vetor[i]%2 == 0 then
        table.insert(pares, vetor[i])
    end
end

--print vetor pares
io.write("pares: ")
for i = 1,#pares,1 do
    io.write(pares[i])
    if i < #pares then
        io.write(",")
    end
end
print()
