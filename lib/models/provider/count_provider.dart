import 'package:flutter/material.dart';

class CountProvider extends ChangeNotifier {
  int _count = 0; // Initial value of the name

  int get count => _count;

  void setFinalCount(int newCount) {
    _count = newCount;
    notifyListeners(); // Notify listeners of the change of name
  }
}
