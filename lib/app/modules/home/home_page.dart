import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:mobx/mobx.dart';
import 'package:weatherapp/app/modules/home/widgets/background_img.dart';
import 'package:weatherapp/app/modules/home/widgets/city_name.dart';
import 'package:weatherapp/app/modules/home/widgets/dateTime.dart';
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

  double transformKelvin2Celsius(double temp) {
    double newTemp;
    newTemp = temp - 273.15;
    return newTemp;
  }

  @observable
  List<String> cities = [];

  @action
  addCity(String city) {
    if (!cities.contains(city))
      cities.add(city);
    else
      print('Essa cidade já está na lista!');
  }

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> placeInfo;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Dialogs.materialDialog(
              title: "Add city",
              color: Colors.white,
              context: context,
              actions: [
                TextFormField(
                  controller: textEditingController,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Place...',
                    hintStyle: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                IconsButton(
                  onPressed: () {
                    setState(() {
                      addCity(textEditingController.text);
                      Navigator.of(context).pop();
                      textEditingController.clear();
                    });
                  },
                  text: 'Add',
                  iconData: Icons.delete,
                  color: Colors.blueAccent,
                  textStyle: TextStyle(color: Colors.white),
                  iconColor: Colors.white,
                ),
              ]);
        },
        child: Icon(Icons.add, color: Colors.blueAccent),
      ),
      body: cities.length != 0
          ? PageView.builder(
              controller: _pageController,
              itemCount: cities.length,
              itemBuilder: (context, index) => LayoutBuilder(
                builder: (context, constraints) => Stack(
                  children: [
                    backgroundImg(constraints, index),
                    FutureBuilder(
                      future: getApiData(placeInfo, parsedPlace: cities[index]),
                      builder: (context, snapshot) => snapshot.data != null
                          ? Column(
                              children: [
                                SizedBox(height: 60),
                                cityName(snapshot),
                                dateTime(),
                                SizedBox(height: 70),
                                Text(
                                  '${transformKelvin2Celsius(snapshot.data['temp']).toStringAsPrecision(3)} °C',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
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
