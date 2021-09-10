import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ict_lms/models/quiz-data.dart';
import 'package:ict_lms/public_files/application_colors.dart';
import 'package:ict_lms/public_files/controllers/utils.dart';
import 'package:ict_lms/public_files/custom-dailog.dart';
import 'package:ict_lms/public_files/responsive.dart';
import 'package:ict_lms/routing/route_names.dart';
import 'package:ict_lms/students_section/components/quiz-itme.dart';

class StudentQuizzes extends StatefulWidget {
  const StudentQuizzes({Key key}) : super(key: key);

  @override
  _StudentQuizzesState createState() => _StudentQuizzesState();
}

class _StudentQuizzesState extends State<StudentQuizzes> {
  List<Quizzes> incomingQuizzes = quizzes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'add some information here',
                    style: GoogleFonts.lato(color: primaryColor),
                  ),
                  Wrap(
                    children: incomingQuizzes
                        .map((e) => QuizItem(
                              quiz: e,
                              onPress: () {
                                setState(() {
                                  DateTime startDate =
                                      DateTime.fromMillisecondsSinceEpoch(e.startTime);
                                  DateTime endDate = DateTime.fromMillisecondsSinceEpoch(e.endTime);
                                  var diff = DateTime.now().difference(startDate);
                                  var endDiff = DateTime.now().difference(endDate);
                                  if (diff < Duration.zero) {
                                    KTDialog(
                                      context,
                                      ktDialogType: KTDialogType.Info,
                                      title: 'Quiz Time',
                                      contentText:
                                          'Please it is not time for the Quiz.\n Quiz will start in ${readTimeLeft(e.startTime)}',
                                      btn1Text: 'Okay',
                                      btn1Press: () {
                                        Navigator.pop(context);
                                      },
                                    ).show();
                                  } else if (endDiff > Duration.zero) {
                                    KTDialog(
                                      context,
                                      ktDialogType: KTDialogType.Info,
                                      title: 'Quiz Time',
                                      contentText:
                                          'Please the Quiz is no more available.\n The quiz ended ${readTimeLeft(e.endTime)}',
                                      btn1Text: 'Okay',
                                      btn1Press: () {
                                        Navigator.pop(context);
                                      },
                                    ).show();
                                  } else {
                                    Navigator.of(context).pushNamed(
                                      MyRouts.routeFromQuizzes(e.quizNumber
                                          .replaceAll(new RegExp(r"\s+"), "")
                                          .toLowerCase()),
                                    );
                                  }
                                });
                              },
                            ))
                        .toList(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          if(!Responsive.isMobile(context))
          Container(
            width: 200,
            decoration: BoxDecoration(border: Border.all(color: primaryColor)),
            padding: EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'Recent Scores',
                    style: GoogleFonts.lato(
                        decoration: TextDecoration.underline,
                        color: primaryColor.withOpacity(.7),
                        fontWeight: FontWeight.bold),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                      itemCount: 4,
                      itemBuilder: (context, int index) {
                        return ListTile(
                          title: Text('Introduction to computer.',style: GoogleFonts.lato(color: primaryColor,fontSize: 12),),
                        subtitle: Column(
                          children: [
                            SizedBox(height: 5,),
                            Row(
                              children: [
                                Text('Scores: 25/40',style: GoogleFonts.lato(color: primaryColor,fontSize: 12),),
                              ],
                            ),
                            SizedBox(height: 5,),
                            Row(
                              children: [
                                Text('Time Used: 45Minute',style: GoogleFonts.lato(color: primaryColor,fontSize: 12),),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Text('Date: Aug 25, 2021',style: GoogleFonts.lato(color: primaryColor,fontSize: 12),),
                              ],
                            ),
                            Divider(color: primaryColor,)
                          ],
                        ),
                        );
                      })
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
