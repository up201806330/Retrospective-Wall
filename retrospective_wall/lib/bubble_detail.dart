import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:retrospective_wall/feedback_text.dart';
import 'bubble.dart';
import 'text_section.dart';

class BubbleDetail extends StatelessWidget {
  final DocumentSnapshot _bubble;

  BubbleDetail(this._bubble);

  @override
  Widget build(BuildContext context) {
    Bubble bubble = new Bubble(_bubble.id, _bubble['title'], _bubble['user'],
        _bubble['category'], FeedbackText('Summary', _bubble['text']));

    return Scaffold(
      appBar: AppBar(
        title: Text(bubble.text),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: []..add(textSections(bubble))),
    );
  }

  Widget textSections(Bubble bubble) {
    return TextSection(
        bubble.feedbackText.title, bubble.feedbackText.text, bubble.user);
  }
}
