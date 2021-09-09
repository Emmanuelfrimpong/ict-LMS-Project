import 'package:flutter/material.dart';
import 'package:ict_lms/administrator_section/main_pages/main_screen.dart';
import 'package:ict_lms/models/lessons-data.dart';
import 'package:ict_lms/models/quiz-data.dart';
import 'package:ict_lms/public_files/authentication/starup-page.dart';
import 'package:ict_lms/students_section/lessons-page/view-lessons/view-lessons-main-page.dart';
import 'package:ict_lms/students_section/quizzes-page/quiz-view/view-quiz.dart';
import 'package:ict_lms/students_section/student-main-page.dart';
import 'route_names.dart';

class RouteConfiguration {
  /// List of [Path] to for route matching. When a named route is pushed with
  /// [Navigator.pushNamed], the route name is matched with the [Path.pattern]
  /// in the list below. As soon as there is a match, the associated builder
  /// will be returned. This means that the paths higher up in the list will
  /// take priority.
  static List<Path> paths = [
    Path(
      r'^' + MyRouts.baseRoute + r'/([\w-]+)$',
      (context, match) => getLessonPage(match),
    ),
    Path(
      r'^' + MyRouts.baseQuizRoute + r'/([\w-]+)$',
          (context, match) => getQuizPage(match),
    ),

    Path(
      r'^' + MyRouts.homeRout,
      (context, match) => StudentMainPage(),
    ),
    Path(
      r'^' + MyRouts.adminHome,
          (context, match) => MainScreen(),
    ),

    Path(
      r'^' + MyRouts.authRout,
      (context, match) => StartupPage(),
    ),
  ];

  /// The route generator callback used when the app is navigated to a named
  /// route. Set it on the [MaterialApp.onGenerateRoute] or
  /// [WidgetsApp.onGenerateRoute] to make use of the [paths] for route
  /// matching.
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    for (Path path in paths) {
      final regExpPattern = RegExp(path.pattern);
      if (regExpPattern.hasMatch(settings.name)) {
        final firstMatch = regExpPattern.firstMatch(settings.name);
        final match = (firstMatch.groupCount == 1) ? firstMatch.group(1) : null;
        return MaterialPageRoute<void>(
          builder: (context) => path.builder(context, match),
          settings: settings,
        );
      }
    }

    // If no match was found, we let [WidgetsApp.onUnknownRoute] handle it.
    return null;
  }
}

class Path {
  const Path(this.pattern, this.builder);

  /// A RegEx string for route matching.
  final String pattern;

  /// The builder for the associated pattern route. The first argument is the
  /// [BuildContext] and the second argument is a RegEx match if it is
  /// included inside of the pattern.
  final Widget Function(BuildContext, String) builder;
}

Widget getLessonPage(String url) {
  for (Lessons lesson in listOfLessons) {
    if (lesson.lessonNumber.replaceAll(new RegExp(r"\s+"), "").toLowerCase() == url) {
      return ViewLessonMainPage(lessons: lesson);
    }
  }
  return Scaffold(
    body: SafeArea(
      child: Center(child: Text('Lesson Not found')),
    ),
  );
}

Widget getQuizPage(String url) {
  for (Quizzes quiz in quizzes) {
    if (quiz.quizNumber.replaceAll(new RegExp(r"\s+"), "").toLowerCase() == url) {
      return ViewQuizPage(quizzes:quiz);
    }
  }
  return Scaffold(
    body: SafeArea(
      child: Center(child: Text('Lesson Not found')),
    ),
  );
}
