import 'package:flutter/material.dart';
import 'package:flutter_map_pet/config/pages.dart';
import 'package:flutter_map_pet/data/controller/settings_controller.dart';
import 'package:get/get.dart';

class LocationMiddleware extends GetMiddleware{

  @override
  int? get priority => 2;

  @override
  RouteSettings? redirect(String? route) {
    SettingsController settings = Get.find<SettingsController>();
    return settings.city.value == 0 ? const RouteSettings(name: PageRoutes.location) : null;
  }
}