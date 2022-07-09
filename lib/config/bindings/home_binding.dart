import 'package:flutter_map_pet/data/controller/home_controller.dart';
import 'package:flutter_map_pet/repositories/time_repository.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<TimeRepository>(TimeRepository());
    Get.put<HomeController>(HomeController());
  }

}