import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
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
void sendToPage(BuildContext context, String name)async {
  Navigator.pushNamed(context, name);
}

String readTimestamp(int timestamp) {
  var date = DateTime.fromMillisecondsSinceEpoch(timestamp);
  var format = DateFormat('MMMM d, yyyy - HH:MM a');
  String time=format.format(date);
  return time;
}
String readDateStamp(int timestamp) {
  var date = DateTime.fromMillisecondsSinceEpoch(timestamp);
  var format = DateFormat('EEEE MMMM d, yyyy');
  String time=format.format(date);
  return time;
}
String readTimeLeft(int timestamp) {
  var now = DateTime.now();
  var date = DateTime.fromMillisecondsSinceEpoch(timestamp);
  var diff = now.difference(date);
  var time = '';

  if (diff.inSeconds <= 0 ||
      diff.inSeconds > 0 && diff.inMinutes == 0 ||
      diff.inMinutes > 0 && diff.inHours == 0 ||
      diff.inHours > 0 && diff.inDays == 0) {
    if (diff.inHours > 0) {
      time = diff.inHours.toString() + 'h ago';
    } else if (diff.inMinutes > 0) {
      time = diff.inMinutes.toString() + 'm ago';
    } else if (diff.inSeconds > 0) {
      time = 'now';
    } else if (diff.inMilliseconds > 0) {
      time = 'now';
    } else if (diff.inMicroseconds > 0) {
      time = 'now';
    } else {
      time = 'now';
    }
  } else if (diff.inDays > 0 && diff.inDays < 7) {
    time = diff.inDays.toString() + 'd ago';
  } else if (diff.inDays > 6) {
    time = (diff.inDays / 7).floor().toString() + 'w ago';
  } else if (diff.inDays > 29) {
    time = (diff.inDays / 30).floor().toString() + 'm ago';
  } else if (diff.inDays > 365) {
    time = '${date.month}-${date.day}-${date.year}';
  }
  return time;
}
