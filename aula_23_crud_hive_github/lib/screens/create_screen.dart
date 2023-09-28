import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';

import '../model/model.dart';
import 'read_screen.dart';

late final Box dataBox;
final TextEditingController _titleController = TextEditingController();
final TextEditingController _descriptionController = TextEditingController();

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {

  @override
  void initState() {

    super.initState();
    dataBox = Hive.box('data_box');
  }

  _createData() {
    Data newData = Data(
      title: _titleController.text,
      description: _descriptionController.text,
    );

    dataBox.add(newData);
  }

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
            padding: EdgeInsets.all(10.0),
            child: TextField(
              controller: _titleController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Title',
                labelText: 'Title',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              controller: _descriptionController,
              maxLines: 3,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Description',
                labelText: 'Description',
              ),
            ),
          ),
          ElevatedButton(onPressed: () {
            _createData();
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const ReadScreen(),
            ),
        );
          }, child: Text('ADD DATA'))
        ],
      ),
    );
  }
}
