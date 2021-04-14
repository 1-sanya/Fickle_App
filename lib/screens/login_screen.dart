import 'package:fickle/components/rounded_button.dart';
import 'package:fickle/constants.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
            Hero(
              tag: 'Flicker',
              child: Container(
                height: 45.0,
                child: Image.asset('images/Flicker.png'),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
                style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
              onChanged: (value) {
                //Do something with the user input.
              },
              decoration: kTextFieldDecoration.copyWith(hintText: 'Email')
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              onChanged: (value) {
                //Do something with the user input.
              },
              decoration: kTextFieldDecoration.copyWith(hintText: 'Password')
            ),
            SizedBox(
              height: 24.0,
            ),
            RoundedButton(
              text: 'Log In',
              buttonColor: Colors.blue,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
