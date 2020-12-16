import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Stats extends StatefulWidget {
  @override
  _Stats createState() => _Stats();
}
class _Stats extends State<Stats> {
  _Stats();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Send Push Notification'),
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.blue.shade50, Colors.blue.shade600]
              )
          ),
          child: SafeArea(
            child: Column(
              children: [
                Column(children: [

                ])
              ],
            ),
          ),
        ));
  }
}