import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text Styles Showcase',
      home: Scaffold(
      appBar: AppBar(
        title: Text('Text Styles Display'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: TextSytles(),
      ),
    );
  }
}

class TextSytles extends StatelessWidget {
  const TextSytles({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          Container(

            padding: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Colors.blue[200],
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              'Large Font Size',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),

          SizedBox(height: 20),

          Container(
            padding: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Colors.green[100],
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              'Bold Font Weight',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          SizedBox(height: 20),

          Container(
            padding: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Colors.red[100],
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              'Italic Font Style',
              style: TextStyle(
                fontStyle: FontStyle.italic,
              ),
            ),
          ),

          SizedBox(height: 20),
          
          Container(
            padding: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Colors.yellow[100],
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              'Custom Font Family',
              style: GoogleFonts.lobster(
                fontSize: 24,
                color: Colors.purple,
              ),
            ),
          ),
        ],
      ),
    );
  }

}