import 'package:flutter/material.dart';
import 'app.dart';
import 'bubble.dart';

class Bubbles extends StatefulWidget {
  @override
  _Bubbles createState() => _Bubbles();
}

class _Bubbles extends State<Bubbles> {

  @override
  Widget build(BuildContext context) {
    final bubbles = [];

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
              },
              child: Text("New Bubble"),
            ),
            Column(children: [
              Container(
                padding: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 16.0),
                height: 500,
                child: ListView(
                  children: bubbles
                      .map((bubble) => GestureDetector(
                            child: Text(bubble.text,
                                style: Theme.of(context).textTheme.bodyText2),
                            onTap: () => _onBubbleTap(context, bubble.id),
                          ))
                      .toList(),
                ),
              )
            ])
          ],
        )));
  }

  _onBubbleTap(BuildContext context, String bubbleID) {
    Navigator.pushNamed(context, BubbleDetailRoute,
        arguments: {'id': bubbleID});
  }

  _onNewBubblePress(BuildContext context) async {
      await Navigator.pushNamed(context, BubbleNewRoute);
    }
}

