import 'package:retrospective_wall/model/feedback_text.dart';
import 'feedback_text.dart';

class Bubble {
  final String id;
  String text;
  String user;
  int category;
  final FeedbackText feedbackText;

  Bubble(this.id, this.text, this.user, this.category, this.feedbackText);
}
