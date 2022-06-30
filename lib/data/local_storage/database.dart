import 'dart:async';
import 'package:floor/floor.dart';
import 'package:flutter_map_pet/data/local_storage/city/city_dao.dart';
import 'package:flutter_map_pet/data/local_storage/city/city_entity.dart';
import 'package:flutter_map_pet/data/local_storage/time/time_dao.dart';
import 'package:flutter_map_pet/data/local_storage/time/time_entity.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [CityEntity, TimeEntity])
abstract class AppDatabase extends FloorDatabase {
  CityDao get cityDao;
  TimesDao get timeDao;
}