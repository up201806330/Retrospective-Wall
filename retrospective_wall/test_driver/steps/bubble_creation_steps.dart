import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:retrospective_wall/globals.dart';

class CheckGivenWidgets extends Given1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String input1) async {
    print("Test Given!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    final newBubbleFinder = find.byValueKey(input1);
    final bool login = isLoggedIn;
    if (login)
      await FlutterDriverUtils.isPresent(world.driver, newBubbleFinder);
    else
      return false;
  }

  @override
  RegExp get pattern => RegExp(r"I have {string} and user is logged in");
}

class ClickNewBubble extends When1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String input1) async {
    print(
        "TestWhen!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    final newBubbleFinder = find.byValueKey(input1);
    await FlutterDriverUtils.tap(world.driver, newBubbleFinder);
  }

  @override
  RegExp get pattern => RegExp(r"I tap the {string} button");
}

class CheckIfPresentHomePage extends Then1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String input) async {
    final homepageFinder = find.byValueKey(input);
    await FlutterDriverUtils.isPresent(world.driver, homepageFinder);
  }

  @override
  RegExp get pattern => RegExp(r"I should have {string} on screen");
}
