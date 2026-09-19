import 'package:flutter/material.dart';
import 'sebha_screen.dart';
import 'qibla_screen.dart';
import 'stories_screen.dart';
import 'duas_screen.dart';
import 'radio_screen.dart';
import 'sadaqah_screen.dart';
import 'settings_screen.dart';
import 'about_screen.dart';

class MoreTab extends StatelessWidget {
  const MoreTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('المزيد')),
      body: GridView.count(
        padding: const EdgeInsets.all(16),
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: [
          _menuItem(context, Icons.plus_one, 'المسبحة', const SebhaScreen()),
          _menuItem(context, Icons.compass_calibration, 'القبلة', const QiblaScreen()),
          _menuItem(context, Icons.auto_stories, 'القصص', const StoriesScreen()),
          _menuItem(context, Icons.favorite, 'الأدعية', const DuasScreen()),
          _menuItem(context, Icons.radio, 'الراديو الإسلامي', const RadioScreen()),
          _menuItem(context, Icons.volunteer_activism, 'صدقة جارية', const SadaqahScreen()),
          _menuItem(context, Icons.settings, 'الإعدادات', const SettingsScreen()),
          _menuItem(context, Icons.info, 'حول التطبيق', const AboutScreen()),
        ],
      ),
    );
  }

  Widget _menuItem(BuildContext context, IconData icon, String title, Widget targetScreen) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => targetScreen));
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: Theme.of(context).colorScheme.primary),
            const SizedBox(height: 12),
            Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
