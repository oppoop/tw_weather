import 'package:get/get.dart';
import 'package:tw_weather/app/data/api_provider.dart';
import 'package:tw_weather/app/models/city_records_model.dart';
import 'package:tw_weather/utils/loading_state.dart';

class HomeController extends GetxController {
  final ApiProvider apiProvider;

  HomeController({required this.apiProvider});

  final loadDataStatus = Rx<LoadDataStatus>(LoadDataStatus.loading);

  final city = '宜蘭縣';
  final element = RxList<CityLocations>();
  final localSelect = Rx<int>(0);
  final localNum = RxList<int>();
  final location = Rx<String>('');
  final weather = RxList<CityTime>();
  final ci = RxList<CityTime>();
  final pop = RxList<CityTime>();
  final t = RxList<CityTime>();
  final ws = RxList<CityTime>();

  @override
  void onInit() {
    // TODO: implement onInit
    init();
    super.onInit();
  }

  void init() async {
    await apiProvider.getCityData(location: city).then((value) {
      element.value = value.locations;
      getWeatherDetails();
    });
    getLocalNumList();
    loadDataStatus.value = LoadDataStatus.finished;
    update();
  }

  void getWeatherDetails() {
    location.value = element[0].location[localSelect.value].locationName;
    element[0].location[localSelect.value].weatherElement.forEach((element) {
      switch (element.elementName) {
        case 'Wx':
          weather.value = element.time;
          break;
        case 'PoP6h':
          pop.value = element.time;
          break;
        case 'T':
          t.value = element.time;
          break;
        case 'CI':
          ci.value = element.time;
          break;
        case 'WS':
          ws.value = element.time;
          break;
      }
    });
    update();
  }

  void getLocalNumList() {
    for (int i = 0; i < element[0].location.length; i++) {
      localNum.add(i);
    }
  }

  void setNewLocation(int value) {
    localSelect.value = value;
    getWeatherDetails();
    update();
  }
}
