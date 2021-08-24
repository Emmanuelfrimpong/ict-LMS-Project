import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ict_lms/public_files/application_colors.dart';
import 'package:ict_lms/public_files/navigation_service.dart';
import 'package:ict_lms/public_files/responsive.dart';
import 'package:provider/provider.dart';
import '../../main.dart';
import 'title-bar-item.dart';

class TitleBar extends StatefulWidget {
  final String title;
  final GlobalKey<ScaffoldState> drawerKey;
  const TitleBar({Key key, this.title, this.drawerKey}) : super(key: key);

  @override
  _TitleBarState createState() => _TitleBarState();
}

class _TitleBarState extends State<TitleBar> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer<NavigationService>(builder: (context, value, child) {
      return Card(
          color: primaryColor.withOpacity(.5),
          elevation: 10,
          child: Container(
              width: size.width,
              height: 60,
              child: Responsive.isMobile(context)
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(
                            FontAwesomeIcons.bars,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              if (!widget.drawerKey.currentState.isDrawerOpen)
                                widget.drawerKey.currentState.openDrawer();
                            });
                          },
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          '${widget.title}',
                          style: GoogleFonts.adamina(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(FontAwesomeIcons.bell)),
                        InkWell(
                          onTap: (){
                            //todo show drop down
                          },
                          child: ClipOval(
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage('assets/images/profile_pic.png'),
                                        fit: BoxFit.fill
                                    )
                                ),
                              )
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        )
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Image.asset('assets/images/logo.png'),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BarItem(
                                isSelected: value.getStudentSelectedPage ==
                                        StudentPages.Home
                                    ? true
                                    : false,
                                txt: 'Home',
                                onSelected: () {
                                  setState(() {
                                    Provider.of<NavigationService>(context,
                                            listen: false)
                                        .updateStudentPage(
                                            StudentPages.Home, 'Home');
                                  });
                                },
                              ),
                              BarItem(
                                isSelected: value.getStudentSelectedPage ==
                                        StudentPages.Lessons
                                    ? true
                                    : false,
                                txt: 'Lessons',
                                onSelected: () {
                                  setState(() {
                                    Provider.of<NavigationService>(context,
                                            listen: false)
                                        .updateStudentPage(
                                            StudentPages.Lessons, 'My Lessons');
                                  });
                                },
                              ),
                              BarItem(
                                isSelected: value.getStudentSelectedPage ==
                                        StudentPages.Quiz
                                    ? true
                                    : false,
                                txt: 'Quizzes',
                                onSelected: () {
                                  setState(() {
                                    Provider.of<NavigationService>(context,
                                            listen: false)
                                        .updateStudentPage(
                                            StudentPages.Quiz, 'My Quizzes');
                                  });
                                },
                              ),
                              BarItem(
                                isSelected: value.getStudentSelectedPage ==
                                        StudentPages.Complaints
                                    ? true
                                    : false,
                                txt: 'Complaints',
                                onSelected: () {
                                  setState(() {
                                    Provider.of<NavigationService>(context,
                                            listen: false)
                                        .updateStudentPage(
                                            StudentPages.Complaints,
                                            'Complaints');
                                  });
                                },
                              ),
                              BarItem(
                                isSelected: value.getStudentSelectedPage ==
                                        StudentPages.Help
                                    ? true
                                    : false,
                                txt: 'Help',
                                onSelected: () {
                                  setState(() {
                                    Provider.of<NavigationService>(context,
                                            listen: false)
                                        .updateStudentPage(
                                            StudentPages.Help, 'Help');
                                  });
                                },
                              )
                            ],
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(FontAwesomeIcons.bell)),
                        InkWell(
                          onTap: (){
                            //todo show drop down
                          },
                          child: ClipOval(
                            child: Container(
                              width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/images/profile_pic.png'),
                                    fit: BoxFit.fill
                                  )
                                ),
                            )
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        )
                      ],
                    )));
    });
  }
}
