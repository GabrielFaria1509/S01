##classe base
class Musico
  attr_accessor :nome, :instrumento  ##getter e setter
  
  def initialize(nome, instrumento)
    @nome = nome
    @instrumento = instrumento
  end

  ##Força implementação nas classes filhas(Abstração por contrato)
  def tocar_partitura(peca)
    raise NotImplementedError, "Método deve ser implementado na subclasse"
  end
  
  def tocar
    puts "Tocando #{@instrumento}"
  end
end
    

class Pianista < Musico ##deve sobreescrever tocar partitura
  def tocar_partitura(peca)
    puts "Tocando partitura de piano: #{peca}"
  end
end

class Violinista < Musico
  def tocar_partitura(peca)
    puts "Tocando partitura de violino: #{peca}"
  end
end

##recebe a peca e usa array.each na lista de músicos para chamar método polimórfico
class Maestro
  attr_accessor :nome
  
  def initialize(nome)
    @nome = nome
  end
  
  def iniciar_ensaio(peca, musicos)
    puts "Iniciando ensaio da peça: #{peca}"
    musicos.each do |musico|
      musico.tocar_partitura(peca)
    end
  end
  
  def mudar_foco(musicos, estado)
    musicos.map do |musico|
      "#{musico.nome} está #{estado}"
    end
  end
end

##MAIN

puts "Qual o nome da peça a ser tocada?"
peca = gets.chomp
puts "Quantos músicos há presentes?"
num = gets.chomp.to_i

##lista de músicos
musicos = []

num.times do |i| ##loop para adicionar músicos
  puts "Músico #{i+1} - Digite o nome:"
  nome = gets.chomp
  puts "Digite o tipo (pianista/violinista):"
  tipo = gets.chomp.downcase
  
  if tipo == "pianista"     ##separação das funções
    musicos << Pianista.new(nome, "piano")
  elsif tipo == "violinista"
    musicos << Violinista.new(nome, "violino")
  end
end

##criando maestro e iniciando ensaio
puts "Digite o nome do maestro:"
nome_maestro = gets.chomp
maestro = Maestro.new(nome_maestro)

maestro.iniciar_ensaio(peca, musicos)

##testando mudança de foco
foco_mensagens = maestro.mudar_foco(musicos, "concentrado")
foco_mensagens.each { |msg| puts msg }

