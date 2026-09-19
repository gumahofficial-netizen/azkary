import 'package:flutter/material.dart';
import '../services/storage_service.dart';
import '../core/constants.dart';

class AppProvider extends ChangeNotifier {
  int _currentIndex = 0;
  ThemeMode _themeMode = ThemeMode.system;
  double _fontSize = 18.0;

  int get currentIndex => _currentIndex;
  ThemeMode get themeMode => _themeMode;
  double get fontSize => _fontSize;

  AppProvider() {
    _loadSettings();
  }

  void _loadSettings() {
    final mode = StorageService.getString(AppConstants.keyThemeMode, 'system');
    if (mode == 'light') {
      _themeMode = ThemeMode.light;
    } else if (mode == 'dark') {
      _themeMode = ThemeMode.dark;
    } else {
      _themeMode = ThemeMode.system;
    }

    _fontSize = StorageService.getDouble(AppConstants.keyFontSize, 18.0);
    notifyListeners();
  }

  void setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void toggleTheme(ThemeMode mode) async {
    _themeMode = mode;
    await StorageService.setString(AppConstants.keyThemeMode, mode.name);
    notifyListeners();
  }

  void setFontSize(double size) async {
    _fontSize = size;
    await StorageService.setDouble(AppConstants.keyFontSize, size);
    notifyListeners();
  }
}
