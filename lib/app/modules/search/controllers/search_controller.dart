import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tw_weather/app/data/api_provider.dart';
import 'package:tw_weather/app/models/all_city_records_model.dart';
import 'package:tw_weather/utils/loading_state.dart';
import 'package:tw_weather/utils/location_helper.dart';
import 'package:tw_weather/utils/show_dialog.dart';
import 'package:tw_weather/utils/storage_helper.dart';

import '../../../constant.dart';

class SearchController extends GetxController {
  final ApiProvider apiProvider;

  SearchController({required this.apiProvider});

  final TextEditingController textEditingController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  final box = GetStorage();
  final locationHelper = LocationHelper();

  final itemIndex = 0.obs;
  final loadDataStatus = Rx<LoadDataStatus>(LoadDataStatus.loading);
  final recommendCity = RxList<AllCityLocation>();
  final citySearch = <String>[].obs; //城市關鍵字列表
  final searchCheck = false.obs; //城市搜尋名稱檢查
  final homeSelectionStatus = false.obs;
  final favoriteStatus = false.obs;
  final favoriteList = <String>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    textEditingController.addListener(() {
      if (textEditingController.text != '') {
        if (textEditingController.text.contains('台')) {
          textEditingController.text =
              textEditingController.text.replaceAll('台', '臺');
          textEditingController.selection = TextSelection.fromPosition(
              TextPosition(offset: textEditingController.text.length));
        }
        searchCityName();
      } else {
        citySearch.clear();
      }
    });
    favoriteList.value = StorageHelper.myFavorite(box);
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    getRecommendCity();
    super.onReady();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    textEditingController.dispose();
    super.dispose();
  }

  ///獲取api資料
  //取得推薦城市
  void getRecommendCity() async {
    await apiProvider
        .getAllCityData(location: '臺北市,臺中市,高雄市')
        .then((value) => recommendCity.addAll(value.location));
    loadDataStatus.value = LoadDataStatus.finished;
    update();
  }

  //取得搜尋城市
  Future<void> getSearchCityData(BuildContext context, String city) async {
    ShowDialog.dialogLoading(context);
    if (city == (box.read('HomeCity') ?? '')) {
      homeSelectionStatus.value = true;
    } else {
      homeSelectionStatus.value = false;
    }
    await apiProvider.getAllCityData(location: city).then((value) {
      Get.back();
      favoriteStatus.value = favoriteList.contains(city);
      ShowDialog.dialogReport(context,
          city: value.location[0].locationName,
          data: value.location[0].weatherElement,
          onPress1: () => StorageHelper.citySelection(context, box,
              city: city, selection: homeSelectionStatus),
          onPress2: () => StorageHelper.cityFavorite(context, box,
              city: city,
              favoriteList: favoriteList,
              favoriteStatus: favoriteStatus),
          selection: homeSelectionStatus,
          favorite: favoriteStatus);
    });
  }

  ///搜尋欄位
  //地名搜尋關鍵字
  void searchCityName() {
    citySearch.value = [];
    cityData.values.forEach((element) {
      if (textEditingController.text != '') {
        if (element['chineseName']!.contains(textEditingController.text)) {
          citySearch.add(element['chineseName']!);
        }
      }
    });
  }

  //文字清除
  void textClean() {
    textEditingController.text = '';
    citySearch.clear();
  }

  //文字選取
  void textChoose(String text) {
    textEditingController.text = text;
    citySearch.clear();
  }

  void searchCityCheck() {
    if (textEditingController.text != '') {
      cityData.values.forEach((element) {
        if (element['chineseName'] == textEditingController.text) {
          searchCheck.value = true;
        }
      });
    }
  }

  void getLocation(BuildContext context) {
    double? lat;
    double? long;
    String? locationCity;
    ShowDialog.dialogLoading(context);
    locationHelper.getGeoCode().whenComplete(() async {
      lat = locationHelper.locationData!.latitude;
      long = locationHelper.locationData!.longitude;
      List<Placemark> placeMarks = await placemarkFromCoordinates(lat!, long!);
      locationCity = taiTransform(placeMarks[0].administrativeArea!);
      print('當前地位:$locationCity');
      Get.back();
      getSearchCityData(context, locationCity!);
    });
  }

  String taiTransform(String city) {
    if (city.contains('台')) {
      return city.replaceAll('台', '臺');
    } else {
      return city;
    }
  }
}
