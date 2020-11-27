import 'package:flutter/material.dart';
import 'package:retrospective_wall/bubbles_subdivisions.dart';
import 'package:retrospective_wall/login.dart';
import 'package:retrospective_wall/style.dart';
import 'package:retrospective_wall/subdivision_detail.dart';
import 'bubble_detail.dart';
import 'bubble_new.dart';
import 'package:retrospective_wall/signup.dart';

const LoginRoute = '/login';
const SignupRoute = '/signup';
const BubbleDetailRoute = '/subdivision_detail/bubble_detail';
const BubbleNewRoute = '/bubble_new';
const SubdivisionDetailRoute = '/subdivision_detail';
const BubblesSubdivisionRoute = '/';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          screen = BubbleDetail(arguments['id']);
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
