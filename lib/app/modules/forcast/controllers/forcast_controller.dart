import 'package:get/get.dart';
import 'package:tw_weather/app/data/api_provider.dart';
import 'package:tw_weather/app/models/city_records_model.dart';
import 'package:tw_weather/utils/loading_state.dart';

class ForcastController extends GetxController {
  final ApiProvider apiProvider;

  ForcastController({required this.apiProvider});
  final loadDataStatus = Rx<LoadDataStatus>(LoadDataStatus.loading);
  final List<int> weekDataMid12H = [1, 3, 5, 7, 9, 11, 13];
  final city = Get.arguments['city'];
  final todayWeekDay = Get.arguments['todayWeekDay'];
  final localSelect = Get.arguments['localSelect'];
  final todayY = Get.arguments['y'];
  final todayM = Get.arguments['m'];
  final todayD = Get.arguments['d'];
  final todayWeather = RxList<CityTime>();
  final todayT = RxList<CityTime>();
  final weekT = RxList<CityTime>();
  final weekWeather = RxList<CityTime>();

  @override
  void onInit() {
    init();
    super.onInit();
  }

  @override
  void onReady() {
    getApiData();
    super.onReady();
  }

  @override
  void onClose() {}

  void init() {
    //今日預報data
    todayForecast();
  }

  void getApiData() async {
    await apiProvider.getCityDataWeek(location: city).then((value) {
      weekDataMid12H.forEach((element) {
        weekT.add(value.locations[0].location[localSelect].weatherElement[1]
            .time[element]);
        weekWeather.add(value.locations[0].location[localSelect]
            .weatherElement[6].time[element]);
      });
    });
    loadDataStatus.value = LoadDataStatus.finished;
    update();
  }

  void todayForecast() {
    List<CityTime> weather = Get.arguments['weather'];
    List<CityTime> t = Get.arguments['t'];
    String md = '$todayM$todayD';
    weather.forEach((element) {
      if (int.parse(formatStartTime(element.startTime)) == int.parse(md)) {
        todayWeather.add(element);
      }
    });
    t.forEach((element) {
      if (int.parse(formatStartTime(element.dataTime)) == int.parse(md)) {
        todayT.add(element);
      }
    });
  }

  String formatStartTime(String date) {
    if (date.length != 0) {
      return '${date.substring(5, 7)}${date.substring(8, 10)}';
    } else {
      return '';
    }
  }

  List<String> weekDay(int today) {
    List<int> weekDayNum = [];
    List<String> weekDay = [];
    for (int i = 0; i < 7; i++) {
      if (today < 8) {
        weekDayNum.add(today);
        if (today == 7) {
          today = 1;
        } else {
          today++;
        }
      }
    }
    weekDayNum.forEach((element) {
      switch (element) {
        case 1:
          weekDay.add('星期一');
          break;
        case 2:
          weekDay.add('星期二');
          break;
        case 3:
          weekDay.add('星期三');
          break;
        case 4:
          weekDay.add('星期四');
          break;
        case 5:
          weekDay.add('星期五');
          break;
        case 6:
          weekDay.add('星期六');
          break;
        case 7:
          weekDay.add('星期天');
          break;
      }
    });
    return weekDay;
  }
}
