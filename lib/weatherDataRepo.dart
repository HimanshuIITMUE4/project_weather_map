import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weathermap/weatherDataModel.dart';

class WeatherRepo {
  Future<WeatherModel> getWeather(String city) async {
    final result = await http.Client().get(
        "https://api.openweathermap.org/data/2.5/weather?q=$city&APPID=deeb160c2a50ecb3872c1ff2ec2b3465");

    if (result.statusCode != 200) throw Exception();

    return parsedJson(result.body);
  }

  WeatherModel parsedJson(final response) {
    final jsonDecoded = json.decode(response);

    final jsonWeather = jsonDecoded;

    return WeatherModel.fromJson(jsonWeather);
  }
}
