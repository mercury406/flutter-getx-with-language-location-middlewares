import 'package:flutter/material.dart';
import 'package:flutter_map_pet/config/helpers.dart';
import 'package:flutter_map_pet/config/pages.dart';
import 'package:flutter_map_pet/config/storage_keys.dart';
import 'package:flutter_map_pet/models/city_view_model.dart';
import 'package:flutter_map_pet/repositories/location_repository.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LocationTab extends StatelessWidget {
  const LocationTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GetStorage storage = Get.find<GetStorage>();
    return FutureBuilder(
      future: LocationRepository().getCurrentSelectedCity(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if(snapshot.connectionState == ConnectionState.done){
          if(snapshot.hasData){
            CityViewModel city = snapshot.data;
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(city.title, style: AppHelpers.generalStyle.copyWith(fontSize: 18)),
                      Text(city.regionTitle, style: AppHelpers.generalStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w400)),
                    ],
                  ),
                  Expanded(child: Container()),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 0)
                    ),
                      onPressed: (){Get.toNamed(PageRoutes.language);},
                      child: Text(storage.read(StorageKeys.language).toString().toUpperCase(), style: AppHelpers.generalStyle,),
                  ),
                  MaterialButton(
                    padding: const EdgeInsets.all(8),
                    color: Colors.blue,
                    onPressed: (){Get.toNamed(PageRoutes.locations);},
                    child: Text("choose_location".tr, style: const TextStyle(color: Colors.white),),
                  ),
                ],
              ),
            );
          }
        }
        return const Center(child: CircularProgressIndicator(),);
      }
    );
  }
}