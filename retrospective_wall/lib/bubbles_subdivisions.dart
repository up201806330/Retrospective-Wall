import 'package:flutter/material.dart';
import 'app.dart';

class BubblesSubdivision extends StatefulWidget {
  @override
  _BubblesSubdivision createState() => _BubblesSubdivision();
}

class _BubblesSubdivision extends State<BubblesSubdivision> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Categories'),
        ),
        body: Container(
          decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.blue.shade50, Colors.blue.shade600]
          )
        ),
        child: SafeArea(
            child: Column(
              children: [
              Center(
                  child: Column(
                children: [
                  SizedBox(height: 1),
                  InkWell(
                    child: Container(
                      child: GestureDetector(
                        child: Text("Wishes",
                            style: Theme.of(context).textTheme.bodyText2),
                        // onTap: () => _onSubdivisionTap(
                        //   context,
                        //   1,
                        // ),
                      ),
                      margin: new EdgeInsets.all(20.0),
                      padding: new EdgeInsets.all(20.0),
                      alignment: Alignment(0.0, 0.3),
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onTap: () => _onSubdivisionTap(context, 1),
                  ),
                  InkWell(
                    child: Container(
                      child: GestureDetector(
                        child: Text("Risks",
                            style: Theme.of(context).textTheme.bodyText2),
                        // onTap: () => _onSubdivisionTap(context, 2),
                      ),
                      margin: new EdgeInsets.all(20.0),
                      padding: new EdgeInsets.all(20.0),
                      alignment: Alignment(0.0, 0.3),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onTap: () => _onSubdivisionTap(context, 2),
                  ),
                  InkWell(
                    child: Container(
                      child: GestureDetector(
                        child: Text("Appreciations",
                            style: Theme.of(context).textTheme.bodyText2),
                        // onTap: () => _onSubdivisionTap(context, 3),
                      ),
                      margin: new EdgeInsets.all(20.0),
                      padding: new EdgeInsets.all(20.0),
                      alignment: Alignment(0.0, 0.3),
                      decoration: BoxDecoration(
                        color: Colors.lightGreen,
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onTap: () => _onSubdivisionTap(context, 3),
                  ),
                  InkWell(
                    child: Container(
                      child: GestureDetector(
                        child: Text("Puzzles",
                            style: Theme.of(context).textTheme.bodyText2),
                        // onTap: () => _onSubdivisionTap(context, 4),
                      ),
                      margin: new EdgeInsets.all(20.0),
                      padding: new EdgeInsets.all(20.0),
                      alignment: Alignment(0.0, 0.3),
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onTap: () => _onSubdivisionTap(context, 4),
                  ),

                  SizedBox(height: 1),

                  Container(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        _onNewBubblePress(context);
                      },
                      child: Text("New Bubble", style: TextStyle(fontSize: 25)),
                    ),
                  ),
                ],
              )),
            ],
          )),
        ));
  }

  _onSubdivisionTap(BuildContext context, int category) {
    Navigator.pushNamed(context, SubdivisionDetailRoute,
        arguments: {'category': category});
  }

  _onNewBubblePress(BuildContext context) async {
    await Navigator.pushNamed(context, BubbleNewRoute);
  }
}
