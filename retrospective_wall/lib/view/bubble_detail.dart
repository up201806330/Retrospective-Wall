import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:retrospective_wall/view/comments_list.dart';
import 'package:retrospective_wall/model/feedback_text.dart';
import '../model/bubble.dart';
import 'text_section.dart';

import '../widgets/feedback_stats.dart';

class BubbleDetail extends StatefulWidget {
  final DocumentSnapshot _bubble;

  static const double LikeButtonSize = 60;

  BubbleDetail(this._bubble);

  @override
  _BubbleDetail createState() => _BubbleDetail(_bubble);
}

class _BubbleDetail extends State<BubbleDetail> {

  final DocumentSnapshot _bubble;

  bool thumbsDown = false;
  bool thumbsUp = false;

  int likeCounter = 10;
  int dislikeCounter = 2;

  _BubbleDetail(this._bubble);

  @override
  Widget build(BuildContext context) {
    Bubble bubble = new Bubble(_bubble.id, _bubble['title'], _bubble['user'],
        _bubble['category'], FeedbackText('Summary', _bubble['text']));

    return Scaffold(
      appBar: AppBar(
        title: Text(bubble.text),
      ),
      body: ListView(
          children: [
            Column(
              children: [
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: []..add(textSections(bubble))
                ),
                SizedBox(
                    width: 250.0,
                    height: 80.0,
                    child: FeedbackStats(_bubble)
                ),
                CommentsList(bubble.id),
              ],
            ),
          ],
      ),
    );
  }

  Widget textSections(Bubble bubble) {
    return TextSection(
        bubble.feedbackText.title, bubble.feedbackText.text, bubble.user);
  }
}
