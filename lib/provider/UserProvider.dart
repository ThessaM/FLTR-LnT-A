

import 'package:flutter/material.dart';

class Userprovider extends ChangeNotifier {
  String username = "Guest";

  void login(String name) {
    username = name;
    notifyListeners();
  }

  bool isLoggedIn() {
    return username != "Guest";
  }

  void logout() {
    username = "Guest";
    notifyListeners();
  }
}