import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SwipeableList(),
  ));
}

class SwipeableList extends StatefulWidget {
  const SwipeableList({super.key});

  @override
  State<SwipeableList> createState() => _SwipeableListState();
}

class _SwipeableListState extends State<SwipeableList> {
  List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Swipeable List"),
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        itemCount: items.length,
        padding: const EdgeInsets.all(8),
        itemBuilder: (context, index) {
          final item = items[index];
          return Dismissible(
            key: Key(item),
            background: Container(
              padding: const EdgeInsets.only(left: 20),
              alignment: Alignment.centerLeft,
              color: Colors.green,
              child: Row(
                children: const [
                  Icon(Icons.edit, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    "Edit",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            secondaryBackground: Container(
              padding: const EdgeInsets.only(right: 20),
              alignment: Alignment.centerRight,
              color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text(
                    "Delete",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.delete, color: Colors.white),
                ],
              ),
            ),
            onDismissed: (direction) {
              if (direction == DismissDirection.endToStart) {
               
                setState(() => items.removeAt(index));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("$item deleted")),
                );
              } else {
                
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Edit $item")),
                );
              }
            },
            child: Card(
              elevation: 2,
              child: ListTile(
                leading: const Icon(Icons.donut_small),
                title: Text(item),
                
              ),
            ),
          );
        },
      ),
    );
  }
}
