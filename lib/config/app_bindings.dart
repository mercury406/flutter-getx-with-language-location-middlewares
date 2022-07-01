import 'package:flutter_map_pet/repositories/location_repository.dart';
import 'package:get/get.dart';

class AppBindings extends Bindings{
  @override
  void dependencies() {
    // Get.put<GetStorage>(GetStorage());
    Get.put<LocationRepository>(LocationRepository());
  }
}