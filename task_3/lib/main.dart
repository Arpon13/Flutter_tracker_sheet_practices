import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List View Showcase',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Item List'),
          backgroundColor: Colors.cyan,
          foregroundColor: Colors.black,
          centerTitle: true,
          elevation: 4.0,
        ),
        body: ListViewBuilder()
        ),
        );
  }
}

class ListViewBuilder extends StatelessWidget {
  ListViewBuilder({super.key});

  final List<int> items = List.generate(20, (index) => index + 1);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 6),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            'Item ${items[index]}',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
    );
  },
    );
  }
}