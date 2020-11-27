import 'package:flutter/material.dart';
import 'app.dart';
import 'bubble.dart';
import 'globals.dart';

class BubblesSubdivision extends StatefulWidget {
  @override
  _BubblesSubdivision createState() => _BubblesSubdivision();
}

class _BubblesSubdivision extends State<BubblesSubdivision> {
  void addBubble(Bubble b) {
    allBubbles.add(b);
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Not Logged in!"),
      content: Text("You have to be logged in to create a new bubble."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Widget logoutButton() {
    return Column(
      children: [
        Text("Logged in!"),
        ElevatedButton(
            child: Text("Logout"),
            onPressed: () {
              _onLogoutPress(context);
            }),
      ],
    );
  }

  Widget loginSignupButtons() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              _onLoginPress(context);
            },
            child: Text("Login"),
          ),
          ElevatedButton(
            onPressed: () {
              _onSignupPress(context);
            },
            child: Text("Signup"),
          ),
        ],
      ),
    );
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
                InkWell(
                  child: Container(
                    child: GestureDetector(
                      child: Text("Wishes",
                          style: Theme.of(context).textTheme.bodyText2),
                      // onTap: () => _onSubdivisionTap(
                      //   context,
                      //   1,
                      // ),
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
                  onTap: () => _onSubdivisionTap(context, 1),
                ),
                InkWell(
                  child: Container(
                    child: GestureDetector(
                      child: Text("Risks",
                          style: Theme.of(context).textTheme.bodyText2),
                      // onTap: () => _onSubdivisionTap(context, 2),
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
                  onTap: () => _onSubdivisionTap(context, 2),
                ),
                InkWell(
                  child: Container(
                    child: GestureDetector(
                      child: Text("Appreciations",
                          style: Theme.of(context).textTheme.bodyText2),
                      // onTap: () => _onSubdivisionTap(context, 3),
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
                  onTap: () => _onSubdivisionTap(context, 3),
                ),
                InkWell(
                  child: Container(
                    child: GestureDetector(
                      child: Text("Puzzles",
                          style: Theme.of(context).textTheme.bodyText2),
                      // onTap: () => _onSubdivisionTap(context, 4),
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
                  onTap: () => _onSubdivisionTap(context, 4),
                ),
                ElevatedButton(
                  onPressed: () {
                    _onNewBubblePress(context);
                  },
                  child: Text("New Bubble"),
                ),
                ElevatedButton(
                    onPressed: () {
                      print(isLoggedIn);
                    },
                    child: Text("Teste")),
                isLoggedIn ? logoutButton() : loginSignupButtons(),
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
    if (!isLoggedIn) {
      showAlertDialog(context);
    } else {
      final result = await Navigator.pushNamed(context, BubbleNewRoute);

      if (result != null) {
        setState(() {
          addBubble(result);
        });
      }
    }
  }

  _onLoginPress(BuildContext context) async {
    print("Login");
    final result = await Navigator.pushNamed(context, LoginRoute);

    if (result == null) {
      isLoggedIn = false;
      return;
    }
    setState(() {
      isLoggedIn = result;
    });
  }

  _onLogoutPress(BuildContext context) {
    setState(() {
      isLoggedIn = false;
    });
  }

  _onSignupPress(BuildContext context) {
    Navigator.pushNamed(context, SignupRoute);
  }
}
