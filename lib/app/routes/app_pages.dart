import 'package:get/get.dart';

import 'package:tw_weather/app/modules/home/bindings/home_binding.dart';
import 'package:tw_weather/app/modules/home/views/home_view.dart';
import 'package:tw_weather/app/modules/setting/bindings/setting_binding.dart';
import 'package:tw_weather/app/modules/setting/views/setting_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SETTING,
      page: () => SettingView(),
      binding: SettingBinding(),
    ),
  ];
}
