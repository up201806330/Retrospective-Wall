import 'package:retrospective_wall/feedback_text.dart';
import 'feedback_text.dart';

List<Bubble> allBubbles = [];

class Bubble {
  final String id;
  String text;
  bool isAnonymous;
  int category;
  final FeedbackText feedbackText;

  Bubble(
      this.id, this.text, this.isAnonymous, this.category, this.feedbackText);

  void addBubble() {
    allBubbles.add(this);
  }

  static List<Bubble> fetchAll() {
    print(allBubbles.length); // <--------- print here
    return allBubbles;
  }
  // static List<Bubble> fetchAll() {
  //   return [
  //     Bubble(1, 'text 1', true, 1),
  //     Bubble(2, 'text 2', true, 3)
  //   ];
  // }

  static List<Bubble> fetchByCategory(int category) {
    List<Bubble> l = new List<Bubble>();
    List<Bubble> bubbles = Bubble.fetchAll();
    for (var i = 0; i < bubbles.length; i++) {
      if (bubbles[i].category == category) {
        l.add(bubbles[i]);
      }
    }
    return l;
  }

  static Bubble fetchByID(String bubbleID) {
    List<Bubble> bubbles = Bubble.fetchAll();
    for (var i = 0; i < bubbles.length; i++) {
      if (bubbles[i].id == bubbleID) {
        return bubbles[i];
      }
    }
    return null;
  }
}
