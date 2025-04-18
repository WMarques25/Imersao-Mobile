/**
 * Testando
 */
class Objeto {
    String nome;
    double tamanho;
    String cor;

    Objeto({required this.nome, required this.tamanho, required this.cor});
}

void paramOpcional([int? num]){
    if(num != null){
        print(num);
        return;
    }
    return;
}

String paramNomeados({String? nome = 'sem nome', int? num = 0}){
    return "$nome e numero: $num";
}

int realizarOperacao(Function operacao, int numeroBase){
  return operacao(numeroBase);
}

void main(){
    Objeto caneca = Objeto(
        tamanho: 10,
        cor: 'Azul',
        nome: 'Caneca',
    );

    print(caneca.cor);
    int num1 = 5;
    String frase = 'He4art devs é';
    String frase2 = ' ${num1*2} vezes a mais braba';
    print(frase + frase2);
    paramOpcional(1);
    paramOpcional();

    print(paramNomeados(num: 5));
    print(paramNomeados(nome: "Teste"));

    Function quadrado = (int num){
        return num * num;
    };

    print(quadrado);
    print(quadrado(2));
    print(realizarOperacao(quadrado, 2));

    var fibonaci = [1, 2, 3, 5, 8, 13, 21];
    fibonaci.forEach((numero) => print(numero));

    const americaDoSul = [ 'Argentina', 'Brasil', 'Chile' ];
    const americaDoNorte = ['Canada', 'Estados Unidos', 'México'];
    const americaCentral = ['Costa Rica', 'Guatemala', 'Panamá'];

    const bool incluirAmericaCentral = true;

    const america = [...americaDoSul, ...americaDoNorte, if(incluirAmericaCentral) ...americaCentral];

    print(america);

    var conjuntoInteiros = {0, 1, 2, 3 };
    var conjuntoOutrosInteiros = {-2, -1, 0, 2,};

    print(conjuntoInteiros.intersection(conjuntoOutrosInteiros)); 
    print(conjuntoInteiros.union(conjuntoOutrosInteiros));

    var pessoa = {
        //chave:  valor
        'nome': 'João',
        'idade': '20',
        'email': 'joao@email.com'
    };

    print(pessoa['idade']); // 20
    print(pessoa['nome']); // João
}