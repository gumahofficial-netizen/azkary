import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/sebha_provider.dart';

class SebhaScreen extends StatelessWidget {
  const SebhaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('المسبحة الإلكترونية')),
      body: Consumer<SebhaProvider>(
        builder: (context, provider, child) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('عدد التسبيحات الحالية', style: TextStyle(fontSize: 18)),
                const SizedBox(height: 10),
                Text(
                  '${provider.counter}',
                  style: TextStyle(
                    fontSize: 72,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 10),
                Text('إجمالي التسبيحات: ${provider.totalCount}', style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 40),
                InkWell(
                  onTap: provider.increment,
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                      border: Border.all(color: Theme.of(context).colorScheme.primary, width: 4),
                    ),
                    child: Center(
                      child: Text(
                        'اضغط',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: provider.resetCounter,
                      child: const Text('تصفير الدورة'),
                    ),
                    ElevatedButton(
                      onPressed: provider.resetTotal,
                      child: const Text('تصفير الإجمالي'),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
