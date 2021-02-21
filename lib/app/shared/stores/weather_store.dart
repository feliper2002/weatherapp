import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import 'package:weatherapp/app/models/weatherApi.dart';
part 'weather_store.g.dart';

class WeatherStore = _WeatherStoreBase with _$WeatherStore;

abstract class _WeatherStoreBase with Store {
  @observable
  WeatherAPI _weatherAPI;

  @computed
  WeatherAPI get weatherApi => _weatherAPI;

  Future<WeatherAPI> fetchWeatherApi({String place}) async {
    final placeName = place.replaceAll(' ', '%20');
    print(placeName);
    String url =
        'https://api.openweathermap.org/data/2.5/weather?q=$placeName,br&APPID=228dd7d24d0eaeee4e90ce3e2244240d';
    final response = await http.get(url);
    final json = jsonDecode(response.body);
    print(json.toString());
    return WeatherAPI.fromJson(json);
  }
}
