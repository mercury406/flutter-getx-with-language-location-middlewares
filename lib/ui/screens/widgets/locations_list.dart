import 'package:flutter/material.dart';
import 'package:flutter_map_pet/models/city_model.dart';

class LocationListView extends StatelessWidget {
  final List<CityModel> _cities;
  final String lang;
  const LocationListView(this._cities, {Key? key, this.lang = "uz", }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _cities.length,
      itemBuilder: (BuildContext context, int index) {
        CityModel _city = _cities[index];
        return ListTile(
          title: Text(_city.titles[lang]),
          subtitle: Text(_city.region.titles[lang]),
        );
      },
    );
  }
}
