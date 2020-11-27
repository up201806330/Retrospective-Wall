import 'package:flutter/material.dart';
import 'package:retrospective_wall/widgets/confirmPasswordField.dart';
import 'widgets/passwordField.dart';
import 'widgets/usernameField.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  Widget usernameField = new UsernameField();
  Widget passwordField = new PasswordField();
  Widget confirmPasswordField = new ConfirmPasswordField();

  _onSignupPressed() {
    // Write to database
    Navigator.pop(context, true);
  }

  _onBackPressed() {
    Navigator.pop(context, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            colors: [Colors.lightBlue, Colors.lightBlueAccent, Colors.blue],
          ),
        ),
        child: ListView(
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.cyan, Colors.cyanAccent],
                  ),
                ),
                height: 600,
                width: 400,
                padding: EdgeInsets.all(20.0),
                margin: EdgeInsets.all(20.0),
                child: Center(
                  child: Column(
                    children: [
                      usernameField,
                      passwordField,
                      confirmPasswordField,
                      ElevatedButton(
                          onPressed: () {
                            _onSignupPressed();
                          },
                          child: Text("Signup")),
                      ElevatedButton(
                        onPressed: () {
                          _onBackPressed();
                        },
                        child: Text("Back"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
