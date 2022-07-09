import 'package:flutter/material.dart';
import 'package:flutter_map_pet/config/helpers.dart';
import 'package:flutter_map_pet/config/pages.dart';
import 'package:flutter_map_pet/data/controller/home_controller.dart';
import 'package:flutter_map_pet/ui/screens/widgets/date_widget.dart';
import 'package:flutter_map_pet/ui/screens/widgets/home_location_tap.dart';
import 'package:flutter_map_pet/ui/screens/widgets/time_widget.dart';

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:slide_countdown/slide_countdown.dart';

// ignore: must_be_immutable
class HomeActivity extends GetView<HomeController> {
  static const String route = "/home";
  HomeActivity({Key? key}) : super(key: key);
  final RefreshController _refreshController = RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppHelpers.mainColor,
      body: Obx(
          () => controller.loading.value
              ? const Center(child: CircularProgressIndicator(),)
              : controller.nullTimeModel.value
                ? Padding(padding: const EdgeInsets.all(8), child: Center(child: Text("no_data_error".tr, style: AppHelpers.generalStyle.copyWith(fontSize: 20),),),)
                : SmartRefresher(
                    controller: _refreshController,
                    onRefresh: (){
                      controller.setTimePeriod();
                      _refreshController.refreshCompleted();
                    },
                    child: SingleChildScrollView(
                    child: SafeArea(
                      child: Column(
                        children: [
                          const SizedBox(height: 16),
                          const LocationTab(),
                          const SizedBox(height: 16),
                          SlideCountdownSeparated(
                            height: 72,
                            width: 76,
                            separatorStyle: const TextStyle(fontSize: 36, color: Colors.white),
                            separatorPadding: const EdgeInsets.all(0),
                            duration: controller.durationTillNextPeriod!,
                            showZeroValue: true,
                            withDays: false,
                            textStyle: AppHelpers.generalStyle.copyWith(fontSize: 64),
                            decoration: const BoxDecoration(color: Colors.transparent),
                            onDone: () {
                              controller.setTimePeriod();
                            },
                          ),
                          Text(controller.timePeriodString.value, style: AppHelpers.generalStyle.copyWith(fontSize: 28, letterSpacing: 1.0),),
                          const SizedBox(height: 16),
                          Container(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              children: [
                                DateWidget(gregorian: controller.gregorianDate!, muslimic: controller.muslimicDate!),
                                const SizedBox(height: 24,),
                                TimeWidget(title: "tong".tr, time: controller.time!.bomdod, isActive: controller.timePeriod.value == 0),
                                TimeWidget(title: "quyosh".tr, time: controller.time!.quyosh, isActive: controller.timePeriod.value == 1),
                                TimeWidget(title: "peshin".tr, time: controller.time!.peshin, isActive: controller.timePeriod.value == 2),
                                TimeWidget(title: "asr".tr, time: controller.time!.asr, isActive: controller.timePeriod.value == 3),
                                TimeWidget(title: "shom".tr, time: controller.time!.shom, isActive: controller.timePeriod.value == 4),
                                TimeWidget(title: "hufton".tr, time: controller.time!.hufton, isActive: controller.timePeriod.value == 5),
                                MaterialButton(
                                  color: Colors.yellow.shade800,
                                  onPressed: () {
                                    Get.toNamed(PageRoutes.qibla);
                                  },
                                  child: Text("find_qibla".tr, style: const TextStyle(fontWeight: FontWeight.w800)),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
          ),
                ),

      ),
    );
  }
}