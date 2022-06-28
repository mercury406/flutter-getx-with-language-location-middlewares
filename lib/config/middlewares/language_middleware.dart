import 'package:flutter/material.dart';
import 'package:flutter_map_pet/config/pages.dart';
import 'package:flutter_map_pet/data/controller/settings_controller.dart';
import 'package:get/get.dart';

class LanguageMiddleware extends GetMiddleware{

  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    SettingsController settings = Get.find<SettingsController>();
    return settings.language.value == "" ? const RouteSettings(name: PageRoutes.language) : null;
  }
}