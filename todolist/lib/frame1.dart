import 'package:flutter/material.dart';
import 'frame3.dart'; // Import frame3.dart where Frame3page is defined

class Frame1page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            SizedBox(width: 150), // Add some space to the left
            Text(
              'Todo List',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.orange,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 100, top: 10),
              child: Column(
                children: [
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: Image.asset(
                      'assets/image1.webp',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 0, height: 10),
                  Align(
                    alignment: AlignmentDirectional
                        .centerStart, // Align text to the left
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 5), // Add left padding
                      child: Text(
                        'Tasks List',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            _buildRoundedRectangleWithCircleAndStick(), // First rectangle
            SizedBox(height: 10),
            _buildRoundedRectangleWithNewCircleAndStick(), // Second rectangle
            SizedBox(height: 10),
            _buildRoundedRectangleWithAdditionalCircleAndStick(), // Third rectangle
            SizedBox(height: 10),
            _buildRoundedRectangleWithNewAdditionalCircleAndStick(), // Fourth rectangle
            SizedBox(height: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.orange, // Set button background color here
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to Frame3page when button is clicked
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Frame3page()),
                      );
                    },
                    child: Text(
                      'Create Task',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(
                              255, 255, 152, 0)), // Set button background color
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildRoundedRectangleWithCircleAndStick() {
  return Stack(
    children: [
      Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 3),
            ),
          ],
        ),
      ),
      Positioned(
        left: 5,
        top: 10,
        child: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: CustomPaint(
            painter: CircleBorderPainter(),
          ),
        ),
      ),
      Positioned(
        right: 5,
        top: 5,
        child: Container(
          width: 4,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.red,
          ),
        ),
      ),
      Positioned(
        left: 50, // Adjusted position for the text
        top: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'UI/UX App',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Design',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      Positioned(
        top: 5,
        right: 15,
        child: Text(
          'April. 29, 2023',
          style: TextStyle(
            color: Colors.black,
            fontSize: 12,
          ),
        ),
      ),
    ],
  );
}

Widget _buildRoundedRectangleWithNewCircleAndStick() {
  return Stack(
    children: [
      Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 3),
            ),
          ],
        ),
      ),
      Positioned(
        left: 5,
        top: 10,
        child: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: CustomPaint(
            painter: NewCircleBorderPainter(),
          ),
        ),
      ),
      Positioned(
        right: 5,
        top: 5,
        child: Container(
          width: 4,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.green,
          ),
        ),
      ),
      Positioned(
        left: 50, // Adjusted position for the text
        top: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'UI/UX App',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Design',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      Positioned(
        top: 5,
        right: 15,
        child: Text(
          'April. 29, 2023',
          style: TextStyle(
            color: Colors.black,
            fontSize: 12,
          ),
        ),
      ),
    ],
  );
}

Widget _buildRoundedRectangleWithAdditionalCircleAndStick() {
  return Stack(
    children: [
      Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 3),
            ),
          ],
        ),
      ),
      Positioned(
        left: 5,
        top: 10,
        child: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: CustomPaint(
            painter: AdditionalCircleBorderPainter(),
          ),
        ),
      ),
      Positioned(
        right: 5,
        top: 5,
        child: Container(
          width: 4,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.orange,
          ),
        ),
      ),
      Positioned(
        left: 50, // Adjusted position for the text
        top: 15,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'View candidates',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      Positioned(
        top: 5,
        right: 15,
        child: Text(
          'April. 29, 2023',
          style: TextStyle(
            color: Colors.black,
            fontSize: 12,
          ),
        ),
      ),
    ],
  );
}

Widget _buildRoundedRectangleWithNewAdditionalCircleAndStick() {
  return Stack(
    children: [
      Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 3),
            ),
          ],
        ),
      ),
      Positioned(
        left: 5,
        top: 10,
        child: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: CustomPaint(
            painter: NewAdditionalCircleBorderPainter(),
          ),
        ),
      ),
      Positioned(
        right: 5,
        top: 5,
        child: Container(
          width: 4,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.red,
          ),
        ),
      ),
      Positioned(
        left: 50, // Adjusted position for the text
        top: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Football Cu',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'drybling',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      Positioned(
        top: 5,
        right: 15,
        child: Text(
          'April. 29, 2023',
          style: TextStyle(
            color: Colors.black,
            fontSize: 12,
          ),
        ),
      ),
    ],
  );
}

class CircleBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.2;

    final double radius = size.width / 2;
    final Offset center = Offset(size.width / 2, size.height / 2);

    final Shader gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Colors.white, Colors.red],
    ).createShader(Rect.fromCircle(center: center, radius: radius));

    paint.shader = gradient;

    canvas.drawCircle(center, radius - 0.25, paint);

    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: 'U',
        style: TextStyle(
          color: Colors.black,
          fontSize: 20.0, // Adjust font size as needed
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );

    final Offset textOffset = Offset(
      center.dx - textPainter.width / 2,
      center.dy - textPainter.height / 2,
    );

    textPainter.paint(canvas, textOffset);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class NewCircleBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.2;

    final double radius = size.width / 2;
    final Offset center = Offset(size.width / 2, size.height / 2);

    final Shader gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Colors.white, Colors.green],
    ).createShader(Rect.fromCircle(center: center, radius: radius));

    paint.shader = gradient;

    canvas.drawCircle(center, radius - 0.25, paint);

    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: 'U',
        style: TextStyle(
          color: Colors.black,
          fontSize: 20.0, // Adjust font size as needed
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );

    final Offset textOffset = Offset(
      center.dx - textPainter.width / 2,
      center.dy - textPainter.height / 2,
    );

    textPainter.paint(canvas, textOffset);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class AdditionalCircleBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.2;

    final double radius = size.width / 2;
    final Offset center = Offset(size.width / 2, size.height / 2);

    final Shader gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Colors.white, const Color.fromARGB(255, 255, 253, 253)],
    ).createShader(Rect.fromCircle(center: center, radius: radius));

    paint.shader = gradient;

    canvas.drawCircle(center, radius - 0.25, paint);

    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: 'V',
        style: TextStyle(
          color: Colors.black,
          fontSize: 20.0, // Adjust font size as needed
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );

    final Offset textOffset = Offset(
      center.dx - textPainter.width / 2,
      center.dy - textPainter.height / 2,
    );

    textPainter.paint(canvas, textOffset);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class NewAdditionalCircleBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.2;

    final double radius = size.width / 2;
    final Offset center = Offset(size.width / 2, size.height / 2);

    final Shader gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Colors.white, Colors.red],
    ).createShader(Rect.fromCircle(center: center, radius: radius));

    paint.shader = gradient;

    canvas.drawCircle(center, radius - 0.25, paint);

    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: 'F',
        style: TextStyle(
          color: Colors.black,
          fontSize: 20.0, // Adjust font size as needed
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );

    final Offset textOffset = Offset(
      center.dx - textPainter.width / 2,
      center.dy - textPainter.height / 2,
    );

    textPainter.paint(canvas, textOffset);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
