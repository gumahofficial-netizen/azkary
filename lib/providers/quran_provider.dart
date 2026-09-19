import 'package:flutter/material.dart';
import '../models/surah.dart';
import '../services/quran_service.dart';
import '../services/storage_service.dart';
import '../core/constants.dart';

class QuranProvider extends ChangeNotifier {
  final QuranService _quranService = QuranService();
  List<Surah> _surahs = [];
  List<Ayah> _currentAyahs = [];
  bool _isLoading = false;
  String _selectedReciter = 'ar.alafasy';
  
  List<Surah> get surahs => _surahs;
  List<Ayah> get currentAyahs => _currentAyahs;
  bool get isLoading => _isLoading;
  String get selectedReciter => _selectedReciter;

  QuranProvider() {
    loadSurahs();
    _selectedReciter = StorageService.getString(AppConstants.keyDefaultReciter, 'ar.alafasy');
  }

  Future<void> loadSurahs() async {
    _isLoading = true;
    notifyListeners();
    _surahs = await _quranService.getSurahs();
    _isLoading = false;
    notifyListeners();
  }

  Future<void> loadSurahAyahs(int surahNumber) async {
    _isLoading = true;
    notifyListeners();
    _currentAyahs = await _quranService.getSurahAyahs(surahNumber);
    _isLoading = false;
    notifyListeners();
  }

  void setReciter(String reciterId) async {
    _selectedReciter = reciterId;
    await StorageService.setString(AppConstants.keyDefaultReciter, reciterId);
    notifyListeners();
  }

  List<AyahBookmark> get bookmarks => StorageService.getBookmarks();

  void toggleBookmark(Surah surah, Ayah ayah) async {
    if (StorageService.isBookmarked(surah.number, ayah.numberInSurah)) {
      await StorageService.removeBookmark(surah.number, ayah.numberInSurah);
    } else {
      await StorageService.addBookmark(AyahBookmark(
        surahNumber: surah.number,
        surahName: surah.name,
        ayahNumber: ayah.numberInSurah,
        ayahText: ayah.text,
        dateAdded: DateTime.now().toString(),
      ));
    }
    notifyListeners();
  }
}
