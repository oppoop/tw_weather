import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tw_weather/app/data/api_provider.dart';
import 'package:tw_weather/app/models/all_city_records_model.dart';
import 'package:tw_weather/utils/loading_state.dart';
import 'package:tw_weather/utils/show_dialog.dart';

import '../../../constant.dart';

class SearchController extends GetxController {
  final ApiProvider apiProvider;

  SearchController({required this.apiProvider});

  final TextEditingController textEditingController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  final box = GetStorage();

  final loadDataStatus = Rx<LoadDataStatus>(LoadDataStatus.loading);
  final recommendCity = RxList<AllCityLocation>();
  final citySearch = <String>[].obs; //城市關鍵字列表
  final searchCheck = false.obs; //城市搜尋名稱檢查
  final homeSelectionStatus = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    textEditingController.addListener(() {
      if (textEditingController.text != '') {
        searchCityName();
      } else {
        citySearch.clear();
      }
    });
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
    await apiProvider
        .getAllCityData(location: textEditingController.text)
        .then((value) {
      Get.back();
      ShowDialog.dialogReport(context,
          city: value.location[0].locationName,
          data: value.location[0].weatherElement,
          onPress1: () => citySelection(context, city),
          onPress2: () {},
          selection: homeSelectionStatus);
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

  ///搜尋資料dialog功能
  //主頁釘選功能
  void citySelection(BuildContext context, String city) {
    String homeCity = box.read('HomeCity') ?? '';
    if (homeCity != city) {
      box.write('HomeCity', city);
      homeSelectionStatus.value = true;
      ShowDialog.dialogSuccess(context, text: '釘選成功');
      Future.delayed(Duration(milliseconds: 500)).then((value) => Get.back());
    }
  }
}
