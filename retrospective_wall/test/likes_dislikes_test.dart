import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:retrospective_wall/feedback_stats.dart';
import 'package:retrospective_wall/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mockito/mockito.dart';

class SnapshotMock extends Mock implements DocumentSnapshot {}

void main() {
  group('LikesDislikes', () {
    testWidgets('Like counter should increment when like button is tapped',
        (WidgetTester tester) async {
      final snapshot = new SnapshotMock();
      await tester.pumpWidget(new FeedbackStats(snapshot));

      final likeFinder = find.byKey(Key("LikeButton"));
      expect(likeFinder, findsOneWidget);
    });

    testWidgets('Counter increments smoke test', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      //await tester.pumpWidget(MyApp());

      // Verify that our counter starts at 0.
      expect(find.text('0'), findsOneWidget);
      expect(find.text('1'), findsNothing);

      // Tap the '+' icon and trigger a frame.
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();

      // Verify that our counter has incremented.
      expect(find.text('0'), findsNothing);
      expect(find.text('1'), findsOneWidget);
    });
  });
}
