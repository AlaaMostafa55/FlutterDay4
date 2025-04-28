class WeatherModel {
  final String cityName;
  final dynamic temp;
  final dynamic maxTemp;
  final dynamic minTemp;
  final dynamic windSpeed;
  final dynamic windDegree;

  WeatherModel(
    this.cityName,
    this.temp,
    this.maxTemp,
    this.minTemp,
    this.windSpeed,
    this.windDegree,
  );

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      json['name'],
      json['main']['temp'],
      json['main']['temp_max'],
      json['main']['temp_min'],
      json['wind']['speed'],
      json['wind']['deg'],
    );
  }
}
