import 'package:fickle/model/user.dart';
import 'package:fickle/screens/chat_page.dart';
import 'package:flutter/material.dart';

class ChatHeaderWidget extends StatelessWidget {
  final List<ListOfUser> users;

  const ChatHeaderWidget({
    @required this.users,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
    color: Theme.of(context).backgroundColor,
    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 24),
    width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.75,
          child: Text(
            'Conversation',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Raleway_regular',
              letterSpacing: 2.0,
              fontSize: 30,
            ),
          ),
        ),
        SizedBox(height: 12),
        Container(
          height: 60,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              if (index == 0) {
                return Container(
                  margin: EdgeInsets.only(right: 12),
                  child: CircleAvatar(
                    radius: 24,
                    child: Icon(Icons.quickreply,color: Colors.lightBlueAccent,),
                  ),
                );
              } else {
                return Container(
                  margin: const EdgeInsets.only(right: 12),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ChatPage(user: users[index]),
                      ));
                    },
                    child: CircleAvatar(
                      radius: 24,
                      backgroundImage: NetworkImage(user.urlAvatar),
                    ),
                  ),
                );
              }
            },
          ),
        )
      ],
    ),
  );
}