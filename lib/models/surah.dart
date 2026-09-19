class Surah {
  final int number;
  final String name;
  final String englishName;
  final String englishNameTranslation;
  final int numberOfAyahs;
  final String revelationType;

  Surah({
    required this.number,
    required this.name,
    required this.englishName,
    required this.englishNameTranslation,
    required this.numberOfAyahs,
    required this.revelationType,
  });

  factory Surah.fromJson(Map<String, dynamic> json) {
    return Surah(
      number: json['number'] ?? 0,
      name: json['name'] ?? '',
      englishName: json['englishName'] ?? '',
      englishNameTranslation: json['englishNameTranslation'] ?? '',
      numberOfAyahs: json['numberOfAyahs'] ?? 0,
      revelationType: json['revelationType'] == 'Meccan' ? 'مكية' : 'مدنية',
    );
  }

  Map<String, dynamic> toJson() => {
    'number': number,
    'name': name,
    'englishName': englishName,
    'englishNameTranslation': englishNameTranslation,
    'numberOfAyahs': numberOfAyahs,
    'revelationType': revelationType,
  };
}

class Ayah {
  final int number;
  final String text;
  final int numberInSurah;
  final int juz;
  final int page;

  Ayah({
    required this.number,
    required this.text,
    required this.numberInSurah,
    required this.juz,
    this.page = 1,
  });

  factory Ayah.fromJson(Map<String, dynamic> json) {
    return Ayah(
      number: json['number'] ?? 0,
      text: json['text'] ?? '',
      numberInSurah: json['numberInSurah'] ?? 0,
      juz: json['juz'] ?? 1,
      page: json['page'] ?? 1,
    );
  }
}

class AyahBookmark {
  final int surahNumber;
  final String surahName;
  final int ayahNumber;
  final String ayahText;
  final String dateAdded;

  AyahBookmark({
    required this.surahNumber,
    required this.surahName,
    required this.ayahNumber,
    required this.ayahText,
    required this.dateAdded,
  });

  factory AyahBookmark.fromJson(Map<String, dynamic> json) {
    return AyahBookmark(
      surahNumber: json['surahNumber'],
      surahName: json['surahName'],
      ayahNumber: json['ayahNumber'],
      ayahText: json['ayahText'],
      dateAdded: json['dateAdded'],
    );
  }

  Map<String, dynamic> toJson() => {
    'surahNumber': surahNumber,
    'surahName': surahName,
    'ayahNumber': ayahNumber,
    'ayahText': ayahText,
    'dateAdded': dateAdded,
  };
}
