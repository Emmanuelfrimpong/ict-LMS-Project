import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ict_lms/routing/route_names.dart';
import 'package:velocity_x/velocity_x.dart';
showToast(BuildContext context, FToast fToast, IconData iconData, Color color,
    String message) {
  Widget toast = Container(
    height: 180,
    width: 200,
    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      color: color.withOpacity(.7),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 21,
          backgroundColor: color,
          child: Icon(
            iconData,
            color: Colors.white,
            size: 40,
          ),
        ),
        SizedBox(
          height: 15.0,
        ),
        Flexible(
            child: Text(message,
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                    color: Colors.white, fontWeight: FontWeight.w700))),
      ],
    ),
  );
  fToast.showToast(
    child: toast,
    gravity: ToastGravity.CENTER,
    toastDuration: Duration(milliseconds: 2000),
  );
}
void sendToPage(BuildContext context, Widget newPage)async {
  await context.vxNav.push(Uri.parse(MyRouts.lessonRout));
}