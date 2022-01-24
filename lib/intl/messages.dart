import 'package:get/get.dart';

class Messages extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        'zh_TW': {
          //首頁
          'home': '首頁',
          //搜尋頁
          'search': '搜尋',
          //收藏頁
          'favorite': '收藏',
          'myFavorite': '我的收藏',
          //設定頁
          'setting': '設定',
          'themeChange': '主題切換',
          'languageChange': '語系切換',
          'about': '關於',
        },
        'en_US': {
          //首頁
          'home': 'Home',
          //搜尋頁
          'search': 'Search',
          //收藏頁
          'favorite': 'Favorite',
          'myFavorite': 'My Favorite',
          //設定頁
          'setting': 'Setting',
          'themeChange': 'Theme Change',
          'languageChange': 'Language Change',
          'about': 'About',
        }
      };
}
