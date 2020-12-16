import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:retrospective_wall/app.dart';

import 'globals.dart';

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
    bool _isOrganization;
    if (formState.validate()) {
      formState.save();
      try {
        print("Logging in");
        credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        // var document = FirebaseFirestore.instance.doc('UserData')
        // collection('UserData').where('userId', isEqualTo: credential.user.uid).snapshots();

        DocumentSnapshot variable = await FirebaseFirestore.instance.collection('UserData').doc(credential.user.uid).get();

        _isOrganization = variable['isOrganization'];


      } on FirebaseAuthException catch (e) {
        credential = null;
        _isOrganization = false;
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
    // isOrganization = true;
    print("idk");
    print(_isOrganization);
    UserCredential result = credential;
    if (credential != null) Navigator.pop(context, result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log In'),
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
                        child: Center(
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                showAlert(),
                                Text("Log In To Your Account"),
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
                                SizedBox(height: 30),
                                ElevatedButton(
                                  onPressed: signIn,
                                  child: Text("Sign in"),
                                ),
                                SizedBox(height: 30),
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
