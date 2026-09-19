import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../services/storage_service.dart';
import '../core/constants.dart';

class SebhaProvider extends ChangeNotifier {
  int _counter = 0;
  int _totalCount = 0;
  bool _hapticFeedback = true;

  int get counter => _counter;
  int get totalCount => _totalCount;
  bool get hapticFeedback => _hapticFeedback;

  SebhaProvider() {
    _totalCount = StorageService.getInt(AppConstants.keySebhaTotal, 0);
  }

  void increment() {
    _counter++;
    _totalCount++;
    if (_hapticFeedback) {
      HapticFeedback.lightImpact();
    }
    StorageService.setInt(AppConstants.keySebhaTotal, _totalCount);
    notifyListeners();
  }

  void resetCounter() {
    _counter = 0;
    notifyListeners();
  }

  void resetTotal() {
    _totalCount = 0;
    StorageService.setInt(AppConstants.keySebhaTotal, 0);
    notifyListeners();
  }

  void toggleHaptic(bool value) {
    _hapticFeedback = value;
    notifyListeners();
  }
}
