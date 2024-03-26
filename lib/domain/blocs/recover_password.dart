import 'package:flutter/material.dart';

class RecoverPasswordProvider extends ChangeNotifier {
  bool _showValidateCode = false;
  bool _showChangePassword = false;
  late Function close;
  String? error;

  final List<TextEditingController> controllers = List.generate(
    6,
    (index) => TextEditingController(),
  );

  TextEditingController password = TextEditingController();
  TextEditingController verifyPassword = TextEditingController();

  Future<String?> validatedCode() async {
    try {} on String catch (err) {
      error = err;
    }
    return null;
  }

  void setShowValidateCode() {
    _showValidateCode = !_showValidateCode;
    notifyListeners();
  }

  void setShowChangePassword() {
    _showChangePassword = !_showChangePassword;
    notifyListeners();
  }

  void setClose(Function value) {
    close = value;
  }

  bool getShowValidateCode() => _showValidateCode;

  bool getShowChangePassword() => _showChangePassword;
}
