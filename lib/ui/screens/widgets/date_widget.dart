import 'package:flutter/material.dart';
import 'package:flutter_map_pet/config/helpers.dart';
import 'package:get/get.dart';

class DateWidget extends StatelessWidget {
  final DateTime gregorian, muslimic;
  const DateWidget({Key? key, required this.gregorian, required this.muslimic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String qamarMonth = "qamar_${DateTime(1443, 12, 1).month - 1}".tr;
    String gregMonth = "greg_${DateTime.now().month - 1}".tr;

    String gregorianDate = "${gregorian.day} $gregMonth ${gregorian.year}";
    String muslimicDate = "${muslimic.day} $qamarMonth ${muslimic.year}";
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(gregorianDate , style: AppHelpers.generalStyle.copyWith(fontSize: 14, color: Colors.white),),
        Text(muslimicDate, style: AppHelpers.generalStyle.copyWith(fontSize: 14, color: Colors.white),)
      ],
    );
  }
}