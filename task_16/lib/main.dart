import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AnimatedShapeApp(),
  ));
}

class AnimatedShapeApp extends StatefulWidget {
  const AnimatedShapeApp({super.key});

  @override
  State<AnimatedShapeApp> createState() => _AnimatedShapeAppState();
}

class _AnimatedShapeAppState extends State<AnimatedShapeApp> {
  double _width = 150;
  double _height = 150;
  Color _color = Colors.lightBlue.shade100;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(20);

  void _animateContainer() {
    setState(() {
      _width = _width == 150 ? 250 : 150;
      _height = _height == 150 ? 250 : 150;
      _color = _color == Colors.lightBlue.shade100
          ? Colors.orange.shade100
          : Colors.lightBlue.shade100;
      _borderRadius =
          _borderRadius == BorderRadius.circular(20) ? BorderRadius.circular(100) : BorderRadius.circular(20);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: const Color(0xFFF4F6FA),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              width: _width,
              height: _height,
              decoration: BoxDecoration(
                color: _color,
                borderRadius: _borderRadius,
                boxShadow: [
                  BoxShadow(
                    color: _color.withOpacity(0.4),
                    blurRadius: 12,
                    spreadRadius: 4,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _animateContainer,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 2,
              ),
              child: const Text(
                "Animate",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
