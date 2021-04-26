import 'package:fickle/utils/styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:fickle/screens/login_screen.dart';
import 'package:fickle/auth.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';
import 'package:fickle/utils/dark_theme_preference.dart';



class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({Key key, User user, this.userCredential})
      : _user = user,
        super(key: key);

  final User _user;
  final UserCredential userCredential;
  @override
  _UserInfoScreenState createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  UserCredential userCredential;
  User _user;
  bool _isSigningOut = false;

  Route _routeToSignInScreen() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => LoginScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(-1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  void initState() {
    userCredential = widget.userCredential;
    _user = widget._user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 20.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.0,
                width: 20.0,
              ),
              Text(
                ' PROFILE',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'RalewayThin',
                    letterSpacing: 3.0,
                    fontSize: 20.0),
              ),
              SizedBox(
                height: 40.0,
                child: Divider(color: Theme.of(context).textSelectionColor,
                thickness: 2.0,
                indent: 20.0,
                endIndent: 20.0,),
              ),
              Row(
                children: [
                  SizedBox(width: 20.0,),
                  _user.photoURL != null
                      ? ClipOval(
                          child: Material(
                              color: Theme.of(context).backgroundColor
                                  .withOpacity(0.3),
                              child: Image.network(_user.photoURL)),
                        )
                      : ClipOval(
                          child: Material(
                            color:
                            Theme.of(context).backgroundColor.withOpacity(0.3),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Icon(
                                Icons.person,
                                size: 40,
                                color: Styles.iconBlue,
                              ),
                            ),
                          ),
                        ),
                  SizedBox(width: 20.0,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        _user.displayName == null
                            ? 'Senor`'
                            : _user.displayName,
                        style: TextStyle(
                          color: Theme.of(context).textSelectionColor,
                          fontSize: 14,
                          letterSpacing: 1.0
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        _user.email,
                        style: TextStyle(
                          color: Theme.of(context).textSelectionColor,
                          fontSize: 12.0,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 24.0),
            new InkWell(
              onTap: _launchURL,
              child: Padding(
                padding:  EdgeInsets.all(10.0),
                child:  Text("About",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'RalewayThin',
                      letterSpacing: 3.0,
                      fontSize: 17.0),),
              ),
            ),
              SizedBox(height: 16.0),
              new InkWell(
                onTap: _launchURL,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child:  Text("Help",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'RalewayThin',
                        letterSpacing: 3.0,
                        fontSize: 17.0),),
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text("Dark Mode",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'RalewayThin',
                          letterSpacing: 3.0,
                          fontSize: 17.0),),
                  ),
                  Container(
                    height: 30.0,
                    width: 120.0,
                    child: LiteRollingSwitch(
                      animationDuration: Duration(milliseconds: 400),
                      value: themeChange.darkTheme,
                      onChanged: (bool value) {
                        themeChange.darkTheme = value;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 100.0),
              Center(
                child: _isSigningOut
                    ? CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      )
                    : ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Colors.red[300],
                          ),
                          elevation:  MaterialStateProperty.all(5.0),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        onPressed: () async {
                          setState(() {
                            _isSigningOut = true;
                          });
                          await Authentication.signOut(context: context);
                          setState(() {
                            _isSigningOut = false;
                          });
                          Navigator.of(context)
                              .pushReplacement(_routeToSignInScreen());
                        },
                        child: Padding(
                          padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                          child: Text(
                            'Sign Out',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 2,
                            ),
                          ),
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
void _launchURL() async {
  const _url = 'https://github.com/keshkaush';
  if (await canLaunch(_url)) {
    await launch(_url);
  } else {
    throw 'Could not launch $_url';
  }
}
void _launchMail() async {
  const _mail = 'mailto:keshav.kaushik344@gmail.com';
  if (await canLaunch(_mail)) {
    await launch(_mail);
  } else {
    throw 'Could not launch to mailer';
  }
}