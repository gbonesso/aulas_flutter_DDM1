import 'package:flutter/material.dart';

// 3
import 'package:hive_flutter/hive_flutter.dart';
// 3

import '../model/model.dart';
import 'read_screen.dart';

// 4
late Box dataBox;
final TextEditingController _titleController = TextEditingController();
final TextEditingController _descriptionController = TextEditingController();
// 4

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  @override
  void initState() {
    super.initState();
    // 5
    dataBox = Hive.box('data_box');
    // 5
  }

  // 6
  _createData() {
    Data newData = Data(
      title: _titleController.text,
      description: _descriptionController.text,
    );

    dataBox.add(newData);
    dataBox.flush();
  }
  // 6

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Create Screen'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Title',
                labelText: 'Title',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: _descriptionController,
              maxLines: 3,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Description',
                labelText: 'Description',
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                // 7
                _createData();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ReadScreen(),
                  ),
                );
                // 7
              },
              child: const Text('ADD DATA'))
        ],
      ),
    );
  }
}
