import 'package:flutter/foundation.dart';
import 'package:fickle/utils/flickerpreferences.dart';

class DarkThemeProvider with ChangeNotifier {
  FlickerPreferences devFestPreferences = FlickerPreferences();
  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
    devFestPreferences.setDarkTheme(value);
    notifyListeners();
  }
}
