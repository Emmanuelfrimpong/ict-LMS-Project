import 'package:flutter/material.dart';
import 'package:ict_lms/public_files/application_colors.dart';
import 'package:ict_lms/administrator_section/admin-auth.dart';
import 'package:ict_lms/students_section/students_login.dart';

import '../responsive.dart';
import 'startup/components/side-page.dart';

class StartupPage extends StatefulWidget {
  const StartupPage({Key key}) : super(key: key);

  @override
  _StartupPageState createState() => _StartupPageState();
}

class _StartupPageState extends State<StartupPage> {
  String isWho = 'Student';
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColor.withOpacity(.6),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/logo.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Center(
              child: Card(
                elevation: 10,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                          bottomRight: Radius.circular(40))),
                  width: Responsive.isDesktop(context)
                      ? size.width * .7
                      : size.width,
                  height: size.height*.8,
                  //height: Responsive.isMobile(context)?size.height:size.height*.8,
                  child: Responsive.isMobile(context)
                      ? SingleChildScrollView(
                          child: Column(
                            children: [],
                          ),
                        )
                      : Row(
                          children: [
                            StartUpSide(
                              width: size.width * .35,
                              height: size.height,
                              isStudent: isWho=='Student'?true:false,
                              onStudent: () {
                                setState(() {
                                  isWho = 'Student';
                                });
                              },
                              onTeacher: () {
                                setState(() {
                                  isWho = 'Teacher';
                                });
                              },
                            ),
                            if (isWho == 'Teacher')
                              Expanded(
                                child: AdminAuth(
                                  width: size.width * .35,
                                ),
                              ),
                            if (isWho == 'Student') Expanded(child: StudentsLogin())
                          ],
                        ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
