import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tw_weather/app/widget/bottom_bar.dart';

import '../controllers/index_controller.dart';

class IndexView extends GetView<IndexController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        bottomNavigationBar: BottomNavBar(), body: controller.nowView()));
  }
}
