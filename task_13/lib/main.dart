import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: CustomizedAppBarExample(),
  ));
}

class CustomizedAppBarExample extends StatelessWidget {
  const CustomizedAppBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan, 
        leading: Padding(
          padding: const EdgeInsets.all(8.0), 
          child: CircleAvatar(
            radius: 20, 
            backgroundImage: NetworkImage(
              'https://play-lh.googleusercontent.com/4t7_uRj7B2YwIWBSMDsvET1X0v1w5-Z06NDhDQ2Cd_Vv-VOAw0ZcC_d5xHqFhf1Y2g=w526-h296-rw', 
            ),
          ),
        ),
        title: Text(
          'Custom AppBar',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},  
          ),
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
        ],
      ),
      body: const Center(
        child: Text('A Custom AppBar!', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
