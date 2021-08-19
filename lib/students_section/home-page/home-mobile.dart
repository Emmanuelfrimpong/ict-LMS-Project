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

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationService>(builder: (context,value,child){
        return Scaffold(
          key: drawerKey,
          drawer: DrawerPage(),
          appBar: AppBar(
            backgroundColor: primaryColor,
            title: Text('${value.getTitle}',style: GoogleFonts.adamina(color: Colors.white,fontWeight: FontWeight.bold),),
            leading: IconButton(icon: Icon(FontAwesomeIcons.bars),
              onPressed: (){
              setState(() {
                if(!drawerKey.currentState.isDrawerOpen)
                  drawerKey.currentState.openDrawer();
              });
              },
            ),
          ),
          body: SafeArea(
            child: Container(),
          ),
        );
      }
    );
  }
}
