import 'package:flutter/material.dart';

//4.
import 'package:hive_flutter/adapters.dart';

import '/screens/create_screen.dart';
import '/screens/update_screen.dart';
//4.

class ReadScreen extends StatefulWidget {
  const ReadScreen({super.key});

  @override
  State<ReadScreen> createState() => _ReadScreenState();
}

class _ReadScreenState extends State<ReadScreen> {
  //4.
  late final Box dataBox;

  @override
  void initState() {
    super.initState();
    dataBox = Hive.box('data_box');
  }
  //4.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //4.
      appBar: AppBar(
        title: const Text('Read Screen'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CreateScreen(),
              ),
            ),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: dataBox.listenable(),
        builder: (context, value, child) {
          if (value.isEmpty) {
            return const Center(
              child: Text('Database Is Empty'),
            );
          } else {
            return ListView.builder(
              itemCount: dataBox.length,
              itemBuilder: (context, index) {
                var box = value;
                var getData = box.getAt(index);

                return ListTile(
                  leading: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.edit),
                  ),
                  title: Text(getData.title),
                  subtitle: Text(getData.description),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.delete),
                  ),
                );
              },
            );
          }
        },
      ),
      //4.
      /* 4.
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text('Read Screen'),
        centerTitle: true,
      ),*/
    );
  }
}
