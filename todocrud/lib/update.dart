import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UpdateTasksPage extends StatefulWidget {
  @override
  _UpdateTasksPageState createState() => _UpdateTasksPageState();
}

class _UpdateTasksPageState extends State<UpdateTasksPage> {
  List<String> _tasks = [];
  String? _selectedTask;
  TextEditingController _taskController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _getTasks();
  }

  void _getTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _tasks = [prefs.getString('task') ?? 'No task available'];
    });
  }

  void _updateTask() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('task', _taskController.text);
    setState(() {
      _selectedTask = _taskController.text;
    });

    // Show a snackbar to indicate task updated successfully
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Task updated successfully!'),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Tasks'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                _getTasks();
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Choose Task to Update'),
                      content: DropdownButton<String>(
                        value: _selectedTask,
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedTask = newValue;
                          });
                        },
                        items: _tasks
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            _taskController.text = _selectedTask ?? '';
                            Navigator.of(context).pop();
                          },
                          child: Text('Select'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Update Task'),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _taskController,
              decoration: InputDecoration(
                labelText: 'Task',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _updateTask,
              child: Text('Commit'),
            ),
          ],
        ),
      ),
    );
  }
}
