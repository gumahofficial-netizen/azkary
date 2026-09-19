import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/prayer_provider.dart';
import '../providers/app_provider.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    final prayerProvider = Provider.of<PrayerProvider>(context);
    
    return Scaffold(
      appBar: AppBar(title: const Text('مسلم')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Prayer Card
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text('الصلاة القادمة', style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 10),
                  Text(prayerProvider.nextPrayerName, style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(height: 10),
                  Text(
                    '${prayerProvider.countdown.inHours}:${prayerProvider.countdown.inMinutes.remainder(60)}:${prayerProvider.countdown.inSeconds.remainder(60)}',
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Shortcut Grid
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 4,
            children: [
              _shortcut(context, Icons.menu_book, 'القرآن', 1),
              _shortcut(context, Icons.mosque, 'الأذكار', 2),
              _shortcut(context, Icons.compass_calibration, 'القبلة', 4),
              _shortcut(context, Icons.radio, 'الراديو', 4),
            ],
          ),
        ],
      ),
    );
  }

  Widget _shortcut(BuildContext context, IconData icon, String label, int tabIndex) {
    return InkWell(
      onTap: () => Provider.of<AppProvider>(context, listen: false).setIndex(tabIndex),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            child: Icon(icon, color: Theme.of(context).colorScheme.primary),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
