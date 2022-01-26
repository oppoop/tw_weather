import 'package:get/get.dart';

class Messages extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        'zh_TW': {
          //首頁
          'home': '首頁',
          'temp': '溫度',
          'pop': '降雨機率',
          'wind': '風速',
          'at': '體感溫度',
          'ci': '舒適指數',
          'rh': '相對溼度',
          'threeDay': '近3日',
          'weeksForecast': '查看未來一周',
          //搜尋頁
          'search': '搜尋',
          'pickLocation': '選擇地區',
          'searchSub': '輸入縣市查詢簡易即時天氣資訊',
          //收藏頁
          'favorite': '收藏',
          'myFavorite': '我的收藏',
          //設定頁
          'setting': '設定',
          'themeChange': '主題切換',
          'languageChange': '語系切換',
          'version': '版本號',
          //城市
          '桃園市': '桃園市',
          '宜蘭縣': '宜蘭縣',
          '新竹縣': '新竹縣',
          '苗栗縣': '苗栗縣',
          '彰化縣': '彰化縣',
          '南投縣': '南投縣',
          '雲林縣': '雲林縣',
          '嘉義縣': '嘉義縣',
          '屏東縣': '屏東縣',
          '臺東縣': '臺東縣',
          '花蓮縣': '花蓮縣',
          '澎湖縣': '澎湖縣',
          '基隆市': '基隆市',
          '新竹市': '新竹市',
          '嘉義市': '嘉義市',
          '臺北市': '臺北市',
          '高雄市': '高雄市',
          '新北市': '新北市',
          '臺中市': '臺中市',
          '臺南市': '臺南市',
          '連江縣': '連江縣',
          '金門縣': '金門縣',
        },
        'en_US': {
          //首頁
          'home': 'Home',
          'temp': 'Temperature',
          'pop': 'PoP',
          'wind': 'Wind',
          'at': 'AT',
          'ci': 'CI',
          'rh': 'RH',
          'threeDay': 'Three Day',
          'weeksForecast': 'Weeks Forecast',
          //搜尋頁
          'search': 'Search',
          'pickLocation': 'Pick a location ',
          'searchSub':
              'Type the area or city you want to know the detailed weather information at this time.',
          //收藏頁
          'favorite': 'Favorite',
          'myFavorite': 'My Favorite',
          //設定頁
          'setting': 'Setting',
          'themeChange': 'Theme Change',
          'languageChange': 'Language Change',
          'version': 'Version',
          //城市
          '桃園市': 'TaoYuan',
          '宜蘭縣': 'YiLan',
          '新竹縣': 'XinZhuCounty',
          '苗栗縣': 'MiaoLi',
          '彰化縣': 'ZhangHua',
          '南投縣': 'NanTou',
          '雲林縣': 'YunLin',
          '嘉義縣': 'JiaYiCounty',
          '屏東縣': 'PingTung',
          '臺東縣': 'TaiDong',
          '花蓮縣': 'HuaLian',
          '澎湖縣': 'PengHu',
          '基隆市': 'JiLong',
          '新竹市': 'XinZhuCity',
          '嘉義市': 'JiaYiCity',
          '臺北市': 'Taipei',
          '高雄市': 'Kaohsiung',
          '新北市': 'NewTaipei',
          '臺中市': 'Taichung',
          '臺南市': 'Tainan',
          '連江縣': 'Lienchiang',
          '金門縣': 'Kinmen',
        }
      };
}
