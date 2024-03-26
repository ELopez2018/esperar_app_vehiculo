import 'dart:convert';
import 'package:esperar_drivers/domain/entities/user/user.dart';
import 'package:esperar_drivers/domain/repositories/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _accessToken = 'accessToken';
const _user = 'user';

class LocalStorageRepository extends LocalStorageInterface {
  @override
  Future<String?> getAccessToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(_accessToken);
  }

  @override
  Future<User?> getUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final userJson = sharedPreferences.getString(_user);
    if (userJson != null) {
      return User.fromJson(jsonDecode(userJson));
    }
    return null;
  }

  @override
  Future setAccessToken(String value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(_accessToken, value);
  }

  @override
  Future setUser(User user) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_user, jsonEncode(user));
  }

  @override
  Future clean() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }
}
