import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateTaskPage extends StatefulWidget {
  @override
  _CreateTaskPageState createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends State<CreateTaskPage> {
  TextEditingController _taskController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  void _createTask() async {
    String task = _taskController.text;
    String description = _descriptionController.text;

    // Storing task and description in local storage
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('task', task);
    await prefs.setString('description', description);

    // Show a snackbar to indicate task created successfully
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Task created successfully!'),
        backgroundColor: Colors.green,
      ),
    );

    // Clear the text fields after task creation
    _taskController.clear();
    _descriptionController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Task'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _taskController,
              decoration: InputDecoration(
                labelText: 'Task',
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Description',
              ),
              maxLines: 3,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _createTask,
              child: Text('Create Task'),
            ),
          ],
        ),
      ),
    );
  }
}
