
from abc import ABC, abstractmethod
##classe ArmaCorpoaCorpo, é uma composição
class ArmaCorpoaCorpo:
    def __init__(self, nome: str, dano: int):

        self.nome = nome
        self.dano = dano

        ##getters e setters
        def get_nome(self) -> str:
            return self.nome
        def set_nome(self, novo_nome: str):
            self.nome = novo_nome
        def get_dano(self) -> int:
            return self.dano


class Membro:
    def __init__(self, nome: str, arma: str):
        self.nome = nome
        self.arma = arma

class PhantomThieves():          ##classe agregada
    def __init__(self, nome: str, arma: str):
        self.nome = nome
        self.arma = arma





class Joker:
    ##instanciando objeto arma corpo a corpo internamente 
    ##arma é criada e gerenciada por Joker
    def __init__(self, nome: str, arma_nome: str, arma_dano: int, equipe: list[PhantomThieves]):
        self.nome = nome
        self.arma = ArmaCorpoaCorpo(arma_nome, arma_dano)  ##composição
        self.equipe = equipe  ##recebe lista de PhantomThieves
    
    def mostrar_equipe(self):
        print(f"Equipe de {self.nome}:")
        for membro in self.equipe:
            print(f"- {membro.nome} com a arma {membro.arma}")


    
##parte principal
if __name__ == "__main__":
    print("\nCriando os Phantom Thieves...\n")
    print("Insira quantidade de membros dos Phantom Thieves:")
    
    quantidade_membros = int(input())

    ##criando lista
    membros: list[PhantomThieves] = []    

    for i in range(quantidade_membros):  ##loop para adicionar membros
        print(f"Insira o nome do membro {i+1}:")
        nome_membro = input()
        print(f"Insira a arma corpo a corpo do membro {i+1}:")
        arma_membro = input()
        membros.append(PhantomThieves(nome_membro, arma_membro))

    ##criando Joker com a equipe
    joker = Joker("Joker", "Killer Queen", 100, membros)
    
    print(f"\n{joker.nome} possui a arma {joker.arma.nome} que causa {joker.arma.dano} de dano.")
    
    ##mostrando a equipe
    joker.mostrar_equipe()



