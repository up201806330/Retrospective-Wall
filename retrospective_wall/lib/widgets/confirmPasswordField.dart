import 'package:flutter/material.dart';

class ConfirmPasswordField extends StatefulWidget {
  @override
  _ConfirmPasswordFieldState createState() => _ConfirmPasswordFieldState();

  bool passwordVisible = false;
  String password;
}

class _ConfirmPasswordFieldState extends State<ConfirmPasswordField> {
  TextEditingController controllerConfirmPassword = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: !widget.passwordVisible,
      controller: controllerConfirmPassword,
      decoration: InputDecoration(
          labelText: "Confirm Password",
          suffixIcon: IconButton(
            icon: Icon(
              Icons.remove_red_eye,
              color: widget.passwordVisible ? Colors.blue : Colors.grey,
            ),
            onPressed: () {
              setState(() => widget.passwordVisible = !widget.passwordVisible);
            },
          )),
      onSubmitted: (value) {
        setState(() {
          widget.password = controllerConfirmPassword.text;
        });
      },
    );
  }
}
