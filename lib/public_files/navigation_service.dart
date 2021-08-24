import 'package:flutter/material.dart';

import '../main.dart';

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


  StudentPages studentSelectedPage=StudentPages.Home;
  StudentPages get getStudentSelectedPage=>studentSelectedPage;
  void updateStudentPage(StudentPages newPage,String new_title){
    if(newPage!=null){
      studentSelectedPage=newPage;
      title=new_title;
    }
    notifyListeners();
  }
}
