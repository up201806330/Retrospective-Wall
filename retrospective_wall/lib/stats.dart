import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Stats extends StatefulWidget {
  @override
  _Stats createState() => _Stats();
}
class _Stats extends State<Stats> {
  _Stats();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('Statistics'),
        ),
        body: SingleChildScrollView(
          child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Colors.blue.shade50, Colors.blue.shade600])),
              child: SafeArea(
                child: Column(
                  children: [
                    Center(
                        child: Column(
                          children: [
                            SizedBox(height: 1),
                            Column(
                              children: [
                                InkWell(
                                  child: Container(
                                    child: GestureDetector(
                                      child: Text("Wishes",
                                          style: Theme.of(context).textTheme.bodyText2),
                                    ),
                                    margin: new EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                                    padding: new EdgeInsets.all(20.0),
                                    alignment: Alignment(0.0, 0.3),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        color: Colors.yellow,
                                        width: 10,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),

                                ),
                                Container(
                                  child: Text("Average Likes: "),
                                  margin: new EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                                  padding: new EdgeInsets.all(20.0),
                                  alignment: Alignment(0.0, 0.3),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                ),
                                Container(
                                  child: Text("Average Dislikes: "),
                                  margin: new EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                                  padding: new EdgeInsets.all(20.0),
                                  alignment: Alignment(0.0, 0.3),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                ),
                                Container(
                                  child: Text("Average Comments: "),
                                  margin: new EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                                  padding: new EdgeInsets.all(20.0),
                                  alignment: Alignment(0.0, 0.3),
                                  decoration: BoxDecoration(
                                    color: Colors.white,

                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Column(
                              children: [
                                InkWell(
                                  child: Container(
                                    child: GestureDetector(
                                      child: Text("Risks",
                                          style: Theme.of(context).textTheme.bodyText2),
                                    ),
                                    margin: new EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                                    padding: new EdgeInsets.all(20.0),
                                    alignment: Alignment(0.0, 0.3),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        color: Colors.red,
                                        width: 10,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),

                                ),
                                Container(
                                  child: Text("Average Likes: "),
                                  margin: new EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                                  padding: new EdgeInsets.all(20.0),
                                  alignment: Alignment(0.0, 0.3),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ],
                            ),
                            InkWell(
                              child: Container(
                                child: GestureDetector(
                                  key: Key("AppreciationsButton"),
                                  child: Text("Appreciations",
                                      style: Theme.of(context).textTheme.bodyText2),
                                ),
                                margin: new EdgeInsets.all(20.0),
                                padding: new EdgeInsets.all(20.0),
                                alignment: Alignment(0.0, 0.3),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.lightGreen,
                                    width: 10,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),

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
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.lightBlue,
                                    width: 10,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),

                            ),
                            SizedBox(height: 1),


                          ],
                        )),
                  ],
                ),
              )),
        ));
  }
}