import 'package:fickle/widgets/google_sign_in_button.dart';
import 'package:flutter/material.dart';
import 'package:fickle/screens/welcome_screen.dart';
import 'package:fickle/screens/login_screen.dart';
import 'package:fickle/screens/registration_screen.dart';
import 'package:fickle/screens/community_chat.dart';
import 'package:page_transition/page_transition.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fickle/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:fickle/utils/dark_theme_preference.dart';
import 'package:fickle/utils/styles.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Fickle());
}

class Fickle extends StatefulWidget {
  @override
  _FickleState createState() => _FickleState();
}

class _FickleState extends State<Fickle> {
  DarkThemeProvider themeChangeProvider = new DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.devFestPreferences.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) {
            return themeChangeProvider;
          },
        )
      ],
      child: Consumer<DarkThemeProvider>(
        builder: (BuildContext context, value, Widget child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: Styles.themeData(themeChangeProvider.darkTheme, context),
            home: AnimatedSplashScreen(
              centered: true,
              duration: 1000,
              splashIconSize: 175.0,
              splash: Image.asset('images/SplashScreenLogo.png'),
              splashTransition: SplashTransition.fadeTransition,
              pageTransitionType: PageTransitionType.bottomToTop,
              backgroundColor: Color(0xFFb2dfdb),
              nextScreen: WelcomeScreen(),
            ),
            routes: {
              WelcomeScreen.id: (context) => WelcomeScreen(),
              LoginScreen.id: (context) => LoginScreen(),
              RegistrationScreen.id: (context) => RegistrationScreen(),
              ChatScreen.id: (context) => ChatScreen(),
              MyHomePage.id: (context) => MyHomePage(),
              GoogleSignInButton.id: (context) => GoogleSignInButton(),
            },
          );
        },
      ),
    );
  }
}
