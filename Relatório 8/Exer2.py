from abc import ABC, abstractmethod

##classe base personagem
class Heroi(ABC):
    ##nome, função e ultimate atributos privados
    def __init__(self, nome: str, funcao: str, ultimate: str = ""):
        self.__nome = nome
        self.__funcao = funcao
        self.__ultimate = ultimate
    
    ##uso de getters e seters para controladores para o nome
    def get_nome(self) -> str:  ##get é para pegar o valor
        return self.__nome

    def set_nome(self, novo_nome: str): ##set é para modificar o valor
        self.__nome = novo_nome

    def get_funcao(self) -> str:
        return self.__funcao

    def set_funcao(self, nova_funcao: str):
        self.__funcao = nova_funcao

    def get_ultimate(self) -> str:
        return self.__ultimate

    def set_ultimate(self, nova_ultimate: str):
        self.__ultimate = nova_ultimate

    ##método usar ultimate , classes filhas precisam implementar
    @abstractmethod
    def usar_ultimate(self):
        pass

class Tanque(Heroi):
    
    def usar_ultimate(self):
        ##mensagem dizendo que heroi x está usando ultimate y
        return f"{self.get_nome()} usa ultimate: {self.get_ultimate()}!"

class Dano(Heroi):
    
    def usar_ultimate(self):
        return f"{self.get_nome()} usa ultimate: {self.get_ultimate()}!"

##main
if __name__ == "__main__":
    print("Insira o tanque e a ultimate dele:")
    nome_tanque = input("Nome do tanque: ")
    ultimate_tanque = input("Ultimate do tanque: ")
    ##adiciondo instância do tanque
    Tanque1 = Tanque(nome_tanque, "Tanque", ultimate_tanque)
    print(f"{Tanque1.get_nome()} é um {Tanque1.get_funcao()}.\n")
          
    print("Insira nome e ultimate do herói de dano:")
    nome_dano = input("Nome do herói de dano: ")
    ultimate_dano = input("Ultimate do herói de dano: ")
    ##adicionando instância do herói de dano
    Dano1 = Dano(nome_dano, "Dano", ultimate_dano)
    print(f"{Dano1.get_nome()} é um {Dano1.get_funcao()}.\n")
          
    ##percorrendo lista de heróis e usando ultimate
    herois: list[Heroi] = [Tanque1, Dano1]
    for heroi in herois:
        print(heroi.usar_ultimate())
