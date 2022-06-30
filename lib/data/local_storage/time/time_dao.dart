import 'package:floor/floor.dart';
import 'package:flutter_map_pet/data/local_storage/time/time_entity.dart';

@dao
abstract class TimesDao{

  @Query("SELECT * FROM times WHERE gregorianDate=:gregorianDate AND cityId=:cityId")
  Future<List<TimeEntity?>> getToday(String gregorianDate, int cityId);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insert(List<TimeEntity> times);
}