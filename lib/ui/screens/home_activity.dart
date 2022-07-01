import 'package:flutter/material.dart';
import 'package:flutter_map_pet/config/helpers.dart';
import 'package:flutter_map_pet/config/pages.dart';
import 'package:flutter_map_pet/ui/screens/widgets/date_widget.dart';
import 'package:flutter_map_pet/ui/screens/widgets/home_location_button.dart';
import 'package:flutter_map_pet/ui/screens/widgets/time_widget.dart';

import 'package:get/get.dart';
import 'package:slide_countdown/slide_countdown.dart';

// ignore: must_be_immutable
class HomeActivity extends GetView {
  static const String route = "/home";
  const HomeActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppHelpers.mainColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 16),
              const LocationButton(),
              const SizedBox(height: 16),
              SlideCountdownSeparated(
                height: 72,
                width: 76,
                separatorStyle: const TextStyle(fontSize: 36, color: Colors.white),
                separatorPadding: const EdgeInsets.all(0),
                duration: const Duration(hours: 0, minutes: 20, seconds: 14),
                showZeroValue: true,
                withDays: false,
                textStyle: AppHelpers.generalStyle.copyWith(fontSize: 64),
                decoration: const BoxDecoration(color: Colors.transparent),
              ),
              Text("till_peshin".tr, style: AppHelpers.generalStyle.copyWith(fontSize: 28, letterSpacing: 1.0),),
              const SizedBox(height: 16),
              times()
            ],
          ),
        ),
      ),
    );
  }

  Widget times(){
    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          DateWidget(gregorian: DateTime(2022, 6 , 12), muslimic: DateTime(1443, 9 ,12)),
          const SizedBox(height: 24,),
          TimeWidget(title: "tong".tr, time: "03:06"),
          TimeWidget(title: "quyosh".tr, time: "04:49"),
          TimeWidget(title: "peshin".tr, time: "12:28", isActive: true,),
          TimeWidget(title: "asr".tr, time: "17:38"),
          TimeWidget(title: "shom".tr, time: "19:58"),
          TimeWidget(title: "hufton".tr, time: "21:39"),
          MaterialButton(
            color: Colors.yellow.shade800,
            onPressed: () {
              //TODO: implement Location permission and GPS status
              Get.toNamed(PageRoutes.qibla);
            },
            child: Text("find_qibla".tr, style: const TextStyle(fontWeight: FontWeight.w800),),
          )
        ],
      ),
    );
  }


}