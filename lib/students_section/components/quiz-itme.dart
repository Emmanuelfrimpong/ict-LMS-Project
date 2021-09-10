import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ict_lms/models/quiz-data.dart';
import 'package:ict_lms/public_files/Constant_Data.dart';
import 'package:ict_lms/public_files/application_colors.dart';
import 'package:ict_lms/public_files/controllers/utils.dart';
import 'package:ict_lms/public_files/responsive.dart';

class QuizItem extends StatelessWidget {
  final Quizzes quiz;
  final Function onPress;
  const QuizItem({Key key, this.quiz, this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _random = new Random();
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
        width: Responsive.isMobile(context) ? size.width * .8 : size.width * .35,
        margin: EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(images[_random.nextInt(images.length)]),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
              child: Text(
                quiz.title,
                style: GoogleFonts.lato(
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w600,
                    color: primaryColor,
                    fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${quiz.quizNumber}',
                    style: GoogleFonts.lato(fontSize: 11, color: Colors.grey),
                  ),
                  Text(
                    'Created At: ${readDateStamp(quiz.createdOn)}',
                    style: GoogleFonts.lato(fontSize: 11, color: Colors.grey),
                  ),
                ],
              ),
            ),
            Divider(height: 4,color: Colors.grey,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Starting At: ',
                    style: GoogleFonts.lato(fontSize: 11, color: Colors.grey),
                  ),
                  Text(
                    '${readTimestamp(quiz.startTime)}',
                    style: GoogleFonts.lato(fontSize: 11, color: Colors.grey),
                  ),
                ],
              ),
            ),
            Divider(height: 4,color: Colors.grey,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Closing At: ',
                    style: GoogleFonts.lato(fontSize: 11, color: Colors.grey),
                  ),
                  Text(
                    '${readTimestamp(quiz.endTime)}',
                    style: GoogleFonts.lato(fontSize: 11, color: Colors.grey),
                  ),
                ],
              ),
            ),
            Divider(height: 4,color:Colors.grey,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Duration: ',
                    style: GoogleFonts.lato(fontSize: 11, color: Colors.grey),
                  ),
                  Text(
                    '${quiz.duration} Minutes - ${quiz.questions.length} Qs',
                    style: GoogleFonts.lato(fontSize: 11, color: Colors.grey),
                  ),
                ],
              ),
            ),
SizedBox(height: 8,)
          ],
        ),
      ),
    );
  }
}
