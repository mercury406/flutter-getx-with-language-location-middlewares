import 'package:flutter/material.dart';
import 'package:flutter_map_pet/config/helpers.dart';
import 'package:flutter_map_pet/config/pages.dart';
import 'package:get/get.dart';

class LocationButton extends StatelessWidget {
  const LocationButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(PageRoutes.locations);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("Toshkent", style: AppHelpers.generalStyle.copyWith(fontSize: 28)),
              Text("boshqa", style: AppHelpers.generalStyle.copyWith(fontSize: 20, fontWeight: FontWeight.w400)),
            ],
          ),
          const SizedBox(width: 8,),
          const Icon(Icons.location_on, color: Colors.white,),
        ],
      ),
    );
  }
}