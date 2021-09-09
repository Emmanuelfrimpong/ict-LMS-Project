import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ict_lms/models/lessons-data.dart';
import 'package:ict_lms/public_files/application_colors.dart';
import 'package:ict_lms/routing/route_names.dart';
import 'package:ict_lms/students_section/lessons-page/view-lessons/components/show-attached-dialog.dart';
import 'package:ict_lms/students_section/lessons-page/view-lessons/components/title-card.dart';
import 'package:vector_math/vector_math.dart' as math;
class LessonMobileView extends StatelessWidget {
  const LessonMobileView({Key key, this.lesson}) : super(key: key);
  final Lessons lesson ;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    List<Map<String, dynamic>> subTopics = [];
    lesson.subTopics.forEach((element) {
      subTopics.add(element);
    });
    return Container(
      width: size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  TitleCard(title:lesson.title),
                  Spacer(),
                  InkWell(
                    onTap: (){
                      String jsonFile=jsonEncode(lesson.attachedFiles);
                      //print('vale===================$jsonFile');
                      showGeneralDialog(
                          context: context,
                          pageBuilder: (ctx, anim1, anim2) {},
                          barrierDismissible: true,
                          barrierLabel: '',
                          transitionBuilder: (context, anim1, anim2, child) {
                            return Transform.rotate(
                              angle: math.radians(anim1.value * 360),
                              child: AttachedFilesPage(files: lesson.attachedFiles,title: lesson.title,)
                            );
                          },
                          transitionDuration: Duration(milliseconds: 300));
                    },
                    child: Text('View Attached Files',style: GoogleFonts.adventPro(color: Colors.blue,decoration: TextDecoration.underline),),
                  )
                ],
              ),
              ListTile(
                subtitle: Text(
                  lesson.description,
                  textAlign: TextAlign.left,
                  style: GoogleFonts.lato(
                      color: primaryColor, height: 1.5),
                ),
                title: Text(
                  'Lesson Description',
                  style: GoogleFonts.lato(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ),
              ),
              ListView.builder(
                itemBuilder: (context, int index) {
                  return ListTile(
                      title: Text(
                        subTopics[index]['title'],
                        textAlign: TextAlign.left,
                        style: GoogleFonts.lato(
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                      ),
                      subtitle: subTopics[index]['description']
                          .runtimeType ==
                          String
                          ? Text(
                        lesson.description,
                        textAlign: TextAlign.left,
                        style: GoogleFonts.lato(
                            color: primaryColor, height: 1.5),
                      )
                          : Column(
                        children: [
                          ListView.builder(
                            itemBuilder:
                                (context, int subIndex) {
                              return subTopics[index]
                              ['description']
                              [subIndex]['info']
                                  .isNotEmpty
                                  ? ListTile(
                                  title: Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor:
                                        Colors.black,
                                        radius: 4,
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Expanded(
                                          child: Text(
                                            subTopics[index][
                                            'description']
                                            [
                                            subIndex]['point'],
                                            style: GoogleFonts
                                                .laila(
                                                color:
                                                primaryColor),
                                          )),
                                    ],
                                  ),
                                  subtitle: Text(
                                      subTopics[index][
                                      'description']
                                      [
                                      subIndex]['info'],
                                      textAlign:
                                      TextAlign.left,
                                      style: GoogleFonts.lato(
                                          color:
                                          primaryColor,
                                          height: 1.5)))
                                  : Padding(
                                padding: const EdgeInsets
                                    .symmetric(
                                    horizontal: 10),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor:
                                      Colors.black,
                                      radius: 4,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Expanded(
                                        child: Text(
                                          subTopics[index][
                                          'description']
                                          [
                                          subIndex]['point'],
                                          style: GoogleFonts
                                              .laila(
                                              color:
                                              primaryColor),
                                        )),
                                  ],
                                ),
                              );
                            },
                            itemCount: subTopics[index]
                            ['description']
                                .length,
                            shrinkWrap: true,
                          )
                        ],
                      ));
                },
                itemCount: subTopics.length,
                shrinkWrap: true,
                //physics: NeverScrollableScrollPhysics(),
              ),
              SizedBox(height: 15,)
            ],
          ),
        ),
      ),
    );
  }
}
