import 'package:flutter/material.dart';
import 'package:flutter_map_pet/data/controller/location_controller.dart';
import 'package:flutter_map_pet/models/city_view_model.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class LocationActivity extends GetView <LocationController> {
  static const String route = "/location";
  LocationActivity({Key? key}) : super(key: key);
  final TextEditingController _editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar,
        body: Obx(
            () => controller.isLoadingCities.value
                ? const Center(child: CircularProgressIndicator())
                : Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(top: 4),
                  width: Get.width,
                  child: TextFormField(
                    controller: _editingController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      label: const Text("Искать город"),
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: IconButton(
                          onPressed: (){
                            _editingController.clear();
                          }, icon: const Icon(Icons.close)
                      )
                    ),
                    onChanged: (String str){
                      debugPrint(str);
                      if(str.isNotEmpty) {
                        controller.filterByName(str);
                      } else {
                        controller.initOrResetCityList();
                      }
                    },
                  ),
                ),
                controller.cityList.isEmpty
                    ? Center(child: Text("Город не найден"),)
                    : Expanded(
                        child: ListView.builder(
                          itemCount: controller.cityList.length,
                          itemBuilder: (BuildContext context, int index) {
                            CityViewModel _city = controller.cityList[index];
                            return ListTile(
                              title: Text(_city.title),
                              subtitle: Text(_city.region.title),
                            );
                          },
                        ),
                      ),
              ],
            ),
        ),
    );
  }

  PreferredSizeWidget appBar = AppBar(
    title: const Text("Выберите область"),
    backgroundColor: Colors.green,
  );
}
