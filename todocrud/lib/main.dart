import 'package:flutter/material.dart';
import 'create.dart';
import 'delete.dart';
import 'read.dart';
import 'update.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GDSC TodoList App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MainPage(),
      routes: {
        '/create': (context) => CreateTaskPage(),
        '/delete': (context) => DeleteTasksPage(),
        '/read': (context) => ReadTasksPage(),
        '/update': (context) => UpdateTasksPage(),
      },
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GDSC TodoList App'),
        backgroundColor: Colors.orangeAccent, // Changing app bar color
        elevation: 0, // Removing app bar elevation
      ),
      backgroundColor: Colors.orangeAccent, // Changing background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to',
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'GDSC TodoList App',
              style: TextStyle(
                fontSize: 32.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 40.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/create');
              },
              child: Text(
                'Create',
                style: TextStyle(fontSize: 18.0),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // Changing button color
                padding: EdgeInsets.symmetric(
                    horizontal: 40.0, vertical: 16.0), // Adding padding
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(30.0), // Adding border radius
                ),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/delete');
              },
              child: Text(
                'Delete',
                style: TextStyle(fontSize: 18.0),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // Changing button color
                padding: EdgeInsets.symmetric(
                    horizontal: 40.0, vertical: 16.0), // Adding padding
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(30.0), // Adding border radius
                ),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/read');
              },
              child: Text(
                'Read',
                style: TextStyle(fontSize: 18.0),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // Changing button color
                padding: EdgeInsets.symmetric(
                    horizontal: 40.0, vertical: 16.0), // Adding padding
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(30.0), // Adding border radius
                ),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/update');
              },
              child: Text(
                'Update',
                style: TextStyle(fontSize: 18.0),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // Changing button color
                padding: EdgeInsets.symmetric(
                    horizontal: 40.0, vertical: 16.0), // Adding padding
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(30.0), // Adding border radius
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
