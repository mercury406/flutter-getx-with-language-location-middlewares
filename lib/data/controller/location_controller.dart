import 'package:flutter_map_pet/data/controller/settings_controller.dart';
import 'package:flutter_map_pet/models/city_model.dart';
import 'package:flutter_map_pet/models/city_view_model.dart';
import 'package:flutter_map_pet/models/region_view_model.dart';
import 'package:flutter_map_pet/repositories/location_repository.dart';
import 'package:get/get.dart';

class LocationController extends GetxController {
  final SettingsController _settings = Get.find<SettingsController>();
  List _allCities = <CityModel>[];
  List _allCitiesView = <CityViewModel>[];
  RxBool isLoadingCities = true.obs;
  RxList cityList = <CityViewModel>[].obs;
  late String language = "uz";

  @override
  void onInit() async {
    language = _settings.language.value;
    _allCities = await LocationRepository().getCities();
    initOrResetCityList();
    isLoadingCities.value = false;
    super.onInit();
  }

  void filterByName(String name) {
    cityList.value = _allCitiesView.where((city) => city.title.startsWith(name)).toList();
  }

  void initOrResetCityList(){
    _allCitiesView = _allCities.map(
          (city) => CityViewModel(
        id: city.id,
        title: city.titles[language],
        region: RegionViewModel(
          id: city.region.id,
          title: city.region.titles[language],
        ),
      ),
    ).toList();

    cityList.value = _allCitiesView;
  }
}
