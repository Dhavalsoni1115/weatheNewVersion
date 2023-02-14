import 'package:geolocator/geolocator.dart';
import 'package:weatherapp_new_version/services/network.dart';

class Location {
  double? latitude;
  double? longitude;

  dynamic data, cityData;
  dynamic temp,
      condition,
      cityName,
      weatherImage,
      tempMin,
      tempMax,
      humidity,
      seaLevel,
      groundLevel,
      visibility,
      windSpeed,
      windGust,
      weatherStatus,
      clouds,
      sunrise,
      sunset;
  Future<dynamic> getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      LocationPermission permission;
      permission = await Geolocator.requestPermission();
    }
  }

  Future<dynamic> getCrurrentLocation() async {
    Location location = Location();
    await location.getLocation();
    latitude = location.latitude;
    longitude = location.longitude;
    NetworkHelper networkHelper = NetworkHelper();
    data = await networkHelper.getLocation(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=8cc159acdb2e1819882625f7361be9d5&units=metric');

   // updateUI(data);
    // getCityWeather(cityName);
    return data;
  }

  Future<dynamic> getCityWeather(dynamic cityName) async {
    var url =
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=8cc159acdb2e1819882625f7361be9d5&units=metric';
    NetworkHelper networkHelper = NetworkHelper();
    cityData = await networkHelper.getLocation(url);

    return updateUI(cityData);
  }

  dynamic updateUI(dynamic weatherdata) {
    // print("1");
    // print(weatherdata);
    // print("1");
    if (weatherdata == null) {
      temp = 0;
      weatherImage = null;
      cityName = '';
      condition = '';
      tempMin = '0';
      tempMax = '0';
      humidity = '0';
      seaLevel = '0';
      groundLevel = '0';
      visibility = '0';
      windSpeed = '0';
      windGust = '0';
      weatherStatus = '0';
      clouds = '0';
      sunrise = '0';
      sunset = '0';
      return;
    }
    // Location location = Location();
    double tempuratre;
    tempuratre = weatherdata['main']['temp'];
    temp = tempuratre.toInt();
    condition = weatherdata['weather'][0]['id'];
    cityName = weatherdata['name'];
    tempMin = weatherdata['main']['temp_min'];
    tempMax = weatherdata['main']['temp_max'];
    humidity = weatherdata['main']['humidity'];
    seaLevel = weatherdata['main']['sea_level'];
    groundLevel = weatherdata['main']['grnd_level'];
    visibility = weatherdata['visibility'];
    windSpeed = weatherdata['wind']['speed'];
    windGust = weatherdata['wind']['gust'];
    weatherStatus = weatherdata['weather'][0]['main'];
    clouds = weatherdata['clouds']['all'];
    sunrise = weatherdata['sys']['sunrise'];

    sunset = weatherdata['sys']['sunset'];
    return {
      'temp': temp,
      'condition': condition,
      'cityName': cityName,
      'tempMin': tempMin,
      'tempMax': tempMax,
      'humidity': humidity,
      'seaLevel': seaLevel,
      'groundLevel': groundLevel,
      'visibility': visibility,
      'windSpeed': windSpeed,
      'windGust': windGust,
      'weatherStatus': weatherStatus,
      'clouds': clouds,
      'sunrise': sunrise,
      'sunset': sunset,
    };
    // weatherImage = location.getWeatherImage(condition);
    // weathermessage = data.getMessage(temp);
    // print(temp);
    // print(condition);
    // print(cityName);
  }

  // String getWeatherImage(var condition) {
  //   if (condition < 300) {
  //     return 'assets/images/sunny.gif';
  //   } else if (condition < 400) {
  //     return 'assets/images/rain.gif';
  //   } else if (condition < 600) {
  //     return 'assets/images/wind.gif';
  //   } else if (condition < 700) {
  //     return 'assets/images/snow.gif';
  //   } else if (condition < 800) {
  //     return 'assets/images/clouds.gif';
  //   } else if (condition == 800) {
  //     return 'assets/images/sunny.gif';
  //   } else if (condition <= 804) {
  //     return 'assets/images/fog.gif';
  //   } else {
  //     return '🤷';
  //   }
  // }
}
