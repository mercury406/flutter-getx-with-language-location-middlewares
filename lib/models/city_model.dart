import 'package:flutter_map_pet/models/region_model.dart';

class CityModel {
  int id;
  Map<String, dynamic> titles;
  RegionModel region;

  CityModel({
    required this.id,
    required this.titles,
    required this.region,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      id: json["id"],
      titles: json["title"],
      region: RegionModel.fromJson(json["region"]),
    );
  }

  @override
  String toString() {
    return "Город $id - ${titles["ru"]} - $region\n";
  }

}
