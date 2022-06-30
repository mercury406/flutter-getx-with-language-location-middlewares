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
  HomeActivity({Key? key}) : super(key: key);
  RxBool drag = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppHelpers.mainColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Obx(
                  () => Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const LocationButton(),
                  Center(
                    child: Column(
                      children: [
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
                        Text("Peshingacha", style: AppHelpers.generalStyle.copyWith(fontSize: 28, letterSpacing: 1.0),)
                      ],
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      _openModalBottomSheet();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppHelpers.secondaryColor,
                          borderRadius: BorderRadius.circular(32)
                      ),
                      padding: const EdgeInsets.all(16),
                      child: const Text("Namoz vaqtlari", style: AppHelpers.generalStyle,),
                    ),
                  ),
                  if(drag()) SizedBox(height: Get.height * 0.4,)
                ],
              )
          ),
        ),
      ),
    );
  }

  void _openModalBottomSheet() {
    Get.bottomSheet(
      Container(
        color: Colors.white,
        padding: const EdgeInsets.all(12),
        child: ListView(
          children: [
            DateWidget(gregorian: DateTime(2022, 6 , 12), muslimic: DateTime(1443, 9 ,12)),
            const SizedBox(height: 24,),
            TimeWidget(title: "Bomdod", time: "03:06"),
            TimeWidget(title: "Quyosh", time: "04:49"),
            TimeWidget(title: "Peshin", time: "12:28", isActive: true,),
            TimeWidget(title: "Asr", time: "17:38"),
            TimeWidget(title: "Shom", time: "19:58"),
            TimeWidget(title: "Xufton", time: "21:39"),
            ElevatedButton(
              onPressed: () {
                //TODO: implement Location permission and GPS status
                Get.toNamed(PageRoutes.qibla);
              },
              child: const Text("Qiblani topish"),
            )
          ],
        ),
      ),
    ).then((value) => drag(false));
    drag(true);

  }
}