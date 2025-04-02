import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Button Press',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Button Press'),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
        ),
        body: ButtonPress(),
      ),
    );
  }
}

class ButtonPress extends StatefulWidget {
  @override
  _ButtonPressState createState() => _ButtonPressState();
}

class _ButtonPressState extends State<ButtonPress> {
  String buttontext = 'Unpressed Button!';

void onButtonPressed() {
    setState(() {
      buttontext = 'Button Pressed!';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            buttontext,
            style: TextStyle(
            fontSize: 24,
            color: Colors.blueAccent,
            fontWeight: FontWeight.bold
            ),
            ),
            SizedBox(height: 20),
          ElevatedButton(
            onPressed: onButtonPressed,
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 8, // Adds shadow
            ),
            child: Text('Press Me!',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

