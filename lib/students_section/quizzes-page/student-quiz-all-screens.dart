import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ict_lms/public_files/application_colors.dart';
import 'package:ict_lms/students_section/components/course-item.dart';

class StudentQuizzes extends StatefulWidget {
  const StudentQuizzes({Key key}) : super(key: key);

  @override
  _StudentQuizzesState createState() => _StudentQuizzesState();
}

class _StudentQuizzesState extends State<StudentQuizzes> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10,),
          Text('add some information here',style: GoogleFonts.lato(color: primaryColor),),
          Wrap(
            children: [
              CourseItem(
                type: 'quiz',
                title: 'Quiz Title',
                description:
                "The default value for the direction argument is horizontal if we don't set it. That means Flutter will try to put an item in the same row or beside the previous item as long as the space in the same row is enough to place a new item, before moving to the next row if the space isn't enough.",
              ),
              CourseItem(
                  type: 'quiz',
                  title: 'Quiz Title',
                  description:
                  "The default value for the direction argument is horizontal if we don't set it. That means Flutter will try to put an item in the same row or beside the previous item as long as the space in the same row is enough to place a new item, before moving to the next row if the space isn't enough."),
              CourseItem(
                  type: 'quiz',
                  title: 'Quiz Title',
                  description:
                  "The default value for the direction argument is horizontal if we don't set it. That means Flutter will try to put an item in the same row or beside the previous item as long as the space in the same row is enough to place a new item, before moving to the next row if the space isn't enough.")
            ],
          ),
          SizedBox(height: 20,),
        ],
      ),
    );
  }
}
