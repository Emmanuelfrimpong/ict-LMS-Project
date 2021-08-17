import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ict_lms/public_files/application_colors.dart';
import 'package:ict_lms/public_files/authentication/components/rounded_button.dart';

import '../../../Constant_Data.dart';

class StartUpSide extends StatelessWidget {
  final bool isStudent;
  final Function onStudent, onTeacher;
  final double width, height;
  const StartUpSide(
      {Key key,
      this.isStudent = true,
      this.onStudent,
      this.onTeacher,
      this.width,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      color: Colors.white,
      child: ListView(
        children: [
          CarouselSlider.builder(
            itemCount: welcomeImages.length,
            options: CarouselOptions(
              height: height * .5,
              aspectRatio: 1.0,
              enlargeCenterPage: false,
              viewportFraction: 1,
              autoPlay: true,
            ),
            itemBuilder: (ctx, index, realIdx) {
              return Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(welcomeImages[index]),
                    fit: BoxFit.fill,
                  ),
                ),
              );
            },
          ),
          Center(
            child: Text(
              'Which one are you ?',
              style: GoogleFonts.lato(fontSize: 20, color: primaryColor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: RoundedButton(
              color:isStudent? primaryColor:secondaryColor.withOpacity(.5),
              textColor: Colors.white,
              text: 'STUDENT',
              press: onStudent,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: RoundedButton(
              color:isStudent?secondaryColor.withOpacity(.5): primaryColor,
              textColor: Colors.white,
              text: 'TEACHER',
              press: onTeacher,
            ),
          ),
          SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }
}
