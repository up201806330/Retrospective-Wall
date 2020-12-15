import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

class ThenRegisterAnonymous extends ThenWithWorld<FlutterWorld> {
  @override
  Future<void> executeStep() async {}

  @override
  RegExp get pattern => RegExp(
      r"the app will register the new bubble without the user's information");
}

class CheckFieldNew extends When2WithWorld<String, String, FlutterWorld> {
  @override
  Future<void> executeStep(String input1, String input2) async {
    final action = input1;

    if (action == "check") {
      final checkboxFinder = find.byValueKey(input2);
      await FlutterDriverUtils.tap(world.driver, checkboxFinder);
    }
  }

  @override
  RegExp get pattern => RegExp(r"they {string} the {string}");
}
