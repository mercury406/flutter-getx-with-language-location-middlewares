

import 'package:flutter_map_pet/config/storage_keys.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingsController extends GetxController{
  RxString language = "".obs;
  RxInt city = 0.obs;


  @override
  void onInit() {
    GetStorage _storage = Get.find<GetStorage>();
    language.value = _storage.read(StorageKeys.language) ?? "";
    city.value = _storage.read(StorageKeys.cityId) ?? 0;
    super.onInit();
  }

}