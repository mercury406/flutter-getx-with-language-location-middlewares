import 'package:flutter/material.dart';
import 'package:flutter_map_pet/config/app_bindings.dart';
import 'package:flutter_map_pet/config/pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put<GetStorage>(GetStorage());
    return GetMaterialApp(
      key: GlobalKey(),
      getPages: AppPages.all,
      initialRoute: AppPages.initial,
      debugShowCheckedModeBanner: false,
      initialBinding: AppBindings(),
    );
  }
}