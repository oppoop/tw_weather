import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/constant.dart';
import 'app/data/api_provider.dart';
import 'app/routes/app_pages.dart';

void main() async {
  await initService().then((value) => runApp(
        GetMaterialApp(
          theme: ThemeData(
            scaffoldBackgroundColor: themeColor,
          ),
          title: "Application",
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
        ),
      ));
}

Future<void> initService() async {
  Get.lazyPut(
    () {
      return Dio();
    },
    fenix: true,
  );
  Get.lazyPut(
    () => ApiProvider(
      dio: Get.find(),
    ),
    fenix: true,
  );
}
