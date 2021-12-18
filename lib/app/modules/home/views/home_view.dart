import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tw_weather/app/widget/bottom_bar.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        bottomNavigationBar: BottomNavBar(), body: controller.nowView()));
  }
}
