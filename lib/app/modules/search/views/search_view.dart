import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tw_weather/app/models/all_city_records_model.dart';
import 'package:tw_weather/utils/common_widget.dart';
import 'package:tw_weather/utils/json_animation.dart';
import 'package:tw_weather/utils/loading_state.dart';

import '../../../constant.dart';
import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchController>(
        init: SearchController(apiProvider: Get.find()),
        builder: (controller) {
          return Container(
              height: Get.height,
              width: Get.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                    alignment: Alignment.bottomRight,
                    image: AssetImage('assets/image/search_back.png')),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Align(
                        child: CommonWidget.headText('pickLocation'.tr,
                            fontSize: 25)),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: Get.width * 0.7,
                      child: Text(
                        'searchSub'.tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: kWhiteColor,
                          fontSize: 15,
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
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Obx(
                      () => searchBlock(context),
                    ),
                    Obx(
                      () => Stack(
                        children: [
                          controller.loadDataStatus == LoadDataStatus.loading
                              ? Center(
                                  child: JsonAnimation.loadAnimation(
                                          height: 150, width: 150)
                                      .paddingSymmetric(vertical: 5),
                                )
                              : featureCity(context),
                          controller.citySearch.length == 0
                              ? Container()
                              : searchMenu(context),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ));
        });
  }

  Widget searchBlock(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          height: 65,
          width: Get.width * 0.5,
          decoration: BoxDecoration(
            color: CardColor,
            borderRadius: controller.citySearch.length == 0
                ? BorderRadius.circular(20)
                : BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
            boxShadow: [
              BoxShadow(
                  color: Colors.black26,
                  offset: Offset(4.0, 4.0), //陰影y軸偏移量
                  blurRadius: 5, //陰影模糊程度
                  spreadRadius: 1 //陰影擴散程度
                  )
            ],
          ),
          child: TextFormField(
            style: TextStyle(color: Colors.white),
            controller: controller.textEditingController,
            focusNode: controller.focusNode,
            textAlign: TextAlign.left,
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: TextStyle(color: kWhiteColor),
              suffixIcon: IconButton(
                  onPressed: () => controller.textClean(),
                  icon: Icon(
                    Icons.cancel,
                    color: kWhiteColor,
                  )),
              border: InputBorder.none,
            ),
          ).paddingOnly(left: 20),
        ),
        const SizedBox(
          width: 20,
        ),
        GestureDetector(
            onTap: () {
              controller.searchCityCheck();
              if (controller.searchCheck.value) {
                FocusScope.of(context).unfocus();
                controller
                    .getSearchCityData(
                        context, controller.textEditingController.text)
                    .then((value) => controller.searchCheck.value = false);
              }
            },
            child: CommonWidget.cardWidget(
                height: 65,
                width: Get.width * 0.15,
                color: CardColor,
                widget: Icon(
                  Icons.search,
                  color: cardTextColor,
                ),
                radius: 20)),
        const SizedBox(
          width: 10,
        ),
        GestureDetector(
            onTap: () => controller.getLocation(context),
            child: CommonWidget.cardWidget(
                height: 65,
                width: Get.width * 0.15,
                color: CardColor,
                widget: Icon(
                  Icons.location_on,
                  color: cardTextColor,
                ),
                radius: 20)),
      ],
    );
  }

  Widget featureCity(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            GestureDetector(
              onTap: () {
                if (controller.itemIndex == 0) {
                  controller.getSearchCityData(context, '臺中市');
                } else {
                  controller.itemIndex.value = 0;
                }
              },
              child: CommonWidget.cardWidget(
                  height: 150,
                  width: 120,
                  color: controller.itemIndex == 0 ? selectColor : CardColor,
                  widget: cardContext(
                      city: controller.recommendCity[1].locationName.tr,
                      data: controller.recommendCity[1].weatherElement)),
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                if (controller.itemIndex == 1) {
                  controller.getSearchCityData(context, '高雄市');
                } else {
                  controller.itemIndex.value = 1;
                }
              },
              child: CommonWidget.cardWidget(
                  height: 150,
                  width: 120,
                  color: controller.itemIndex == 1 ? selectColor : CardColor,
                  widget: cardContext(
                      city: controller.recommendCity[2].locationName.tr,
                      data: controller.recommendCity[2].weatherElement)),
            ),
          ],
        ),
        const SizedBox(
          width: 30,
        ),
        Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            GestureDetector(
              onTap: () {
                if (controller.itemIndex == 2) {
                  controller.getSearchCityData(context, '臺北市');
                } else {
                  controller.itemIndex.value = 2;
                }
              },
              child: CommonWidget.cardWidget(
                  height: 300,
                  width: 120,
                  color: controller.itemIndex == 2 ? selectColor : CardColor,
                  widget: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CommonWidget.headText(
                          '${controller.recommendCity[0].weatherElement[2].time[0].parameter.parameterName} °C',
                          color: cardTextColor,
                          fontSize: 30),
                      SizedBox(
                        width: 80,
                        height: 80,
                        child: CommonWidget.imageAsset(controller
                            .recommendCity[0]
                            .weatherElement[0]
                            .time[0]
                            .parameter
                            .parameterValue),
                      ),
                      Column(
                        children: [
                          CommonWidget.bodyText(
                              controller.recommendCity[0].weatherElement[0]
                                  .time[0].parameter.parameterName,
                              fontSize: 20),
                          CommonWidget.headText(
                              controller.recommendCity[0].locationName.tr,
                              color: cardTextColor,
                              fontSize: 25)
                        ],
                      ),
                    ],
                  )),
            )
          ],
        ),
      ],
    );
  }

  Widget cardContext(
      {required String city, required List<AllCityWeatherElement> data}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CommonWidget.headText('${data[2].time[0].parameter.parameterName} °C',
            color: cardTextColor, fontSize: 20),
        SizedBox(
          width: 60,
          height: 60,
          child:
              CommonWidget.imageAsset(data[0].time[0].parameter.parameterValue),
        ),
        Column(
          children: [
            CommonWidget.bodyText(data[0].time[0].parameter.parameterName,
                fontSize: 15),
            CommonWidget.headText(city, color: cardTextColor, fontSize: 20)
          ],
        ),
      ],
    ).paddingSymmetric(vertical: 5);
  }

  Widget searchMenu(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            alignment: Alignment.center,
            height: 60 * (controller.citySearch.length.toDouble()),
            width: Get.width * 0.5,
            decoration: BoxDecoration(
              color: CardColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    offset: Offset(4.0, 4.0), //陰影y軸偏移量
                    blurRadius: 5, //陰影模糊程度
                    spreadRadius: 1 //陰影擴散程度
                    )
              ],
            ),
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: controller.citySearch.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          controller.textChoose(controller.citySearch[index]);
                        },
                        title: CommonWidget.bodyText(
                            controller.citySearch[index]));
                  }),
            )),
        //對齊用
        const SizedBox(
          width: 20,
        ),
        SizedBox(
          width: Get.width * 0.15,
        ),
        const SizedBox(
          width: 10,
        ),
        SizedBox(
          width: Get.width * 0.15,
        ),
      ],
    );
  }
}
