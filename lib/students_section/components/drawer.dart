import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ict_lms/main.dart';
import 'package:ict_lms/public_files/controllers/MenuController.dart';
import 'package:provider/provider.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        // it enables scrolling
        child: Column(
          children: [
            DrawerHeader(
              child: Image.asset("assets/images/logo.png"),
            ),
            DrawerListTile(
              title: "Home",
              svgSrc: "assets/icons/menu_dashbord.svg",
              press: () {

              },
            ),
            DrawerListTile(
              title: "Lessons",
              svgSrc: "assets/icons/practicals.svg",
              press: () {
                Provider.of<MenuController>(context, listen: false)
                    .controlSelectedPage(SelectedPage.Students,'Students');
              },
            ),
            DrawerListTile(
              title: "Quizzes",
              svgSrc: "assets/icons/exersice.svg",
              press: () {
                Provider.of<MenuController>(context, listen: false)
                    .controlSelectedPage(SelectedPage.Class,'Classes');
              },
            ),
            DrawerListTile(
              title: "Complaints",
              svgSrc: "assets/icons/complaints.svg",
              press: () {
                Provider.of<MenuController>(context, listen: false)
                    .controlSelectedPage(SelectedPage.Topics,'Topics');
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
