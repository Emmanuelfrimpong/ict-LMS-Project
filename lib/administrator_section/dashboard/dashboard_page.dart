import 'package:flutter/material.dart';
import 'package:ict_lms/administrator_section/dashboard/components/my_fiels.dart';
import 'package:ict_lms/public_files/Constant_Data.dart';
import 'package:ict_lms/public_files/responsive.dart';

import 'components/recent_files.dart';


class DashBoard extends StatelessWidget {
  const DashBoard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 5,
          child: Column(
            children: [
              MyFiels(),
              SizedBox(height: defaultPadding),
              RecentFiles(),
              if (Responsive.isMobile(context))
                SizedBox(height: defaultPadding),
            ],
          ),
        ),
        if (!Responsive.isMobile(context))
          SizedBox(width: defaultPadding),
      ],
    );
  }
}
