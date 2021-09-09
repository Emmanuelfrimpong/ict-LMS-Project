import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ict_lms/models/lessons-data.dart';
import 'package:ict_lms/public_files/application_colors.dart';
import 'package:ict_lms/routing/route_names.dart';
import 'package:ict_lms/students_section/components/course-item.dart';

class StudentLessons extends StatefulWidget {
  const StudentLessons({Key key}) : super(key: key);

  @override
  _StudentLessonsState createState() => _StudentLessonsState();
}

class _StudentLessonsState extends State<StudentLessons> {
  List<Lessons> incomingLessons;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    incomingLessons = listOfLessons;

  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
            children: incomingLessons
                .map((e) => CourseItem(
                      type: 'lesson',
                      title: e.title,
                      description: e.description,
                      lesson: e.lessonNumber,
                      createdOn: e.createdOn,
                      onPress: () {
                        setState(() {
                          Navigator.of(context).pushNamed(
                            MyRouts.routeFromSlug(e.lessonNumber.replaceAll(new RegExp(r"\s+"), "").toLowerCase()),
                          );
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
    );
  }
}
