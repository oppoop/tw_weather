import 'package:decorated_icon/decorated_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:tw_weather/app/models/city_records_model.dart';
import 'package:tw_weather/utils/common_widget.dart';
import 'package:tw_weather/utils/json_animation.dart';
import 'package:tw_weather/utils/loading_state.dart';
import 'package:tw_weather/utils/time_transform.dart';

import '../../../constant.dart';
import '../controllers/forcast_controller.dart';

class ForcastView extends GetView<ForcastController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForcastController>(
        init: ForcastController(apiProvider: Get.find()),
        builder: (controller) {
          return Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: IconButton(
                          onPressed: () => Get.back(),
                          icon: DecoratedIcon(
                            Icons.arrow_back_ios_outlined,
                            color: kWhiteColor,
                            shadows: [
                              BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(4.0, 4.0), //陰影y軸偏移量
                                  blurRadius: 5, //陰影模糊程度
                                  spreadRadius: 1 //陰影擴散程度
                                  )
                            ],
                          )),
                    ),
                    CommonWidget.headText('一週預報', fontSize: 25),
                    const SizedBox(
                      width: 50,
                      height: 50,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      width: Get.width * 0.5,
                      child: CommonWidget.headText('今日', fontSize: 20)
                          .paddingOnly(left: 30),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      width: Get.width * 0.5,
                      child: CommonWidget.bodyText(
                              '${controller.todayM}月 ${controller.todayD}日, ${controller.todayY}',
                              fontSize: 15)
                          .paddingOnly(right: 30),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: Get.width,
                  height: 110,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: controller.todayWeather.length,
                      itemBuilder: (context, index) {
                        return reportItem(index,
                            weatherData: controller.todayWeather,
                            temData: controller.todayT);
                      }),
                ).paddingSymmetric(horizontal: 15),
                const SizedBox(
                  height: 30,
                ),
                CommonWidget.headText('未來一週', fontSize: 20)
                    .paddingOnly(left: 30),
                const SizedBox(
                  height: 10,
                ),
                controller.loadDataStatus == LoadDataStatus.finished
                    ? Container(
                        height: Get.height * 0.5,
                        width: Get.width,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.weekT.length,
                          itemBuilder: (context, index) => forecastItem(
                              temData: controller.weekT[index],
                              weatherData: controller.weekWeather[index],
                              weekDay: controller
                                  .weekDay(controller.todayWeekDay)[index]),
                        ),
                      )
                    : Center(
                        child: JsonAnimation.loadAnimation(
                            height: 200, width: 200),
                      )
              ],
            ).paddingOnly(top: 20),
          );
        });
  }

  Widget reportItem(int index,
      {required List<CityTime> weatherData, required List<CityTime> temData}) {
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
                child: CommonWidget.imageAsset(
                    weatherData[index].elementValue[1].value)),
          ).paddingOnly(right: 15),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                TimeTransform.transHM(weatherData[index].startTime),
                style: TextStyle(
                  color: index == 0 ? Colors.black : cardTextColor,
                ),
              ).paddingOnly(bottom: 10),
              Text(
                '${temData[index].elementValue[0].value} °C',
                style:
                    TextStyle(color: index == 0 ? Colors.black : cardTextColor),
              )
            ],
          ),
        ],
      ),
    ).paddingOnly(right: 20, bottom: 10);
  }

  Widget forecastItem(
      {required CityTime temData,
      required CityTime weatherData,
      required String weekDay}) {
    return Align(
      child: Container(
        height: 100,
        width: Get.width * 0.85,
        decoration: BoxDecoration(
          color: CardColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.black26,
                offset: Offset(4.0, 4.0), //陰影y軸偏移量
                blurRadius: 5, //陰影模糊程度
                spreadRadius: 1 //陰影擴散程度
                )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              alignment: Alignment.center,
              height: 90,
              width: Get.width * 0.25,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    weekDay,
                    style: TextStyle(
                        color: cardTextColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    TimeTransform.transMD(temData.startTime),
                    style: TextStyle(color: cardTextColor, fontSize: 12),
                  )
                ],
              ),
            ),
            Container(
                alignment: Alignment.center,
                height: 90,
                width: Get.width * 0.25,
                child: Text('${temData.elementValue[0].value} °C',
                    style: TextStyle(
                        color: cardTextColor,
                        fontSize: 30,
                        fontWeight: FontWeight.w500))),
            Container(
              alignment: Alignment.center,
              height: 90,
              width: Get.width * 0.25,
              child: SizedBox(
                height: 80,
                width: 80,
                child: SimpleShadow(
                    color: Colors.black26, // Default: Black
                    offset: Offset(0, 2), // Default: Offset(2, 2)
                    child: CommonWidget.imageAsset(
                        weatherData.elementValue[1].value)),
              ).paddingOnly(right: 10),
            ),
          ],
        ),
      ),
    ).paddingOnly(bottom: 20);
  }
}
