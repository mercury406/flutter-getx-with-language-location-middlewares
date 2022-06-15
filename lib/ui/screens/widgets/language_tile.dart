import 'package:flutter/material.dart';
import 'package:flutter_map_pet/config/pages.dart';
import 'package:flutter_map_pet/config/storage_keys.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LanguageTile extends StatelessWidget {
  final String language;
  final String title;
  const LanguageTile({Key? key, required this.language, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GetStorage _storage = Get.find<GetStorage>();
    return InkWell(
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w800),),
      ),
      onTap: () {
        _storage.write(StorageKeys.language, language);
        Get.offAllNamed(PageRoutes.home);
      },
    );
  }
}
