class Weather {
  var cityName;
  var Icons;
  var condition;
  var temp;
  var wind;
  var humidity;
  var wind_dir;
  var gust;
  var pressure;
  var uv;
  var precipitation;
  var last_update;

  Weather({
    required this.Icons,
    required this.cityName,
    required this.condition,
    required this.gust,
    required this.humidity,
    required this.last_update,
    required this.precipitation,
    required this.pressure,
    required this.temp,
    required this.uv,
    required this.wind,
    required this.wind_dir,
  });

  factory Weather.jsonMap(Map res) {
    return Weather(
        Icons: res["current"]["condition"]["icon"],
        cityName: res["location"]["name"],
        condition: res["current"]["condition"]["text"],
        gust: res["current"]["gust_kph"],
        humidity: res["current"]['humidity'],
        last_update: res["current"]["last_updated"],
        precipitation: res["current"]["precip_mm"],
        pressure: res["current"]["pressure_mb"],
        temp: res['current']["temp_c"],
        uv: res['current']["uv"],
        wind: res['current']["wind_kph"],
        wind_dir: res['current']["wind_dir"]);
  }
}
//8.23677865848738, 77.24109640442093


//https://api.weatherapi.com/v1/current.json?key=222249c643674c33bb0140651230611&q=8.23,77.24&aqi=no