import 'package:get/get.dart';
import 'package:tw_weather/app/data/api_provider.dart';
import 'package:tw_weather/app/models/records_model.dart';
import 'package:tw_weather/utils/loading_state.dart';

class HomeController extends GetxController {
  final ApiProvider apiProvider;

  HomeController({required this.apiProvider});

  final location = '宜蘭縣';
  final element = RxList<Location>();
  final loadDataStatus = Rx<LoadDataStatus>(LoadDataStatus.loading);
  final weather = RxList<Time>();
  final pop = RxList<Time>();
  final minT = RxList<Time>();
  final maxT = RxList<Time>();

  @override
  void onInit() {
    // TODO: implement onInit
    getApi();
    super.onInit();
  }

  void getApi() async {
    await apiProvider.get36hData(location: location).then((value) {
      element.value = value.location;
      getWeatherDetails(element[0].weatherElement);
    });
    loadDataStatus.value = LoadDataStatus.finished;
    update();
  }

  String dateTimeChange(String date) {
    if (date.length != 0) {
      return '${date.substring(5, 7)}月${date.substring(8, 10)}日 , ${date.substring(0, 4)}';
    } else {
      return '';
    }
  }

  void getWeatherDetails(List<WeatherElement> data) {
    data.forEach((element) {
      switch (element.elementName) {
        case 'Wx':
          weather.value = element.time;
          break;
        case 'PoP':
          pop.value = element.time;
          break;
        case 'MinT':
          minT.value = element.time;
          break;
        case 'MaxT':
          maxT.value = element.time;
          break;
      }
    });
    update();
  }
}
