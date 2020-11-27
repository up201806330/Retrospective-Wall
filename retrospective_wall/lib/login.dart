import 'package:flutter/material.dart';
import 'widgets/passwordField.dart';
import 'widgets/usernameField.dart';

class LoginSignup extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginSignup> {
  TextEditingController controllerHeading = new TextEditingController();
  TextEditingController controllerText = new TextEditingController();

  _onLoginPressed() {
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
                      UsernameField(),
                      PasswordField(),
                      ElevatedButton(
                          onPressed: () {
                            _onLoginPressed();
                          },
                          child: Text("Login")),
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
