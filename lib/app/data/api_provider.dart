import 'package:dio/dio.dart';
import 'package:tw_weather/app/models/records_model.dart';
import 'package:tw_weather/app/models/success_model.dart';

import '../../authorization.dart';
import '../constant.dart';

class ApiProvider {
  final Dio dio;
  ApiProvider({
    required this.dio,
  });

  Future<Records> get36hData({required String location}) async {
    final uri = Uri.https(kDataAuth, '$kDataPath$k36HForecast/',
        {"Authorization": authorization, 'locationName': location});
    final url = uri.toString();
    final result = await dio.get(url);
    final response = Success.fromJson(result.data as Map<String, dynamic>);
    if (response.success == 'true') {
      final records = Records.fromJson(response.records);
      return Future<Records>.value(records);
    }
    return Future<Records>.error('Error');
  }
}
