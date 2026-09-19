import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/adhkar.dart';

class AdhkarProvider extends ChangeNotifier {
  List<AdhkarCategory> _categories = [];
  bool _isLoading = false;

  List<AdhkarCategory> get categories => _categories;
  bool get isLoading => _isLoading;

  AdhkarProvider() {
    loadAdhkar();
  }

  Future<void> loadAdhkar() async {
    _isLoading = true;
    notifyListeners();
    try {
      final String data = await rootBundle.loadString('assets/adhkar/adhkar.json');
      final List decoded = json.decode(data);
      _categories = decoded.map((c) => AdhkarCategory.fromJson(c)).toList();
    } catch (e) {
      print('Error loading adhkar: $e');
    }
    _isLoading = false;
    notifyListeners();
  }
}
