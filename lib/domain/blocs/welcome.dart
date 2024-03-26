import 'package:flutter/material.dart';

class WelcomeProvider extends ChangeNotifier {
  bool _showLoginMenu = false;
  bool _showRecoverPasswordMenu = false;


  void setShowLoginMenu() {
    _showLoginMenu = !_showLoginMenu;
    notifyListeners();
  }


  void setShowRecoverPasswordMenu() {
    _showRecoverPasswordMenu = !_showRecoverPasswordMenu;
    notifyListeners();
  }



  bool getShowLoginMenu() => _showLoginMenu;

  bool getShowRecoverPasswordMenu() => _showRecoverPasswordMenu;
}
