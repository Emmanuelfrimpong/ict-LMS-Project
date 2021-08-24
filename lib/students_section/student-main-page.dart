import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ict_lms/public_files/application_colors.dart';
import 'package:ict_lms/public_files/navigation_service.dart';
import 'package:ict_lms/students_section/complaints-page/students-complaints-all-screen.dart';
import 'package:ict_lms/students_section/components/page-title-bar.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import 'components/drawer.dart';
import 'home-page/home-big-screen.dart';
import 'home-page/home-mobile.dart';
import 'components/student-screen-type.dart';
import 'lessons-page/student-lesson-all-screen.dart';
import 'quizzes-page/student-quiz-all-screens.dart';

class StudentMainPage extends StatefulWidget {
  StudentMainPage({Key key}) : super(key: key);

  @override
  _StudentMainPageState createState() => _StudentMainPageState();
}

class _StudentMainPageState extends State<StudentMainPage> {
  final GlobalKey<ScaffoldState> drawerKey = new GlobalKey<ScaffoldState>();
  bool isTransparent = true;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer<NavigationService>(
      builder: (context, value, child) {
        return Scaffold(
          backgroundColor: Colors.white70,
          key: drawerKey,
          drawer: DrawerPage(),
          body: SafeArea(
            child: Column(
              children: [
               TitleBar(
                 drawerKey: drawerKey,
                 title: value.getTitle,
               ),
                Expanded(
                    child: value.getStudentSelectedPage == StudentPages.Home
                        ? StudentsScreenTypePage(
                            tablet: StudentHomeBig(),
                            desktop: StudentHomeBig(),
                            mobile: StudentHomeMobile(),
                          )
                        : value.getStudentSelectedPage == StudentPages.Lessons
                            ? StudentsScreenTypePage(
                                tablet: StudentLessons(),
                                desktop: StudentLessons(),
                                mobile: StudentLessons(),
                              )
                            : value.getStudentSelectedPage == StudentPages.Quiz
                                ? StudentsScreenTypePage(
                                    tablet: StudentQuizzes(),
                                    desktop: StudentQuizzes(),
                                    mobile: StudentQuizzes(),
                                  )
                                : value.getStudentSelectedPage ==
                                        StudentPages.Complaints
                                    ? StudentsScreenTypePage(
                                        tablet: StudentsComplains(),
                                        desktop: StudentsComplains(),
                                        mobile: StudentsComplains(),
                                      )
                                    : Container()),
              ],
            ),
          ),
        );
      },
    );
  }
}
