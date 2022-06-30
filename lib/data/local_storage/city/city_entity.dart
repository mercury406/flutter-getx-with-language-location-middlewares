import 'dart:convert';

import 'package:floor/floor.dart';

@Entity(tableName: "cities")
class CityEntity {
  @PrimaryKey(autoGenerate: false)
  final int id;
  final String titles;
  final int regionId;
  final String regionTitles;
  final int poryadok;

  CityEntity({
    required this.id,
    required this.titles,
    required this.regionId,
    required this.poryadok,
    required this.regionTitles
  });

  @ignore
  factory CityEntity.fromMap(Map map){
    return CityEntity(
      id: map["id"],
      titles: jsonEncode(map["title"]),
      regionId: map["region"]["id"],
      poryadok: int.parse(map["order"]),
      regionTitles: jsonEncode(map["region"]["title"]),
    );
  }
}
