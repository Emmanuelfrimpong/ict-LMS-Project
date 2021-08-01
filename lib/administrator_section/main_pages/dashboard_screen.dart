import 'package:flutter/material.dart';
import 'package:ict_lms/administrator_section/dashboard/dashboard_page.dart';
import 'package:ict_lms/administrator_section/students/students_table.dart';
import 'package:ict_lms/main.dart';
import 'package:ict_lms/public_files/Constant_Data.dart';
import 'package:ict_lms/public_files/controllers/MenuController.dart';
import 'package:provider/provider.dart';
import '../dashboard/components/header.dart';


class DashboardScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Consumer<MenuController>(builder: (context, value, child) {
      return SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              Header(),
              SizedBox(height: defaultPadding),
              value.getSelectedPage==SelectedPage.DashBoard?
                  DashBoard():
                  value.getSelectedPage==SelectedPage.Students?StudentTable():
              Container()
            ],
          ),
        ),
      );
    });
  }
}
