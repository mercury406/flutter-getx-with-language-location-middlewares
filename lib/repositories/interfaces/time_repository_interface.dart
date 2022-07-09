import 'package:flutter_map_pet/data/local_storage/time/time_entity.dart';

abstract class TimeRepositoryInterface{

  Future<TimeEntity?> fetch();
  Future<void> fetchRemote();

  Future<void> saveTime(List<TimeEntity> times);

}