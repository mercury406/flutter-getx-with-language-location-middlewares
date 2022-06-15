abstract class AppSettingsRepositoryInterface {
  String? getLanguage();
  int? getCityId();

  Future<void> storeLanguage(String lang);
  Future<void> storeCityId(int cityId);
}