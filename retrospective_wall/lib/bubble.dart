List<Bubble> allBubbles = [
  Bubble(1, 'text 1', true, 1),
  Bubble(2, 'text 2', true, 3)
];

class Bubble {
  final int id;
  String text;
  bool isAnonymous;
  int category;

  Bubble(this.id, this.text, this.isAnonymous, this.category);

  void addBubble() {
    allBubbles.add(this);
  }

  static List<Bubble> fetchAll() {
    return allBubbles;
  }
  // static List<Bubble> fetchAll() {
  //   return [
  //     Bubble(1, 'text 1', true, 1),
  //     Bubble(2, 'text 2', true, 3)
  //   ];
  // }

  static Bubble fetchByID(int bubbleID) {
    List<Bubble> bubbles = Bubble.fetchAll();
    for (var i = 0; i < bubbles.length; i++) {
      if (bubbles[i].id == bubbleID) {
        return bubbles[i];
      }
    }
    return null;
  }
}
