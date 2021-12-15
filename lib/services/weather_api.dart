import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/model/weather_model.dart';

class WeatherApi {
  Future<Weather>? getCurrentWeather(String? cityName) async {
    var endpoint = Uri.parse(
        "http://api.openweathermap.org/data/2.5/weather?q=Saint%20Petersburg&appid=e966517baf261e6236ed600f51a27283&units=metric&lang=ru");
    var response = await http.get(endpoint);
    var body = jsonDecode(response.body);
    Weather weather = Weather.fromJson(body);
    print(Weather.fromJson(body).cityName);
    return Weather.fromJson(body);
  }
}
