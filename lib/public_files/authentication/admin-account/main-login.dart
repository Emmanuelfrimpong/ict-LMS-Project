import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminAuth extends StatelessWidget {
  const AdminAuth({Key key, this.width, this.height, this.onLogin, this.onSignup, this.backColor, this.textColor, this.borderColor}) : super(key: key);
  final double width, height;
  final Function onLogin,onSignup;
  final Color backColor,textColor,borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Container(
                    decoration: BoxDecoration(color: backColor,
                        border: Border(bottom: BorderSide(color: borderColor,width: 2))
                    ),
                    child: Center(child: Text('LOGIN',style: GoogleFonts.lato(color: textColor),))),
              ),
              Expanded(
                child: Container(
                    decoration: BoxDecoration(color: backColor,
                      border: Border(bottom: BorderSide(color: borderColor,width: 2))
                    ),
                    child: Center(child: Text('REGISTER',style: GoogleFonts.lato(color: textColor),))),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
