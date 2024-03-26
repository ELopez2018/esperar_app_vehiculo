import 'package:dio/dio.dart';
import 'package:esperar_drivers/domain/entities/county%20state%20city/cities.dart';
import 'package:esperar_drivers/domain/entities/county%20state%20city/country.dart';
import 'package:esperar_drivers/domain/services/country_satate_city.dart';


class CountryStateCityService extends CountyStateCity {
  final Dio dio =
      Dio(BaseOptions(baseUrl: 'https://api.countrystatecity.in/v1'));
      
        get apiCountryStateCity => null;
  @override
  Future<List<Country>?>? getCountries() async {
    try {
      final response = await dio.get(
        '/countries',
        options: Options(
          headers: {'X-CSCAPI-KEY': apiCountryStateCity},
        ),
      );
      if (response.statusCode == 200) {
        final List<dynamic> countriesJson = response.data;
        return countriesJson.map((e) => Country.fromJson(e)).toList();
      }
    } on DioException catch (_) {}
    return null;
  }

  @override
  Future<List<Country>?>? getStates(String country) async {
    try {
      final response = await dio.get(
        '/countries/$country/states',
        options: Options(
          headers: {'X-CSCAPI-KEY': apiCountryStateCity},
        ),
      );
      if (response.statusCode == 200) {
        final List<dynamic> countriesJson = response.data;
        return countriesJson.map((e) => Country.fromJson(e)).toList();
      }
    } on DioException catch (_) {}
    return null;
  }

  @override
  Future<List<Cities>?>? getCities(String country, String state) async {
    try {
      final response = await dio.get(
        '/countries/$country/states/$state/cities',
        options: Options(
          headers: {'X-CSCAPI-KEY': apiCountryStateCity},
        ),
      );
      if (response.statusCode == 200) {
        final List<dynamic> countriesJson = response.data;
        return countriesJson.map((e) => Cities.fromJson(e)).toList();
      }
    } on DioException catch (_) {}
    return null;
  }
}
