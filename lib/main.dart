import 'package:flutter/material.dart';
import 'package:fickle/screens/welcome_screen.dart';
import 'package:fickle/screens/login_screen.dart';
import 'package:fickle/screens/registration_screen.dart';
import 'package:fickle/screens/chat_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() => runApp(Fickle());

class Fickle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedSplashScreen(
        duration: 2000,
        splashIconSize: 120.0,
        splash: Image.asset(
          'images/SplashScreenLogo.png'
        ),
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.rightToLeftWithFade,
        backgroundColor: Colors.black,
        nextScreen: WelcomeScreen(),
      ),
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        ChatScreen.id: (context) => ChatScreen(),
      },
    );
  }
}
