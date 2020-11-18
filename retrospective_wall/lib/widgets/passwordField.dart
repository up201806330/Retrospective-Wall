import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  @override
  _PasswordFieldState createState() => _PasswordFieldState();

  bool passwordVisible = false;
}

class _PasswordFieldState extends State<PasswordField> {
  TextEditingController controllerPassword = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: !widget.passwordVisible,
      controller: controllerPassword,
      decoration: InputDecoration(
          labelText: "Password",
          prefixIcon: Icon(Icons.security),
          suffixIcon: IconButton(
            icon: Icon(
              Icons.remove_red_eye,
              color: widget.passwordVisible ? Colors.blue : Colors.grey,
            ),
            onPressed: () {
              setState(() => widget.passwordVisible = !widget.passwordVisible);
            },
          )),
    );
  }
}
