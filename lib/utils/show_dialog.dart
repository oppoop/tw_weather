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

  static Future<void> dialogSuccess(BuildContext context) async {
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
                      child: Icon(
                    Icons.assignment_turned_in,
                    color: Colors.green,
                    size: 30,
                  )),
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
  }) async {
    return showDialog<void>(
        context: context,
        barrierColor: Colors.black38,
        builder: (BuildContext context) {
          return UnconstrainedBox(
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CommonWidget.headText(
                                    '${data[2].time[0].parameter.parameterName} °C',
                                    color: cardTextColor,
                                    fontSize: 30),
                                SizedBox(
                                  width: 80,
                                  height: 80,
                                  child: CommonWidget.imageAsset(
                                      'assets/image/Moon cloud fast wind.png'),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                CommonWidget.bodyText(
                                    data[0].time[0].parameter.parameterName,
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
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                                onPressed: onPress1 as void Function(),
                                icon: Icon(
                                  Icons.where_to_vote_outlined,
                                  color: kWhiteColor,
                                )),
                            IconButton(
                                onPressed: onPress2 as void Function(),
                                icon: Icon(Icons.favorite_border,
                                    color: kWhiteColor)),
                          ],
                        ),
                      ],
                    )),
              ),
            ),
          );
        });
  }
}
