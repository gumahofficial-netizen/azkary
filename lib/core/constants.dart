class AppConstants {
  static const String appName = 'مسلم';
  static const String appVersion = '1.0.0';

  // API Endpoints
  static const String quranApiBase = 'https://api.alquran.cloud/v1';
  static const String tafsirApiBase = 'https://api.quran.com/api/v4';
  
  // Reciters
  static const List<Map<String, String>> reciters = [
    {'id': 'ar.alafasy', 'name': 'مشاري راشد العفاسي'},
    {'id': 'ar.abdulbasitmurattal', 'name': 'عبد الباسط عبد الصمد'},
    {'id': 'ar.mahermuaiqly', 'name': 'ماهر المعيقلي'},
    {'id': 'ar.minshawi', 'name': 'محمد صديق المنشاوي'},
    {'id': 'ar.saoodshuraym', 'name': 'سعود الشريم'},
    {'id': 'ar.ahmedajamy', 'name': 'أحمد بن علي العجمي'},
  ];

  // Calculation Methods for Prayer Times
  static const List<Map<String, dynamic>> calculationMethods = [
    {'id': 'egyptian', 'name': 'الهيئة العامة المصرية للمساحة'},
    {'id': 'makkah', 'name': 'أم القرى (مكة المكرمة)'},
    {'id': 'isna', 'name': 'الجمعية الإسلامية لشمال أمريكا (ISNA)'},
    {'id': 'mwl', 'name': 'رابطة العالم الإسلامي'},
    {'id': 'karachi', 'name': 'جامعة العلوم الإسلامية بكراتشي'},
  ];

  // Shared Preferences Keys
  static const String keyThemeMode = 'theme_mode';
  static const String keyLastSurah = 'last_surah';
  static const String keyLastAyah = 'last_ayah';
  static const String keyLastPage = 'last_page';
  static const String keyFontSize = 'font_size';
  static const String keyFontFamily = 'font_family';
  static const String keyDefaultReciter = 'default_reciter';
  static const String keyCalculationMethod = 'calc_method';
  static const String keySebhaTotal = 'sebha_total';
  static const String keySebhaStreak = 'sebha_streak';
  static const String keyBookmarks = 'bookmarks';
}
