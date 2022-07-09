
import 'package:flutter_map_pet/config/storage_keys.dart';
import 'package:flutter_map_pet/data/local_storage/database.dart';
import 'package:flutter_map_pet/data/local_storage/time/time_dao.dart';
import 'package:flutter_map_pet/data/local_storage/time/time_entity.dart';
import 'package:flutter_map_pet/repositories/interfaces/time_repository_interface.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';


class TimeRepository extends GetConnect implements TimeRepositoryInterface{
  late int _cityId;
  final String _baseUrl = "https://namozvaqti.uz/api/time";
  final GetStorage _storage = Get.find();

  TimeRepository() {
    _cityId = _storage.read(StorageKeys.cityId);
  }

  @override
  Future<TimeEntity?> fetch() async{
    try{
      await fetchRemote();
    } on Exception catch (exception) {
      return null;
    }
    final _database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    TimesDao _timesDao = _database.timeDao;

    String today = DateFormat('yyyy-MM-dd').format(DateTime.now());
    return await _timesDao.getToday(today, _cityId);
  }

  @override
  Future<void> fetchRemote() async{
    try{
      Response response = await get("$_baseUrl/$_cityId");

      if(response.statusCode == 200){
        List<dynamic> data = response.body["data"];
        List<TimeEntity> entities = data.map((time) => TimeEntity.fromMap(time)).toList();
        if(entities.isNotEmpty) saveTime(entities);
      }

    } on Exception catch(exception){}
  }

  @override
  Future<void> saveTime(List<TimeEntity> times) async{
    final _database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    TimesDao _timesDao = _database.timeDao;
    _timesDao.insert(times);
  }

}