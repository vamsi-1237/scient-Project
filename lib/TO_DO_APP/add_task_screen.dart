import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add New Task")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(labelText: 'Enter task'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, controller.text);
              },
              child: Text("Add Task"),
            ),
          ],
        ),
      ),
    );
  }
}
