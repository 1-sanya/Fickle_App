import 'package:fickle/screens/community_chat.dart';
import 'package:fickle/screens/user_info_screen.dart';
import 'package:fickle/widgets/note_pad.dart';
import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fickle/utils/dark_theme_preference.dart';
import 'package:provider/provider.dart';
import 'private_chat.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.user, this.newUser}) : super(key: key);

  final User user;
  final UserCredential newUser;
  static const String id = 'home_screen';
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  UserCredential _userCredential;
  User user;
  int _currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    user = widget.user;
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          leading: null,
          title: Image.asset(
            'images/Flicker.png',
            height: 25.0,
          ),
          centerTitle: true,
          elevation: 0.5,
          backgroundColor:
              Theme.of(context).backgroundColor /*Color(0xFFb2dfdb)*/,
        ),
        body: SizedBox.expand(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
            },
            children: <Widget>[
              Container(
                child: ChatsPage(),
              ),
              Container(
                child: AddToDoNotes(),
              ),
              Container(
                child: ChatScreen(),
              ),
              Container(
                child: UserInfoScreen(
                  user: user,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavyBar(
          backgroundColor: Theme.of(context).backgroundColor ,
          iconSize: 25.0,
          containerHeight: 60.0,
          showElevation: false,
          itemCornerRadius: 15.0,
          curve: Curves.easeIn,
          selectedIndex: _currentIndex,
          onItemSelected: (index) {
            setState(() => _currentIndex = index);
            _pageController.jumpToPage(index);
          },
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
                title: Text('Chats'), icon: Icon(Icons.chat_rounded)),
            BottomNavyBarItem(
                title: Text('Status'),
                icon: Icon(Icons.note_add_outlined)),
            BottomNavyBarItem(
              title: Text('Community'),
              icon: Icon(Icons.people_alt_sharp),
              activeColor: Colors.pinkAccent,
              inactiveColor: Colors.pinkAccent,
            ),
            BottomNavyBarItem(
                title: Text('Settings'), icon: Icon(Icons.settings)),
          ],
        ),
      ),
    );
  }
}
