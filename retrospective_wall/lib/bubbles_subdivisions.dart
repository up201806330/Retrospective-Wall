import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'app.dart';
import 'bubble.dart';
import 'globals.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BubblesSubdivision extends StatefulWidget {
  @override
  _BubblesSubdivision createState() => _BubblesSubdivision();

  UserCredential user;
}

class _BubblesSubdivision extends State<BubblesSubdivision> {
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

  Widget logoutMessage() {
    if (widget.user != null) {
      return Container(
        child: Center(
            child: Text(
          "Logged in as " + widget.user.user.displayName,
          textAlign: TextAlign.center,
        )),
        height: 50,
        width: 120,
      );
    }
  }

  Widget logoutButton() {
    return Column(
      children: [
        logoutMessage(),
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
            key: Key("LoginButton"),
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

  Widget signInsignOut() {
    if (!isLoggedIn) {
      return FlatButton(
        key: Key("SignInButton"),
        child: Text('Sign in'),
        onPressed: () {
          _onLoginPress(context);
        },
      );
    } else
      return Row(
        children: [
          logoutMessage(),
          FlatButton(
              child: Text("Logout"),
              onPressed: () {
                _onLogoutPress(context);
              }),
        ],
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: Key("HomePage"),
        appBar: AppBar(
          title: Text('Categories'),
          actions: [signInsignOut()],
        ),
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.blue.shade50, Colors.blue.shade600])),
            child: SafeArea(
              child: Column(
                children: [
                  Center(
                      child: Column(
                    children: [
                      SizedBox(height: 1),
                      InkWell(
                        child: Container(
                          child: GestureDetector(
                            child: Text("Wishes",
                                style: Theme.of(context).textTheme.bodyText2),
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
                            key: Key("AppreciationsButton"),
                            child: Text("Appreciations",
                                style: Theme.of(context).textTheme.bodyText2),
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
                      SizedBox(height: 1),
                      Container(
                        height: 50,
                        child: ElevatedButton(
                          key: Key("newBubbleButton"),
                          onPressed: () {
                            _onNewBubblePress(context);
                          },
                          child: Text(
                            "New Bubble",
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                      ),
                    ],
                  )),
                ],
              ),
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
      await Navigator.pushNamed(context, BubbleNewRoute);
    }
  }

  _onLoginPress(BuildContext context) async {
    final result = await Navigator.pushNamed(context, LoginRoute);

    if (result == null) {
      isLoggedIn = false;
      return;
    }
    setState(() {
      isLoggedIn = true;
      widget.user = result;
    });
  }

  _onLogoutPress(BuildContext context) {
    FirebaseAuth.instance.signOut();
    setState(() {
      isLoggedIn = false;
    });
  }

  _onSignupPress(BuildContext context) async {
    final result = await Navigator.pushNamed(context, SignupRoute);

    if (result == null) {
      isLoggedIn = false;
      return;
    }
    setState(() {
      isLoggedIn = true;
      widget.user = result;
    });
  }
}
