local function operacao(x,y,op)
    if op == "+" then
        return x + y
    end
    if op == "-" then
        return x - y
    end
    if op == "*" then
        return x * y
    end
    if op == "/" then
        return x / y
    end
    return "Insira um operador que exista"
end

local x;
local y;
local op;
x = tonumber(io.read("*l"));
y = tonumber(io.read("*l"));
op = io.read("*l");
local resultado = operacao(x,y,op);
print(resultado);
