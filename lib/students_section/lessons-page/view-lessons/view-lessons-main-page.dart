import 'package:flutter/material.dart';
import 'package:ict_lms/models/lessons-data.dart';
import 'package:ict_lms/public_files/responsive.dart';
import 'components/big-screen-view.dart';
import 'components/mobile-view.dart';

class ViewLessonMainPage extends StatelessWidget {
  final Lessons lessons;
  const ViewLessonMainPage({Key key, this.lessons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:Responsive(
          mobile: LessonMobileView(lesson: lessons,),
          desktop: LessonBigScreenView(lesson: lessons,),
          tablet: LessonBigScreenView(lesson: lessons,),
        )
      ),
    );
  }
}
