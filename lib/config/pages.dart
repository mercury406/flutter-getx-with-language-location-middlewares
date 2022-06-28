import 'package:flutter_map_pet/config/middlewares/language_middleware.dart';
import 'package:flutter_map_pet/config/middlewares/location_middleware.dart';
import 'package:flutter_map_pet/ui/screens/home_activity.dart';
import 'package:flutter_map_pet/ui/screens/language_list.dart';
import 'package:flutter_map_pet/ui/screens/locations_activity.dart';
import 'package:get/get.dart';

class AppPages {
  static const String initial = PageRoutes.initial;
  static List<GetPage> all = [
    GetPage(
      name: PageRoutes.language,
      page: () => const LanguageActivity(),
    ),
    GetPage(
      name: PageRoutes.location,
      page: () => LocationActivity(),
    ),
    GetPage(name: PageRoutes.home, page: () => const HomeActivity(), binding: null, middlewares: [
      LanguageMiddleware(),
      LocationMiddleware(),
    ]),
  ];
}

class PageRoutes {
  static const String initial = HomeActivity.route;
  static const String location = LocationActivity.route;
  static const String language = LanguageActivity.route;
  static const String home = HomeActivity.route;
}
