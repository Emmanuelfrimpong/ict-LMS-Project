import 'package:flutter/material.dart';
import 'package:ict_lms/public_files/application_colors.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: primaryColor.withOpacity(.3),
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}
