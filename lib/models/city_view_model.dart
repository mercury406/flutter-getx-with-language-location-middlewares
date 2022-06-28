import 'package:flutter_map_pet/models/region_view_model.dart';

class CityViewModel{
  int id;
  String title;
  RegionViewModel region;

  CityViewModel({
    required this.id,
    required this.title,
    required this.region,
  });
}