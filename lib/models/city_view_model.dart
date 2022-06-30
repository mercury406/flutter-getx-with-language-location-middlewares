import 'dart:convert';

import 'package:flutter_map_pet/data/local_storage/city/city_entity.dart';

class CityViewModel {
  final int id;
  final String title;
  final String regionTitle;


  CityViewModel({required this.id, required this.title, required this.regionTitle});

  factory CityViewModel.fromEntity(CityEntity entity, String lang) {
    return CityViewModel(
        id: entity.id,
        title: jsonDecode(entity.titles)[lang],
        regionTitle: jsonDecode(entity.regionTitles)[lang]
    );
  }
}