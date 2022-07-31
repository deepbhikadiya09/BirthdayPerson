import 'package:bdayapp/screen/add_bday_screen.dart';
import 'package:bdayapp/screen/show_bday_screen.dart';
import 'package:get/get.dart';

class MyRoutes {
  static const String home = "/";
  static const String addBday = "/addBday";
  static const Duration duration = Duration(milliseconds: 400);

  static List<GetPage> routes = [
    GetPage(
      name: home,
      page: () => AddBDayScreen(),
      transitionDuration: duration,
    ),
    GetPage(
      name: addBday,
      page: () => const ShowBdayScreen(),
      transitionDuration: duration,
    ),
  ];
}
