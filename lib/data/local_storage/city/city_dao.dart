import 'package:floor/floor.dart';
import 'package:flutter_map_pet/data/local_storage/city/city_entity.dart';

@dao
abstract class CityDao{
  @Query("SELECT * FROM cities ORDER BY poryadok ASC")
  Future<List<CityEntity>> fetchAllCities();

  @Query("SELECT * FROM cities WHERE id = :id")
  Future<CityEntity?> fetchCityById(int id);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertCity(CityEntity entity);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertCities(List<CityEntity> entities);

  @Query("DELETE FROM cities")
  Future<void> deleteAllCities();

}