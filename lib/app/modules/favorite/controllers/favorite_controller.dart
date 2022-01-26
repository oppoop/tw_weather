import 'package:decorated_icon/decorated_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tw_weather/app/data/api_provider.dart';
import 'package:tw_weather/app/models/all_city_records_model.dart';
import 'package:tw_weather/utils/loading_state.dart';
import 'package:tw_weather/utils/show_dialog.dart';
import 'package:tw_weather/utils/storage_helper.dart';

import '../../../constant.dart';

class FavoriteController extends GetxController {
  //TODO: Implement FavoriteController
  final ApiProvider apiProvider;

  FavoriteController({required this.apiProvider});

  final box = GetStorage();

  final loadDataStatus = Rx<LoadDataStatus>(LoadDataStatus.loading);
  final favoriteList = <String>[].obs;
  final favoriteCity = <AllCityLocation>[].obs;
  final pickStatus = 999.obs;

  @override
  void onInit() {
    favoriteList.value = StorageHelper.myFavorite(box);
    super.onInit();
  }

  @override
  void onReady() {
    getFavoriteData();
    super.onReady();
  }

  Future<void> showBottomSheet(BuildContext context,
      {required String city}) async {
    return Get.bottomSheet(Container(
      width: Get.width,
      height: 130,
      decoration: BoxDecoration(
        color: Color(0xffffffff),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Column(
        children: [
          Center(
            child: Text(
              city,
              style: TextStyle(color: kBlackColor, fontSize: 20),
            ),
          ).paddingOnly(top: 5),
          Divider(
            color: kBlackColor,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  box.write('HomeCity', city);
                  ShowDialog.dialogSuccess(context, text: '釘選成功');
                  Future.delayed(Duration(milliseconds: 500)).then((value) {
                    Get.back();
                    Get.back();
                  });
                },
                child: Column(
                  children: [
                    DecoratedIcon(
                      Icons.where_to_vote_outlined,
                      color: Colors.green,
                      size: 40,
                      shadows: [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(3.0, 3.0), //陰影y軸偏移量
                            blurRadius: 5, //陰影模糊程度
                            spreadRadius: 1 //陰影擴散程度
                            )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text('釘選主頁')
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  favoriteList.remove(city);
                  favoriteCity
                      .removeWhere((element) => element.locationName == city);
                  box.write('favorite', favoriteList);
                  ShowDialog.dialogSuccess(context, text: '取消收藏');
                  Future.delayed(Duration(milliseconds: 500)).then((value) {
                    Get.back();
                    Get.back();
                  });
                },
                child: Column(
                  children: [
                    DecoratedIcon(
                      Icons.favorite_border,
                      color: Colors.red,
                      size: 40,
                      shadows: [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(3.0, 3.0), //陰影y軸偏移量
                            blurRadius: 5, //陰影模糊程度
                            spreadRadius: 1 //陰影擴散程度
                            )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text('取消收藏')
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => Get.back(),
                child: Column(
                  children: [
                    DecoratedIcon(
                      Icons.clear,
                      color: kBlackColor,
                      size: 40,
                      shadows: [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(3.0, 3.0), //陰影y軸偏移量
                            blurRadius: 5, //陰影模糊程度
                            spreadRadius: 1 //陰影擴散程度
                            )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text('取消')
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    ));
  }

  //取得收藏城市資料
  void getFavoriteData() async {
    if (favoriteList.length != 0) {
      await apiProvider
          .getAllCityData(location: convertListToString)
          .then((value) => favoriteCity.value = value.location);
    }
    loadDataStatus.value = LoadDataStatus.finished;
    update();
  }

  String get convertListToString => favoriteList
      .toString()
      .replaceAll('[', '')
      .replaceAll(']', '')
      .replaceAll(' ', '');
}
