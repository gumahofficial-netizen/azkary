import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../providers/prayer_provider.dart';

class PrayerTab extends StatelessWidget {
  const PrayerTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('مواقيت الصلاة')),
      body: Consumer<PrayerProvider>(
        builder: (context, provider, child) {
          final times = provider.prayerTimes;
          if (times == null) {
            return const Center(child: CircularProgressIndicator());
          }

          final formatter = DateFormat('hh:mm a', 'ar');

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const Text('الصلاة القادمة', style: TextStyle(fontSize: 18)),
                      Text(provider.nextPrayerName, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      Text(
                        '${provider.countdown.inHours}:${provider.countdown.inMinutes.remainder(60)}:${provider.countdown.inSeconds.remainder(60)}',
                        style: const TextStyle(fontSize: 24, color: Colors.amber),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _prayerTile(context, 'الفجر', formatter.format(times['Fajr']!)),
              _prayerTile(context, 'الشروق', formatter.format(times['Sunrise']!)),
              _prayerTile(context, 'الظهر', formatter.format(times['Dhuhr']!)),
              _prayerTile(context, 'العصر', formatter.format(times['Asr']!)),
              _prayerTile(context, 'المغرب', formatter.format(times['Maghrib']!)),
              _prayerTile(context, 'العشاء', formatter.format(times['Isha']!)),
            ],
          );
        },
      ),
    );
  }

  Widget _prayerTile(BuildContext context, String name, String time) {
    return Card(
      child: ListTile(
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        trailing: Text(time, style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}
