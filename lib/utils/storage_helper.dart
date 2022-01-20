import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tw_weather/utils/show_dialog.dart';

class StorageHelper {
  //主頁釘選功能
  static void citySelection(BuildContext context, GetStorage box,
      {required String city, required RxBool selection}) {
    String homeCity = box.read('HomeCity') ?? '';
    if (homeCity != city) {
      box.write('HomeCity', city);
      selection.value = true;
      ShowDialog.dialogSuccess(context, text: '釘選成功');
      Future.delayed(Duration(milliseconds: 500)).then((value) => Get.back());
    }
  }

  //收藏項目取出
  static List<String> myFavorite(GetStorage box) {
    List list = box.read('favorite');
    List<String> favorite = [];
    list.forEach((element) => favorite.add(element));
    return favorite;
  }

  //收藏功能
  static void cityFavorite(BuildContext context, GetStorage box,
      {required String city,
      required RxList<String> favoriteList,
      required RxBool favoriteStatus}) {
    if (favoriteStatus.value == true) {
      favoriteList.remove(city);
      box.write('favorite', favoriteList);
      favoriteStatus.value = false;
      ShowDialog.dialogSuccess(context, text: '取消收藏');
      Future.delayed(Duration(milliseconds: 500)).then((value) => Get.back());
    } else {
      favoriteList.add(city);
      box.write('favorite', favoriteList);
      print(favoriteList);
      favoriteStatus.value = true;
      ShowDialog.dialogSuccess(context, text: '收藏成功');
      Future.delayed(Duration(milliseconds: 500)).then((value) => Get.back());
    }
  }
}
