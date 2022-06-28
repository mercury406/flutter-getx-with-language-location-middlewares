import 'package:flutter_map_pet/data/controller/location_controller.dart';
import 'package:flutter_map_pet/data/controller/settings_controller.dart';
import 'package:get/get.dart';

class AppBindings implements Bindings{
  @override
  void dependencies() {
    Get.put<SettingsController>( SettingsController() );
    Get.put<LocationController>(LocationController());
  }
}