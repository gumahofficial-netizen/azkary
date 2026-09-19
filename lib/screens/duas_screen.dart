import 'package:flutter/material.dart';
import '../services/duas_service.dart';
import '../models/dua.dart';

class DuasScreen extends StatelessWidget {
  const DuasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Dua> duas = DuasService.getDuas();

    return Scaffold(
      appBar: AppBar(title: const Text('الأدعية المباركة')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: duas.length,
        itemBuilder: (context, index) {
          final dua = duas[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(dua.title, style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary)),
                  const SizedBox(height: 8),
                  Text(dua.text, style: const TextStyle(fontSize: 18, height: 1.6)),
                  const SizedBox(height: 8),
                  if (dua.reference != null)
                    Text('المصدر: ${dua.reference}', style: const TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
