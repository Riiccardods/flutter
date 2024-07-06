Estrutura do Projeto

contador_app/
|- lib/
  |- principal.dart
  |- paginas/
    |- pagina_inicial.dart
  |- widgets/
    |- contador_widget.dart
|- pubspec.yaml





Arquivo principal.dart


// principal.dart
import 'package:flutter/material.dart'; // Importa o pacote Flutter Material
import 'paginas/pagina_inicial.dart'; // Importa a PaginaInicial

// Função principal que inicia o aplicativo
void main() {
  runApp(MeuAplicativo());
}

// Classe principal do aplicativo
class MeuAplicativo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contador', // Título do aplicativo
      theme: ThemeData(
        primarySwatch: Colors.blue, // Define a cor principal do tema
      ),
      home: PaginaInicial(), // Define a PaginaInicial como a tela inicial
    );
  }
}



Arquivo pagina_inicial.dart

// paginas/pagina_inicial.dart
import 'package:flutter/material.dart'; // Importa o pacote Flutter Material
import '../widgets/contador_widget.dart'; // Importa o ContadorWidget

// Classe que representa a página inicial
class PaginaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contador'), // Título da AppBar
      ),
      body: Center(
        child: ContadorWidget(), // Adiciona o ContadorWidget no centro da tela
      ),
    );
  }
}


Arquivo contador_widget.dart

// widgets/contador_widget.dart
import 'package:flutter/material.dart'; // Importa o pacote Flutter Material

// Classe que representa o widget de contador, que é um StatefulWidget
class ContadorWidget extends StatefulWidget {
  @override
  _EstadoContadorWidget createState() => _EstadoContadorWidget();
}

// Classe que gerencia o estado do ContadorWidget
class _EstadoContadorWidget extends State<ContadorWidget> {
  int _contador = 0; // Variável que armazena o valor do contador

  // Função para incrementar o contador
  void _incrementarContador() {
    setState(() {
      _contador++; // Incrementa o valor do contador em 1
    });
  }

  // Função para decrementar o contador
  void _decrementarContador() {
    setState(() {
      _contador--; // Decrementa o valor do contador em 1
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center, // Centraliza os widgets verticalmente
      children: <Widget>[
        Text(
          'Você clicou no botão este número de vezes:', // Texto descritivo
        ),
        Text(
          '$_contador', // Exibe o valor atual do contador
          style: Theme.of(context).textTheme.headline4, // Aplica estilo ao texto
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center, // Centraliza os botões horizontalmente
          children: <Widget>[
            ElevatedButton(
              onPressed: _decrementarContador, // Chama a função de decremento
              child: Text('-'), // Texto do botão de decremento
            ),
            SizedBox(width: 20), // Espaço entre os botões
            ElevatedButton(
              onPressed: _incrementarContador, // Chama a função de incremento
              child: Text('+'), // Texto do botão de incremento
            ),
          ],
        ),
      ],
    );
  }
}
