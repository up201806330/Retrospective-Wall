import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:retrospective_wall/globals.dart';

class CheckGivenWidgets extends Given1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String input1) async {
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
    final newBubbleFinder = find.byValueKey(input1);
    await FlutterDriverUtils.tap(world.driver, newBubbleFinder);
  }

  @override
  RegExp get pattern => RegExp(r"I tap the {string} button");
}

class CheckIfPresentNewBubblePage extends Then1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String input) async {
    final homepageFinder = find.byValueKey(input);
    await FlutterDriverUtils.isPresent(world.driver, homepageFinder);
  }

  @override
  RegExp get pattern => RegExp(r"I should have {string} on screen");
}

class CheckGivenWidgetsNew extends Given1WithWorld<String, FlutterWorld> {
  navigateToNewBubblePage() async {
    final loginButtonFinder = find.byValueKey("SignInButton");

    await FlutterDriverUtils.tap(world.driver, loginButtonFinder);

    final emailFinder = find.byValueKey("LoginEmailField");
    final passwordFinder = find.byValueKey("LoginPasswordField");

    await FlutterDriverUtils.enterText(
        world.driver, emailFinder, "jeff@gmail.com");

    await FlutterDriverUtils.enterText(
        world.driver, passwordFinder, "password123");

    final signinButton = find.byValueKey("SignInButtonPage");

    await FlutterDriverUtils.tap(world.driver, signinButton);

    final newBubbleFinder = find.byValueKey("newBubbleButton");

    await FlutterDriverUtils.tap(world.driver, newBubbleFinder);
  }

  @override
  Future<void> executeStep(String input1) async {
    if (input1 == "NewBubblePage") await navigateToNewBubblePage();
    final newBubbleFinder = find.byValueKey(input1);
    final bool login = isLoggedIn;
    if (login)
      await FlutterDriverUtils.isPresent(world.driver, newBubbleFinder);
    else
      return false;
  }

  @override
  RegExp get pattern => RegExp(r"that attendee Manuel is on the {string}");
}

class ChooseOnDropdown extends When2WithWorld<String, String, FlutterWorld> {
  @override
  Future<void> executeStep(String input1, String input2) async {
    final dropdownFinder = find.byValueKey(input2);
    final dropdownItemFinder = find.byValueKey(input1);
    await FlutterDriverUtils.tap(world.driver, dropdownFinder);
    await FlutterDriverUtils.tap(world.driver, dropdownItemFinder);
  }

  @override
  RegExp get pattern => RegExp(r"they choose {string} from the {string}");
}

class CheckField extends And2WithWorld<String, String, FlutterWorld> {
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

class FillOutField extends And2WithWorld<String, String, FlutterWorld> {
  @override
  Future<void> executeStep(String input1, String input2) async {
    final fieldFinder = find.byValueKey(input1);
    await FlutterDriverUtils.enterText(world.driver, fieldFinder, input2);
  }

  @override
  RegExp get pattern => RegExp(r"they fill out the {string} with {string}");
}

class ClickButton extends And1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String input1) async {
    final buttonFinder = find.byValueKey(input1);
    await FlutterDriverUtils.tap(world.driver, buttonFinder);
  }

  @override
  RegExp get pattern => RegExp(r"they tap the {string}");
}

class CheckUpload extends ThenWithWorld<FlutterWorld> {
  @override
  Future<void> executeStep() async {}

  @override
  RegExp get pattern => RegExp(r"the app uploads the feedback they just wrote");
}
