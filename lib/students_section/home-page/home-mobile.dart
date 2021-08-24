import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ict_lms/public_files/Constant_Data.dart';
import 'package:ict_lms/public_files/application_colors.dart';
import 'package:ict_lms/public_files/navigation_service.dart';
import 'package:ict_lms/students_section/components/course-item.dart';
import 'package:provider/provider.dart';

class StudentHomeMobile extends StatefulWidget {
  const StudentHomeMobile({Key key}) : super(key: key);

  @override
  _StudentHomeMobileState createState() => _StudentHomeMobileState();
}

class _StudentHomeMobileState extends State<StudentHomeMobile> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationService>(builder: (context, value, child) {
      var size = MediaQuery.of(context).size;
      return SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: CarouselSlider.builder(
                      options: CarouselOptions(
                        aspectRatio: 1.0,
                        enlargeCenterPage: false,
                        initialPage: 0,
                        viewportFraction: 1,
                        enableInfiniteScroll: true,
                        autoPlay: true,
                      ),
                      itemBuilder: (ctx, index, realIdx) {
                        return Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(slides[index]),
                              fit: BoxFit.cover,
                            ),
                          ),);
                      },
                      itemCount: slides.length,
                    ),),
                  Center(
                    child: Container(
                      padding: EdgeInsets.all(15),
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: primaryColor.withOpacity(.8),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'WELCOME TO ICT LMS',
                            style: GoogleFonts.alegreyaSans(
                                fontSize: 26, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Your best ICT center. \nTo coordinate and oversee an ICT system that produces globally competitive research and Innovation through quality oriented and demand-driven learning for national development.',
                            style: GoogleFonts.alegreyaSans(
                              height: 1.5,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          ListTile(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('INSTRUCTIONS',
                                      style: GoogleFonts.alegreyaSans(
                                          fontSize: 26,
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.underline)),
                                ],
                              ),
                              subtitle: Text(
                                'For a new User, Enter your Student ID as your username and same ID as your Password.',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.alegreyaSans(
                                  color: Colors.white,
                                  height: 1.5,
                                ),
                              )),
                          SizedBox(
                            height: 15,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              height: size.height * .6,
              width: size.width,
            ),
            Transform.translate(
              offset: Offset(0, -20),
              child: Card(
                margin: EdgeInsets.symmetric(horizontal: 20),
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 10,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    'Upcoming Quiz',
                    style: GoogleFonts.adventPro(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
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
            Card(
              child: Padding(
                padding:EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  'Most Recent Viewed Lessons',
                  style: GoogleFonts.adventPro(
                      decoration: TextDecoration.underline,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Wrap(
              children: [
                CourseItem(
                    type: 'lesson',
                    title: 'Lesson Title',
                    description:
                        "The default value for the direction argument is horizontal if we don't set it. That means Flutter will try to put an item in the same row or beside the previous item as long as the space in the same row is enough to place a new item, before moving to the next row if the space isn't enough."),
                CourseItem(
                    type: 'lesson',
                    title: 'Lesson Title',
                    description:
                        "The default value for the direction argument is horizontal if we don't set it. That means Flutter will try to put an item in the same row or beside the previous item as long as the space in the same row is enough to place a new item, before moving to the next row if the space isn't enough."),
                CourseItem(
                    type: 'lesson',
                    title: 'Lesson Title',
                    description:
                        "The default value for the direction argument is horizontal if we don't set it. That means Flutter will try to put an item in the same row or beside the previous item as long as the space in the same row is enough to place a new item, before moving to the next row if the space isn't enough."),
              ],
            ),
            SizedBox(
              height: 25,
            ),
          ],
        ),
      );
    });
  }
}
