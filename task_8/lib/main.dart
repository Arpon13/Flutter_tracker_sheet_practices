import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navigation Drawer Example',
      home: HomeScreen(),
    );
  }
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          SizedBox(
            height: 80,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.teal,
              ),
              child: Text(
                'Navigation Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.insert_drive_file, color: Colors.blue),
            title: Text('Files'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FilesScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.photo, color: Colors.orange),
            title: Text('Photos'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PhotosScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.videocam, color: Colors.red),
            title: Text('Videos'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => VideosScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.purple),
            title: Text('Settings'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.info, color: Colors.green),
            title: Text('About'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home Screen'),
          backgroundColor: Colors.amber,
        ),
        drawer: AppDrawer(),
        body: Center(
          child: Text('Welcome to the Home Screen!'),
        ),
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings Screen'),
        backgroundColor: Colors.purple,
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Text('Welcome to the Settings Screen!'),
      ),
    );
  }
}

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Screen'),
        backgroundColor: Colors.green,
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Text('Welcome to the About Screen!'),
      ),
    );
  }
}

class FilesScreen extends StatelessWidget {
  const FilesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Files'),
        backgroundColor: Colors.blue,
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Text('Explore your files here!'),
      ),
    );
  }
}

class PhotosScreen extends StatelessWidget {
  const PhotosScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photos'),
        backgroundColor: Colors.orange,
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Text('View your photos here!'),
      ),
    );
  }
}

class VideosScreen extends StatelessWidget {
  const VideosScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Videos'),
        backgroundColor: Colors.red,
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Text('Watch your videos here!'),
      ),
    );
  }
}