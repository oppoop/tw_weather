import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'app/constant.dart';
import 'app/data/api_provider.dart';
import 'app/routes/app_pages.dart';
import 'intl/messages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  // 豎直螢幕
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  await initService().then((value) => runApp(GetMaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: themeColor,
        ),
        title: "Application",
        translations: Messages(),
        locale: Locale('zh', 'TW'),
        fallbackLocale: Locale("zh", "TW"),
        debugShowCheckedModeBanner: false,
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
      )));
}

Future<void> initService() async {
  await GetStorage.init();
  Get.lazyPut(() => GetStorage(), fenix: true);
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
