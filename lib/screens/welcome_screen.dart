import 'package:fickle/screens/registration_screen.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:fickle/components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Hero(
                  tag: 'Flicker',
                  child: Container(
                    child: Image.asset('images/Flicker.png'),
                    height: 30.0,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
              child: Divider(
                height: 14.0,
                indent: 30.0,
                endIndent: 30.0,
                color: Colors.white70,
              ),
            ),
            RoundedButton(text: 'Log  In',),
            RoundedButton(text: 'Sign up'),
            SizedBox(
              height: 30.0,
              child: Center(
                child: AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText('Let Emotions Speak...',
                    textStyle: TextStyle(
                      color: Colors.white,
                    )),
                  ],
                  isRepeatingAnimation: true,
                ),
                ),
            ),
          ],

        ),
      ),
    );
  }
}
