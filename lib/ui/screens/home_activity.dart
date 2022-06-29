import 'package:flutter/material.dart';
import 'package:flutter_map_pet/config/pages.dart';
import 'package:flutter_map_pet/config/storage_keys.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeActivity extends StatelessWidget {
  static const String route = "/home";

  const HomeActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GetStorage _storage = Get.find<GetStorage>();
    TextStyle _style = const TextStyle(fontSize: 18, fontWeight: FontWeight.w700);
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Язык", style: _style),
                  Text(_storage.read(StorageKeys.language), style: _style),
                ],
              ),
              InkWell(
                child: const Text(
                  "Изменить язык",
                  style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
                ),
                onTap: () {
                  Get.toNamed(PageRoutes.language);
                },
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Город", style: _style),
                  Text(_storage.read(StorageKeys.cityId).toString(), style: _style),
                ],
              ),
              InkWell(
                child: const Text(
                  "Изменить город",
                  style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
                ),
                onTap: () {
                  Get.toNamed(PageRoutes.regions);
                },
              ),
              const SizedBox(height: 24),
              MaterialButton(
                  color: Colors.red,
                  textColor: Colors.white,
                  child: const Text("Удалить и выйти"),
                  onPressed: () {
                    _storage.erase();
                    Get.offAllNamed(route);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}