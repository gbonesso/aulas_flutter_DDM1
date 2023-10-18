import 'package:flutter/material.dart';

// 8
import 'package:hive_flutter/adapters.dart';

import '/screens/create_screen.dart';
import '/screens/update_screen.dart';
// 8

class ReadScreen extends StatefulWidget {
  const ReadScreen({super.key});

  @override
  State<ReadScreen> createState() => _ReadScreenState();
}

class _ReadScreenState extends State<ReadScreen> {
  // 9
  late final Box dataBox;
  // 9

  @override
  void initState() {
    super.initState();
    // 10
    dataBox = Hive.box('data_box');
    // 10
  }

  // 20
  _deleteData(int index) {
    dataBox.deleteAt(index);
  }
  // 20

  // 11
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    onPressed: () {
                      // 15
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UpdateScreen(
                            index: index,
                            data: getData,
                            titleController: getData.title,
                            descriptionController: getData.description,
                          ),
                        ),
                      );
                      // 15
                    },
                    icon: const Icon(Icons.edit),
                  ),
                  title: Text(getData.title),
                  subtitle: Text(getData.description),
                  trailing: IconButton(
                    onPressed: () {
                      // 21
                      _deleteData(index);
                      // 21
                    },
                    icon: const Icon(Icons.delete),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
  // 11
}
