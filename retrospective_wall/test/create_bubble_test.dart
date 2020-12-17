import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:retrospective_wall/bubble_new.dart';
import 'package:retrospective_wall/bubble.dart';
import 'package:retrospective_wall/feedback_text.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';

void main() {
  group('Bubbles', () {
    test('Create bubble function should create a bubble when called', () async {
      final instance = MockFirestoreInstance();

      BubbleNew bubblenewpage = new BubbleNew();
      final state = bubblenewpage.createState();
/*
      state.bubblesCollection = mock;

      state.createBubble("Title", "Text", false, 1);

      verify(mock.add).called(1);*/
    });

    test(
        'Bubble object should have a text, user, category and feedbackText when created',
        () {
      Bubble bubble = new Bubble(
          "idTest", "Text", "User", 1, new FeedbackText("Title", "TextAgain"));

      expect(bubble.id, "idTest");
      expect(bubble.text, "Text");
      expect(bubble.user, "User");
      expect(bubble.category, 1);
      expect(bubble.feedbackText.text, "TextAgain");
      expect(bubble.feedbackText.title, "Title");
    });
  });
}
