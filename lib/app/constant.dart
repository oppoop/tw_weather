import 'dart:ui';

enum IndexPage {
  Home,
  Search,
  Favorite,
  Setting,
}

///主題色系
bool appTheme = true;
final themeColor = appTheme ? kDarkThemeColor : kBrightThemeColor;
final CardColor = appTheme ? kDarkCardColor : kBrightCardColor;
final selectColor = appTheme ? kDarkSelectColor : kBrightSelectColor;
final topColor = appTheme ? kDarkTopColor : kBrightTopColor;
final bottomColor = appTheme ? kDarkBottomColor : kBrightBottomColor;
final IconColor = appTheme ? kDarkIconColor : kBrightIconColor;
final cardTextColor = appTheme ? kWhiteColor : kBlackColor;

const kWhiteColor = const Color(0xffffffff);
const kBlackColor = const Color(0xfff000000);

//暗色系主題
const kDarkThemeColor = const Color(0xfff060D26);
const kDarkCardColor = const Color(0xfff272F3A);
const kDarkSelectColor = const Color(0xfffA7B4E0);
const kDarkTopColor = const Color(0xfff2C303F);
const kDarkBottomColor = const Color(0xfff101A39);
const kDarkIconColor = const Color(0xfff557EAE);

//亮色系主題

const kBrightThemeColor = const Color(0xfff828CAE);
const kBrightCardColor = const Color(0xfffFFFFFF);
const kBrightSelectColor = const Color(0xfffA7B4E0);
const kBrightTopColor = const Color(0xfff7882A7);
const kBrightBottomColor = const Color(0xfffA7B4E0);
const kBrightIconColor = const Color(0xfff000000);

///api資料
const kDataStore = 'https://opendata.cwb.gov.tw/api/v1/rest/datastore/';
const k36HForecast = 'F-C0032-001';

///天氣型態
const kBigRainDrops = 'BR';
const kBigSnow = 'BS';
const kCloudZap = 'CZ';
const kMidSnowFastWinds = 'MSFW';
const kMoonCloudFastWind = 'MCFW';
const kMoonCloudMidRain = 'MCMR';
const kMoonFastWind = 'MFW';
const kSunCloudAngledRain = 'SCAR';
const kSunCloudLittleRain = 'SCLR';
const kSunCloudMidRain = 'SCMR';
const kTornado = 'T';
const kZaps = 'Z';

const kWeatherKey = [
  kBigRainDrops,
  kBigSnow,
  kCloudZap,
  kMidSnowFastWinds,
  kMoonCloudFastWind,
  kMoonCloudMidRain,
  kMoonFastWind,
  kSunCloudAngledRain,
  kSunCloudLittleRain,
  kSunCloudMidRain,
  kTornado,
  kZaps
];

const kWeatherType = const {
  kBigRainDrops: {
    'type': kBigRainDrops,
    'name': 'BigRainDrops',
    'image': 'assets/image/Big rain drops.png',
  },
  kBigSnow: {
    'type': kBigSnow,
    'name': 'BigSnow',
    'image': 'assets/image/Big snow.png',
  },
  kCloudZap: {
    'type': kCloudZap,
    'name': 'CloudZap',
    'image': 'assets/image/Cloud 3 zap.png',
  },
  kMidSnowFastWinds: {
    'type': kMidSnowFastWinds,
    'name': 'MidSnowFastWinds',
    'image': 'assets/image/Mid snow fast winds.png',
  },
  kMoonCloudFastWind: {
    'type': kMoonCloudFastWind,
    'name': 'MoonCloudFastWind',
    'image': 'assets/image/Moon cloud fast wind.png',
  },
  kMoonCloudMidRain: {
    'type': kMoonCloudMidRain,
    'name': 'kMoonCloudMidRain',
    'image': 'assets/image/Moon cloud mid rain.png',
  },
  kMoonFastWind: {
    'type': kMoonFastWind,
    'name': 'MoonFastWind',
    'image': 'assets/image/Moon fast wind.png',
  },
  kSunCloudAngledRain: {
    'type': kSunCloudAngledRain,
    'name': 'SunCloudAngledRain',
    'image': 'assets/image/Sun cloud angled rain.png',
  },
  kSunCloudLittleRain: {
    'type': kSunCloudLittleRain,
    'name': 'SunCloudLittleRain',
    'image': 'assets/image/Sun cloud little rain.png',
  },
  kSunCloudMidRain: {
    'type': kSunCloudMidRain,
    'name': 'SunCloudMidRain',
    'image': 'assets/image/Sun cloud mid rain.png',
  },
  kTornado: {
    'type': kTornado,
    'name': 'Tornado',
    'image': 'assets/image/Tornado.png',
  },
  kZaps: {
    'type': kZaps,
    'name': 'Zaps',
    'image': 'assets/image/Zaps.png',
  },
};
