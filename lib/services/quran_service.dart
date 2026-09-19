import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import '../models/surah.dart';

class QuranService {
  static const String _baseUrl = 'https://api.alquran.cloud/v1';

  Future<List<Surah>> getSurahs() async {
    try {
      final String response = await rootBundle.loadString('assets/quran/data/surahs.json');
      final data = json.decode(response);
      return (data['data'] as List).map((s) => Surah.fromJson(s)).toList();
    } catch (e) {
      print('Error loading surahs: $e');
      return [];
    }
  }

  Future<List<Ayah>> getSurahAyahs(int surahNumber) async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/surah/$surahNumber'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return (data['data']['ayahs'] as List).map((a) => Ayah.fromJson(a)).toList();
      }
      throw Exception('Failed to load ayahs');
    } catch (e) {
      print('Error fetching ayahs: $e');
      return [];
    }
  }

  String getAudioUrl(int surahNumber, {String reciter = 'ar.alafasy'}) {
    return 'https://cdn.islamic.network/quran/audio-surah/128/$reciter/$surahNumber.mp3';
  }
}
