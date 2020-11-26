import 'package:flutter/material.dart';
import 'widgets/passwordField.dart';

class LoginSignup extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginSignup> {
  TextEditingController controllerHeading = new TextEditingController();
  TextEditingController controllerText = new TextEditingController();

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
                height: 200,
                width: 200,
                padding: EdgeInsets.all(20.0),
                margin: EdgeInsets.all(20.0),
                child: Center(
                  child: Column(
                    children: [
                      Text("Username: "),
                      PasswordField(),
                      Text("Submit"),
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
