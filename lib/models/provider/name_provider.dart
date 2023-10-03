import 'package:flutter/material.dart';

class NameProvider extends ChangeNotifier {
  String _name = ''; // Initial value of the name

  String get name => _name;

  void setName(String newName) {
    _name = newName;
    notifyListeners(); // Notify listeners of the change of name
  }
}
