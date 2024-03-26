import 'package:esperar_drivers/domain/entities/county%20state%20city/cities.dart';
import 'package:esperar_drivers/domain/entities/county%20state%20city/country.dart';

abstract class CountyStateCity {
  Future<List<Country>?>? getCountries();
  Future<List<Country>?>? getStates(String country);
  Future<List<Cities>?>? getCities(String country, String state);
}
