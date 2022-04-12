import 'package:decorated_icon/decorated_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tw_weather/utils/common_widget.dart';

import '../../../constant.dart';
import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(
        init: SettingController(packageInfo: Get.find()),
        builder: (controller) {
          return Stack(
            children: [
              Container(
                alignment: Alignment.topLeft,
                width: Get.width,
                height: Get.height * 0.4,
                decoration: BoxDecoration(
                    color: Color(0xfffA7B4E0),
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(70),
                        bottomLeft: Radius.circular(70))),
                child: Row(
                  children: [
                    DecoratedIcon(
                      Icons.settings,
                      color: kWhiteColor,
                      size: 40,
                      shadows: [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(3.0, 3.0), //陰影y軸偏移量
                            blurRadius: 5, //陰影模糊程度
                            spreadRadius: 1 //陰影擴散程度
                            )
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    CommonWidget.headText('setting'.tr, fontSize: 30)
                  ],
                ).paddingOnly(top: 30, left: 30),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: Get.width * 0.8,
                  height: Get.height * 0.77,
                  decoration: BoxDecoration(
                      color: CardColor,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30))),
                  child: Column(
                    children: [
                      /*ListTile(
                        title: CommonWidget.headText('themeChange'.tr,
                            fontSize: 20),
                        trailing: Switch(value: true, onChanged: (value) {}),
                      ),*/
                      Obx(
                        () => ListTile(
                          title: CommonWidget.headText('languageChange'.tr,
                              fontSize: 20),
                          trailing: DropdownButton<String>(
                            style: TextStyle(color: kWhiteColor),
                            dropdownColor: topColor,
                            value: controller.locale.value,
                            onChanged: (newValue) {
                              controller.localeChange(newValue!);
                            },
                            items: <String>['繁體中文', 'English']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ).paddingOnly(right: 10),
                      ),
                      ListTile(
                        title:
                            CommonWidget.headText('version'.tr, fontSize: 20),
                        trailing: CommonWidget.bodyText(
                                '${controller.packageInfo.version} + ${controller.packageInfo.buildNumber}')
                            .paddingOnly(right: 10),
                      ),
                    ],
                  ).paddingSymmetric(vertical: 20, horizontal: 10),
                ),
              ),
            ],
          );
        });
  }
}
