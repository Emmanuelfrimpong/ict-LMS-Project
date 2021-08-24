import 'package:flutter/material.dart';
import 'package:ict_lms/public_files/responsive.dart';

class StudentsScreenTypePage extends StatefulWidget {
  final Widget mobile,tablet,desktop;
  const StudentsScreenTypePage({Key key,this.desktop,this.mobile,this.tablet}) : super(key: key);

  @override
  _StudentsScreenTypePageState createState() => _StudentsScreenTypePageState();
}

class _StudentsScreenTypePageState extends State<StudentsScreenTypePage> {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: widget.mobile,
      tablet: widget.tablet,
      desktop: widget.desktop,
    );
  }
}
