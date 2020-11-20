import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:retrospective_wall/feedback_text.dart';
import 'app.dart';
import 'bubble.dart';

class SubdivisionDetail extends StatefulWidget {
  final int _category;

  SubdivisionDetail(this._category);

  @override
  _SubdivisionDetail createState() => _SubdivisionDetail();
}

class _SubdivisionDetail extends State<SubdivisionDetail> {
  @override
  Widget build(BuildContext context) {
    List bubbles = Bubble.fetchByCategory(widget._category);

    /*Stream bubbleCollectionStream = FirebaseFirestore.instance.collection('Bubbles').where('category', isEqualTo: widget._category).snapshots();
    bubbleCollectionStream.listen((event) {
        QuerySnapshot snapshot = event;
        if(snapshot.docs.length < bubbles.length)
        {
          print("Will remove");
          bubbles = [];
          for(QueryDocumentSnapshot doc in  snapshot.docs)
          {
            dynamic data = doc.data();
            bubbles.add(new Bubble(doc.id, data['tittle'], data['isAnonymous'], data['category'], FeedbackText('Summary',data['text'])));
          }
        }
        else if(snapshot.docs.length > bubbles.length)
        {
          for(QueryDocumentSnapshot doc in  snapshot.docs)
            {
              dynamic data = doc.data();
              Bubble b = new Bubble(doc.id, data['tittle'], data['isAnonymous'], data['category'], FeedbackText('Summary',data['text']));
              if(!bubbles.contains(b)) {
                bubbles.add(b);
                print("added "+doc.id);
              }
            }
        }
    });*/

    return Scaffold(
        appBar: AppBar(
          title: Text('Subdivisions Detail'),
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
                Column(children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 16.0),
                    height: 500,
                    child: ListView(
                      children: bubbles
                          .map((bubble) => GestureDetector(
                                child: Container(
                                  child: Text(bubble.text,
                                      style:
                                          Theme.of(context).textTheme.bodyText2),
                                  alignment: Alignment.center,
                                  margin: new EdgeInsets.all(20.0),
                                  padding: new EdgeInsets.all(20.0),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade50,
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onTap: () => _onBubbleTap(context, bubble.id),
                              ))
                          .toList(),
                    ),
                  )
                ])
              ],
            ),
          ),
        ));
  }

  _onBubbleTap(BuildContext context, String bubbleID) {
    Navigator.pushNamed(context, BubbleDetailRoute,
        arguments: {'id': bubbleID});
  }
}
