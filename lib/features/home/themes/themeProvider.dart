
import 'package:carhelp/features/home/themes/homeLIght.dart';
import 'package:flutter/material.dart';

class themeProvider with ChangeNotifier{
  ThemeData _themeData=lightTheme;

  ThemeData get themeData=> _themeData;

  set themeData(ThemeData themeData){
    _themeData=themeData;
    notifyListeners();
  }

  void toggleTheme(){
    if(_themeData==lightTheme)
      themeData=darkTheme;
    else
      themeData=lightTheme;
  }
}