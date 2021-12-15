import 'dart:ui';

bool appTheme = true;
final themeColor = appTheme ? kDarkThemeColor : kBrightThemeColor;
final CardColor = appTheme ? kDarkCardColor : kBrightCardColor;
final selectColor = appTheme ? kDarkSelectColor : kBrightSelectColor;
final topColor = appTheme ? kDarkTopColor : kBrightTopColor;

///暗色系主題
const kDarkThemeColor = const Color(0xfff060D26);
const kDarkCardColor = const Color(0xfff272F3A);
const kDarkSelectColor = const Color(0xfffA7B4E0);
const kDarkTopColor = const Color(0xfff2C303F);

///亮色系主題

const kBrightThemeColor = const Color(0xfff828CAE);
const kBrightCardColor = const Color(0xfffFFFFFF);
const kBrightSelectColor = const Color(0xfffA7B4E0);
const kBrightTopColor = const Color(0xfff7882A7);
