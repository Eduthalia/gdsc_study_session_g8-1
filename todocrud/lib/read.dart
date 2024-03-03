import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReadTasksPage extends StatefulWidget {
  @override
  _ReadTasksPageState createState() => _ReadTasksPageState();
}

class _ReadTasksPageState extends State<ReadTasksPage> {
  List<String> _tasks = [];

  void _getTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _tasks = [
        prefs.getString('task') ?? 'No task available',
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Read Tasks'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: _getTasks,
              child: Text('Show Tasks'),
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: ListView.builder(
                itemCount: _tasks.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_tasks[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
