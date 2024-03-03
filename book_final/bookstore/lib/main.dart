import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'book.dart'; // Assuming book.dart is in the same directory

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GDSC AASTU Book Store',
      theme: ThemeData(),
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Changing background color to white
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20.0), // Add space at the top
            // Text Section
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Welcome to GDSC AASTU Book Store',
                style: TextStyle(
                  fontSize: 24.0,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Changing text color to black
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.white, // Shadow color
                      offset: Offset(3.0, 3.0),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            // Animation Section
            Expanded(
              child: Container(
                width: 400, // Adjust the width as per your requirement
                child: Lottie.asset(
                  'images/animation.json', // Your Lottie animation file path
                  fit: BoxFit.contain,
                ),
              ),
            ),
            // Button Section
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => bookpage()),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.blue), // Changing button color to blue
              ),
              child: Text('Go to Book Page'),
            ),
            SizedBox(height: 20.0), // Add space at the bottom
          ],
        ),
      ),
    );
  }
}
