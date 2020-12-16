import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'globals.dart';

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
  String _username;
  bool _isOrganization = false;

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

  Future<void> signUp() async {
    final formState = _formKey.currentState;
    UserCredential credential;
    // CollectionReference userDataCollection =  FirebaseFirestore.instance.collection("UserData");

    if (formState.validate()) {
      formState.save();
      try {
        print("Signing up");
        credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: _email, password: _password);
        FirebaseAuth.instance.currentUser.updateProfile(displayName: _username);

        DocumentReference ref = FirebaseFirestore.instance.doc("UserData/" + FirebaseAuth.instance.currentUser.uid);
        ref.set({'isOrganization': _isOrganization});
        // userDataCollection.add({'userId': FirebaseAuth.instance.currentUser.uid, <'isOrganization': _isOrganization}>);

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
    isOrganization = _isOrganization;
    UserCredential result = credential;
    if (credential != null) Navigator.pop(context, result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*resizeToAvoidBottomInset: false,*/
      appBar: AppBar(
        title: Text('Sign up'),
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width,
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: IntrinsicHeight(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.blue.shade50, Colors.blue.shade600],
                ),
              ),
              child: Center(
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.white, Colors.white],
                          ),
                        ),
                        /*height: 400,
                        width: 400,*/
                        padding: EdgeInsets.all(20.0),
                        margin: EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 300.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              showAlert(),
                              Text("Create an account"),
                              TextFormField(
                                validator: (input) {
                                  if (input.isEmpty) {
                                    return 'Please type an username';
                                  }
                                },
                                onSaved: (input) => _username = input,
                                decoration: InputDecoration(
                                  labelText: "Username",
                                ),
                              ),
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
                              Row(
                                children: [
                                  Checkbox(value: _isOrganization, onChanged: (bool value){
                                    setState(() {
                                      _isOrganization = value;
                                    });
                                  }),
                                  Text("Organization member")
                                ],
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
            ),
          ),
        ),
      ),
    );
  }
}
