import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tw_weather/utils/common_widget.dart';

import '../../../constant.dart';
import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchController>(
        init: SearchController(),
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
                        child: CommonWidget.headText('Pick a location',
                            fontSize: 25)),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: Get.width * 0.7,
                      child: Text(
                        'Type the area or city you want to know the detailed weather information at this time.',
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
                    searchBlock(),
                    featureCity(),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ));
        });
  }

  Widget searchBlock() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          height: 65,
          width: Get.width * 0.6,
          decoration: BoxDecoration(
            color: CardColor,
            borderRadius: BorderRadius.circular(20),
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
              border: InputBorder.none,
              suffixIcon: Icon(
                Icons.search,
                color: kWhiteColor,
              ),
            ),
          ).paddingOnly(left: 20),
        ),
        const SizedBox(
          width: 20,
        ),
        GestureDetector(
            onTap: () {},
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

  Widget featureCity() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            CommonWidget.cardWidget(
                height: 150,
                width: 120,
                color: selectColor,
                widget: cardContext()),
            const SizedBox(
              height: 30,
            ),
            CommonWidget.cardWidget(
                height: 150,
                width: 120,
                color: CardColor,
                widget: cardContext()),
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
            CommonWidget.cardWidget(
                height: 300,
                width: 120,
                color: CardColor,
                widget: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CommonWidget.headText('26 °C',
                        color: cardTextColor, fontSize: 30),
                    SizedBox(
                      width: 80,
                      height: 80,
                      child: CommonWidget.imageAsset(
                          'assets/image/Moon cloud fast wind.png'),
                    ),
                    Column(
                      children: [
                        CommonWidget.bodyText('Wind', fontSize: 20),
                        CommonWidget.headText('台北',
                            color: cardTextColor, fontSize: 25)
                      ],
                    ),
                  ],
                ))
          ],
        ),
      ],
    );
  }

  Widget cardContext() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CommonWidget.headText('26 °C', color: cardTextColor, fontSize: 20),
        SizedBox(
          width: 60,
          height: 60,
          child:
              CommonWidget.imageAsset('assets/image/Moon cloud fast wind.png'),
        ),
        Column(
          children: [
            CommonWidget.bodyText('Wind', fontSize: 15),
            CommonWidget.headText('台北', color: cardTextColor, fontSize: 20)
          ],
        ),
      ],
    ).paddingSymmetric(vertical: 5);
  }
}
