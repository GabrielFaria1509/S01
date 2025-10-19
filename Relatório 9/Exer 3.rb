#classe base
class MicroondasUnidade
  attr_accessor :marca, :modelo, :cor, :preco, :potencia, :voltagem  #dados base de cada unidade
  def initialize(marca, modelo, cor, preco, potencia, voltagem)
    @marca = marca
    @modelo = modelo
    @cor = cor
    @preco = preco
    @potencia = potencia
    @voltagem = voltagem
  end
end

##classe filha Agregação
class DMail < MicroondasUnidade
  attr_accessor :conteudo, :hora
  
  def initialize(marca, modelo, cor, preco, potencia, voltagem, conteudo, hora)
    super(marca, modelo, cor, preco, potencia, voltagem)
    @conteudo = conteudo
    @hora = hora
  end
  
  def enviar_email
    puts "Enviando email: #{@conteudo} às #{@hora}"
  end
end

class TelefoneDeMicroondas < MicroondasUnidade
  attr_accessor :numero, :dmails
  
  def initialize(marca, modelo, cor, preco, potencia, voltagem, numero)
    super(marca, modelo, cor, preco, potencia, voltagem)
    @numero = numero
    @dmails = []
  end
  
  def adicionar_dmail(dmail)
    @dmails << dmail
  end
  
  def listar_dmails_a_partir_de(hora_limite)
    @dmails.select { |dmail| dmail.hora >= hora_limite }
  end
end


##Main
puts "Digite quantos emails serão elaborados:"
quantidade = gets.chomp.to_i

# Criando telefone de microondas
telefone = TelefoneDeMicroondas.new("LG", "LG123", "Preto", 1000, 1000, 220, "123456789")

# Adicionando emails
for i in 1..quantidade
  puts "Digite o conteúdo do email #{i}:"
  conteudo = gets.chomp
  puts "Digite a hora do email #{i} (formato HH:MM):"
  hora = gets.chomp
  
  dmail = DMail.new("LG", "LG123", "Preto", 1000, 1000, 220, conteudo, hora)
  telefone.adicionar_dmail(dmail)
end

puts "A partir de qual horário vai ser analisado os emails? (formato HH:MM)"
hora_limite = gets.chomp

emails_filtrados = telefone.listar_dmails_a_partir_de(hora_limite)

if emails_filtrados.empty? ##validaçào horário
  puts "Nenhum email encontrado a partir de #{hora_limite}"
else
  puts "Listando emails a partir de #{hora_limite}:"
  emails_filtrados.each { |dmail| dmail.enviar_email }
  puts "Total de emails analisados: #{emails_filtrados.length}"
end


