import "package:flutter/material.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task 07',
      home: MyHomePage(),
      );
  }
}

  class MyHomePage extends StatelessWidget {
    MyHomePage({super.key});

      final List<String> placeholderImages = [
    'assets/images/naruto.png',
    'assets/images/goku.png',
    'assets/images/natsu.png',
    'assets/images/gintoki.png',
    'assets/images/kakashi.png',
    'assets/images/ichigo.png',
  ]; 


    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Grid View Of Image'),
          centerTitle: true,
          backgroundColor: Colors.blue,

        ),
        body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "ANIME IMAGES",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0), 
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, 
                  crossAxisSpacing: 8.0, 
                  mainAxisSpacing: 8.0, 
                ),
                itemCount: placeholderImages.length,
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(placeholderImages[index], fit: BoxFit.cover),
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

