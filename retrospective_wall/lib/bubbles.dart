import 'package:flutter/material.dart';
import 'app.dart';
import 'bubble.dart';

class Bubbles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bubbles = Bubble.fetchAll();

    return Scaffold(
      appBar: AppBar(
        title: Text('FeedBack Bubbles'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                _onNewBubblePress(context);
                // Bubble b = createBubble(controller.text, isAnonymous, _value);
                // Navigator.pop(context, b);
              },
              child: Text("New Bubble"),
            ),
            Container(
              height: 200,
              child: ListView(
              children:
                bubbles.map( (bubble) => GestureDetector(
                  child: Text(bubble.category.toString()),
                  onTap: () => _onBubbleTap(context, bubble.id),
                ))
                .toList(),
              ),
            )
          ],
          
        )
        
        
        
      )
    );
  }

  _onBubbleTap(BuildContext context, int bubbleID) {
    Navigator.pushNamed(context, BubbleDetailRoute, arguments: {'id': bubbleID});
  }

  _onNewBubblePress(BuildContext context) {
    Navigator.pushNamed(context, BubbleNewRoute);
    
  }

}