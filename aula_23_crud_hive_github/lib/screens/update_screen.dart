import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';

import '../model/model.dart';
import 'read_screen.dart';

class UpdateScreen extends StatefulWidget {
  final int? index;
  final Data? data;
  final titleController;
  final descriptionController;

  const UpdateScreen(
      {super.key,
      this.index,
      this.data,
      this.titleController,
      this.descriptionController});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  late final Box dataBox;
  //late final TextEditingController titleController;
  //late final TextEditingController descriptionController;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();

    dataBox = Hive.box('data_box');
    //titleController = TextEditingController(text: widget.titleController);
    //descriptionController =TextEditingController(text: widget.descriptionController);
  }

  _updateData() {
    Data newData = Data(
      title: _titleController.text,
      description: _descriptionController.text,
    );
    dataBox.putAt(widget.index!, newData);
  }

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
            _updateData();
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const ReadScreen(),
            ),
        );
          }, child: Text('UPDATE DATA'))
        ],
      ),
    );
  }
}
