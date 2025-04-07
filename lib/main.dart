import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

//---------Criação da primeira tela---------//
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

//---------Criação da classe de estado da primeira tela---------//
class HomePageState extends State<HomePage> {
  late String _currentTime;
  Timer? _tempoAtualizacao;

  //---------Criação do método initState para atualizar a hora a cada segundo---------//
  @override
  void initState() {
    super.initState();
    _atualizarHora();
    _tempoAtualizacao = Timer.periodic(
      const Duration(seconds: 1),
      (timer) => _atualizarHora(),
    );
  }

  void _atualizarHora() {
    setState(() {
      _currentTime = DateFormat('hh:mm:ss a').format(DateTime.now());
    });
  }

  String obterDataAtual() {
    return DateFormat('dd/MM/yyyy').format(DateTime.now());
  }

  //---------Criação do método dispose para cancelar o timer---------//
  @override
  void dispose() {
    _tempoAtualizacao?.cancel();
    super.dispose();
  }

  //---------Criação do método build para construir a interface da primeira tela---------//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/homePage.jpg', fit: BoxFit.cover),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Avaliação Flutter',
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    shadows: [Shadow(blurRadius: 10, color: Colors.black)],
                  ),
                ),

                Text(
                  _currentTime,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [Shadow(blurRadius: 10, color: Colors.black)],
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  obterDataAtual(),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [Shadow(blurRadius: 10, color: Colors.black)],
                  ),
                ),

                const SizedBox(height: 20),

                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 100),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFD3D3D3),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SecondPage(),
                          ),
                        );
                      },
                      child: const Text(
                        'Segunda Tela',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//---------Criação da segunda tela---------//
class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

//---------Criação da classe de estado da segunda tela---------//
class _SecondPageState extends State<SecondPage> {
  Color? color;

  void definirFundoPreta() {
    setState(() {
      color = Color(0xFF000000);
    });
  }

  void definirFundoAzul() {
    setState(() {
      color = Color(0xff296277);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        title: const Text('Paulo Henrique Araújo de Almeida'),
        backgroundColor: Color(0xFF1976D2),
      ),
      body: Container(
        //---------Criação do Container para definir o fundo da tela---------//
        decoration: BoxDecoration(
          image:
              color == null
                  ? const DecorationImage(
                    image: AssetImage('assets/homemAranha3.jpg'),
                    fit: BoxFit.cover,
                  )
                  : null,
        ),

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 200),

              const Text(
                'Avaliação P1',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  color: Color(0xFFFFFFFF),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Tópicos Especiais em Informática',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  color: Color(0xFFFFFFFF),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Itú - 07 de Abril de 2025',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFFFFFFFF),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFF9800),
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: definirFundoPreta,

                    child: const Text(
                      'Black',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF296277),
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: definirFundoAzul,
                    child: const Text(
                      'Azul',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
