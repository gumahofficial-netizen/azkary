import 'package:adhan/adhan.dart';
import 'package:geolocator/geolocator.dart';

class PrayerService {
  Future<Position?> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return null;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) return null;
    }

    if (permission == LocationPermission.deniedForever) return null;

    return await Geolocator.getCurrentPosition();
  }

  Map<String, DateTime> getPrayerTimes(Position position) {
    final coordinates = Coordinates(position.latitude, position.longitude);
    final params = CalculationMethod.egyptian.getParameters();
    params.madhab = Madhab.shafi;
    
    final prayerTimes = PrayerTimes.today(coordinates, params);

    return {
      'Fajr': prayerTimes.fajr,
      'Sunrise': prayerTimes.sunrise,
      'Dhuhr': prayerTimes.dhuhr,
      'Asr': prayerTimes.asr,
      'Maghrib': prayerTimes.maghrib,
      'Isha': prayerTimes.isha,
    };
  }

  String getNextPrayerName(Map<String, DateTime> times) {
    final now = DateTime.now();
    if (now.isBefore(times['Fajr']!)) return 'الفجر';
    if (now.isBefore(times['Dhuhr']!)) return 'الظهر';
    if (now.isBefore(times['Asr']!)) return 'العصر';
    if (now.isBefore(times['Maghrib']!)) return 'المغرب';
    if (now.isBefore(times['Isha']!)) return 'العشاء';
    return 'الفجر';
  }

  Duration getCountdown(Map<String, DateTime> times) {
    final now = DateTime.now();
    DateTime next;
    if (now.isBefore(times['Fajr']!)) {
      next = times['Fajr']!;
    } else if (now.isBefore(times['Dhuhr']!)) {
      next = times['Dhuhr']!;
    } else if (now.isBefore(times['Asr']!)) {
      next = times['Asr']!;
    } else if (now.isBefore(times['Maghrib']!)) {
      next = times['Maghrib']!;
    } else if (now.isBefore(times['Isha']!)) {
      next = times['Isha']!;
    } else {
      next = times['Fajr']!.add(const Duration(days: 1));
    }
    return next.difference(now);
  }
}
