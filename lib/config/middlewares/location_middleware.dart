import 'package:flutter/material.dart';
import 'package:flutter_map_pet/config/pages.dart';
import 'package:flutter_map_pet/config/storage_keys.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LocationMiddleware extends GetMiddleware{

  @override
  int? get priority => 2;

  @override
  RouteSettings? redirect(String? route) {
    GetStorage _storage = Get.find<GetStorage>();
    int? cityId = _storage.read(StorageKeys.cityId);
    debugPrint("$runtimeType => $cityId");
    return cityId == null ? const RouteSettings(name: PageRoutes.regions) : null  ;
  }
}