import 'package:flutter/material.dart';
import 'package:flutter_map_pet/config/app_bindings.dart';
import 'package:flutter_map_pet/config/pages.dart';
import 'package:flutter_map_pet/config/storage_keys.dart';
import 'package:flutter_map_pet/config/translations.dart';
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
    GetStorage _storage = Get.put<GetStorage>(GetStorage());
    String lang = _storage.read(StorageKeys.language);
    return GetMaterialApp(
      key: GlobalKey(),
      getPages: AppPages.all,
      initialRoute: AppPages.initial,
      debugShowCheckedModeBanner: false,
      initialBinding: AppBindings(),
      translations: AppTranslations(),
      locale: Locale(lang),
      fallbackLocale: const Locale("uz"),
    );
  }
}