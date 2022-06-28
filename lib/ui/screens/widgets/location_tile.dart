

import 'package:flutter/material.dart';
import 'package:flutter_map_pet/config/pages.dart';
import 'package:flutter_map_pet/config/storage_keys.dart';
import 'package:flutter_map_pet/models/city_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class RegionTile extends StatelessWidget {
  final CityModel city;
  const RegionTile({Key? key, required this.city}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GetStorage _storage = Get.find<GetStorage>();
    String? lang = _storage.read(StorageKeys.language);
    return InkWell(
      child: ListTile(
        title: Text(city.titles[lang!]!, style: const TextStyle(fontWeight: FontWeight.w800),),
      ),
      onTap: () async{
        GetStorage _storage = Get.find<GetStorage>();
        _storage.write(StorageKeys.cityId, city.id);
        Get.offAllNamed(PageRoutes.home);
      },
    );
  }
}
