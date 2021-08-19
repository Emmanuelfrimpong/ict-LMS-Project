import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ict_lms/administrator_section/main_pages/main_screen.dart';
import 'package:ict_lms/public_files/authentication/starup-page.dart';
import 'package:ict_lms/routing/route_names.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Startup:
      return _getPageRoute(StartupPage(), settings);
    case AdminHome:
      return _getPageRoute(MainScreen(), settings);
    // case StudentHome:
    //   return _getPageRoute(EpisodesView(), settings);
    // case EpisodeDetailsRoute:
    //   return _getPageRoute(EpisodeDetails(), settings);
    default:
      return _getPageRoute(StartupPage(), settings);
  }
}

PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return _FadeRoute(child: child, routeName: settings.name);
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final String routeName;
  _FadeRoute({this.child, this.routeName})
      : super(
          settings: RouteSettings(name: routeName),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
