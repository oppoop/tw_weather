import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class InitSettingNotifier with ChangeNotifier {
  String languageCode = "zh";
  String? countryCode = "TW";

  Future<void> changeLanguage({required Locale locale}) async {
    final box = GetStorage();
    box.write(
      "languageCode",
      locale.languageCode,
    );
    box.write(
      "countryCode",
      locale.countryCode ?? '',
    );
    languageCode = locale.languageCode;
    countryCode = locale.countryCode;
    notifyListeners();
  }

  Future<void> setLanguageToDefault() async {
    final box = GetStorage();
    box.remove("languageCode");
    box.remove("countryCode");
    countryCode = "TW";
    languageCode = "zh";
    notifyListeners();
  }

  Future<void> getLocale() async {
    final box = GetStorage();
    if (box.read("languageCode") != null) {
      languageCode = box.read("languageCode")!;
    }
    if (box.read("countryCode") != null) {
      countryCode =
          box.read("countryCode") == '' ? null : box.read("countryCode");
    }
  }
}
