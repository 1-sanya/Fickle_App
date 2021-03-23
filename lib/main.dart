import 'package:flutter/material.dart';
import 'package:fickle/screens/welcome_screen.dart';
import 'package:fickle/screens/login_screen.dart';
import 'package:fickle/screens/registration_screen.dart';
import 'package:fickle/screens/chat_screen.dart';

void main() => runApp(Fickle());

class Fickle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          body1: TextStyle(color: Colors.black54),
        ),
      ),
      home: WelcomeScreen(),
    );
  }
}