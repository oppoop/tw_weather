import 'package:decorated_icon/decorated_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:tw_weather/app/models/city_records_model.dart';
import 'package:tw_weather/app/routes/app_pages.dart';
import 'package:tw_weather/utils/common_widget.dart';
import 'package:tw_weather/utils/json_animation.dart';
import 'package:tw_weather/utils/loading_state.dart';
import 'package:tw_weather/utils/time_transform.dart';

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
          todayReport(controller)
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
                    child: SimpleShadow(
                      child: Image.asset(
                          kWeatherType[kWeatherKey[index]]!['image']!
                              as String),
                      opacity: 0.7, // Default: 0.5
                      color: Colors.black38, // Default: Black
                      offset: Offset(5, 5), // Default: Offset(2, 2)
                      sigma: 3, // Default: 2
                    ),
                  ),
                  CommonWidget.bodyText(
                      kWeatherType[kWeatherKey[index]]!['name']! as String,
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
        CommonWidget.headText(controller.element[0].locationsName),
        const SizedBox(
          height: 5,
        ),
        DropdownButton<int>(
          style: TextStyle(color: kWhiteColor),
          hint: CommonWidget.bodyText(controller.location.value,
              color: Colors.white),
          dropdownColor: topColor,
          onChanged: (newValue) {
            controller.setNewLocation(newValue!);
          },
          value: controller.localSelect.value,
          items: controller.localNum.map((selectedType) {
            return DropdownMenuItem(
              child: new Text(
                  controller.element[0].location[selectedType].locationName),
              value: selectedType,
            );
          }).toList(),
        ),
        const SizedBox(
          height: 5,
        ),
        CommonWidget.bodyText(controller.date.value),
        SizedBox(
            height: 150,
            width: 150,
            child: CommonWidget.imageAsset(
                controller.weather[0].elementValue[1].value)),
        const SizedBox(
          height: 10,
        ),
        Obx(() => CommonWidget.headText(
            controller
                .weather[controller.itemIndex.value].elementValue[0].value,
            fontSize: 25)).paddingSymmetric(vertical: 15),
        const SizedBox(
          height: 20,
        ),
        Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: Get.width * 0.3,
                  height: Get.width * 0.3,
                  child: Column(
                    children: [
                      CommonWidget.bodyText('溫度'),
                      CommonWidget.bodyText(
                          '${controller.t[controller.itemIndex.value].elementValue[0].value} °C'),
                    ],
                  ),
                ),
                Container(
                  width: Get.width * 0.3,
                  height: Get.width * 0.3,
                  child: Column(
                    children: [
                      CommonWidget.bodyText('降雨機率'),
                      CommonWidget.bodyText(
                          '${controller.pop[controller.itemIndex.value].elementValue[0].value} %'),
                    ],
                  ),
                ),
                Container(
                  width: Get.width * 0.3,
                  height: Get.width * 0.3,
                  child: Column(
                    children: [
                      CommonWidget.bodyText('風速'),
                      CommonWidget.bodyText(
                          '${controller.ws[controller.itemIndex.value].elementValue[0].value} km/h'),
                    ],
                  ),
                )
              ],
            )),
      ],
    );
  }

  Widget todayReport(HomeController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              width: Get.width * 0.5,
              child: CommonWidget.headText('近3日', fontSize: 20)
                  .paddingOnly(left: 30),
            ),
            Container(
              width: Get.width * 0.5,
              child: GestureDetector(
                onTap: () => Get.toNamed(Routes.FORCAST, arguments: {
                  'city': controller.city.value,
                  'localSelect': controller.localSelect.value,
                  'todayWeekDay': controller.now.weekday,
                  'weather': controller.weather,
                  't': controller.t,
                  'y': controller.now.year,
                  'm': controller.now.month,
                  'd': controller.now.day
                }),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '查看未來一周',
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
        controller.loadDataStatus.value == LoadDataStatus.finished
            ? Container(
                width: Get.width,
                height: 110,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: controller.weather.length,
                    itemBuilder: (context, index) {
                      return Obx(() => reportItem(index,
                          weather: controller.weather, T: controller.t));
                    }),
              ).paddingSymmetric(horizontal: 15)
            : Center(
                child: JsonAnimation.loadAnimation(height: 150, width: 150)
                    .paddingSymmetric(vertical: 5),
              ),
        const SizedBox(
          height: 50,
        ),
      ],
    );
  }

  Widget reportItem(int index,
      {required List<CityTime> weather, required List<CityTime> T}) {
    return GestureDetector(
      onTap: () => controller.itemIndex.value = index,
      child: Container(
        width: 150,
        decoration: BoxDecoration(
          color: index == controller.itemIndex.value ? selectColor : CardColor,
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
        child: Column(
          children: [
            Text(
              TimeTransform.transMD(weather[index].startTime),
              style: TextStyle(
                color: index == controller.itemIndex.value
                    ? Colors.black
                    : cardTextColor,
              ),
            ).paddingSymmetric(vertical: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    height: 50,
                    width: 50,
                    child: CommonWidget.imageAsset(
                        weather[0].elementValue[1].value,
                        color: Colors.black26,
                        opacity: 0.5,
                        dx: 0,
                        dy: 2,
                        sigma: 2)),
                const SizedBox(width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      TimeTransform.transHM(weather[index].startTime),
                      style: TextStyle(
                        color: index == controller.itemIndex.value
                            ? Colors.black
                            : cardTextColor,
                      ),
                    ).paddingOnly(bottom: 10),
                    Text(
                      '${T[index].elementValue[0].value} °C',
                      style: TextStyle(
                          color: index == controller.itemIndex.value
                              ? Colors.black
                              : cardTextColor),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ).paddingOnly(right: 20, bottom: 10);
  }
}
