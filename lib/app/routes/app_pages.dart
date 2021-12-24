import 'package:get/get.dart';
import 'package:tw_weather/app/modules/favorite/bindings/favorite_binding.dart';
import 'package:tw_weather/app/modules/favorite/views/favorite_view.dart';
import 'package:tw_weather/app/modules/forcast/bindings/forcast_binding.dart';
import 'package:tw_weather/app/modules/forcast/views/forcast_view.dart';
import 'package:tw_weather/app/modules/home/bindings/home_binding.dart';
import 'package:tw_weather/app/modules/home/views/home_view.dart';
import 'package:tw_weather/app/modules/index/bindings/index_binding.dart';
import 'package:tw_weather/app/modules/index/views/index_view.dart';
import 'package:tw_weather/app/modules/search/bindings/search_binding.dart';
import 'package:tw_weather/app/modules/search/views/search_view.dart';
import 'package:tw_weather/app/modules/setting/bindings/setting_binding.dart';
import 'package:tw_weather/app/modules/setting/views/setting_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.INDEX;

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
    GetPage(
      name: _Paths.SEARCH,
      page: () => SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: _Paths.FORCAST,
      page: () => ForcastView(),
      binding: ForcastBinding(),
    ),
    GetPage(
      name: _Paths.FAVORITE,
      page: () => FavoriteView(),
      binding: FavoriteBinding(),
    ),
    GetPage(
      name: _Paths.INDEX,
      page: () => IndexView(),
      binding: IndexBinding(),
    ),
  ];
}
