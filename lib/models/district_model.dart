import 'city_model.dart';

class RegionsModel {
  int id;
  Map<String, String> titles;
  List<CityModel> cities;

  RegionsModel({required this.id, required this.titles, required this.cities});
}