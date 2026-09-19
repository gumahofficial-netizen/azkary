import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quran_provider.dart';
import 'quran_reader_screen.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('القرآن الكريم')),
      body: Consumer<QuranProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: provider.surahs.length,
            itemBuilder: (context, index) {
              final surah = provider.surahs[index];
              return ListTile(
                leading: CircleAvatar(child: Text('${surah.number}')),
                title: Text(surah.name),
                subtitle: Text('${surah.englishName} • ${surah.revelationType}'),
                trailing: Text('${surah.numberOfAyahs} آية'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QuranReaderScreen(surah: surah)),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
