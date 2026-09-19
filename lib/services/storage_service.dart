import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/surah.dart';
import '../core/constants.dart';

class StorageService {
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  // General settings
  static Future<void> setString(String key, String value) async {
    await _prefs?.setString(key, value);
  }

  static String getString(String key, String defaultValue) {
    return _prefs?.getString(key) ?? defaultValue;
  }

  static Future<void> setDouble(String key, double value) async {
    await _prefs?.setDouble(key, value);
  }

  static double getDouble(String key, double defaultValue) {
    return _prefs?.getDouble(key) ?? defaultValue;
  }

  static Future<void> setInt(String key, int value) async {
    await _prefs?.setInt(key, value);
  }

  static int getInt(String key, int defaultValue) {
    return _prefs?.getInt(key) ?? defaultValue;
  }

  static Future<void> setBool(String key, bool value) async {
    await _prefs?.setBool(key, value);
  }

  static bool getBool(String key, bool defaultValue) {
    return _prefs?.getBool(key) ?? defaultValue;
  }

  // Quran bookmarks
  static List<AyahBookmark> getBookmarks() {
    final raw = getString(AppConstants.keyBookmarks, '[]');
    final List decoded = jsonDecode(raw);
    return decoded.map((b) => AyahBookmark.fromJson(b)).toList();
  }

  static Future<void> addBookmark(AyahBookmark bookmark) async {
    final bookmarks = getBookmarks();
    bookmarks.add(bookmark);
    await setString(AppConstants.keyBookmarks, jsonEncode(bookmarks.map((e) => e.toJson()).toList()));
  }

  static Future<void> removeBookmark(int surahNumber, int ayahNumber) async {
    final bookmarks = getBookmarks();
    bookmarks.removeWhere((element) => element.surahNumber == surahNumber && element.ayahNumber == ayahNumber);
    await setString(AppConstants.keyBookmarks, jsonEncode(bookmarks.map((e) => e.toJson()).toList()));
  }

  static bool isBookmarked(int surahNumber, int ayahNumber) {
    return getBookmarks().any((element) => element.surahNumber == surahNumber && element.ayahNumber == ayahNumber);
  }
}
