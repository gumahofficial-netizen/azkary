import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/adhkar_provider.dart';
import 'adhkar_detail_screen.dart';

class AdhkarTab extends StatelessWidget {
  const AdhkarTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الأذكار')),
      body: Consumer<AdhkarProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: provider.categories.length,
            itemBuilder: (context, index) {
              final category = provider.categories[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                    child: Icon(Icons.mosque, color: Theme.of(context).colorScheme.primary),
                  ),
                  title: Text(category.category),
                  subtitle: Text('${category.items.length} ذكر/دعاء'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AdhkarDetailScreen(category: category),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
