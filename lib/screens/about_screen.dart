import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('حول التطبيق')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const Icon(Icons.mosque, size: 100, color: Color(0xFF0C4A3F)),
            const SizedBox(height: 16),
            const Text(
              'تطبيق مسلم',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text('الإصدار 1.0.0', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 32),
            const Text(
              'تطبيق إسلامي شامل يهدف لتسهيل وصول المسلم لكل ما يحتاجه في يومه من قرآن، أذكار، مواقيت صلاة، وراديو إسلامي.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 32),
            const Divider(),
            _infoTile(Icons.source, 'المصادر المفتوحة', 'AlQuran.cloud, Adhkar-json, AlAdhan'),
            _infoTile(Icons.code, 'تطوير', 'Claude Code - Android Agent'),
            const SizedBox(height: 32),
            const Text(
              'جميع الحقوق محفوظة © 2026',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoTile(IconData icon, String title, String subtitle) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }
}
