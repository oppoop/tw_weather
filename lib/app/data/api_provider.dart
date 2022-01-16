import 'package:dio/dio.dart';
import 'package:tw_weather/app/models/all_city_records_model.dart';
import 'package:tw_weather/app/models/city_records_model.dart';
import 'package:tw_weather/app/models/success_model.dart';

import '../../authorization.dart';
import '../constant.dart';

class ApiProvider {
  final Dio dio;
  ApiProvider({
    required this.dio,
  });

  Future<AllCityRecords> getAllCityData({required String location}) async {
    final uri = Uri.https(kDataAuth, '$kDataPath$k36HForecast/',
        {"Authorization": authorization, 'locationName': location});
    final url = uri.toString();
    final result = await dio.get(url);
    final response = Success.fromJson(result.data as Map<String, dynamic>);
    if (response.success == 'true') {
      final records = AllCityRecords.fromJson(response.records);
      return Future<AllCityRecords>.value(records);
    }
    return Future<AllCityRecords>.error('Error');
  }

  Future<CityRecords> getCityDataTwoDays({required String location}) async {
    String? cityPath;
    cityData.forEach((key, value) {
      if (value['chineseName'] == location) {
        cityPath = value['twoDays'];
      }
    });
    final uri = Uri.https(
        kDataAuth, '$kDataPath$cityPath/', {"Authorization": authorization});
    final url = uri.toString();
    final result = await dio.get(url);
    final response = Success.fromJson(result.data as Map<String, dynamic>);
    if (response.success == 'true') {
      final records = CityRecords.fromJson(response.records);
      return Future<CityRecords>.value(records);
    }
    return Future<CityRecords>.error('Error');
  }

  Future<CityRecords> getCityDataWeek({required String location}) async {
    String? cityPath;
    cityData.forEach((key, value) {
      if (value['chineseName'] == location) {
        cityPath = value['week'];
      }
    });
    final uri = Uri.https(
        kDataAuth, '$kDataPath$cityPath/', {"Authorization": authorization});
    final url = uri.toString();
    final result = await dio.get(url);
    final response = Success.fromJson(result.data as Map<String, dynamic>);
    if (response.success == 'true') {
      print(response.records);
      final records = CityRecords.fromJson(response.records);
      return Future<CityRecords>.value(records);
    }
    return Future<CityRecords>.error('Error');
  }
}
