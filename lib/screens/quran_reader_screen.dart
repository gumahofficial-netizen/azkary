import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/surah.dart';
import '../providers/quran_provider.dart';

class QuranReaderScreen extends StatefulWidget {
  final Surah surah;
  const QuranReaderScreen({super.key, required this.surah});

  @override
  State<QuranReaderScreen> createState() => _QuranReaderScreenState();
}

class _QuranReaderScreenState extends State<QuranReaderScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<QuranProvider>(context, listen: false).loadSurahAyahs(widget.surah.number);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.surah.name)),
      body: Consumer<QuranProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: provider.currentAyahs.length,
            itemBuilder: (context, index) {
              final ayah = provider.currentAyahs[index];
              return ListTile(
                title: Text(
                  ayah.text,
                  textAlign: TextAlign.right,
                  style: const TextStyle(fontSize: 22, fontFamily: 'Amiri'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
