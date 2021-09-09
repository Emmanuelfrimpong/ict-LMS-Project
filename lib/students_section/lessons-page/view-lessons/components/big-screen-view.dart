import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ict_lms/models/lessons-data.dart';
import 'package:ict_lms/public_files/application_colors.dart';
import 'package:ict_lms/students_section/lessons-page/view-lessons/components/side-container.dart';
import 'package:ict_lms/students_section/lessons-page/view-lessons/components/title-card.dart';

class LessonBigScreenView extends StatelessWidget {
  const LessonBigScreenView({Key key,this.lesson}) : super(key: key);
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
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TitleCard(title:lesson.title),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Container(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
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
                        )
                      ],
                    ),
                  )),
                  SizedBox(
                    width: 10,
                  ),
                  AttachedFiles(width: size.width,files: lesson.attachedFiles,)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
