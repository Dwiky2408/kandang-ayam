import 'package:flutter/material.dart';
import 'package:mobileapps/pages/auth_page.dart';
import 'package:mobileapps/pages/home_page.dart';
import 'settings.dart'; // Import file settings.dart

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SMART ANIMAL CAGE',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 247, 247, 246),
      ),
      home: LoginPage(),
      routes: {
        '/home': (context) => HomePage(),
        '/settings': (context) => SettingsPage(),
      },
    );
  }
}
