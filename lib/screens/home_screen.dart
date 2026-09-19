import 'package:flutter/material.dart';
import '../services/prayer_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PrayerService _prayerService = PrayerService();
  String _nextPrayer = 'جارٍ التحميل...';
  
  @override
  void initState() {
    super.initState();
    _loadPrayerTimes();
  }

  Future<void> _loadPrayerTimes() async {
    final position = await _prayerService.getCurrentLocation();
    if (position != null) {
      final times = _prayerService.getPrayerTimes(position);
      setState(() {
        _nextPrayer = _prayerService.getNextPrayerName(times);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('مسلم')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text('الصلاة القادمة', style: Theme.of(context).textTheme.titleLarge),
                      const SizedBox(height: 10),
                      Text(_nextPrayer, style: Theme.of(context).textTheme.headlineMedium),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: [
                  _shortcutButton(Icons.book, 'القرآن'),
                  _shortcutButton(Icons.mosque, 'الأذكار'),
                  _shortcutButton(Icons.compass_calibration, 'القبلة'),
                  _shortcutButton(Icons.radio, 'الراديو'),
                  _shortcutButton(Icons.favorite, 'الأدعية'),
                  _shortcutButton(Icons.settings, 'الإعدادات'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _shortcutButton(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
          child: Icon(icon, size: 30, color: Theme.of(context).colorScheme.primary),
        ),
        const SizedBox(height: 5),
        Text(label),
      ],
    );
  }
}
