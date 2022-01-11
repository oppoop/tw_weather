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
const kDataAuth = 'opendata.cwb.gov.tw';
const kDataPath = '/api/v1/rest/datastore/';

const k36HForecast = 'F-C0032-001'; //query location

const cityData = const {
  "YiL": {
    "chineseName": "宜蘭縣",
    "EnglishName": "YiLan",
    "twoDays": "F-D0047-001",
    "week": "F-D0047-003"
  },
  "TY": {
    "chineseName": "桃園市",
    "EnglishName": "TaoYuan",
    "twoDays": "F-D0047-005",
    "week": "F-D0047-007"
  },
  "XZCounty": {
    "chineseName": "新竹縣",
    "EnglishName": "XinZhuCounty",
    "twoDays": "F-D0047-009",
    "week": "F-D0047-011"
  },
  "ML": {
    "chineseName": "苗栗縣",
    "EnglishName": "MiaoLi",
    "twoDays": "F-D0047-013",
    "week": "F-D0047-015"
  },
  "ZH": {
    "chineseName": "彰化縣",
    "EnglishName": "ZhangHua",
    "twoDays": "F-D0047-017",
    "week": "F-D0047-019"
  },
  "NT": {
    "chineseName": "南投縣",
    "EnglishName": "NanTou",
    "twoDays": "F-D0047-021",
    "week": "F-D0047-023"
  },
  "YunL": {
    "chineseName": "雲林縣",
    "EnglishName": "YunLin",
    "twoDays": "F-D0047-025",
    "week": "F-D0047-027"
  },
  "JYCounty": {
    "chineseName": "嘉義縣",
    "EnglishName": "JiaYiCounty",
    "twoDays": "F-D0047-029",
    "week": "F-D0047-031"
  },
  "PT": {
    "chineseName": "屏東縣",
    "EnglishName": "PingTung",
    "twoDays": "F-D0047-033",
    "week": "F-D0047-035"
  },
  "TD": {
    "chineseName": "臺東縣",
    "EnglishName": "TaiDong",
    "twoDays": "F-D0047-037",
    "week": "F-D0047-039"
  },
  "HL": {
    "chineseName": "花蓮縣",
    "EnglishName": "HuaLian",
    "twoDays": "F-D0047-041",
    "week": "F-D0047-043"
  },
  "PH": {
    "chineseName": "澎湖縣",
    "EnglishName": "PengHu",
    "twoDays": "F-D0047-045",
    "week": "F-D0047-047"
  },
  "JL": {
    "chineseName": "基隆市",
    "EnglishName": "JiLong",
    "twoDays": "F-D0047-049",
    "week": "F-D0047-051"
  },
  "XZCity": {
    "chineseName": "新竹市",
    "EnglishName": "XinZhuCity",
    "twoDays": "F-D0047-053",
    "week": "F-D0047-055"
  },
  "JYCity": {
    "chineseName": "嘉義市",
    "EnglishName": "JiaYiCity",
    "twoDays": "F-D0047-057",
    "week": "F-D0047-059"
  },
  "TP": {
    "chineseName": "臺北市",
    "EnglishName": "Taipei",
    "twoDays": "F-D0047-061",
    "week": "F-D0047-063"
  },
  "KS": {
    "chineseName": "高雄市",
    "EnglishName": "Kaohsiung",
    "twoDays": "F-D0047-065",
    "week": "F-D0047-067"
  },
  "NTP": {
    "chineseName": "新北市",
    "EnglishName": "NewTaipei",
    "twoDays": "F-D0047-069",
    "week": "F-D0047-071"
  },
  "TC": {
    "chineseName": "臺中市",
    "EnglishName": "Taichung",
    "twoDays": "F-D0047-073",
    "week": "F-D0047-075"
  },
  "TN": {
    "chineseName": "臺南市",
    "EnglishName": "Tainan",
    "twoDays": "F-D0047-077",
    "week": "F-D0047-079"
  },
  "LC": {
    "chineseName": "連江縣",
    "EnglishName": "Lienchiang",
    "twoDays": "F-D0047-081",
    "week": "F-D0047-083"
  },
  "KM": {
    "chineseName": "金門縣",
    "EnglishName": "Kinmen",
    "twoDays": "F-D0047-085",
    "week": "F-D0047-087"
  },
};

