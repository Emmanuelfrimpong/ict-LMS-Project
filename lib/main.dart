import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ict_lms/public_files/Application_Colors.dart';
import 'package:ict_lms/public_files/navigation_service.dart';
import 'package:ict_lms/routing/route-config.dart';
import 'package:ict_lms/routing/route_names.dart';
import 'package:ict_lms/students_section/lessons-page/view-lessons/view-lessons-main-page.dart';
import 'package:ict_lms/students_section/student-main-page.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:velocity_x/velocity_x.dart';
import 'public_files/authentication/starup-page.dart';
import 'public_files/controllers/MenuController.dart';

enum SelectedPage {
  DashBoard,
  Students,
  Class,
  Topics,
  Practicals,
  Exercise,
  Settings,
  Complaints
}
enum StudentPages { Home, Quiz, Complaints, Lessons, Help }

void main() {
  setPathUrlStrategy();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => NavigationService()),
    ChangeNotifierProvider(create: (_) => MenuController()),
  ], child: MyApp()));
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
      initialRoute: MyRouts.authRout,
      onGenerateRoute: RouteConfiguration.onGenerateRoute,
    );
  }
}
