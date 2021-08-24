import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ict_lms/main.dart';
import 'package:ict_lms/public_files/controllers/MenuController.dart';
import 'package:ict_lms/public_files/navigation_service.dart';
import 'package:provider/provider.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({
    Key key,
  }) : super(key: key);

  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            DrawerHeader(
              child: Image.asset("assets/images/logo.png"),
            ),
            DrawerListTile(
              title: "Home",
              svgSrc: "assets/icons/menu_dashbord.svg",
              press: () {
                setState(() {
                  Provider.of<NavigationService>(context, listen: false)
                      .updateStudentPage(StudentPages.Home,'Home');
                  Navigator.pop(context);
                });

              },
            ),
            DrawerListTile(
              title: "Lessons",
              svgSrc: "assets/icons/practicals.svg",
              press: () {
                setState(() {
                  Provider.of<NavigationService>(context, listen: false)
                      .updateStudentPage(StudentPages.Lessons,'My Lessons');
                  Navigator.pop(context);

                });

              },
            ),
            DrawerListTile(
              title: "Quizzes",
              svgSrc: "assets/icons/exersice.svg",
              press: () {
                setState(() {
                  Provider.of<NavigationService>(context, listen: false)
                      .updateStudentPage(StudentPages.Quiz,'My Quizzes');
                  Navigator.pop(context);

                });

              },
            ),
            DrawerListTile(
              title: "Complaints",
              svgSrc: "assets/icons/complaints.svg",
              press: () {
                setState(() {
                  Provider.of<NavigationService>(context, listen: false)
                      .updateStudentPage(StudentPages.Complaints,'Complaints');
                  Navigator.pop(context);
                });

              },
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key key,
    // For selecting those three line once press "Command+D"
     this.title,
     this.svgSrc,
     this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        color: Colors.white54,
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
}
