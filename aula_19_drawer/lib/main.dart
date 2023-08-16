import 'package:flutter/material.dart';

void main() {
  // Desclocar o MaterialApp para o runApp
  // Isso permite o Navigator.pop()
  runApp(const MaterialApp(home: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Teste Drawer"),
      ),
      // Adicionar o drawer (menu sanduiche) ao Scaffold
      drawer: Drawer(
        // O ListView permite que o usuário possa rolar
        // as opções no menu se não houver espaço vertical
        // para mostrar todas as opções na mesma tela.
        child: ListView(
          // Remove o espaçamento entre os items da ListView
          padding: EdgeInsets.zero,
          children: [
            // Cabeçalho
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text("Cabeçalho"),
            ),
            // Lista de Opções do Menu
            ListTile(
              title: const Text("Primeira Opção..."),
              onTap: () {
                // Faz alguma coisa...
                print("Opção 1 escolhida...");
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Segunda Opção..."),
              onTap: () {
                // Faz alguma coisa...
                print("Agora a segunda opção foi a escolhida...");
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text('Olá Mundo!!!'),
      ),
    );
  }
}
