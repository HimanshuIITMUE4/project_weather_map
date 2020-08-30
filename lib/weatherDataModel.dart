class WeatherModel {
  final main;
  final name;
  final lon;
  final lat;
  final temp;
  final feels_like;
  final temp_min;
  final temp_max;
  final pressure;
  final humidity;
  final visibility;
  final sunrise;
  final sunset;
  final icon;

  double get getTemp => temp - 272.5;
  double get getFeelsLike => feels_like - 272.5;
  double get getMaxTemp => temp_max - 272.5;
  double get getMinTemp => temp_min - 272.5;
  String get getSunrise => getClockInUtcPlus3Hours(sunrise as int);
  String get getSunset => getClockInUtcPlus3Hours(sunset as int);

  String getClockInUtcPlus3Hours(int timeSinceEpochInSec) {
    final time = DateTime.fromMillisecondsSinceEpoch(timeSinceEpochInSec * 1000,
            isUtc: true)
        .add(const Duration(hours: 3));
    return '${time.hour}:${time.second}';
  }

  WeatherModel(
    this.main,
    this.name,
    this.lon,
    this.lat,
    this.temp,
    this.feels_like,
    this.temp_min,
    this.temp_max,
    this.pressure,
    this.humidity,
    this.visibility,
    this.sunrise,
    this.sunset,
    this.icon,
  );

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      json["weather"][0]["main"],
      json["name"],
      json["coord"]["lon"],
      json["coord"]["lat"],
      json["main"]["temp"],
      json["main"]["feels_like"],
      json["main"]["temp_min"],
      json["main"]["temp_max"],
      json["main"]["pressure"],
      json["main"]["humidity"],
      json["visibility"],
      json["sys"]["sunrise"],
      json["sys"]["sunset"],
      json["weather"][0]["icon"],
    );
  }
}
