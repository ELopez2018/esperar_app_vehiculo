import 'package:flutter/material.dart';

class PopUpsProvider extends ChangeNotifier {
  bool _closeSession = false;

  void setCloseSession() {
    _closeSession = !_closeSession;
    notifyListeners();
  }

  bool getCloseSession() => _closeSession;
}
