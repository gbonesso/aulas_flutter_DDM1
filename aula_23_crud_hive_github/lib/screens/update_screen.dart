import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';

import '../model/model.dart';
import 'read_screen.dart';

class UpdateScreen extends StatefulWidget {
  // 14
  final int? index;
  final Data? data;
  final String titleController;
  final String descriptionController;

  const UpdateScreen(
      {super.key,
      this.index,
      this.data,
      required this.titleController,
      required this.descriptionController});
  // 14

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  // 16
  late final Box dataBox;
  late final TextEditingController titleController;
  late final TextEditingController descriptionController;
  // 16

  @override
  void initState() {
    super.initState();

    dataBox = Hive.box('data_box');
    // 17
    titleController = TextEditingController(text: widget.titleController);
    descriptionController =
        TextEditingController(text: widget.descriptionController);
    // 17
  }

  // 18
  _updateData() {
    Data newData = Data(
      title: titleController.text,
      description: descriptionController.text,
    );
    dataBox.putAt(widget.index!, newData);
  }
  // 18

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Update Screen'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: titleController,
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
              controller: descriptionController,
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
                // 19
                _updateData();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ReadScreen(),
                  ),
                );
                // 19
              },
              child: const Text('UPDATE DATA'))
        ],
      ),
    );
  }
}
