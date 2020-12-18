import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:retrospective_wall/model/bubble.dart';
import 'package:retrospective_wall/view/bubbles_subdivisions.dart';
import 'package:retrospective_wall/view/login.dart';
import 'package:retrospective_wall/view/stats.dart';
import 'package:retrospective_wall/style.dart';
import 'package:retrospective_wall/view/subdivision_detail.dart';
import '../view/bubble_detail.dart';
import '../view/bubble_new.dart';
import '../model/feedback_text.dart';
import 'package:retrospective_wall/view/signup.dart';

const LoginRoute = '/login';
const SignupRoute = '/login/signup';
const BubbleDetailRoute = '/subdivision_detail/bubble_detail';
const BubbleNewRoute = '/bubble_new';
const SubdivisionDetailRoute = '/subdivision_detail';
const BubblesSubdivisionRoute = '/';
const StatsRoute = '/subdivision_detail/stats';

User userInfo;

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    userInfo = null;
    return MaterialApp(
      onGenerateRoute: _routes(),
      theme: _theme(),
    );
  }

  RouteFactory _routes() {
    return (settings) {
      final Map<String, dynamic> arguments = settings.arguments;
      Widget screen;
      switch (settings.name) {
        case BubblesSubdivisionRoute:
          screen = BubblesSubdivision();
          break;
        case SubdivisionDetailRoute:
          screen = SubdivisionDetail(arguments['category']);
          break;
        case BubbleDetailRoute:
          screen = BubbleDetail(arguments['bubble']);
          break;
        case BubbleNewRoute:
          screen = BubbleNew();
          break;
        case LoginRoute:
          screen = Login();
          break;
        case SignupRoute:
          screen = Signup();
          break;
        case StatsRoute:
          screen = Stats();
          break;
        default:
          return null;
      }
      return MaterialPageRoute(builder: (BuildContext context) => screen);
    };
  }

  ThemeData _theme() {
    return ThemeData(
        appBarTheme: AppBarTheme(
          textTheme: TextTheme(headline6: AppBarTextStyle),
        ),
        textTheme: TextTheme(
          headline6: TitleTextStyle,
          bodyText2: Body1TextStyle,
        ));
  }
}
