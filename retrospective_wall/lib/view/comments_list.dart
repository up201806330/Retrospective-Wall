import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:retrospective_wall/model/comment_model.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../controller/app.dart';

showAlertDialog(BuildContext context) {
  // set up the button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Not Logged in!"),
    content: Text("You have to be logged in to comment."),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

class CommentsList extends StatelessWidget {

  String feedbackId;

  CommentsList(this.feedbackId);

  void submitComment(String input, context){
    if(userInfo != null && !input.isEmpty) {
      commentsCollection.add({
        'feedbackId': feedbackId,
        'username': userInfo.displayName,
        'comment': input,
        'timestamp': DateTime
            .now()
            .microsecondsSinceEpoch
      });
      textEditingController.clear();
    }
    else if(userInfo == null)
      showAlertDialog(context);
  }
  TextEditingController textEditingController = TextEditingController();
  CollectionReference commentsCollection;
  CollectionReference bubblesCollection;

  @override
  Widget build(BuildContext context) {
    commentsCollection =  FirebaseFirestore.instance.collection("Comments");
    bubblesCollection = FirebaseFirestore.instance.collection("Bubbles");

    return StreamBuilder(stream: commentsCollection.where('feedbackId', isEqualTo: feedbackId).orderBy('timestamp').snapshots() ,
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(snapshot.connectionState == ConnectionState.none) {
            return null;
          }
          else if(snapshot.connectionState == ConnectionState.waiting)
            return const Text(
              'Loading...',
              textAlign:TextAlign.center,);
          else
            updateCommentCount(feedbackId, snapshot.data.docs.length);
            return Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: ExpansionTile(
                    leading: Icon(Icons.comment),
                    trailing: Text(snapshot.data.docs.length.toString()),
                    title: Text(snapshot.data.docs.length > 0 ? "Comments" : "No comments yet, be the first"),
                    children:
                    [(TextFormField(decoration: InputDecoration(labelText: 'Add a comment...'),
                      onFieldSubmitted: (input)=>submitComment(input, context),
                      controller: textEditingController,) as Widget)] +
                        List<Widget>.generate(snapshot.data.docs.length, (index) => _SingleComment(snapshot.data.docs[index]))
                )
            );
        }
    );
  }

  void updateCommentCount(String feedbackId, int length) {
    bubblesCollection.doc(feedbackId).update(
      {
        'nComments': length
      }
    );
  }

}



class _SingleComment extends StatelessWidget {

  final dynamic comment;

  const _SingleComment(this.comment);


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Text(comment['username']),
          Text(comment['comment']),
        ],
      ),
    );
  }

}