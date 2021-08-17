
import 'package:flutter/material.dart';
import 'package:ict_lms/public_files/application_colors.dart';


class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  final bool isLoading;
  const RoundedButton({
    Key key,
    this.text,
    this.press,
    this.color = primaryColor,
    this.textColor = Colors.white,
    this.isLoading=false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child:TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            backgroundColor: color,
          ),
          onPressed: press,
          child: isLoading == null
              ? false
              : isLoading
              ? Image.asset(
            'assets/icons/spinner.gif',
            width: 19.0,
            height: 19.0,
          )
              : Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: textColor),
          ),
        ),
      ),
    );
  }
}
