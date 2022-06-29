import 'package:flutter_map_pet/models/city_model.dart';
import 'package:flutter_map_pet/models/district_model.dart';

class LocationRepository{

  Future<List<RegionsModel>> getRegions() async {
    await Future.delayed(const Duration(seconds: 2));
    return _districts;
  }

  final List<RegionsModel> _districts = [
    RegionsModel(id: 1, titles: {
      "ru": "Бухарская область",
      "oz": "Бухоро вилояти",
      "uz": "Buhoro viloyati",
      "en": "Bukhara distrct"
    }, cities: [
      CityModel(id: 1,titles: {"ru": "Бухара", "oz": "Бухоро", "uz": "Buhoro", "en": "Bukhara"},),
      CityModel(id: 2,titles: {"ru": "Бухара", "oz": "Бухоро", "uz": "Buhoro", "en": "Bukhara"},),
      CityModel(id: 3,titles: {"ru": "Бухара", "oz": "Бухоро", "uz": "Buhoro", "en": "Bukhara"},),
      CityModel(id: 4,titles: {"ru": "Бухара", "oz": "Бухоро", "uz": "Buhoro", "en": "Bukhara"},),
    ]),
    RegionsModel(id: 2, titles: {
      "ru": "Самаркандская область",
      "oz": "Самарканд вилояти",
      "uz": "Samarqand viloyati",
      "en": "Samarqand distrct"
    }, cities: [
      CityModel(id: 5,titles: {"ru": "Самарканд", "oz": "Самарканд", "uz": "Samarqand", "en": "Samarqand"},),
      CityModel(id: 6,titles: {"ru": "Самарканд", "oz": "Самарканд", "uz": "Samarqand", "en": "Samarqand"},),
      CityModel(id: 7,titles: {"ru": "Самарканд", "oz": "Самарканд", "uz": "Samarqand", "en": "Samarqand"},),

    ]),
    RegionsModel(id: 3, titles: {
      "ru": "Хорезмская область",
      "oz": "Хоразм вилояти",
      "uz": "Xorazm viloyati",
      "en": "Khorezm distrct"
    }, cities: [
      CityModel(id: 8,titles: {"ru": "Хорезм", "oz": "Хоразм", "uz": "Xorazm", "en": "Khorezm"},),
      CityModel(id: 9,titles: {"ru": "Хорезм", "oz": "Хоразм", "uz": "Xorazm", "en": "Khorezm"},),
      CityModel(id: 10,titles: {"ru": "Хорезм", "oz": "Хоразм", "uz": "Xorazm", "en": "Khorezm"},),
      CityModel(id: 11,titles: {"ru": "Хорезм", "oz": "Хоразм", "uz": "Xorazm", "en": "Khorezm"},),
    ])
  ];
}