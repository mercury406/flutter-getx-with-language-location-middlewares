import 'package:flutter_map_pet/data/local_storage/time/time_entity.dart';
import 'package:flutter_map_pet/repositories/time_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  RxBool loading = false.obs;
  TimeEntity? time;
  final TimeRepository _timeRepository = Get.find();
  DateTime? gregorianDate, muslimicDate;
  RxBool nullTimeModel = false.obs;
  RxString timePeriodString = "till_tom_tong".tr.obs;
  RxInt timePeriod = 5.obs;
  Duration? durationTillNextPeriod;

  @override
  void onInit() async{
    fetchTimeModel();
    super.onInit();
  }

  void fetchTimeModel() async{
    loading(true);
    time = await _timeRepository.fetch();
    if(time == null) {
      nullTimeModel(true);
    } else {
      gregorianDate = DateTime.parse(time!.gregorianDate);
      muslimicDate = DateTime.parse(time!.qamarDate);
      setTimePeriod();
    }
    loading(false);
  }

  void setTimePeriod(){
    loading(true);
    DateTime now = DateTime.now();
    DateTime bomdod =  DateTime.parse("${time!.gregorianDate} ${time!.bomdod}");
    DateTime quyosh =  DateTime.parse("${time!.gregorianDate} ${time!.quyosh}");
    DateTime peshin =  DateTime.parse("${time!.gregorianDate} ${time!.peshin}");
    DateTime asr =  DateTime.parse("${time!.gregorianDate} ${time!.asr}");
    DateTime shom =  DateTime.parse("${time!.gregorianDate} ${time!.shom}");
    DateTime hufton =  DateTime.parse("${time!.gregorianDate} ${time!.hufton}");


    if( now.isBefore(bomdod) ) {
      timePeriodString.value = "till_tong".tr;
      timePeriod.value = 0;
      durationTillNextPeriod = - now.difference(bomdod);
    }
    else if( now.isBefore(quyosh) ) {
      timePeriodString.value = "till_quyosh".tr;
      timePeriod.value = 1;
      durationTillNextPeriod = - now.difference(quyosh);
    }
    else if( now.isBefore(peshin) ) {
      timePeriodString.value = "till_peshin".tr;
      timePeriod.value = 2;
      durationTillNextPeriod = - now.difference(peshin);
    }
    else if( now.isBefore(asr) ) {
      timePeriodString.value = "till_asr".tr;
      timePeriod.value = 3;
      durationTillNextPeriod = - now.difference(asr);
    }
    else if( now.isBefore(shom) ) {
      timePeriodString.value = "till_shom".tr;
      timePeriod.value = 4;
      durationTillNextPeriod = - now.difference(shom);
    }
    else if( now.isBefore(hufton) ) {
      timePeriodString.value = "till_hufton".tr;
      timePeriod.value = 5;
      durationTillNextPeriod = - now.difference(hufton);
    }

    loading(false);
  }


}