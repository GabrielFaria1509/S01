from abc import ABC, abstractmethod 

##classe base personagem
class Personagem(ABC):
    ##vida e resistencia atributos privados
    ##método construtor
    def __init__(self, vida: int, resistencia: int):
        self.__vida = vida       ##duas underlines indica que o atributo é privado
        self.__resistencia = resistencia

##uso de getters e seters para controladores para a vida 
    def get_vida(self) -> int:
        return self.__vida

    def set_vida(self, nova_vida: int):
        if nova_vida >= 0:       ##tratamento para vida negativa
            self.__vida = nova_vida
        else:
            self.__vida = 0

    def get_resistencia(self):
        return self.__resistencia

    def set_resistencia(self, nova_resistencia):
        if nova_resistencia >= 0:  ##tratamento para resistencia negativa
            self.__resistencia = nova_resistencia
        else:
            self.__resistencia = 0

    ##método str padrão
    def __str__(self):
        return f'Personagem com {self.__vida} de vida e {self.__resistencia} de resistência.'
    
    ##método abstrato obrigatório para classes filhas implementarem
    @abstractmethod
    def atacar(self):
        pass

    
##classe filha de personagem
class Cavaleiro(Personagem):
    ##atributo exclusivo booleano
    armadura_pesada = True

    ##implementação obrigatória do método abstrato
    def atacar(self):
        return "O cavaleiro ataca com sua espada!"

    ##método str (Ex:Personagem com 100 de vida)
    def __str__(self):
        return f'Personagem com {self.get_vida()} de vida'
    
    ##método para sinalizar que o personagem é um cavaleiro e tem armadura pesada
    def info_cavaleiro(self):
        if self.armadura_pesada:
            return "Este personagem é um cavaleiro e possui armadura pesada."
        else:
            return "Este personagem é um cavaleiro, mas não possui armadura pesada."

##teste das classes
if __name__ == "__main__":          ##parte de teste // principal

    print("Começando criação do personagem...\n")

    ##criando um cavaleiro
    cavaleiro1 = Cavaleiro(100, 50)
    
    ##testando os métodos
    print(cavaleiro1)
    print(cavaleiro1.atacar())
    print(cavaleiro1.info_cavaleiro())
