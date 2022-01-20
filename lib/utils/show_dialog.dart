import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tw_weather/app/constant.dart';
import 'package:tw_weather/app/models/all_city_records_model.dart';

import 'common_widget.dart';
import 'json_animation.dart';

class ShowDialog {
  static Future<void> dialogLoading(BuildContext context) async {
    return showDialog<void>(
        context: context,
        barrierColor: Colors.black38,
        builder: (BuildContext context) {
          return UnconstrainedBox(
            constrainedAxis: Axis.vertical,
            child: SizedBox(
              width: 100,
              child: Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                insetPadding: EdgeInsets.zero,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8)),
                  height: 100,
                  child: Center(
                    child: SizedBox(
                      width: 75,
                      height: 75,
                      child: JsonAnimation.loadAnimation(),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }

  static Future<void> dialogSuccess(BuildContext context,
      {String text = ''}) async {
    return showDialog<void>(
        context: context,
        barrierColor: Colors.black38,
        builder: (BuildContext context) {
          return UnconstrainedBox(
            constrainedAxis: Axis.vertical,
            child: SizedBox(
              width: 100,
              child: Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                insetPadding: EdgeInsets.zero,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8)),
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.assignment_turned_in,
                        color: Colors.green,
                        size: 30,
                      ),
                      text == ''
                          ? Container()
                          : CommonWidget.bodyText(text, fontSize: 15)
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  static Future<void> dialogReport(
    BuildContext context, {
    required String city,
    required List<AllCityWeatherElement> data,
    required Function onPress1,
    required Function onPress2,
    required RxBool selection,
    required RxBool favorite,
  }) async {
    return showDialog<void>(
        context: context,
        barrierColor: Colors.black38,
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (context, setState) => UnconstrainedBox(
                    constrainedAxis: Axis.vertical,
                    child: SizedBox(
                      width: Get.width * 0.6,
                      child: Dialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        insetPadding: EdgeInsets.zero,
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(8)),
                            height: Get.height * 0.55,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: IconButton(
                                      onPressed: () => Get.back(),
                                      icon: Icon(
                                        Icons.clear,
                                        color: kWhiteColor,
                                      ),
                                    )),
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    width: Get.width * 0.6,
                                    height: Get.height * 0.35,
                                    color: selectColor,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CommonWidget.headText(
                                            '${data[2].time[0].parameter.parameterName} °C',
                                            color: cardTextColor,
                                            fontSize: 30),
                                        SizedBox(
                                          width: 80,
                                          height: 80,
                                          child: CommonWidget.imageAsset(data[0]
                                              .time[0]
                                              .parameter
                                              .parameterValue),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        CommonWidget.bodyText(
                                            data[0]
                                                .time[0]
                                                .parameter
                                                .parameterName,
                                            fontSize: 20),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        CommonWidget.headText(city,
                                            color: cardTextColor, fontSize: 25)
                                      ],
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Obx(
                                      () => IconButton(
                                          onPressed: () => setState(
                                              onPress1 as void Function()),
                                          icon: Icon(
                                            selection.value
                                                ? Icons.where_to_vote
                                                : Icons.where_to_vote_outlined,
                                            color: Colors.green,
                                          )),
                                    ),
                                    IconButton(
                                        onPressed: () => setState(
                                            onPress2 as void Function()),
                                        icon: Icon(
                                            favorite.value
                                                ? Icons.favorite
                                                : Icons.favorite_border,
                                            color: Colors.red)),
                                  ],
                                ),
                              ],
                            )),
                      ),
                    ),
                  ));
        });
  }
}
