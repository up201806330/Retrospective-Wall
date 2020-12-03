import 'package:retrospective_wall/comment_model.dart';
import 'package:flutter/material.dart';

List<CommentModel> comments = [
  new CommentModel("user1", "comment1"),
  new CommentModel("user2", "comment2"),
];

class CommentsList extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    // final List<CommentModel> comments = [new CommentModel("user", "comment")];

    return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: ExpansionTile(
            leading: Icon(Icons.comment),
            trailing: Text(comments.length.toString()),
            title: Text("Comments"),
            children: List<Widget>.generate(
                comments.length, (index) => _SingleComment(index))
        )
    );
  }

}



class _SingleComment extends StatelessWidget {

  final int index;

  const _SingleComment(this.index);


  @override
  Widget build(BuildContext context) {
    final CommentModel commentData = new CommentModel("user ", "comment ");

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Text(commentData.user + index.toString()),
          Text(commentData.comment + index.toString()),
        ],
      ),
    );
  }

}