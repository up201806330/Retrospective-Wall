import 'package:retrospective_wall/feedback_text.dart';
import 'feedback_text.dart';

class Bubble {
  final String id;
  String text;
  bool isAnonymous;
  int category;
  final FeedbackText feedbackText;

  Bubble(this.id, this.text, this.isAnonymous, this.category, this.feedbackText);
}
