import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddToDoNotes extends StatefulWidget {
  @override
  _AddToDoNotesState createState() => _AddToDoNotesState();
}

class _AddToDoNotesState extends State<AddToDoNotes> {
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    String notes;
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Material(
        color: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Expanded(
              child: Column(children: [
                Center(
                  child: Text(
                    'Notes',
                    style: TextStyle(
                        color: Theme.of(context).backgroundColor,
                        fontFamily: 'Raleway_regular',
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3.0,
                        fontSize: 25.0),
                  ),
                ),
                const Divider(
                  color: Colors.white,
                  thickness: 0.2,
                ),
                TextField(
                  controller: _controller,
                  onChanged: (value) {
                    notes = value;
                  },
                  style: TextStyle(color: Theme.of(context).backgroundColor),
                  decoration: InputDecoration(
                    hintStyle:
                        TextStyle(color: Theme.of(context).backgroundColor),
                    hintText: 'Write a note',
                    border: InputBorder.none,
                  ),
                  cursorColor: Colors.grey,
                  maxLines: 6,
                ),
                const Divider(
                  color: Colors.grey,
                  thickness: 0.2,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Colors.red[300],
                    ),
                    elevation: MaterialStateProperty.all(5.0),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                  onPressed: () {
                    _controller.clear();
                    Fluttertoast.showToast(msg: "Uploaded Successfully");
                  },
                  child: Text('Add To Cloud'),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
