import 'package:flutter_driver/driver_extension.dart';
import 'package:retrospective_wall/controller/app.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
// This line enables the extension.
  enableFlutterDriverExtension();
  await Firebase.initializeApp();
  runApp(App());
}
