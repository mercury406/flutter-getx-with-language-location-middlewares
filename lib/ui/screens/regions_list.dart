import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map_pet/config/storage_keys.dart';
import 'package:flutter_map_pet/models/district_model.dart';
import 'package:flutter_map_pet/repositories/location_repository.dart';
import 'package:flutter_map_pet/ui/screens/widgets/location_tile.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class RegionsActivity extends StatelessWidget {
  static const String route = "/regions";
  const RegionsActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GetStorage _storage = Get.find<GetStorage>();
    String lang = _storage.read(StorageKeys.language);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Выберите область"),
          backgroundColor: Colors.green,
        ),
        body: FutureBuilder(
          future: LocationRepository().getRegions(),
          builder: (BuildContext context, AsyncSnapshot<List<RegionsModel>> snapshot) {
            if(snapshot.connectionState == ConnectionState.done){
              if(snapshot.hasError) return const Center(child: Text("something went wrong"),);
              List<RegionsModel> _regions = snapshot.hasData ? snapshot.data! : <RegionsModel>[];
              return ListView.builder(
                itemCount: _regions.length,
                itemBuilder: (BuildContext context, int index) {
                  RegionsModel _region = _regions[index];
                  return ExpandablePanel(
                    header: Container(
                        padding: const EdgeInsets.all(16),
                        child: Text(_region.titles[lang]!, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
                    ),
                    collapsed: const SizedBox(),
                    expanded: Column(
                      children: _region.cities.map((city) => LocationTile(city: city)).toList(),
                    )
                  );
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        )
    );
  }
}
