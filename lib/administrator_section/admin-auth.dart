import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ict_lms/public_files/application_colors.dart';
import 'package:ict_lms/public_files/authentication/components/rounded_button.dart';
import 'package:ict_lms/public_files/authentication/components/rounded_input_field.dart';
import 'package:ict_lms/public_files/authentication/components/rounded_password_field.dart';
import 'package:ict_lms/public_files/controllers/utils.dart';
import 'package:ict_lms/public_files/responsive.dart';
import 'package:ict_lms/routing/route_names.dart';
import 'package:image_picker/image_picker.dart';

import '../public_files/Constant_Data.dart';

class AdminAuth extends StatefulWidget {
  AdminAuth({Key key, this.width, this.height}) : super(key: key);
  final double width, height;

  @override
  _AdminAuthState createState() => _AdminAuthState();
}

class _AdminAuthState extends State<AdminAuth> {
  String tab = 'login';
  String loginEmail, loginPassword;
  bool invisiblePass=true;
  bool isLoading=false;
  String signupEmail,signupPassword,signupUsername;
  bool signupLoading=false;
  bool signupInvisiblePass=true;
  final _loginFormKey = GlobalKey<FormState>();
  final _signupFormKey = GlobalKey<FormState>();
  FToast fToast;
  File _image;
  final picker = ImagePicker();
  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal:Responsive.isMobile(context)?10: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor:
                              tab == 'login' ? Colors.white : primaryColor),
                      onPressed: () {
                        setState(() {
                          tab = 'login';
                        });
                      },
                      child: Center(
                          child: Text(
                        'LOGIN',
                        style: GoogleFonts.lato(
                            color:
                                tab == 'login' ? primaryColor : Colors.white),
                      ))),
                ),
                Expanded(
                  child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor:
                              tab == 'register' ? Colors.white : primaryColor),
                      onPressed: () {
                        setState(() {
                          tab = 'register';
                        });
                      },
                      child: Center(
                          child: Text(
                        'REGISTER',
                        style: GoogleFonts.lato(
                            color: tab == 'register'
                                ? primaryColor
                                : Colors.white),
                      ))),
                ),
              ],
            ),
          ),
          SizedBox(height: 15,),
          if (tab == 'login') buildLogin(),
          if(tab=='register')buildRegistration()
        ],
      ),
    );
  }

  Widget buildLogin() {
    return Form(
      key: _loginFormKey,
      child: Column(
    children: [
      SizedBox(height: 20,),
      Text(
        "TEACHER'S LOGIN",
        style: GoogleFonts.aclonica(
            fontSize:Responsive.isMobile(context)?16: 24,
            color: Colors.white,
            decoration: TextDecoration.underline),
      ),
      SizedBox(height: 20,),
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
            loginEmail=email;
          });
        },
      ),
      RoundedPasswordField(
        isInvisible: invisiblePass,
        onView: (){
          setState(() {
            invisiblePass=invisiblePass?false:true;
          });
        },
        onChanged: (password){
          setState(() {
            loginPassword=password;
          });
        },
      ),
      SizedBox(
        width: 200,
        child: RoundedButton(
          textColor: primaryColor,
          color: Colors.white,
          text: 'LOGIN',
          press: isLoading?null:login,
        ),
      )
    ],
      ),
    );
  }
  Widget buildRegistration() {
    return Form(
      key: _signupFormKey,
      child: Column(
        children: [
          SizedBox(height: 20,),
          Text(
            "TEACHER'S REGISTRATION",
            style: GoogleFonts.aclonica(
                fontSize:Responsive.isMobile(context)?16: 24,
                color: Colors.white,
                decoration: TextDecoration.underline),
          ),
          SizedBox(height: 20,),
          _imageChooser(),
          RoundedInputField(
            hintText: 'Full Name',
            type: TextInputType.text,
            icon: FontAwesomeIcons.user,
            validation: (value) {
              if (value.isEmpty) {
                return 'Please Enter Your Name';
              } else
                return null;
            },
            onChanged: (email) {
              setState(() {
                signupUsername=email;
              });
            },
          ),
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
                signupEmail=email;
              });
            },
          ),
          RoundedPasswordField(
            isInvisible: signupInvisiblePass,
            onView: (){
              setState(() {
                signupInvisiblePass=signupInvisiblePass?false:true;
              });
            },
            onChanged: (password){
              setState(() {
                signupPassword=password;
              });
            },
          ),
          SizedBox(
            width: 200,
            child: RoundedButton(
              textColor: primaryColor,
              color: Colors.white,
              text: 'REGISTER',
              press: signupLoading?null:register,
            ),
          )
        ],
      ),
    );
  }
  Widget _imageChooser() {
    return Center(
      child: GestureDetector(
        onTap: () {
          getImageGallery();
        },
        child: ClipOval(
          child: Material(
            color: primaryColor.withOpacity(.4),
            child: _image != null
                ? Image.file(
              _image,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            )
                : Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Icon(
              Icons.camera_alt,
              size: 60,
              color: Colors.black38,
            ),
                ),
          ),
        ),
      ),
    );
  }


  Future getImageGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        showToast(context, fToast, FontAwesomeIcons.exclamationCircle,
            Colors.red, "No image selected");
        print('No image selected.');
      }
    });
  }


  login(){
    sendToPage(context, MyRouts.adminHome);
  }
  register(){

  }
}
