import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

import 'app/constant.dart';
import 'app/data/api_provider.dart';
import 'app/providers/init_setting_notifier.dart';
import 'app/routes/app_pages.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 豎直螢幕
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  await initService().then((value) => runApp(
        MultiProvider(
            providers: [
              ChangeNotifierProvider<InitSettingNotifier>(
                create: (context) => InitSettingNotifier(),
              ),
            ],
            child: Consumer<InitSettingNotifier>(
              builder: (context, initSettingNotifier, _) {
                return GetMaterialApp(
                  theme: ThemeData(
                    scaffoldBackgroundColor: themeColor,
                  ),
                  title: "Application",
                  locale: Locale(
                    context.watch<InitSettingNotifier>().languageCode,
                    context.watch<InitSettingNotifier>().countryCode,
                  ),
                  localizationsDelegates: [
                    S.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: S.delegate.supportedLocales,
                  debugShowCheckedModeBanner: false,
                  initialRoute: AppPages.INITIAL,
                  getPages: AppPages.routes,
                );
              },
            )),
      ));
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
