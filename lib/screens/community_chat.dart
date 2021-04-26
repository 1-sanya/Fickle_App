import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fickle/widgets/emoji_selection.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fickle/constants.dart';
import 'package:fickle/components/message_stream.dart';

final _firestore = FirebaseFirestore.instance;
User loggedUser;

class ChatScreen extends StatefulWidget {
  static const String id = 'chat_screen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _controller = TextEditingController();
  final messageTextController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  String chatMessage;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 18.0),
          color: Theme.of(context).backgroundColor,
          width: double.infinity,
          height: 80.0,
          child: Text(
            'Get Together Place',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Raleway_regular',
              letterSpacing: 2.0,
              fontSize: 30,
            ),
          ),
        ),
        Expanded(
          child: DecoratedBox(
            decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  AddEmojiButton(),
                  MessageStream(
                    firestore: _firestore,
                    loggedUserEmail: loggedUser.email,
                  ),
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            controller: _controller,
                            textCapitalization: TextCapitalization.sentences,
                            autocorrect: true,
                            enableSuggestions: true,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor:
                                  Theme.of(context).dialogBackgroundColor,
                              labelText: 'Type your message',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(width: 0),
                                gapPadding: 10,
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            onChanged: (value) => setState(() {
                              chatMessage = value;
                            }),
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {
                            _controller.clear();
                            // _firestore.collection('messages').add({
                            //   'text': chatMessage,
                            //   'sender': loggedUser.email,
                            // });
                            _firestore.collection(kFireBaseDBName).add({
                              kFireBaseDBSenderLabel: loggedUser.email,
                              kFireBaseDBTextLabel: chatMessage,
                              kFireBaseDBTimestamp: FieldValue.serverTimestamp()
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).backgroundColor,
                            ),
                            child: Icon(Icons.send, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