///天氣型態
const kSunny = 'SUN';
const kSunCloud = 'SC';
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
  kSunny,
  kSunCloud,
  kMoonCloudFastWind,
  kMoonCloudMidRain,
  kCloudZap,
  kSunCloudLittleRain,
  kSunCloudAngledRain,
  kBigSnow,
  kMidSnowFastWinds,
  kTornado,

  ///暫無使用
  /*kBigRainDrops,
  kMoonFastWind,
  kSunCloudMidRain,
  kZaps*/
];

const kWeatherType = const {
  kSunny: {
    'type': kSunny,
    'name': '晴天',
    'image': 'assets/image/Sunny.png',
    'value': ['1', '01'],
  },
  kSunCloud: {
    'type': kSunCloud,
    'name': '晴時多雲',
    'image': 'assets/image/PartlyCloudy.png',
    'value': ['2', '3', '4', '02', '03', '04', '24', '25', '26', '27'],
  },
  kMoonCloudFastWind: {
    'type': kMoonCloudFastWind,
    'name': '陰時多雲',
    'image': 'assets/image/Moon cloud fast wind.png',
    'value': ['5', '6', '7', '05', '06', '07', '28'],
  },
  kMoonCloudMidRain: {
    'type': kMoonCloudMidRain,
    'name': '陰局部雨',
    'image': 'assets/image/Moon cloud mid rain.png',
    'value': [
      '8',
      '9',
      '08',
      '09',
      '10',
      '11',
      '12',
      '13',
      '14',
      '29',
      '30',
      '31',
      '32',
      '37',
      '38',
      '39',
      '41'
    ],
  },
  kCloudZap: {
    'type': kCloudZap,
    'name': '多雲雷陣雨 ',
    'image': 'assets/image/Cloud 3 zap.png',
    'value': ['15', '16', '17', '18', '33', '34', '35', '36'],
  },
  kSunCloudLittleRain: {
    'type': kSunCloudLittleRain,
    'name': '晴午後局部雨',
    'image': 'assets/image/Sun cloud little rain.png',
    'value': ['19', '20'],
  },
  kSunCloudAngledRain: {
    'type': kSunCloudAngledRain,
    'name': '晴午後雷陣雨',
    'image': 'assets/image/Sun cloud angled rain.png',
    'value': ['21', '22'],
  },
  kBigSnow: {
    'type': kBigSnow,
    'name': '陰有雨或雪 ',
    'image': 'assets/image/Big snow.png',
    'value': ['23'],
  },
  kMidSnowFastWinds: {
    'type': kMidSnowFastWinds,
    'name': '暴風雪',
    'image': 'assets/image/Mid snow fast winds.png',
    'value': ['42'],
  },
  kTornado: {
    'type': kTornado,
    'name': '颶風',
    'image': 'assets/image/Tornado.png',
    'value': [''],
  },

  ///暫無使用
  /*kBigRainDrops: {
    'type': kBigRainDrops,
    'name': 'BigRainDrops',
    'image': 'assets/image/Big rain drops.png',
    'value': [],
  },
  kMoonFastWind: {
    'type': kMoonFastWind,
    'name': 'MoonFastWind',
    'image': 'assets/image/Moon fast wind.png',
    'value': [],
  },
  kSunCloudMidRain: {
    'type': kSunCloudMidRain,
    'name': 'SunCloudMidRain',
    'image': 'assets/image/Sun cloud mid rain.png',
    'value': [],
  },
  kZaps: {
    'type': kZaps,
    'name': 'Zaps',
    'image': 'assets/image/Zaps.png',
    'value': [],
  },*/
};
