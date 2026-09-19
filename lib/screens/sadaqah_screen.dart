import 'package:flutter/material.dart';

class SadaqahScreen extends StatelessWidget {
  const SadaqahScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('صدقة جارية')),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).colorScheme.primary.withOpacity(0.05),
              Theme.of(context).colorScheme.primary.withOpacity(0.2),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.volunteer_activism, size: 80, color: Color(0xFFC5A059)),
            const SizedBox(height: 32),
            const Text(
              'صدقة جارية',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFC5A059), width: 1),
              ),
              child: const Text(
                'اللهم اجعل ثواب هذا العمل صدقة جارية عن والدي المرحوم محمد نصار العجاج، وارحمه واغفر له وأسكنه فسيح جناتك.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, height: 1.6, color: Colors.black87),
              ),
            ),
            const SizedBox(height: 32),
            const Divider(color: Color(0xFFC5A059)),
            const SizedBox(height: 24),
            const Text(
              'دعاء لابني عامر جمعة العجاج',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'اللهم بارك في عامر واحفظه بعينك التي لا تنام، واجعله من الصالحين المصلحين البارين بوالديهم، وأنبتة نباتاً حسناً.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, height: 1.6, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}
