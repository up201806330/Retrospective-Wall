import 'dart:async';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:glob/glob.dart';
import 'steps/bubble_creation_steps.dart';
import 'steps/list_of_bubbles_steps.dart';
import 'steps/anonymous_steps.dart';
import 'steps/like_dislike_steps.dart';

Future<void> main() {
  final config = FlutterTestConfiguration()
    ..features = [
      Glob(r"test_driver/features/like_dislike.feature")
    ] // ..features = [Glob(r"test_driver/features/**.feature")]
    ..reporters = [ProgressReporter()]
    ..stepDefinitions = [
      CheckGivenWidgets(),
      ClickNewBubble(),
      CheckIfPresentNewBubblePage(),
      CheckGivenWidgetsNew(),
      ChooseOnDropdown(),
      CheckField(),
      FillOutField(),
      ClickButton(),
      CheckUpload(),
      ThenAllBubblesCategory(),
      ThenRegisterAnonymous(),
      ThenLike(),
      ThenDislike(),
      GivenBubblePage()
    ]
    ..restartAppBetweenScenarios = true
    ..targetAppPath = "test_driver/app.dart"
    ..exitAfterTestRun = true;
  return GherkinRunner().execute(config);
}
