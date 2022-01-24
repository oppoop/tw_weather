import 'dart:ui';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingController extends GetxController {
  //TODO: Implement SettingController

  final box = GetStorage();
  final locale = ''.obs;

  @override
  void onInit() {
    locale.value = box.read('locale');
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void localeChange(String newLocale) {
    this.locale.value = newLocale;
    switch (newLocale) {
      case '繁體中文':
        box.write('locale', newLocale);
        return changeLanguage('zh', 'TW');
      case 'English':
        box.write('locale', newLocale);
        return changeLanguage('en', 'US');
    }
  }

  void changeLanguage(String languageCode, String countryCode) {
    var locale = Locale(languageCode, countryCode);
    Get.updateLocale(locale);
  }
}
