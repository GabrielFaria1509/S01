##atributos encapsulados nome e precobase
class Drink
    attr_reader :name  ##somente leituea
    
    def initialize(name, price)
        @name = name
        @price = price
    end

    ##getter e setter explicíto pora preço base
    def price  ##getter
        @price
    end

    def price=(new_price) ##setter
        @price = new_price if new_price.is_a?(Numeric) && new_price > 0 
    end

    def to_s
        "Nome: #{@name}, Preço: #{@price}"
    end
end

##subclasse 
class DrinkLenda < Drink
    ##adiciona novo atributo(anos desde a criação)
    attr_accessor :years ##getter e setter

    def initialize(name, price, years)    
        super(name, price)
        @years = years
    end

    ##metódo preço final adiciona 5 por ano de criação
    def price_final
        @price + (@years * 5)
    end

    def to_s
        "Nome: #{@name}, Preço Base: #{@price}, Anos: #{@years}, Preço Final: #{price_final}"
    end
end

##Main

puts("Insira o nome da bebida desejada : ")  ##entrada de dados
nome = gets.chomp

puts("Insira o preço base : ")
price = gets.chomp.to_f ##converte para float

puts("Deseja uma bebida lenda ou comum ? ")
tipo = gets.chomp
if tipo == "lenda"       ##análise qual bebida
    puts("Insira os anos desde a criação : ")
    years = gets.chomp.to_i   ##converte para inteiro
end

puts("Exibindo dados...")
if tipo == "lenda"
    drink = DrinkLenda.new(nome, price, years)  ##criando instância
    puts(drink)
else
    drink = Drink.new(nome, price)
    puts(drink)
end
    



    



    
