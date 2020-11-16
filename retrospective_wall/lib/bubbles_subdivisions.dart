import 'package:flutter/material.dart';
import 'package:retrospective_wall/subdivision_detail.dart';
import 'app.dart';
import 'bubble.dart';

class BubblesSubdivision extends StatefulWidget {
  @override
  _BubblesSubdivision createState() => _BubblesSubdivision();
}

class _BubblesSubdivision extends State<BubblesSubdivision> {
  void addBubble(Bubble b) {
    allBubbles.add(b);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Categories'),
        ),
        body: SafeArea(
            child: Column(
          children: [
            Center(
                child: Column(
              children: [
                Container(
                  child: GestureDetector(
                    child: Text("Wishes",
                        style: Theme.of(context).textTheme.bodyText2),
                    onTap: () => _onSubdivisionTap(
                      context,
                      1,
                    ),
                  ),
                  margin: new EdgeInsets.all(20.0),
                  padding: new EdgeInsets.all(20.0),
                  alignment: Alignment(0.0, 0.3),
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  child: GestureDetector(
                    child: Text("Risks",
                        style: Theme.of(context).textTheme.bodyText2),
                    onTap: () => _onSubdivisionTap(context, 2),
                  ),
                  margin: new EdgeInsets.all(20.0),
                  padding: new EdgeInsets.all(20.0),
                  alignment: Alignment(0.0, 0.3),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  child: GestureDetector(
                    child: Text("Appreciations",
                        style: Theme.of(context).textTheme.bodyText2),
                    onTap: () => _onSubdivisionTap(context, 3),
                  ),
                  margin: new EdgeInsets.all(20.0),
                  padding: new EdgeInsets.all(20.0),
                  alignment: Alignment(0.0, 0.3),
                  decoration: BoxDecoration(
                    color: Colors.lightGreen,
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  child: GestureDetector(
                    child: Text("Puzzles",
                        style: Theme.of(context).textTheme.bodyText2),
                    onTap: () => _onSubdivisionTap(context, 4),
                  ),
                  margin: new EdgeInsets.all(20.0),
                  padding: new EdgeInsets.all(20.0),
                  alignment: Alignment(0.0, 0.3),
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    _onNewBubblePress(context);
                  },
                  child: Text("New Bubble"),
                ),
              ],
            )),
          ],
        )));
  }

  _onSubdivisionTap(BuildContext context, int category) {
    Navigator.pushNamed(context, SubdivisionDetailRoute,
        arguments: {'category': category});
  }

  _onNewBubblePress(BuildContext context) async {
    final result = await Navigator.pushNamed(context, BubbleNewRoute);

    if (result != null) {
      setState(() {
        addBubble(result);
      });
    }
  }
}
