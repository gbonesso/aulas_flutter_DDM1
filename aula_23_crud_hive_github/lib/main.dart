import 'package:flutter/material.dart';
import 'package:todo_app/screens/read_screen.dart';

import 'screens/create_screen.dart';
//import 'screens/update_screen.dart';

// 1
import 'package:hive_flutter/hive_flutter.dart';
// 1

import 'model/model.dart';

late final Box box;

void main() async {
  // 2
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  // 13
  Hive.registerAdapter(DataAdapter());
  // 13
  box = await Hive.openBox('data_box');
  // 2

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CRUD APP'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CreateScreen(),
                ),
              ),
              child: const Text(
                'Create',
              ),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ReadScreen(),
                ),
              ),
              child: const Text(
                'Read',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
