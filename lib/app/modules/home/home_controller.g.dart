// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$citiesAtom = Atom(name: '_HomeControllerBase.cities');

  @override
  List<String> get cities {
    _$citiesAtom.reportRead();
    return super.cities;
  }

  @override
  set cities(List<String> value) {
    _$citiesAtom.reportWrite(value, super.cities, () {
      super.cities = value;
    });
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic addCity(String city) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.addCity');
    try {
      return super.addCity(city);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cities: ${cities}
    ''';
  }
}
