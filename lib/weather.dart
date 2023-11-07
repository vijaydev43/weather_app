import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/weatherModel.dart';

class WeatherData {
  Future<Weather> getData(var latitude, var longitude) async {
    var Uricall = Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=222249c643674c33bb0140651230611&q=$latitude,$longitude&aqi=no');

    var responce = await http.get(Uricall);

    var body = jsonDecode(responce.body);

    return Weather.jsonMap(body);
  }
}
