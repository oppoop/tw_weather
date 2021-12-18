import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant.dart';
import '../controllers/location_controller.dart';

class LocationView extends GetView<LocationController> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          weatherType(),
          const SizedBox(
            height: 30,
          ),
          mainCityWeather(),
          todayReport(),
        ],
      ),
    );
  }

  Widget weatherType() {
    return Container(
      height: 90,
      width: Get.width,
      color: topColor,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: kWeatherKey.length,
          itemBuilder: (context, index) {
            return Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: Image.asset(
                        kWeatherType[kWeatherKey[index]]!['image']!),
                  ),
                  Text(
                    kWeatherType[kWeatherKey[index]]!['type']!,
                    style: TextStyle(color: kWhiteColor),
                  ),
                ],
              ).paddingSymmetric(horizontal: 15),
            );
          }),
    ).paddingOnly(top: 50);
  }

  Widget mainCityWeather() {
    return Column(
      children: [
        Text(
          '台北',
          style: TextStyle(
              color: kWhiteColor, fontWeight: FontWeight.w600, fontSize: 40),
        ),
        const SizedBox(
          height: 5,
        ),
        Text('7月 22日 2021', style: TextStyle(color: kWhiteColor, fontSize: 18)),
        SizedBox(
          height: 150,
          width: 150,
          child: Image.asset('assets/image/Moon cloud fast wind.png'),
        ),
        const SizedBox(
          height: 10,
        ),
        Text('26 °C',
            style: TextStyle(
                color: kWhiteColor, fontSize: 50, fontWeight: FontWeight.w600)),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: Get.width * 0.3,
              height: Get.width * 0.3,
              child: Column(
                children: [
                  Text('溫度',
                      style: TextStyle(color: kWhiteColor, fontSize: 18)),
                  Text('26 °C',
                      style: TextStyle(color: kWhiteColor, fontSize: 18)),
                ],
              ),
            ),
            Container(
              width: Get.width * 0.3,
              height: Get.width * 0.3,
              child: Column(
                children: [
                  Text('濕度',
                      style: TextStyle(color: kWhiteColor, fontSize: 18)),
                  Text('60%',
                      style: TextStyle(color: kWhiteColor, fontSize: 18)),
                ],
              ),
            ),
            Container(
              width: Get.width * 0.3,
              height: Get.width * 0.3,
              child: Column(
                children: [
                  Text('風速',
                      style: TextStyle(color: kWhiteColor, fontSize: 18)),
                  Text('10 km/h',
                      style: TextStyle(color: kWhiteColor, fontSize: 18)),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget todayReport() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              width: Get.width * 0.5,
              child: Text(
                'Today',
                style: TextStyle(
                    color: kWhiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ).paddingOnly(left: 30),
            ),
            Container(
              width: Get.width * 0.5,
              child: GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'View Report',
                      style: TextStyle(color: selectColor, fontSize: 18),
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: selectColor,
                    )
                  ],
                ).paddingOnly(right: 20),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 50,
        ),
        Container(
          width: Get.width,
          height: 100,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                return reportItem();
              }),
        ).paddingSymmetric(horizontal: 15),
        const SizedBox(
          height: 50,
        ),
      ],
    );
  }

  Widget reportItem() {
    return Container(
      height: 90,
      width: 150,
      decoration: BoxDecoration(
          color: selectColor, borderRadius: BorderRadius.circular(30)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
            width: 50,
            child: Image.asset('assets/image/Moon cloud fast wind.png'),
          ).paddingOnly(right: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('10:00 AM').paddingOnly(bottom: 10), Text('26 °C')],
          ),
        ],
      ),
    ).paddingOnly(right: 20);
  }
}
