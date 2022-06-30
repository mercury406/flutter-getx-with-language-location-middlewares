import 'package:flutter/material.dart';
import 'package:flutter_map_pet/config/constants.dart';
import 'package:flutter_map_pet/data/local_storage/city/city_dao.dart';
import 'package:flutter_map_pet/data/local_storage/city/city_entity.dart';
import 'package:flutter_map_pet/data/local_storage/database.dart';
import 'package:flutter_map_pet/models/city_view_model.dart';
import 'package:get/get.dart';

class LocationRepository extends GetConnect {

  Future<void> _getRemoteCities() async {
    try{
      Response response = await get(AppConstants.baseUrl + "/location");
      if(response.statusCode == 200){
        List<CityEntity> _cities = [];
        response.body.forEach((city) => _cities.add(CityEntity.fromMap(city)));
        _storeCities(_cities);
      }
    }
    on Exception catch(e){
      debugPrint("Exception $runtimeType:  $e");
    }

  }

  Future<void> _storeCities(List<CityEntity> cities)async{
    final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    CityDao cityDao = database.cityDao;
    cityDao.insertCities(cities);
  }

  Future<List<CityViewModel>> getCities(String lang) async {
    try{
      await _getRemoteCities();
    } on Exception catch (e){
      debugPrint("Exception $runtimeType: $e");
    }
    final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    CityDao cityDao = database.cityDao;
    try{
      List<CityEntity> cities = await cityDao.fetchAllCities();
      return cities.map((entity) => CityViewModel.fromEntity(entity, lang)).toList();
    } on Exception catch(e){
      debugPrint("Exception $runtimeType: $e");
      return [];
    }
  }
}
