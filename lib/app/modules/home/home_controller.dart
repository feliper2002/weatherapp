import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  List<String> cities = [];

  @action
  addCity(String city) {
    if (!cities.contains(city))
      cities.add(city);
    else
      print('Essa cidade já está na lista!');
  }

  double transformKelvin2Celsius(double temp) {
    double newTemp;
    newTemp = temp - 273.15;
    return newTemp;
  }
}
