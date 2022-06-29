

import '../../models/district_model.dart';

abstract class LocationRepositoryInterface{
  Future<List<RegionsModel>> getRemoteDistrictList();
  Future<List<RegionsModel>> getLocalDistrictList();

  Future<List<RegionsModel>> getDistrictList();
  Future<dynamic> storeDistrictList();

}