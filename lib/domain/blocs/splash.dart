import 'package:esperar_drivers/domain/repositories/local_storage.dart';
import 'package:esperar_drivers/domain/repositories/user.dart';
import 'package:flutter/foundation.dart';

class SplashProvider extends ChangeNotifier {
  SplashProvider({
    required this.userInterface,
    required this.localStorageInterface,
  });

  final UserInterface userInterface;
  final LocalStorageInterface localStorageInterface;

  Future<bool?> validate() async {
    try {
      final user = await userInterface.getUserByToken();
      if (user != null) {
        return true;
      }
      localStorageInterface.clean();
      return false;
    } on String catch (_) {
      return null;
    }
  }
}
