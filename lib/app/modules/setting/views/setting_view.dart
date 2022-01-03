import 'package:decorated_icon/decorated_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:tw_weather/app/providers/init_setting_notifier.dart';
import 'package:tw_weather/generated/l10n.dart';
import 'package:tw_weather/utils/common_widget.dart';

import '../../../constant.dart';
import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  @override
  Widget build(BuildContext context) {
    return Consumer<InitSettingNotifier>(builder: (context, controller, _) {
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
                CommonWidget.headText(S().setting, fontSize: 30)
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
                  ListTile(
                    title: CommonWidget.headText('主題切換', fontSize: 20),
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  ListTile(
                    title: CommonWidget.headText('語系切換', fontSize: 20),
                    trailing: DropdownButton(
                      items: <String>['A', 'B', 'C', 'D'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (_) {},
                    ),
                  ).paddingOnly(right: 10),
                  ListTile(
                    title: CommonWidget.headText('關於', fontSize: 20),
                    trailing: DecoratedIcon(
                      Icons.arrow_forward_ios,
                      color: kWhiteColor,
                      size: 20,
                      shadows: [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(3.0, 3.0), //陰影y軸偏移量
                            blurRadius: 5, //陰影模糊程度
                            spreadRadius: 1 //陰影擴散程度
                            )
                      ],
                    ).paddingOnly(right: 10),
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
