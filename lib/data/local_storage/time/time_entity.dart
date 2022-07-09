import 'package:floor/floor.dart';
import 'package:flutter_map_pet/data/local_storage/city/city_entity.dart';

@Entity(
  tableName: "times",
  foreignKeys: [
    ForeignKey(
      childColumns: ["cityId"],
      parentColumns: ["id"],
      entity: CityEntity,
      onDelete: ForeignKeyAction.cascade,
    )
  ],
  primaryKeys: [
    "cityId",
    "date"
  ]
)
class TimeEntity {
  final int id;
  final int cityId;
  final String gregorianDate;
  final String qamarDate;
  final String bomdod;
  final String quyosh;
  final String peshin;
  final String asr;
  final String shom;
  final String hufton;

  TimeEntity({
    required this.id,
    required this.cityId,
    required this.gregorianDate,
    required this.qamarDate,
    required this.bomdod,
    required this.quyosh,
    required this.peshin,
    required this.asr,
    required this.shom,
    required this.hufton,
  });

  @ignore
  factory TimeEntity.fromMap(Map map){
    return TimeEntity(
      id: map["id"],
      cityId: map["city_id"],
      gregorianDate: map["date"],
      qamarDate: map["qamar_date"],
      bomdod: map["tong"],
      quyosh: map["quyosh"],
      peshin: map["peshin"],
      asr: map["asr"],
      shom: map["shom"],
      hufton: map["hufton"],
    );
  }

}
