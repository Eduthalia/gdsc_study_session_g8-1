import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeleteTasksPage extends StatefulWidget {
  @override
  _DeleteTasksPageState createState() => _DeleteTasksPageState();
}

class _DeleteTasksPageState extends State<DeleteTasksPage> {
  List<String> _tasks = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _getTasks();
    });
  }

  Future<void> _getTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _tasks = prefs.getStringList('tasks') ?? [];
    });
  }

  Future<void> _deleteTask(String task) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _tasks.remove(task);
    await prefs.setStringList('tasks', _tasks);

    // Show a snackbar to indicate task deleted successfully
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Task deleted successfully!'),
        backgroundColor: Colors.green,
      ),
    );

    // Update the displayed tasks
    await _getTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete Tasks'),
      ),
      body: _tasks.isEmpty
          ? Center(
              child: Text('No tasks available'),
            )
          : ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                final task = _tasks[index];
                return InkWell(
                  onTap: () => _deleteTask(task),
                  child: ListTile(
                    title: Text(task),
                    trailing: Icon(Icons.delete),
                  ),
                );
              },
            ),
    );
  }
}
