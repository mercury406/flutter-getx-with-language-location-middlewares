import 'package:flutter/material.dart';
import 'package:flutter_map_pet/config/helpers.dart';
import 'package:get/get.dart';

class DateWidget extends StatelessWidget {
  final DateTime gregorian, muslimic;
  const DateWidget({Key? key, required this.gregorian, required this.muslimic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String gregorianDate = "${gregorian.day} iyun ${gregorian.year}";
    String muslimicDate = "${muslimic.day} zulqada ${muslimic.year}";
    return Container(
      width: Get.width,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(width: 2),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(blurRadius: 2.0)
          ]
      ),
      child: Column(
        children: [
          Text(gregorianDate , style: AppHelpers.generalStyle.copyWith(fontSize: 32, color: Colors.black),),
          Text(muslimicDate, style: AppHelpers.generalStyle.copyWith(fontSize: 24, color: Colors.black),)
        ],
      ),
    );
  }
}