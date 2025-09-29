
import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Security Guard',
      theme: ThemeData.dark(),
      home:  WelcomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

