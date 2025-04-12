import 'package:flutter/material.dart';

void main() {
  runApp(const SettingsApp());
}

class SettingsApp extends StatefulWidget {
  const SettingsApp({super.key});

  @override
  State<SettingsApp> createState() => _SettingsAppState();
}

class _SettingsAppState extends State<SettingsApp> {
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = _isDarkMode ? const Color(0xFF1E1E2F) : const Color(0xFFF2F7FF);
    final textColor = _isDarkMode ? Colors.white : Colors.black;
    final tileColor = _isDarkMode ? const Color(0xFF2A2A3B) : Colors.white;
    final toggleActiveColor = _isDarkMode ? Colors.tealAccent : Colors.blueAccent;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        appBarTheme: AppBarTheme(
          backgroundColor: tileColor,
          elevation: 1,
          iconTheme: IconThemeData(color: textColor),
          titleTextStyle: TextStyle(color: textColor, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Settings"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            decoration: BoxDecoration(
              color: tileColor,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: _isDarkMode ? Colors.black45 : Colors.grey.withOpacity(0.2),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.dark_mode, color: textColor),
                    const SizedBox(width: 10),
                    Text(
                      'Dark Mode',
                      style: TextStyle(fontSize: 16, color: textColor),
                    ),
                  ],
                ),
                Switch(
                  value: _isDarkMode,
                  onChanged: (value) {
                    setState(() {
                      _isDarkMode = value;
                    });
                  },
                  activeColor: toggleActiveColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
