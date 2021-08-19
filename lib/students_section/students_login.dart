import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ict_lms/public_files/Constant_Data.dart';
import 'package:ict_lms/public_files/application_colors.dart';
import 'package:ict_lms/public_files/authentication/components/rounded_button.dart';
import 'package:ict_lms/public_files/authentication/components/rounded_input_field.dart';
import 'package:ict_lms/public_files/authentication/components/rounded_password_field.dart';
import 'package:ict_lms/public_files/navigation_service.dart';
import 'package:ict_lms/public_files/responsive.dart';
import 'package:ict_lms/routing/route_names.dart';
import 'package:ict_lms/students_section/home-page/students-home.dart';
import 'package:provider/provider.dart';

class StudentsLogin extends StatefulWidget {
  const StudentsLogin({Key key}) : super(key: key);

  @override
  _StudentsLoginState createState() => _StudentsLoginState();
}

class _StudentsLoginState extends State<StudentsLogin> {
  bool isLoading = false;
  bool invisiblePass = true;
  String loginEmail, loginPassword;
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          SizedBox(height: 20,),
          Text(
            "STUDENT'S LOGIN",
            style: GoogleFonts.aclonica(
                fontSize:Responsive.isMobile(context)?16: 24,
                color: Colors.white,
                decoration: TextDecoration.underline),
          ),
          SizedBox(height: 40,),
          RoundedInputField(
            hintText: 'Enter Email',
            type: TextInputType.emailAddress,
            icon: FontAwesomeIcons.envelope,
            validation: (value) {
              if (value.isEmpty || !RegExp(EMAIL_PATTERN).hasMatch(value)) {
                return 'Please Enter a valid Email';
              } else
                return null;
            },
            onChanged: (email) {
              setState(() {
                loginEmail = email;
              });
            },
          ),
          RoundedPasswordField(
            isInvisible: invisiblePass,
            onView: () {
              setState(() {
                invisiblePass = invisiblePass ? false : true;
              });
            },
            onChanged: (password) {
              setState(() {
                loginPassword = password;
              });
            },
          ),
          SizedBox(
            width: 200,
            child: RoundedButton(
              textColor: primaryColor,
              color: Colors.white,
              text: 'LOGIN',
              press: isLoading ? null : login,
            ),
          )
        ],
      ),
    );
  }

  login() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (BuildContext context) => StudentsHomePage()),
      );
      //Provider.of<NavigationService>(context,listen: false).navigateTo(StudentHome,'Home');
    });
  }
}
