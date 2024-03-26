import 'package:dio/dio.dart';

void exception(DioException _) {
  final Map<String, dynamic> data = _.response!.data;
  if (data.isNotEmpty) {
    if (data.containsKey('backedMessage')) {
      throw data['backedMessage'];
    }
  }
  throw 'Se ha producido un error inténtalo nuevamente, si el error persiste comunícate con soporte';
}
