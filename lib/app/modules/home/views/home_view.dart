import 'package:decorated_icon/decorated_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:tw_weather/app/routes/app_pages.dart';
import 'package:tw_weather/utils/common_widget.dart';
import 'package:tw_weather/utils/json_animation.dart';
import 'package:tw_weather/utils/loading_state.dart';

import '../../../constant.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(apiProvider: Get.find()),
        builder: (controller) {
          return homePage(controller);
        });
  }

  Widget homePage(HomeController controller) {
    return SingleChildScrollView(
      child: Column(
        children: [
          weatherType(),
          const SizedBox(
            height: 30,
          ),
          controller.loadDataStatus.value == LoadDataStatus.finished
              ? mainCityWeather(controller)
              : JsonAnimation.loadAnimation(height: 200, width: 200)
                  .paddingSymmetric(vertical: 50),
          controller.loadDataStatus.value == LoadDataStatus.finished
              ? todayReport()
              : JsonAnimation.loadAnimation(height: 150, width: 150)
                  .paddingSymmetric(vertical: 50),
        ],
      ),
    );
  }

  Widget weatherType() {
    return Container(
      height: 90,
      width: Get.width,
      decoration: BoxDecoration(
        color: topColor,
        boxShadow: [
          BoxShadow(
              color: Colors.black26,
              offset: Offset(0.0, 4.0), //陰影y軸偏移量
              blurRadius: 5, //陰影模糊程度
              spreadRadius: 1 //陰影擴散程度
              )
        ],
      ),
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
                      child: CommonWidget.imageAsset(
                          kWeatherType[kWeatherKey[index]]!['image']!)),
                  CommonWidget.bodyText(
                      kWeatherType[kWeatherKey[index]]!['type']!,
                      fontSize: 15)
                ],
              ).paddingSymmetric(horizontal: 15),
            );
          }),
    ).paddingOnly(top: 50);
  }

  Widget mainCityWeather(HomeController controller) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => controller.getApi(),
          child: CommonWidget.headText(controller.element[0].locationName),
        ),
        const SizedBox(
          height: 5,
        ),
        CommonWidget.bodyText(controller.dateTimeChange(
            controller.element[0].weatherElement[0].time[0].startTime)),
        SizedBox(
            height: 150,
            width: 150,
            child: CommonWidget.imageAsset(
                'assets/image/Moon cloud fast wind.png')),
        const SizedBox(
          height: 10,
        ),
        CommonWidget.headText(
            '${controller.maxT[0].parameter.parameterName} °C',
            fontSize: 50),
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
                  CommonWidget.bodyText('溫度'),
                  CommonWidget.bodyText(
                      '${controller.maxT[0].parameter.parameterName} °C'),
                ],
              ),
            ),
            Container(
              width: Get.width * 0.3,
              height: Get.width * 0.3,
              child: Column(
                children: [
                  CommonWidget.bodyText('濕度'),
                  CommonWidget.bodyText(
                      '${controller.pop[0].parameter.parameterName} %'),
                ],
              ),
            ),
            Container(
              width: Get.width * 0.3,
              height: Get.width * 0.3,
              child: Column(
                children: [
                  CommonWidget.bodyText('風速'),
                  CommonWidget.bodyText('10 km/h'),
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
              child: CommonWidget.headText('Today', fontSize: 20)
                  .paddingOnly(left: 30),
            ),
            Container(
              width: Get.width * 0.5,
              child: GestureDetector(
                onTap: () => Get.toNamed(Routes.FORCAST),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'View Report',
                      style: TextStyle(
                        color: selectColor,
                        fontSize: 18,
                        shadows: [
                          BoxShadow(
                              color: Colors.black26,
                              offset: Offset(4.0, 4.0), //陰影y軸偏移量
                              blurRadius: 5, //陰影模糊程度
                              spreadRadius: 1 //陰影擴散程度
                              )
                        ],
                      ),
                    ),
                    DecoratedIcon(
                      Icons.chevron_right,
                      color: selectColor,
                      shadows: [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(3.0, 3.0), //陰影y軸偏移量
                            blurRadius: 5, //陰影模糊程度
                            spreadRadius: 1 //陰影擴散程度
                            )
                      ],
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
          height: 110,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                return reportItem(index);
              }),
        ).paddingSymmetric(horizontal: 15),
        const SizedBox(
          height: 50,
        ),
      ],
    );
  }

  Widget reportItem(int index) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        color: index == 0 ? selectColor : CardColor,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
              color: Colors.black26,
              offset: Offset(3.0, 3.0), //陰影y軸偏移量
              blurRadius: 5, //陰影模糊程度
              spreadRadius: 1 //陰影擴散程度
              )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
            width: 50,
            child: SimpleShadow(
                color: Colors.black26, // Default: Black
                offset: Offset(0, 2), // Default: Offset(2, 2)
                child: Image.asset('assets/image/Moon cloud fast wind.png')),
          ).paddingOnly(right: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '10:00 AM',
                style: TextStyle(
                  color: index == 0 ? Colors.black : cardTextColor,
                ),
              ).paddingOnly(bottom: 10),
              Text(
                '26 °C',
                style:
                    TextStyle(color: index == 0 ? Colors.black : cardTextColor),
              )
            ],
          ),
        ],
      ),
    ).paddingOnly(right: 20, bottom: 10);
  }
}
