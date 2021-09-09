const String Startup='authentication';
const String AdminHome='dashboard';
const String StudentHome='Home';

class MyRouts{
  static String authRout="/authentication";
  static String homeRout="/dashboard";
  static const String baseRoute = '/lessons';
  static const String baseQuizRoute = '/quizzes';
static const String adminHome='/admin';

  static String Function(String url) routeFromSlug =
      (String url) => baseRoute + '/$url';

  static String Function(String url) routeFromQuizzes =
      (String url) => baseQuizRoute + '/$url';

}