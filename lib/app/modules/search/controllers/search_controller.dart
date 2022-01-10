import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
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

  final loadDataStatus = Rx<LoadDataStatus>(LoadDataStatus.loading);
  final recommendCity = RxList<AllCityLocation>();
  final citySearch = <String>[].obs;
  final searchCheck = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    textEditingController.addListener(() {
      if (textEditingController.text != '') {
        searchCityName();
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

  void getRecommendCity() async {
    await apiProvider
        .getAllCityData(location: '臺北市,臺中市,高雄市')
        .then((value) => recommendCity.addAll(value.location));
    loadDataStatus.value = LoadDataStatus.finished;
    update();
  }

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

  void textClean() {
    textEditingController.text = '';
    citySearch.clear();
  }

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

  Future<void> getSearchCityData(BuildContext context) async {
    ShowDialog.dialogLoading(context);
    await apiProvider
        .getAllCityData(location: textEditingController.text)
        .then((value) {
      Get.back();
      ShowDialog.dialogReport(context,
          city: value.location[0].locationName,
          data: value.location[0].weatherElement,
          onPress1: () {},
          onPress2: () {});
    });
  }
}
