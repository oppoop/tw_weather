import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tw_weather/app/models/all_city_records_model.dart';
import 'package:tw_weather/utils/common_widget.dart';
import 'package:tw_weather/utils/json_animation.dart';
import 'package:tw_weather/utils/loading_state.dart';

import '../../../constant.dart';
import '../controllers/favorite_controller.dart';

class FavoriteView extends GetView<FavoriteController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavoriteController>(
        init: FavoriteController(apiProvider: Get.find()),
        builder: (controller) {
          return Container(
            height: Get.height,
            width: Get.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                  alignment: Alignment.bottomCenter,
                  fit: BoxFit.cover,
                  image: AssetImage('assets/image/back_item2.png')),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonWidget.headText('我的收藏', fontSize: 30)
                    .paddingOnly(left: 40, top: 40),
                controller.loadDataStatus == LoadDataStatus.finished
                    ? Obx(() => GridView.builder(
                        shrinkWrap: true,
                        itemCount: controller.favoriteCity.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 3 / 4,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 15),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () => controller.pickStatus.value == index
                                ? controller.showBottomSheet(context,
                                    city: controller
                                        .favoriteCity[index].locationName)
                                : controller.pickStatus.value = index,
                            child: Obx(() => CommonWidget.cardWidget(
                                height: 150,
                                width: 120,
                                color: index == controller.pickStatus.value
                                    ? selectColor
                                    : CardColor,
                                widget: cardContext(
                                    city: controller
                                        .favoriteCity[index].locationName,
                                    data: controller
                                        .favoriteCity[index].weatherElement))),
                          );
                        }).paddingSymmetric(horizontal: 15))
                    : Center(
                            child: JsonAnimation.loadAnimation(
                                height: 200, width: 200))
                        .paddingOnly(top: 50)
              ],
            ),
          );
        });
  }

  Widget cardContext(
      {required String city, required List<AllCityWeatherElement> data}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CommonWidget.headText('${data[2].time[0].parameter.parameterName} °C',
            color: cardTextColor, fontSize: 25),
        SizedBox(
          width: 90,
          height: 90,
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
}
