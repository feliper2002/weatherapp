// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WeatherStore on _WeatherStoreBase, Store {
  Computed<WeatherAPI> _$weatherApiComputed;

  @override
  WeatherAPI get weatherApi =>
      (_$weatherApiComputed ??= Computed<WeatherAPI>(() => super.weatherApi,
              name: '_WeatherStoreBase.weatherApi'))
          .value;

  final _$_weatherAPIAtom = Atom(name: '_WeatherStoreBase._weatherAPI');

  @override
  WeatherAPI get _weatherAPI {
    _$_weatherAPIAtom.reportRead();
    return super._weatherAPI;
  }

  @override
  set _weatherAPI(WeatherAPI value) {
    _$_weatherAPIAtom.reportWrite(value, super._weatherAPI, () {
      super._weatherAPI = value;
    });
  }

  @override
  String toString() {
    return '''
weatherApi: ${weatherApi}
    ''';
  }
}
