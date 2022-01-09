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
                    searchBlock(context),
                    controller.loadDataStatus == LoadDataStatus.loading
                        ? Center(
                            child: JsonAnimation.loadAnimation(
                                    height: 150, width: 150)
                                .paddingSymmetric(vertical: 5),
                          )
                        : featureCity(),
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
            ),
          ).paddingOnly(left: 20),
        ),
        const SizedBox(
          width: 20,
        ),
        GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
              ;
              controller.searchCity();
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
                widget: cardContext(
                    city: controller.recommendCity[1].locationName,
                    data: controller.recommendCity[1].weatherElement)),
            const SizedBox(
              height: 30,
            ),
            CommonWidget.cardWidget(
                height: 150,
                width: 120,
                color: CardColor,
                widget: cardContext(
                    city: controller.recommendCity[2].locationName,
                    data: controller.recommendCity[2].weatherElement)),
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
                    CommonWidget.headText(
                        '${controller.recommendCity[0].weatherElement[2].time[0].parameter.parameterName} °C',
                        color: cardTextColor,
                        fontSize: 30),
                    SizedBox(
                      width: 80,
                      height: 80,
                      child: CommonWidget.imageAsset(
                          'assets/image/Moon cloud fast wind.png'),
                    ),
                    Column(
                      children: [
                        CommonWidget.bodyText(
                            controller.recommendCity[0].weatherElement[0]
                                .time[0].parameter.parameterName,
                            fontSize: 20),
                        CommonWidget.headText(
                            controller.recommendCity[0].locationName,
                            color: cardTextColor,
                            fontSize: 25)
                      ],
                    ),
                  ],
                ))
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
              CommonWidget.imageAsset('assets/image/Moon cloud fast wind.png'),
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

  Widget _buildCountry() {
    return FormField(
      builder: (FormFieldState state) {
        return DropdownButtonHideUnderline(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new InputDecorator(
                decoration: InputDecoration(
                  filled: false,
                  hintText: 'Choose Country',
                  prefixIcon: Icon(Icons.location_on),
                ),
                isEmpty: controller.citySearch.length == 0,
                child: new DropdownButton(
                  value: 1,
                  isDense: true,
                  onChanged: (newValue) {},
                  items: controller.citySearch.map((value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
