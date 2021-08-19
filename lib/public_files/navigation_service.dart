import 'package:flutter/material.dart';

class NavigationService with ChangeNotifier {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  String title = 'Home';
  void navigateTo(String routeName, String txt) {
    title = txt;
    navigatorKey.currentState.pushNamed(routeName);
    notifyListeners();
  }

  void goBack(String txt) {
    title = txt;
     navigatorKey.currentState.pop();
     notifyListeners();
  }

  GlobalKey<NavigatorState> get getKey => navigatorKey;
  String get getTitle => title;
}
