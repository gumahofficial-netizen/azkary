import 'package:flutter/material.dart';
import '../models/adhkar.dart';

class AdhkarDetailScreen extends StatefulWidget {
  final AdhkarCategory category;
  const AdhkarDetailScreen({super.key, required this.category});

  @override
  State<AdhkarDetailScreen> createState() => _AdhkarDetailScreenState();
}

class _AdhkarDetailScreenState extends State<AdhkarDetailScreen> {
  late List<int> _counters;

  @override
  void initState() {
    super.initState();
    _counters = widget.category.items.map((e) => e.count).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.category.category)),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: widget.category.items.length,
        itemBuilder: (context, index) {
          final item = widget.category.items[index];
          final remaining = _counters[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    item.text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 18, height: 1.6),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: remaining > 0
                        ? () {
                            setState(() {
                              _counters[index]--;
                            });
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Colors.white,
                    ),
                    child: Text(remaining > 0 ? 'التكرار المتبقي: $remaining' : 'تم الذكر ✓'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
