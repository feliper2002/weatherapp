import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:mobx/mobx.dart';
import 'package:weatherapp/app/modules/home/widgets/background_img.dart';
import 'package:weatherapp/app/modules/home/widgets/city_name.dart';
import 'package:weatherapp/app/modules/home/widgets/dateTime.dart';
import 'package:weatherapp/app/modules/home/widgets/min_max_Temp.dart';
import 'package:weatherapp/app/modules/home/widgets/pressure_humidity.dart';
import 'package:weatherapp/app/modules/home/widgets/temperature.dart';
import 'package:weatherapp/app/shared/stores/weather_store.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  WeatherStore weatherStore = WeatherStore();
  int _currentPage = 0;
  PageController _pageController = PageController(viewportFraction: 0.8);

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      int next = _pageController.page.round();
      if (_currentPage != next) {
        setState(() {
          _currentPage = next;
        });
      }
    });
  }

  Future<Map<String, dynamic>> getApiData({String parsedPlace}) async {
    Map<String, dynamic> placeInfo;
    final weather = await weatherStore.fetchWeatherApi(place: parsedPlace);
    placeInfo = {
      'name': weather?.name,
      'temp': weather?.main?.temp ?? 0.0,
      'temp-max': weather?.main?.tempMax ?? 0.0,
      'temp-min': weather?.main?.tempMin ?? 0.0,
      'humidity': weather?.main?.humidity,
      'feelsLike': weather?.main?.feelsLike ?? 0.0,
      'pressure': weather?.main?.pressure,
      'timezone': weather?.timezone,
      'clouds': weather?.clouds?.all,
      'coord-lat': weather?.coord?.lat ?? 0.0,
      'coord-lon': weather?.coord?.lon ?? 0.0,
      'visibility': weather?.visibility,
      'country': weather?.sys?.country,
      'sunrise': weather?.sys?.sunrise,
      'sunset': weather?.sys?.sunset,
    };
    return placeInfo;
  }

  double transformKelvin2Celsius(double temp) {
    double newTemp;
    newTemp = temp - 273.15;
    return newTemp;
  }

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Dialogs.materialDialog(
              title: "Adicionar cidade",
              color: Colors.white,
              context: context,
              actions: [
                TextFormField(
                  controller: textEditingController,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Local...',
                    hintStyle: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                IconsButton(
                  onPressed: () {
                    setState(() {
                      controller.addCity(textEditingController.text);
                      Navigator.of(context).pop();
                      textEditingController.clear();
                    });
                  },
                  text: 'Adicionar',
                  iconData: Icons.place,
                  color: Colors.blueAccent,
                  textStyle: TextStyle(color: Colors.white),
                  iconColor: Colors.white,
                ),
              ]);
        },
        child: Icon(Icons.add, color: Colors.blueAccent),
      ),
      body: controller.cities.length != 0
          ? PageView.builder(
              controller: _pageController,
              itemCount: controller.cities.length,
              itemBuilder: (context, index) => LayoutBuilder(
                builder: (context, constraints) => Stack(
                  children: [
                    backgroundImg(constraints, index),
                    FutureBuilder(
                      future: getApiData(parsedPlace: controller.cities[index]),
                      builder: (context, snapshot) => snapshot.data != null
                          ? Column(
                              children: [
                                SizedBox(height: 60),
                                cityName(snapshot),
                                dateTime(),
                                SizedBox(height: 70),
                                temperature(snapshot),
                                min_max_temp(snapshot),
                                pressure_humidity(snapshot),
                              ],
                            )
                          : Center(
                              child: CircularProgressIndicator(),
                            ),
                    ),
                  ],
                ),
              ),
            )
          : Center(
              child: Text('Adicione alguma cidade!'),
            ),
    );
  }
}
