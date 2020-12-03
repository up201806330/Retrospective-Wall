import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:retrospective_wall/app.dart';

// teste@gmail.com    teste123

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController controllerUsername = new TextEditingController();
  TextEditingController controllerPassword = new TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email;
  String _password;
  String _error;

  Widget showAlert() {
    if (_error != null) {
      return Container(
          color: Colors.amber,
          width: double.infinity,
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: [
              Icon(Icons.error_outline_sharp),
              Expanded(child: Text(_error, style: TextStyle(fontSize: 15.0))),
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

  _onBackPressed() {
    Navigator.pop(context, null);
  }

  Future<void> signIn() async {
    final formState = _formKey.currentState;
    UserCredential credential;
    if (formState.validate()) {
      formState.save();
      try {
        print("Logging in");
        credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
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
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.cyan, Colors.cyanAccent],
              ),
            ),
            height: 400,
            width: 400,
            padding: EdgeInsets.all(20.0),
            margin: EdgeInsets.all(20.0),
            child: Center(
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
                    ElevatedButton(
                      onPressed: signIn,
                      child: Text("Sign in"),
                    ),
                    InkWell(
                        child: new Text('Create an account',
                            style: TextStyle(
                              color: Colors.black,
                              decoration: TextDecoration.underline,
                              fontSize: 20.0,
                            )),
                        onTap: () {
                          Navigator.pushNamed(context, SignupRoute);
                        }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
