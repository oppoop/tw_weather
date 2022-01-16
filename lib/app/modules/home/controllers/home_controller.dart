import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tw_weather/app/data/api_provider.dart';
import 'package:tw_weather/app/models/city_records_model.dart';
import 'package:tw_weather/utils/loading_state.dart';

class HomeController extends GetxController {
  final ApiProvider apiProvider;

  HomeController({required this.apiProvider});

  final box = GetStorage();
  final now = DateTime.now();
  final loadDataStatus = Rx<LoadDataStatus>(LoadDataStatus.loading);

  final city = Rx<String>('');
  final date = Rx<String>('');
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

  @override
  void onReady() {
    // TODO: implement onReady
    getApiData();
    super.onReady();
  }

  void init() {
    //獲取當天日期
    date.value = '${now.month}月${now.day}日 , ${now.year}';
    //主頁釘選地區
    city.value = box.read('HomeCity') ?? '臺北市';
    update();
  }

  ///天氣詳細資料
//獲取主頁釘選城市資料
  void getApiData() async {
    await apiProvider.getCityDataTwoDays(location: city.value).then((value) {
      element.value = value.locations;
      getWeatherDetails();
    });
    getLocalNumList();
    loadDataStatus.value = LoadDataStatus.finished;
    update();
  }

//天氣因子分類
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

  ///鄉鎮資料列表
//鄉鎮資料列表index
  void getLocalNumList() {
    for (int i = 0; i < element[0].location.length; i++) {
      localNum.add(i);
    }
  }

//切換鄉鎮
  void setNewLocation(int value) {
    localSelect.value = value;
    getWeatherDetails();
    update();
  }
}
