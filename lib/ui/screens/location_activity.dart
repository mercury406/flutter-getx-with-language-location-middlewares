import 'package:flutter/material.dart';
import 'package:flutter_map_pet/config/pages.dart';
import 'package:flutter_map_pet/config/storage_keys.dart';
import 'package:flutter_map_pet/repositories/location_repository.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LocationActivity extends StatefulWidget {
  static const String route = "/regions";

  const LocationActivity({Key? key}) : super(key: key);

  @override
  State<LocationActivity> createState() => _LocationActivityState();
}

class _LocationActivityState extends State<LocationActivity> {
  final GetStorage _storage = Get.find<GetStorage>();
  final LocationRepository _locationRepository = Get.find<LocationRepository>();
  final TextEditingController _editingController = TextEditingController();
  RxList cities = [].obs;
  String lang = "uz";
  RxBool loading = true.obs;

  @override
  void initState() {
    super.initState();
    lang = _storage.read(StorageKeys.language) ?? "uz";
    debugPrint("Lang: $lang");
    setCities();
  }

  setCities() async {
    cities.value = await _locationRepository.getCities(lang);
    loading.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("choose_location".tr),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            child: TextField(
              controller: _editingController,
              maxLines: 1,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                label: Text("find_city".tr),
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () async {
                    _editingController.clear();
                    await setCities();
                  },
                ),
              ),
              onChanged: (String str) async {
                if (str.isNotEmpty) {
                  cities.value = cities
                      .where((city) => city.title.toString().toLowerCase().startsWith(str))
                      .toList();
                } else {
                  await setCities();
                }
              },
            ),
          ),
          Expanded(
            child: Obx(
              () => loading.value
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: cities.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text(cities[index].title),
                          subtitle: Text(cities[index].regionTitle),
                          onTap: () async {
                            await _storage.write(StorageKeys.cityId, cities[index].id);
                            Get.offAllNamed(PageRoutes.home);
                          },
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
