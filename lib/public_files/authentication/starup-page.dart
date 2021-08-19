import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ict_lms/public_files/application_colors.dart';
import 'package:ict_lms/administrator_section/admin-auth.dart';
import 'package:ict_lms/students_section/students_login.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../responsive.dart';
import 'startup/components/side-page.dart';

class StartupPage extends StatefulWidget {
  const StartupPage({Key key}) : super(key: key);

  @override
  _StartupPageState createState() => _StartupPageState();
}

class _StartupPageState extends State<StartupPage> {
  String isWho = 'Student';
  String mobIsWho = '';
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColor.withOpacity(.6),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (!Responsive.isMobile(context))
                Container(
                  width: size.width,
                  color: primaryColor,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/logo.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'ICT LMS',
                        style: GoogleFonts.actor(
                            fontSize: 30, color: Colors.white),
                      )
                    ],
                  ),
                ),
              Responsive.isMobile(context)
                  ? Column(
                    children: [
                      AppBar(
                        backgroundColor: primaryColor,
                        title: Text('ICT LMS',style: GoogleFonts.actor(fontSize: 20,color: Colors.white),),
                        actions: [
                          if(mobIsWho.isNotEmpty)
                          IconButton(
                            icon: Icon(FontAwesomeIcons.arrowLeft),
                            onPressed: (){
                              setState(() {
                                mobIsWho='';
                              });
                            },
                          )
                        ],
                        leading:Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/logo.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ),
                      mobIsWho.isEmpty
                          ? StartUpSide(
                              width: size.width,
                              height: size.height,
                              isStudent: mobIsWho == 'Student' ? true : false,
                              onStudent: () {
                                setState(() {
                                  mobIsWho = 'Student';
                                });
                              },
                              onTeacher: () {
                                setState(() {
                                  mobIsWho = 'Teacher';
                                });
                              },
                            )
                          : mobIsWho == 'Student'
                              ? StudentsLogin()
                              : AdminAuth(
                                  width: size.width,
                                ),
                    ],
                  )
                  : Center(
                      child: Card(
                        elevation: 10,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(40),
                                  bottomRight: Radius.circular(40))),
                          width: Responsive.isDesktop(context)
                              ? size.width * .7
                              : size.width,
                          //height: size.height*.8,
                          //height: Responsive.isMobile(context)?size.height:size.height*.8,
                          child: Row(
                            children: [
                              StartUpSide(
                                width: size.width * .35,
                                height: size.height,
                                isStudent: isWho == 'Student' ? true : false,
                                onStudent: () {
                                  setState(() {
                                    isWho = 'Student';
                                  });
                                },
                                onTeacher: () {
                                  setState(() {
                                    isWho = 'Teacher';
                                  });
                                },
                              ),
                              if (isWho == 'Teacher')
                                Expanded(
                                  child: AdminAuth(
                                    width: size.width * .35,
                                  ),
                                ),
                              if (isWho == 'Student')
                                Expanded(child: StudentsLogin())
                            ],
                          ),
                        ),
                      ),
                    ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
