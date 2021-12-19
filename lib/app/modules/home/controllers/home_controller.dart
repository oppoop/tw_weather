import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tw_weather/app/modules/favorite/views/favorite_view.dart';
import 'package:tw_weather/app/modules/home/views/home_view.dart';
import 'package:tw_weather/app/modules/location/views/location_view.dart';
import 'package:tw_weather/app/modules/search/views/search_view.dart';
import 'package:tw_weather/app/modules/setting/views/setting_view.dart';

import '../../../constant.dart';

class HomeController extends GetxController {
  final currentIndex = IndexPage.Home.obs;

  Widget nowView() {
    switch (currentIndex.value) {
      case IndexPage.Home:
        return HomeView().homePage();
      case IndexPage.Location:
        return LocationView();
      case IndexPage.Search:
        return SearchView();
      case IndexPage.Favorite:
        return FavoriteView();
      case IndexPage.Setting:
        return SettingView();
    }
  }
}
