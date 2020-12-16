import 'package:cloud_firestore/cloud_firestore.dart';
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

                                StreamBuilder(
                                  stream: FirebaseFirestore.instance.collection("Bubbles").where("category", isEqualTo: 1).snapshots(),
                                  builder:
                                    (context, AsyncSnapshot<QuerySnapshot> snapshot) {

                                        if (snapshot.connectionState == ConnectionState.none) {
                                          return Text("something went wrong. try again later");
                                        }
                                        else if (snapshot.connectionState ==
                                            ConnectionState.waiting)
                                          return const Text(
                                            'Loading...',
                                            textAlign: TextAlign.center,
                                          );


                                        var avgLikes = 0.0;
                                        var avgDislikes = 0.0;
                                        var avgComments = 0.0;

                                        var size = snapshot.data.docs.length;

                                        for (dynamic bubble in snapshot.data.docs) {
                                          avgLikes += bubble['nLikes'];
                                          avgDislikes += bubble['nDislikes'];
                                          avgComments += bubble['nComments'];
                                        }

                                        avgLikes /= size;
                                        avgDislikes /= size;
                                        avgComments /= size;

                                        return Column(
                                          children: [
                                            Container(
                                              child: Text("Average Likes: " + avgLikes.toStringAsFixed(2)),
                                              margin: new EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                                              padding: new EdgeInsets.all(20.0),
                                              alignment: Alignment(0.0, 0.3),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                              ),
                                            ),
                                            Container(
                                              child: Text("Average Dislikes: " + avgDislikes.toStringAsFixed(2)),
                                              margin: new EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                                              padding: new EdgeInsets.all(20.0),
                                              alignment: Alignment(0.0, 0.3),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                              ),
                                            ),
                                            Container(
                                              child: Text("Average Comments: " + avgComments.toStringAsFixed(2)),
                                              margin: new EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                                              padding: new EdgeInsets.all(20.0),
                                              alignment: Alignment(0.0, 0.3),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        );

                                      return Text(snapshot.connectionState.toString());
                                    }
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

                                StreamBuilder(
                                    stream: FirebaseFirestore.instance.collection("Bubbles").where("category", isEqualTo: 2).snapshots(),
                                    builder:
                                        (context, AsyncSnapshot<QuerySnapshot> snapshot) {

                                      if (snapshot.connectionState == ConnectionState.none) {
                                        return Text("something went wrong. try again later");
                                      }
                                      else if (snapshot.connectionState ==
                                          ConnectionState.waiting)
                                        return const Text(
                                          'Loading...',
                                          textAlign: TextAlign.center,
                                        );


                                      var avgLikes = 0.0;
                                      var avgDislikes = 0.0;
                                      var avgComments = 0.0;

                                      var size = snapshot.data.docs.length;

                                      for (dynamic bubble in snapshot.data.docs) {
                                        avgLikes += bubble['nLikes'];
                                        avgDislikes += bubble['nDislikes'];
                                        avgComments += bubble['nComments'];
                                      }

                                      avgLikes /= size;
                                      avgDislikes /= size;
                                      avgComments /= size;

                                      return Column(
                                        children: [
                                          Container(
                                            child: Text("Average Likes: " + avgLikes.toStringAsFixed(2)),
                                            margin: new EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                                            padding: new EdgeInsets.all(20.0),
                                            alignment: Alignment(0.0, 0.3),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                            ),
                                          ),
                                          Container(
                                            child: Text("Average Dislikes: " + avgDislikes.toStringAsFixed(2)),
                                            margin: new EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                                            padding: new EdgeInsets.all(20.0),
                                            alignment: Alignment(0.0, 0.3),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                            ),
                                          ),
                                          Container(
                                            child: Text("Average Comments: " + avgComments.toStringAsFixed(2)),
                                            margin: new EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                                            padding: new EdgeInsets.all(20.0),
                                            alignment: Alignment(0.0, 0.3),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      );

                                      return Text(snapshot.connectionState.toString());
                                    }
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
                                margin: new EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
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

                            StreamBuilder(
                                stream: FirebaseFirestore.instance.collection("Bubbles").where("category", isEqualTo: 3).snapshots(),
                                builder:
                                    (context, AsyncSnapshot<QuerySnapshot> snapshot) {

                                  if (snapshot.connectionState == ConnectionState.none) {
                                    return Text("something went wrong. try again later");
                                  }
                                  else if (snapshot.connectionState ==
                                      ConnectionState.waiting)
                                    return const Text(
                                      'Loading...',
                                      textAlign: TextAlign.center,
                                    );


                                  var avgLikes = 0.0;
                                  var avgDislikes = 0.0;
                                  var avgComments = 0.0;

                                  var size = snapshot.data.docs.length;

                                  for (dynamic bubble in snapshot.data.docs) {
                                    avgLikes += bubble['nLikes'];
                                    avgDislikes += bubble['nDislikes'];
                                    avgComments += bubble['nComments'];
                                  }

                                  avgLikes /= size;
                                  avgDislikes /= size;
                                  avgComments /= size;

                                  return Column(
                                    children: [
                                      Container(
                                        child: Text("Average Likes: " + avgLikes.toStringAsFixed(2)),
                                        margin: new EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                                        padding: new EdgeInsets.all(20.0),
                                        alignment: Alignment(0.0, 0.3),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                        ),
                                      ),
                                      Container(
                                        child: Text("Average Dislikes: " + avgDislikes.toStringAsFixed(2)),
                                        margin: new EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                                        padding: new EdgeInsets.all(20.0),
                                        alignment: Alignment(0.0, 0.3),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                        ),
                                      ),
                                      Container(
                                        child: Text("Average Comments: " + avgComments.toStringAsFixed(2)),
                                        margin: new EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                                        padding: new EdgeInsets.all(20.0),
                                        alignment: Alignment(0.0, 0.3),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  );

                                  return Text(snapshot.connectionState.toString());
                                }
                            ),

                            InkWell(
                              child: Container(
                                child: GestureDetector(
                                  child: Text("Puzzles",
                                      style: Theme.of(context).textTheme.bodyText2),
                                  // onTap: () => _onSubdivisionTap(context, 4),
                                ),
                                margin: new EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
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
                            StreamBuilder(
                                stream: FirebaseFirestore.instance.collection("Bubbles").where("category", isEqualTo: 4).snapshots(),
                                builder:
                                    (context, AsyncSnapshot<QuerySnapshot> snapshot) {

                                  if (snapshot.connectionState == ConnectionState.none) {
                                    return Text("something went wrong. try again later");
                                  }
                                  else if (snapshot.connectionState ==
                                      ConnectionState.waiting)
                                    return const Text(
                                      'Loading...',
                                      textAlign: TextAlign.center,
                                    );


                                  var avgLikes = 0.0;
                                  var avgDislikes = 0.0;
                                  var avgComments = 0.0;

                                  var size = snapshot.data.docs.length;

                                  for (dynamic bubble in snapshot.data.docs) {
                                    avgLikes += bubble['nLikes'];
                                    avgDislikes += bubble['nDislikes'];
                                    avgComments += bubble['nComments'];
                                  }

                                  avgLikes /= size;
                                  avgDislikes /= size;
                                  avgComments /= size;

                                  return Column(
                                    children: [
                                      Container(
                                        child: Text("Average Likes: " + avgLikes.toStringAsFixed(2)),
                                        margin: new EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                                        padding: new EdgeInsets.all(20.0),
                                        alignment: Alignment(0.0, 0.3),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                        ),
                                      ),
                                      Container(
                                        child: Text("Average Dislikes: " + avgDislikes.toStringAsFixed(2)),
                                        margin: new EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                                        padding: new EdgeInsets.all(20.0),
                                        alignment: Alignment(0.0, 0.3),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                        ),
                                      ),
                                      Container(
                                        child: Text("Average Comments: " + avgComments.toStringAsFixed(2)),
                                        margin: new EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
                                        padding: new EdgeInsets.all(20.0),
                                        alignment: Alignment(0.0, 0.3),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  );

                                  return Text(snapshot.connectionState.toString());
                                }
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