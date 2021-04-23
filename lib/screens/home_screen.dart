import 'package:fickle/screens/chat_screen.dart';
import 'package:fickle/screens/user_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, @required User user})
      : _user = user,
        super(key: key);

  final User _user;
  static const String id = 'home_screen';
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  User _user;
  int _currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
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
          backgroundColor: Colors.black,
        ),
        body: SizedBox.expand(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
            },
            children: <Widget>[
              Container(
                color: Colors.lightGreenAccent ,
              ),
              Container(
                color: Colors.red,
              ),
              Container(
                child: ChatScreen(),
              ),
              Container(
                child:  UserInfoScreen(
                      user: _user,
              ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavyBar(
          backgroundColor: Colors.white10,
          iconSize: 25.0,
          containerHeight: 60.0,
          showElevation: true,
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
                icon: Icon(Icons.video_collection_outlined)),
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
