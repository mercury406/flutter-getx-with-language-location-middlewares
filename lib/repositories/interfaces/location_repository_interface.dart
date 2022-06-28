
import 'package:flutter_map_pet/models/city_model.dart';

abstract class LocationRepositoryInterface{
  Future<List<CityModel>> getRemoteCities();
  Future<List<CityModel>> getLocalCities();

  Future<List<CityModel>> getCities();
  Future<dynamic> storeCities();

}