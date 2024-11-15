import 'package:flutter/material.dart';
import 'pages/opening_pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Chicken Cage',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: OpeningPage(),
    );
  }
}
