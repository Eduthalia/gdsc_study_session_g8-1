
import 'package:flutter/material.dart';

void main() {
  runApp(TaskManagerApp());
}

class TaskManagerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager',
      theme: ThemeData(
       
      ),
      home: HomePage(key: UniqueKey()),
      routes: {
        '/taskList': (context) => TaskListPage(key: UniqueKey()),
        '/taskDetail': (context) => TaskDetailPage(key: UniqueKey()),
        '/addTask': (context) => AddTaskPage(key: UniqueKey()),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
   
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body:
       Stack(
        children: [
           
          _buildBottomButton(),
        ],
      ),
    );
  }
}
 Widget _buildBottomButton(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.only(bottom: 20.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/taskList');
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              'Get Started',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

class TaskListPage extends StatefulWidget {
  TaskListPage({Key? key}) : super(key: key);

  @override
  _TaskListPageState createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  List<Task> tasks = [
    Task('Task 1', 'Description of Task 1'),
    Task('Task 2', 'Description of Task 2'),
    Task('Task 3', 'Description of Task 3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text('Task List'),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(tasks[index].title),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/taskDetail',
                arguments: tasks[index],
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        
        onPressed: () {
          Navigator.pushNamed(context, '/addTask').then((newTask) {
            if (newTask != null) {
              setState(() {
                
              });
            }
          });
        },
      ),
    );
  }
}

class TaskDetailPage extends StatelessWidget {
  TaskDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Task task = ModalRoute.of(context)!.settings.arguments as Task;

    return Scaffold(
   
      appBar: AppBar(
        title: const Text('Task Detail'),
      ),
      body: Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              task.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              task.description,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class AddTaskPage extends StatelessWidget {
  AddTaskPage({Key? key}) : super(key: key);

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      appBar: AppBar(
        title: const Text('Add Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Task Title',
              ),
            ), const
            SizedBox(height: 10),
             TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                labelText: 'Task Description',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Add Task'),
              onPressed: () {
                String title = titleController.text;
                String description = descriptionController.text;
                if (title.isNotEmpty && description.isNotEmpty) {
                  Task newTask = Task(title, description);
                  Navigator.pop(context, newTask);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Task {
  String title;
  String description;

  Task(this.title, this.description);
}

