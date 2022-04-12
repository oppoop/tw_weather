import 'package:decorated_icon/decorated_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:tw_weather/utils/common_widget.dart';

import '../../../constant.dart';
import '../controllers/tutorial_controller.dart';

class TutorialView extends GetView<TutorialController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TutorialController>(
        init: TutorialController(),
        builder: (controller) {
          return Scaffold(body: tutorialPage());
        });
  }

  Widget tutorialPage() {
    return GestureDetector(
      onTap: () => controller.tutorialStep.value++,
      child: SingleChildScrollView(
        child: Column(
          children: [
            weatherType(),
            mainCityWeather(controller),
            todayReport(controller),
          ],
        ),
      ),
    );
  }

  Widget weatherType() {
    return Stack(
      children: [
        Container(
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
        ).paddingOnly(top: 50),
        mask(170)
      ],
    );
  }

  Widget mainCityWeather(TutorialController controller) {
    return Obx(() => Stack(
          children: [
            Column(
              children: [
                CommonWidget.headText('臺北市'.tr),
                const SizedBox(
                  height: 5,
                ),
                /*DropdownButton<int>(
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
        ),*/
                const SizedBox(
                  height: 5,
                ),
                CommonWidget.bodyText('2月7日 , 2022'),
                SizedBox(
                    height: 150,
                    width: 150,
                    child: SimpleShadow(
                      child: Image.asset('assets/image/Sunny.png'),
                      opacity: 0.7, // Default: 0.5
                      color: Colors.black38, // Default: Black
                      offset: Offset(5, 3), // Default: Offset(2, 2)
                      sigma: 3, // Default: 2
                    )),
                const SizedBox(
                  height: 10,
                ),
                CommonWidget.headText('晴天', fontSize: 25)
                    .paddingSymmetric(vertical: 15),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: Get.width * 0.3,
                      height: Get.width * 0.17,
                      child: Column(
                        children: [
                          CommonWidget.bodyText('temp'.tr),
                          CommonWidget.bodyText('22 °C'),
                        ],
                      ),
                    ),
                    Container(
                      width: Get.width * 0.3,
                      height: Get.width * 0.17,
                      child: Column(
                        children: [
                          CommonWidget.bodyText('pop'.tr),
                          CommonWidget.bodyText('20 %'),
                        ],
                      ),
                    ),
                    Container(
                      width: Get.width * 0.3,
                      height: Get.width * 0.17,
                      child: Column(
                        children: [
                          CommonWidget.bodyText('wind'.tr),
                          CommonWidget.bodyText('3 km/h'),
                        ],
                      ),
                    )
                  ],
                ),
                Obx(() => Visibility(
                    visible: controller.detailOpen.value,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: Get.width * 0.3,
                          height: Get.width * 0.17,
                          child: Column(
                            children: [
                              CommonWidget.bodyText('at'.tr),
                              CommonWidget.bodyText('20 °C')
                                  .paddingOnly(top: 3),
                            ],
                          ),
                        ),
                        Container(
                          width: Get.width * 0.3,
                          height: Get.width * 0.17,
                          child: Column(
                            children: [
                              CommonWidget.bodyText('ci'.tr),
                              CommonWidget.bodyText('舒適'),
                            ],
                          ),
                        ),
                        Container(
                          width: Get.width * 0.3,
                          height: Get.width * 0.17,
                          child: Column(
                            children: [
                              CommonWidget.bodyText('rh'.tr),
                              CommonWidget.bodyText('70 %').paddingOnly(top: 3),
                            ],
                          ),
                        )
                      ],
                    ).paddingOnly(top: 20))),
                Obx(
                  () => GestureDetector(
                      onTap: () => controller.detailOpen.value =
                          !controller.detailOpen.value,
                      child: controller.detailOpen.value
                          ? Icon(
                              Icons.arrow_drop_up_sharp,
                              color: kWhiteColor,
                              size: 40,
                            )
                          : Icon(
                              Icons.arrow_drop_down,
                              color: kWhiteColor,
                              size: 40,
                            )),
                )
              ],
            ),
            controller.tutorialStep == 0 ? Container() : mask(480)
          ],
        ));
  }

  Widget todayReport(TutorialController controller) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  width: Get.width * 0.5,
                  child: CommonWidget.headText('threeDay'.tr, fontSize: 20)
                      .paddingOnly(left: 30),
                ),
                Container(
                  width: Get.width * 0.5,
                  child: GestureDetector(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'weeksForecast'.tr,
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
          ],
        ),
        mask(230)
      ],
    );
  }

  Widget reportItem(int index) {
    return GestureDetector(
      onTap: () {},
      child: Container(
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
        child: Column(
          children: [
            Text(
              '02月07日',
              style: TextStyle(
                color: index == 0 ? Colors.black : cardTextColor,
              ),
            ).paddingSymmetric(vertical: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    height: 50,
                    width: 50,
                    child: SimpleShadow(
                      child: Image.asset('assets/image/Sunny.png'),
                      opacity: 0.7, // Default: 0.5
                      color: Colors.black38, // Default: Black
                      offset: Offset(5, 3), // Default: Offset(2, 2)
                      sigma: 3, // Default: 2
                    )),
                const SizedBox(width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '00 : 00',
                      style: TextStyle(
                        color: index == 0 ? Colors.black : cardTextColor,
                      ),
                    ).paddingOnly(bottom: 10),
                    Text(
                      '22 °C',
                      style: TextStyle(
                          color: index == 0 ? Colors.black : cardTextColor),
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

  Widget mask(double height) {
    return Container(
      color: Colors.black54,
      height: height,
      width: Get.width,
    );
  }
}
