import 'package:flutter/material.dart';
import 'package:flutter_application_1/add_task_screen.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState(); //private
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> tasks = [];

  void _navigateToAddTask() async {
    final newTask = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddTaskScreen()),
    );

    if (newTask != null && newTask.isNotEmpty) {
      setState(() {
        tasks.add(newTask);
      });
    }
  }
  //context returns the location the current widget
  //in the widget tree  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My To-Do List')),
      body: tasks.isEmpty
          ? Center(child: Text("No Tasks Yet! Tap + to add."))
          : ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) =>
                  ListTile(title: Text(tasks[index])),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToAddTask,
        child: Icon(Icons.add),
      ),
    );
  }
}

