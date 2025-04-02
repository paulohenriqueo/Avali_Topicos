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

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity, // Ocupa toda a largura da tela
        height: double.infinity, // Ocupa toda a altura da tela
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/homePage.jpg"), // Caminho da imagem
            fit: BoxFit.cover, // Faz a imagem cobrir toda a tela
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [const SizedBox(height: 20)],
        ),
      ),
    );
  }
}
