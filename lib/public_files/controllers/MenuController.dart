import 'package:flutter/material.dart';
import 'package:ict_lms/main.dart';

class MenuController extends ChangeNotifier {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  void controlMenu() {
    if (!_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openDrawer();
    }
  }
  SelectedPage selectedPage=SelectedPage.DashBoard;
  String dashboard_title='DashBoard';
  void controlSelectedPage(SelectedPage page,String title) {
    selectedPage=page;
    if(title.isNotEmpty){
      dashboard_title=title;
    }
    notifyListeners();
  }
  SelectedPage get getSelectedPage=>selectedPage;
  String get title=>dashboard_title;
}
