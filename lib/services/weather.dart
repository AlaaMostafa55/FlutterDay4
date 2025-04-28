import 'package:dio/dio.dart';
import 'package:flutter_project/models/weather_model.dart';

class WeatherService {
  final Dio dio = Dio();

  Future<WeatherModel> getWeather({required String cityName}) async {
    try {
      Response response = await dio.get(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=b57988752f7addf51b55cc79204ea284&units=metric',
      );
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } catch (e) {
      return WeatherModel('ERROR is  $e', 0, 0, 0, 0, 0);
    }
  }
}
