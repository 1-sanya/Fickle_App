import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fickle/components/rounded_button.dart';
import 'login_screen.dart';
import 'registration_screen.dart';
import 'package:fickle/auth.dart';
import 'package:fickle/res/custom_colors.dart';
import 'package:fickle/widgets/google_sign_in_button.dart';

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
                    child: Image.asset('images/Saly-24.png'),
                    height: 300.0,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            RoundedButton(text: 'Log  In',buttonColor: Colors.blue, onPressed: () {
              Navigator.pushNamed(context, LoginScreen.id);
            },),
            RoundedButton(text: 'Sign up', buttonColor: Colors.pinkAccent, onPressed: () {
              Navigator.pushNamed(context, RegistrationScreen.id);
            },),
            SizedBox(
              height: 200.0,
              child: Center(
                child:  GoogleSignInButton(),
              )
            ),
            Container(
              height: 20.0,
              child: Image.asset('images/Flicker.png'),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              'Let Your Emotions Speak',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 2.0,
                fontSize: 10.0,
                fontFamily: 'RalewayDots',
              ),
              textAlign: TextAlign.center,
            )
          ],

        ),
      ),
    );
  }
}
