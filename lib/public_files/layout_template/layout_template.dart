import 'package:flutter/material.dart';
import 'package:ict_lms/public_files/navigation_service.dart';
import 'package:ict_lms/routing/route_names.dart';
import 'package:provider/provider.dart';
import '../../routing/router.dart';

class LayoutTemplate extends StatelessWidget {
  const LayoutTemplate({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationService>(builder: (context,value,child){
        return Scaffold(
          body:  Navigator(
            key: value.getKey,
            onGenerateRoute: generateRoute,
            initialRoute: Startup,
          ),
        );
      }
    );
  }
}
