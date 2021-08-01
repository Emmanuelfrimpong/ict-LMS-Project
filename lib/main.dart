
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ict_lms/public_files/Application_Colors.dart';
import 'package:ict_lms/public_files/controllers/MenuController.dart';
import 'package:provider/provider.dart';
import 'administrator_section/main_pages/main_screen.dart';

enum SelectedPage{DashBoard,Students,Class,Topics,Practicals,Exercise,Settings,Complaints}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ICT LMS',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: primaryColor,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => MenuController(),
          ),
        ],
        child: MainScreen(),
      ),
    );
  }
}
