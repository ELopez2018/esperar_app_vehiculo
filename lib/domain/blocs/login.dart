import 'package:esperar_drivers/core/const/state_progress.dart';
import 'package:esperar_drivers/domain/entities/auth/auth_request.dart';
import 'package:esperar_drivers/domain/repositories/auth.dart';
import 'package:esperar_drivers/domain/repositories/local_storage.dart';
import 'package:esperar_drivers/domain/repositories/user.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  LoginProvider({
    required this.localStorageInterface,
    required this.authInterface,
    required this.userInterface,
  });
  bool _showRecoverPassword = false;

  final LocalStorageInterface localStorageInterface;
  final AuthInterface authInterface;
  final UserInterface userInterface;
  final TextEditingController user = TextEditingController();
  final TextEditingController password = TextEditingController();
  String? rol;
  String? error;

  StateProgress state = StateProgress.initial;

  Future<bool?> login() async {
    try {
      state = StateProgress.loading;
      notifyListeners();
      final result = await authInterface
          .singIn(AuthRequest(username: user.text, password: password.text));
      if (result != null) {
          await localStorageInterface.setAccessToken(result.accessToken);
        final userResponse = await userInterface.getUserByToken();
        if (userResponse != null) {
          await localStorageInterface.setUser(userResponse);
          state = StateProgress.initial;
          notifyListeners();
          return true;
        }
      }
      state = StateProgress.initial;
      notifyListeners();
      return false;
    } on String catch (_) {
      state = StateProgress.initial;
      notifyListeners();
      error = _;
    }
    return null;
  }

  void setShowRecoverPassword() {
    _showRecoverPassword = !_showRecoverPassword;
    notifyListeners();
  }

  bool getShowRecoverPassword() => _showRecoverPassword;
}
