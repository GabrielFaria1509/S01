using System; // Importa a biblioteca System para usar Console


//classe abstrata == classes que não podem ser instanciadas diretamente , precisam ser herdadas
abstract class MonstroSombrio
{
    public string nome = string.Empty;
    
    // Método abstrato - deve ser implementado pelas classes filhas
    public abstract void Mover();
}

class Zumbi : MonstroSombrio
{
    public Zumbi()
    {
        nome = "Zumbi";         //herdando o atributo da classe mãe
    }

    private int velocidade = 5; //atributo privado, não é herdado

    public override void Mover()
    {
        Console.WriteLine("O zumbi se move lentamente.");
        Console.WriteLine("Velocidade: " + velocidade);
    }
}

class Espectro : MonstroSombrio
{
    private int velocidade = 10; //atributo privado, não é herdado
    
    public Espectro()
    {
        nome = "Espectro";  //herdando o atributo da classe mãe
    }

    public override void Mover()
    {
        Console.WriteLine("O espectro se move silenciosamente.");
        Console.WriteLine("Velocidade: " + velocidade);
    }
}

class ProgramExer2
{
    public static void Main()
    {
        //declaração de um array do tipo da classe mãe(MonstroSombrio)
        //enchendo com uma instância de cada classe filha
        MonstroSombrio[] monstros = new MonstroSombrio[2];
        monstros[0] = new Zumbi();
        monstros[1] = new Espectro();

        //percorrendo o array
        //sistema deve ser capaz de processar os diferentes tipos de monstro de forma uníforme
        foreach (var monstro in monstros)
        {
            //chamando metódo Mover() de cada instância/monstro
            monstro.Mover();
        }
    }
}
       
