import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class TimeWidget extends StatelessWidget {
  final String time;
  final String title;
  bool isActive;

  TimeWidget({Key? key, required this.title, required this.time, this.isActive = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle dateStyle = const TextStyle(fontSize: 18, fontWeight: FontWeight.w800);
    return Container(
        width: Get.width * 0.8,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 26),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(width: 2),
          color: isActive ? Colors.green : Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: dateStyle),
            Text(time, style: dateStyle),
          ],
        )
    );
  }
}