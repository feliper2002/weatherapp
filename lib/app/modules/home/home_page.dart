import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:weatherapp/app/shared/stores/weather_store.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  WeatherStore weatherStore = WeatherStore();

  @override
  void initState() {
    super.initState();
  }

  Future<Map<String, dynamic>> getApiData(Map<String, dynamic> placeInfo,
      {String parsedPlace}) async {
    final weather = await weatherStore.fetchWeatherApi(place: parsedPlace);
    placeInfo = {
      'name': weather?.name,
      'temp': weather?.main?.temp,
      'temp-max': weather?.main?.tempMax,
      'temp-min': weather?.main?.tempMin,
      'humidity': weather?.main?.humidity,
      'feelsLike': weather?.main?.feelsLike,
      'pressure': weather?.main?.pressure,
      'timezone': weather?.timezone,
      'clouds': weather?.clouds?.all,
      'coord-lat': weather?.coord?.lat,
      'coord-lon': weather?.coord?.lon,
      'visibility': weather?.visibility,
      'country': weather?.sys?.country,
      'sunrise': weather?.sys?.sunrise,
      'sunset': weather?.sys?.sunset,
    };
    return placeInfo;
  }

  @observable
  String place;

  @action
  getPlace({String name}) {
    place = name;
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> placeInfo;

    return Scaffold(
      appBar: AppBar(),
      body: LayoutBuilder(
        builder: (context, constraints) => FutureBuilder(
          future: getApiData(placeInfo, parsedPlace: 'Salvador'),
          builder: (context, snapshot) => snapshot.data != null
              ? Container(
                  // background picture container
                  child: Center(
                    child: Text(
                      snapshot.data['name'],
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
    );
  }
}
