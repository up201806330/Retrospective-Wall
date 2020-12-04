import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:retrospective_wall/comment_model.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'app.dart';


class CommentsList extends StatelessWidget {

  String feedbackId;

  CommentsList(this.feedbackId);

  void submitComment(String input){
    if(userInfo != null && !input.isEmpty) {
      commentsCollection.add({
        'feedbackId': feedbackId,
        'username': userInfo.displayName,
        'comment' : input,
        'timestamp' : DateTime.now().microsecondsSinceEpoch
      });
    }
    textEditingController.clear();
  }
  TextEditingController textEditingController = TextEditingController();
  CollectionReference commentsCollection;
  @override
  Widget build(BuildContext context) {
    commentsCollection =  FirebaseFirestore.instance.collection("Comments");

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
            return Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: ExpansionTile(
                    leading: Icon(Icons.comment),
                    trailing: Text(snapshot.data.docs.length.toString()),
                    title: Text(snapshot.data.docs.length > 0 ? "Comments" : "No comments yet, be the first"),
                    children: (FirebaseAuth.instance.currentUser != null ?
                    [(TextFormField(decoration: InputDecoration(labelText: 'Add a comment...'),
                      onFieldSubmitted: (input)=>submitComment(input),
                      controller: textEditingController,) as Widget)] : List<Widget>()) +
                        List<Widget>.generate(snapshot.data.docs.length, (index) => _SingleComment(snapshot.data.docs[index]))
                )
            );
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