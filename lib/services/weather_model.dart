// ignore_for_file: public_member_api_docs, sort_constructors_first
class Weather {
  var cityName;
  var temp;
  var wind;
  var humidity;
  var icon;
  var condition;
  var pressure;
  var precipitation;
  var lastUpdate;
  Weather({
    required this.cityName,
    required this.temp,
    required this.wind,
    required this.humidity,
    required this.icon,
    required this.condition,
    required this.precipitation,
    required this.pressure,
    required this.lastUpdate,
  });

  Weather.fromJson(Map<String, dynamic> json) {
    cityName = json['location']['name'];
    icon = json['current']['condition']['icon'];
    condition = json['current']['condition']['text'];
    temp = json['current']['temp_c'];
    wind = json['current']['wind_kph'];
    humidity = json['current']['humidity'];
    precipitation = json['current']['precip_mm'];
    pressure = json['current']['pressure_mb'];
    lastUpdate = json['current']['last_updated'];
  }
}
