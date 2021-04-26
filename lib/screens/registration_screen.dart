import 'package:fickle/components/rounded_button.dart';
import 'package:fickle/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:fickle/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fickle/screens/home_screen.dart';
import 'package:fickle/widgets/google_sign_in_button.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;

  bool showSpinner = false;

  String username;
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
                height: 42.0,
                child: Text(
                  'Signup',
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
                  username = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Name',
                    fillColor: Color(0xFFFFFFFF).withOpacity(0.2)),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                  keyboardType: TextInputType.emailAddress,
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
                  obscureText: true,
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
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
                text: 'Sign up',
                buttonColor: Colors.pinkAccent,
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    if (newUser != null) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => MyHomePage(
                            newUser: newUser,
                          ),
                        ),
                      );
                    }
                    setState(() {
                      showSpinner = false;
                    });
                  } catch (e) {
                    Fluttertoast.showToast(msg: e);
                  }
                },
                padding: EdgeInsets.symmetric(vertical: 10.0),
              ),
              InkWell(
                child: GoogleSignInButton(
                  text: 'SignUp With Google',
                  alignmentGeometry: AlignmentDirectional.topEnd,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, LoginScreen.id);
                },
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "Already have an Account..!!",
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
