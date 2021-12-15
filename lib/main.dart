import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/constant.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: themeColor,
      ),
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
