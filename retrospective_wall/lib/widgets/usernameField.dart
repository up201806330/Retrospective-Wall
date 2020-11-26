import 'package:flutter/material.dart';

class UsernameField extends StatefulWidget {
  @override
  _UsernameFieldState createState() => _UsernameFieldState();

  String username;
}

class _UsernameFieldState extends State<UsernameField> {
  TextEditingController controllerUsername = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controllerUsername,
      decoration: InputDecoration(
        labelText: "Username",
      ),
      onSubmitted: (value) {
        setState(() {
          widget.username = controllerUsername.text;
        });
      },
    );
  }
}
