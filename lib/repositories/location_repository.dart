import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map_pet/config/constants.dart';
import 'package:flutter_map_pet/models/city_model.dart';
import 'package:flutter_map_pet/models/region_model.dart';
import 'package:flutter_map_pet/repositories/interfaces/location_repository_interface.dart';

class LocationRepository implements LocationRepositoryInterface {
  late Dio _dio;

  LocationRepository() {
    BaseOptions _baseOptions = BaseOptions(
      baseUrl: AppConstants.baseUrl,
      responseType: ResponseType.json,
    );
    _dio = Dio(_baseOptions);
  }

  @override
  Future<List<CityModel>> getCities() async {
    var c = await getRemoteCities();
    return c;
  }

  @override
  Future<List<CityModel>> getLocalCities() async {
    return <CityModel>[];
  }

  @override
  Future<List<CityModel>> getRemoteCities() async {
    try {
      Response response = await _dio.get("/location");
      List<dynamic> responseData = response.data;
      List<CityModel> cities = [];
      for (var item in responseData) {
        cities.add(
          CityModel(
            id: item["id"],
            titles: item["title"],
            region: RegionModel(id: item["region"]["id"], titles: item["region"]["title"])
          )
        );
      }
      return cities;
    } on Exception catch (e) {
      debugPrint(e.toString());
      return <CityModel>[];
    }
  }

  @override
  Future storeCities() async {
    return [];
  }
}
