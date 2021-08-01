import 'package:flutter/material.dart';
import 'package:ict_lms/administrator_section/main_pages/dashboard_screen.dart';
import 'package:ict_lms/public_files/controllers/MenuController.dart';
import 'package:ict_lms/public_files/responsive.dart';
import 'package:provider/provider.dart';
import 'components/side_menu.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  (Responsive.isDesktop(context))? Scaffold(
      key: context.read<MenuController>().scaffoldKey,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
              Expanded(
                child: SideMenu(),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: DashboardScreen(),
            ),
          ],
        ),
      ),
    ): Scaffold(
      key: context.read<MenuController>().scaffoldKey,
      drawer: SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           // We want this side menu only for large screen
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: DashboardScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
