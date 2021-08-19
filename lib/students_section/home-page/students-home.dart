import 'package:flutter/material.dart';
import 'package:ict_lms/students_section/home-page/home-big-screen.dart';
import 'package:ict_lms/students_section/home-page/home-mobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class StudentsHomePage extends StatefulWidget {
  const StudentsHomePage({Key key}) : super(key: key);

  @override
  _StudentsHomePageState createState() => _StudentsHomePageState();
}

class _StudentsHomePageState extends State<StudentsHomePage> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: StudentHomeMobile(),
      tablet: StudentHomeBig(),
      desktop: StudentHomeBig(),
    );
  }
}
