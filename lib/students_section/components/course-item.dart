import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ict_lms/public_files/Constant_Data.dart';
import 'package:ict_lms/public_files/application_colors.dart';
import 'package:ict_lms/public_files/responsive.dart';

class CourseItem extends StatelessWidget {
  final Function onPress;
  final String title;
  final String description;
  final int number;
  final String type;
  const CourseItem(
      {Key key,
      this.onPress,
      this.title,
      this.description,
      this.number,
      this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _random = new Random();
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey)
        ),
        width: Responsive.isMobile(context) ?  size.width*.8 : size.width * .3,
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
              padding: const EdgeInsets.all(10.0),
              child: Text(
                title,
                style: GoogleFonts.lato(
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w600,
                    color: primaryColor,
                    fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(description,maxLines: 3,overflow: TextOverflow.ellipsis, style: GoogleFonts.lato(color: primaryColor),),
            ),
          ],
        ),
      ),
    );
  }
}
