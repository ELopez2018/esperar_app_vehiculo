import 'package:esperar_drivers/domain/entities/user/user.dart';
import 'package:esperar_drivers/domain/repositories/local_storage.dart';
import 'package:flutter/material.dart';

class DrawerProvider extends ChangeNotifier {
  DrawerProvider({
    required this.localStorageInterface,
  });

  final LocalStorageInterface localStorageInterface;
  User? user;

  Future init() async {
    user = await localStorageInterface.getUser();
    notifyListeners();
  }
}
