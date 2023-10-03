import 'package:flutter/material.dart';

class IndexProvider extends ChangeNotifier {
  int _index = 0; // Initial value of the name

  int get index => _index;

  void updateIndex() {
    if (_index < 9) {
      _index++;
    }
    notifyListeners(); // Notify listeners of the change of name
  }
}
