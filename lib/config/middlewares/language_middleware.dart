import 'package:flutter/material.dart';
import 'package:flutter_map_pet/config/pages.dart';
import 'package:flutter_map_pet/config/storage_keys.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LanguageMiddleware extends GetMiddleware{

  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    GetStorage _storage = Get.find<GetStorage>();
    String? lang = _storage.read(StorageKeys.language);
    debugPrint("$runtimeType => $lang");
    return lang == null ? const RouteSettings(name: PageRoutes.language) : null;
  }
}