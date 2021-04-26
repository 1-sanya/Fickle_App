import 'package:fickle/components/rounded_button.dart';
import 'package:fickle/constants.dart';
import 'package:fickle/screens/community_chat.dart';
import 'package:fickle/screens/home_screen.dart';
import 'package:fickle/screens/registration_screen.dart';
import 'package:fickle/widgets/google_sign_in_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:fickle/auth.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;

  bool showSpinner = false;

  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'Flicker',
                  child: Container(
                    height: 340.0,
                    child: Image.asset('images/Saly-24.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              SizedBox(
                height: 48.0,
                child: Text(
                  'Login',
                  style: TextStyle(
                      color: Colors.white, letterSpacing: 3.5, fontSize: 40.0),
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              TextField(
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Email',
                      fillColor: Color(0xFFFFFFFF).withOpacity(0.2))),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                  obscureText: true,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Password',
                      fillColor: Color(0xFFFFFFFF).withOpacity(0.2))),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                  text: 'Log In',
                  buttonColor: Colors.blue,
                  onPressed: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    try {
                      UserCredential userCredentials =
                          await _auth.signInWithEmailAndPassword(
                              email: email, password: password);
                      if (userCredentials != null) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => MyHomePage(
                              newUser: userCredentials,
                            ),
                          ),
                        );
                      }
                      setState(() {
                        showSpinner = false;
                      });
                    } catch (e) {
                      setState(() {
                        showSpinner = false;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        Authentication.customSnackBar(
                          content: e,
                        ),
                      );
                    }
                  },
                  padding: EdgeInsets.symmetric(vertical: 10.0)),
              InkWell(
                child: GoogleSignInButton(
                  text: 'SignIn With Google',
                  alignmentGeometry: AlignmentDirectional.topEnd,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RegistrationScreen.id);
                },
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "Need a New Account..!!",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'RalewayThin',
                        letterSpacing: 3.0,
                        fontSize: 17.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
