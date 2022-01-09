import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tw_weather/app/data/api_provider.dart';
import 'package:tw_weather/app/models/all_city_records_model.dart';
import 'package:tw_weather/utils/loading_state.dart';

import '../../../constant.dart';

class SearchController extends GetxController {
  final ApiProvider apiProvider;

  SearchController({required this.apiProvider});

  final TextEditingController textEditingController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  final loadDataStatus = Rx<LoadDataStatus>(LoadDataStatus.loading);
  final recommendCity = RxList<AllCityLocation>();
  final citySearch = RxList<String>();

  @override
  void onReady() {
    // TODO: implement onReady
    getRecommendCity();
    super.onReady();
  }

  void getRecommendCity() async {
    await apiProvider
        .getAllCityData(location: '臺北市,臺中市,高雄市')
        .then((value) => recommendCity.addAll(value.location));
    loadDataStatus.value = LoadDataStatus.finished;
    update();
  }

  void searchCity() {
    citySearch.value = [];
    cityData.values.forEach((element) {
      if (textEditingController.text != '') {
        if (element['chineseName']!.contains(textEditingController.text)) {
          citySearch.add(element['chineseName']!);
        }
      }
    });
    print(citySearch);
    update();
  }
}
