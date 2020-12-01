import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<FormFieldState> passwordKey = GlobalKey<FormFieldState>();

  String _email;
  String _password;
  String _error;

  _onSignupPressed() {
    // Write to database
    Navigator.pop(context, true);
  }

  _onBackPressed() {
    Navigator.pop(context, false);
  }

  Widget showAlert() {
    if (_error != null) {
      return Container(
          color: Colors.amber,
          width: double.infinity,
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: [
              Icon(Icons.error_outline_sharp),
              Expanded(child: Text(_error)),
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  setState(() {
                    _error = null;
                  });
                },
              )
            ],
          ));
    } else
      return SizedBox(
        height: 0,
      );
  }

  Future<void> signUp() async {
    final formState = _formKey.currentState;
    UserCredential credential;
    if (formState.validate()) {
      formState.save();
      try {
        print("Signing up");
        credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: _email, password: _password);
      } on FirebaseAuthException catch (e) {
        credential = null;
        setState(() {
          _error = e.message;
        });
        if (e.code == 'user-not-found') {
          print("No user found for that email");
        } else if (e.code == 'wrong-password') {
          print("Wrong password for that email");
        }
      }
    }
    if (credential != null) Navigator.pop(context, credential);
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
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      showAlert(),
                      TextFormField(
                        validator: (input) {
                          if (input.isEmpty) {
                            return 'Please type an email';
                          }
                        },
                        onSaved: (input) => _email = input,
                        decoration: InputDecoration(
                          labelText: "Email",
                        ),
                      ),
                      TextFormField(
                        key: passwordKey,
                        validator: (input) {
                          if (input.length < 6) {
                            return "Password too weak";
                          }
                        },
                        onSaved: (input) => _password = input,
                        decoration: InputDecoration(
                          labelText: "Password",
                        ),
                        obscureText: true,
                      ),
                      TextFormField(
                        validator: (input) {
                          var password = passwordKey.currentState.value;
                          if (input != password) {
                            return "Passwords do not match";
                          }
                        },
                        onSaved: (input) => _password = input,
                        decoration: InputDecoration(
                          labelText: "Confirm password",
                        ),
                        obscureText: true,
                      ),
                      ElevatedButton(
                        onPressed: signUp,
                        child: Text("Sign Up"),
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
