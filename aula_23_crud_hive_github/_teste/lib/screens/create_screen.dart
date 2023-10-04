import 'package:flutter/material.dart';
// 3.
import 'package:hive_flutter/hive_flutter.dart';
import '../model/model.dart';
import 'read_screen.dart';
// 3.


class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  //3.
  late final Box dataBox;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

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
  //3.

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
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Title',
                labelText: 'Title',
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              maxLines: 3,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Description',
                labelText: 'Description',
              ),
            ),
          ),
          ElevatedButton(onPressed: () {
            //3.
             _createData();
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const ReadScreen(),
            ),
        );
            //3.
          }, child: Text('ADD DATA'))
        ],
      ),
    );
  }
}
