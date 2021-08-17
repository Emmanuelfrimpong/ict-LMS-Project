import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ict_lms/public_files/Application_Colors.dart';
import 'package:ict_lms/public_files/Constant_Data.dart';
import 'package:ict_lms/public_files/controllers/MenuController.dart';
import 'package:ict_lms/public_files/responsive.dart';
import 'package:provider/provider.dart';


class Header extends StatelessWidget {
  const Header({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MenuController>(builder: (context ,value,child ) {
      return Container(
        color: primaryColor,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        child: Row(
          children: [
            if (!Responsive.isDesktop(context))
              IconButton(
                icon: Icon(Icons.menu),
                onPressed: context
                    .read<MenuController>()
                    .controlMenu,
              ),
            if (!Responsive.isMobile(context))
              Text(
                value.title,
                style: Theme
                    .of(context)
                    .textTheme
                    .headline6,
              ),
            // if (!Responsive.isMobile(context))
            Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
            // Expanded(child: SearchField()),
            ProfileCard()
          ],
        ),
      );
    }
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Row(
        children: [
          Image.asset(
            "assets/images/profile_pic.png",
            height: 38,
          ),
          if (!Responsive.isMobile(context))
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
              child: Text("Teacher's Name"),
            ),
          Icon(Icons.keyboard_arrow_down),
          SizedBox(width: 5,)
        ],
      ),
    );
  }
}


