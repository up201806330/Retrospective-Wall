import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retrospective_wall/bubble.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Retrospective Wall',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Retrospective Wall Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void _navigateAndDisplayBubble(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context)=> BubbleScreen()),
    );

    Bubble b = result;

    print(b.text);
    print(b.isAnonymous);
    print(b.category);

  }

  @override
  Widget build(BuildContext context) {

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: (){
              _navigateAndDisplayBubble(context);
            },
            child: Text('New Bubble'),
          )
        ],
      ),

    );
  }
}

class BubbleScreen extends StatefulWidget{
  @override
  _BubbleScreen createState() => _BubbleScreen();
}

class _BubbleScreen extends State<BubbleScreen>{

  TextEditingController controller = new TextEditingController();

  int _value = 1;

  bool isAnonymous = false;

  Bubble createBubble(String text, bool isAnonymous, int value){
    return new Bubble(text, isAnonymous, value);
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

