import 'package:counter_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeData _currentTheme = AppThemes.lightTheme;
  bool _isDarkMode = false;

  ThemeData get currentTheme => _currentTheme;
  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    if (_isDarkMode) {
      _currentTheme = AppThemes.lightTheme;
    } else {
      _currentTheme = AppThemes.darkTheme;
    }
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}
