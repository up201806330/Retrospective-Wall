import 'package:flutter/material.dart';
import 'bubble.dart';

class BubbleNew extends StatefulWidget {

  @override
  _BubbleNew createState() => _BubbleNew();
}

class _BubbleNew extends State<BubbleNew> {

  TextEditingController controller = new TextEditingController();

  int _value = 1;

  bool isAnonymous = false;

  Bubble createBubble(String text, bool isAnonymous, int value){
    return new Bubble(1, text, isAnonymous, value);
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Bubble"),
      ),
      body: Column(
        children: [
          Text("New Review:"),
          Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.cyan,
              border: Border.all(),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                  value: _value,
                  items: [
                    DropdownMenuItem(
                      child: Text("Wishes"),
                      value: 1,
                    ),
                    DropdownMenuItem(
                      child: Text("Risks"),
                      value: 2,
                    ),
                    DropdownMenuItem(
                      child: Text("Appreciations"),
                      value: 3,
                    ),
                    DropdownMenuItem(
                      child: Text("Puzzles"),
                      value: 4,
                    ),
                  ],
                  onChanged: (value) {
                    setState((){
                      _value = value;
                    });
                  }
              ),
            ),
          ),
          CheckboxListTile(
              title: Text("Anonymous Review: "),
              value: isAnonymous,
              onChanged: (newValue) {
                setState(() {
                  isAnonymous = newValue;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
          ),
          TextField(
            keyboardType: TextInputType.multiline,
            minLines: 5,
            maxLines: 10,
            controller: controller,
            textAlign: TextAlign.left,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Enter your feedback',
              hintStyle: TextStyle(color: Colors.grey),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Bubble b = createBubble(controller.text, isAnonymous, _value);
                Navigator.pop(context, b);
              },
              child: Text("Submit"),
            ),
          ),
        ],
      ),
    );
  }
}
