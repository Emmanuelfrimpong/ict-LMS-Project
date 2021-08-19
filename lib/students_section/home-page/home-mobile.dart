import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ict_lms/public_files/application_colors.dart';
import 'package:ict_lms/public_files/navigation_service.dart';
import 'package:ict_lms/students_section/components/drawer.dart';
import 'package:provider/provider.dart';

class StudentHomeMobile extends StatefulWidget {
  const StudentHomeMobile({Key key}) : super(key: key);

  @override
  _StudentHomeMobileState createState() => _StudentHomeMobileState();
}

class _StudentHomeMobileState extends State<StudentHomeMobile> {
  final GlobalKey<ScaffoldState> drawerKey = new GlobalKey<ScaffoldState>();
  var _controller = ScrollController();
  bool isTransparent = true;
  @override
  void initState() {
    super.initState();
    getScorllUpdate();
  }

  getScorllUpdate() {
    _controller.addListener(() {
      if (_controller.position.atEdge) {
        if (_controller.position.pixels == 0) {
          setState(() {
            isTransparent = true;
          });
        } else {
          setState(() {
            isTransparent = false;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationService>(builder: (context, value, child) {
      var size = MediaQuery.of(context).size;
      return Scaffold(
        key: drawerKey,
        drawer: DrawerPage(),
        body: SafeArea(
          child: Stack(
            alignment: Alignment.topCenter,
            textDirection: TextDirection.rtl,
            fit: StackFit.loose,
            clipBehavior: Clip.hardEdge,
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      child: Center(
                          child: Container(
                        padding: EdgeInsets.all(15),
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        color: primaryColor.withOpacity(.6),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'WELCOME TO ICT LMS',
                              style: GoogleFonts.alegreyaSans(
                                  fontSize: 26, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Your best ICT center. \nTo coordinate and oversee an ICT system that produces globally competitive research and Innovation through quality oriented and demand-driven learning for national development.',
                              style: GoogleFonts.alegreyaSans(
                                height: 1.5,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      )),
                      height: size.height * .5,
                      width: size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/back.jpg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(0, -20),
                      child: Card(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        elevation: 10,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: primaryColor),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Text(
                            'Upcoming Quiz',
                            style: GoogleFonts.adventPro(
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'Most Recent Viewed Lessons',
                      style: GoogleFonts.adventPro(
                          decoration: TextDecoration.underline,
                          color: primaryColor,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Card(
                color:
                    isTransparent ? primaryColor.withOpacity(.5) : primaryColor,
                elevation: isTransparent ? 0 : 10,
                child: Container(
                  width: size.width,
                  height: 60,
                  color: isTransparent ? Colors.transparent : primaryColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(
                          FontAwesomeIcons.bars,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            if (!drawerKey.currentState.isDrawerOpen)
                              drawerKey.currentState.openDrawer();
                          });
                        },
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        '${value.getTitle}',
                        style: GoogleFonts.adamina(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      IconButton(
                          onPressed: () {}, icon: Icon(FontAwesomeIcons.bell)),
                      SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
