import 'package:flutter/material.dart';

class UserModel with ChangeNotifier {
  String _username = '';
  String _phone = '';

  String get username => _username;
  String get phone => _phone;

  Future<void> loadUserData() async {
    // Simulate fetching data from SharedPreferences
    await Future.delayed(Duration(seconds: 2));
    _username = 'Samarth';
    _phone = '123-456-7890';
    notifyListeners();  // Notify listeners about the change
  }
}
