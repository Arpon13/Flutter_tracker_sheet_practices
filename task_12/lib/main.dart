import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: CustomContainerExample(),
  ));
}

class CustomContainerExample extends StatelessWidget {
  const CustomContainerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Container Example'),
        backgroundColor: Colors.lightBlue,
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.lightBlue, 
            borderRadius: BorderRadius.circular(20), 
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2), 
                offset: const Offset(4, 4),
                blurRadius: 12,
                spreadRadius: 4, 
              ),
            ],
          ),
          padding: const EdgeInsets.all(30), 
          width: 300, 
          height: 150, 
          child: const Text(
            'This is a Container.!!!',
            style: TextStyle(
              color: Colors.white, 
              fontSize: 24,
              fontWeight: FontWeight.bold, 
            ),
            textAlign: TextAlign.center, 
          ),
        ),
      ),
    );
  }
}
