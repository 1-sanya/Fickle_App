import 'package:flutter/material.dart';
import 'package:fickle/components/custom_rect_tween.dart';
import 'package:fickle/components/hero_dialog_route.dart';
class AddEmojiButton extends StatelessWidget {
  const AddEmojiButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(32),
      width: 120,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(HeroDialogRoute(builder: (context) {
            return const _AddEmojiPopupCard();
          }));
        },
        child: Hero(
          tag: _heroAddTodo,
          createRectTween: (begin, end) {
            return CustomRectTween(begin: begin, end: end);
          },
          child: Material(
            color: Theme.of(context).backgroundColor,
            elevation: 2,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.emoji_emotions_sharp,
                  color: Colors.yellow,
                  size: 20.0,
                ),
                Text('Give Emotions',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16,letterSpacing: 1),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

const String _heroAddTodo = 'add-todo-hero';
class _AddEmojiPopupCard extends StatelessWidget {
  const _AddEmojiPopupCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Hero(
          tag: _heroAddTodo,
          createRectTween: (begin, end) {
            return CustomRectTween(begin: begin, end: end);
          },
          child: Material(
            color: Theme.of(context).backgroundColor,
            elevation: 2,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                            onTap: (){},
                            child: Image.asset('images/mimi1.gif', height: 65.0,)
                        ),
                        GestureDetector(
                            onTap: (){},
                            child: Image.asset('images/mimi2.gif', height: 65.0,)
                        ),
                        GestureDetector(
                            onTap: (){},
                            child: Image.asset('images/mimi3.gif', height: 65.0,)
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                            onTap: (){},
                            child: Image.asset('images/mimi4.gif', height: 65.0,)
                        ),
                        GestureDetector(
                            onTap: (){},
                            child: Image.asset('images/mimi5.gif', height: 65.0,)
                        ),
                        GestureDetector(
                            onTap: (){},
                            child: Image.asset('images/mimi6.gif', height: 65.0,)
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}