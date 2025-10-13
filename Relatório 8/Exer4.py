from abc import ABC,abstractmethod

##interface Cibernético
class Cibernetico(ABC):
    @abstractmethod
    def realizar_hack(self):
        pass

class Implante:
    def __init__(self,custo:int,funcao:str):
        self.custo = custo
        self.funcao = funcao

    def get_custo(self) -> int:
        return self.custo
    def set_custo(self, novo_custo: int):
        if novo_custo >= 0:
            self.custo = novo_custo
        else:
            self.custo = 0
    
    def get_funcao(self) -> str:
        return self.funcao
    
    def set_funcao(self, nova_funcao: str):
        self.funcao = nova_funcao
    
class NetRunner(Cibernetico):   ##herda de Cibernético
    ##no init deve compor um objeto implante
    def __init__(self,nome:str,implante:Implante):
        self.nome = nome
        self.implante = implante  
    def realizar_hack(self):
        return f"{self.nome} está realizando um hack usando o implante de função {self.implante.get_funcao()}!"
    
##agrega uma lista de objetos do tipo Cibernetico no construtor
class Faccao:
    def __init__(self,nome:str,membros:list[Cibernetico]):
        self.nome = nome
        self.membros = membros


##parte principal
if __name__ == "__main__":
    print("Insira a quantidade de NetRunners na facção:")

    quantidade_membros = int(input())

    membros : list[NetRunner] = []  ##lista vazia  ##é uma lista de objetos do tipo NetRunner
    ##cada objeto do tipo NetRunner tem um objeto do tipo Implante

    for i in range(quantidade_membros):  ##loop para adicionar membros
        print(f"Insira o nome do NetRunner {i+1}:")
        nome_membro = input()
        print(f"Insira a função do implante do NetRunner {i+1}:")
        funcao_implante = input()
        print(f"Insira o custo do implante do NetRunner {i+1}:")
        custo_implante = int(input())

        implante = Implante(custo_implante,funcao_implante)  ##criando objeto implante

        netrunner = NetRunner(nome_membro,implante)  ##criando objeto NetRunner ##preciso passar os dados que o init pede
        membros.append(netrunner)  ##adicionando o netrunner na lista

        print(f"NetRunner {nome_membro} adicionado com implante de função {funcao_implante} e custo {custo_implante}.\n")

        print("Mandando hack...")
        for membro in membros:
            print(membro.realizar_hack())


