import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tw_weather/app/widget/bottom_bar.dart';

import '../../../constant.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavBarCurvedFb1(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              weatherType(),
              const SizedBox(
                height: 30,
              ),
              mainCityWeather(),
            ],
          ),
        ));
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
}
