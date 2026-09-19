import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../services/prayer_service.dart';

class PrayerProvider extends ChangeNotifier {
  final PrayerService _prayerService = PrayerService();
  Map<String, DateTime>? _prayerTimes;
  String _nextPrayerName = '';
  Duration _countdown = Duration.zero;
  Position? _currentPosition;
  Timer? _timer;

  Map<String, DateTime>? get prayerTimes => _prayerTimes;
  String get nextPrayerName => _nextPrayerName;
  Duration get countdown => _countdown;
  Position? get currentPosition => _currentPosition;

  PrayerProvider() {
    init();
  }

  Future<void> init() async {
    _currentPosition = await _prayerService.getCurrentLocation();
    if (_currentPosition != null) {
      _updatePrayerTimes();
      _startCountdown();
    }
  }

  void _updatePrayerTimes() {
    if (_currentPosition == null) return;
    _prayerTimes = _prayerService.getPrayerTimes(_currentPosition!);
    _nextPrayerName = _prayerService.getNextPrayerName(_prayerTimes!);
    notifyListeners();
  }

  void _startCountdown() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_prayerTimes != null) {
        _countdown = _prayerService.getCountdown(_prayerTimes!);
        if (_countdown.isNegative || _countdown.inSeconds == 0) {
          _updatePrayerTimes();
        }
        notifyListeners();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
