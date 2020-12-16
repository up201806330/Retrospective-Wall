import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

class ThenLike extends ThenWithWorld<FlutterWorld> {
  @override
  Future<void> executeStep() async {}

  @override
  RegExp get pattern =>
      RegExp(r"the app updates the number of likes of the feedback");
}

class ThenDislike extends ThenWithWorld<FlutterWorld> {
  @override
  Future<void> executeStep() async {}

  @override
  RegExp get pattern =>
      RegExp(r"the app updates the number of dislikes of the feedback");
}

class GivenBubblePage extends GivenWithWorld<FlutterWorld> {
  navigateToBubblePage() async {
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

    final appreciationsFinder = find.byValueKey("AppreciationsButton");

    await FlutterDriverUtils.tap(world.driver, appreciationsFinder);

    final bubbleFinder = find.byValueKey("Bubble23d6Y");

    await FlutterDriverUtils.tap(world.driver, bubbleFinder);
  }

  @override
  Future<void> executeStep() async {
    await navigateToBubblePage();

    final likeFinder = find.byValueKey("LikeButton");
    final dislikeFinder = find.byValueKey("DislikeButton");

    await FlutterDriverUtils.isPresent(world.driver, likeFinder);
    await FlutterDriverUtils.isPresent(world.driver, dislikeFinder);
  }

  @override
  RegExp get pattern => RegExp(r"that attendee Manuel is on a bubble's page");
}
