import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ict_lms/public_files/application_colors.dart';

class TitleCard extends StatelessWidget {
  const TitleCard({Key key, this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return  Card(
      //margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      elevation: 10,
      color: primaryColor,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Text(
            title,
            style: GoogleFonts.lato(fontSize: 22),
          ),
        ),
      ),
    );
  }
}
