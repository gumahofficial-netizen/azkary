import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import 'home_tab.dart';
import 'quran_tab.dart';
import 'adhkar_tab.dart';
import 'prayer_tab.dart';
import 'more_tab.dart';

class MainNavigationScreen extends StatelessWidget {
  const MainNavigationScreen({super.key});

  final List<Widget> _tabs = const [
    HomeTab(),
    QuranTab(),
    AdhkarTab(),
    PrayerTab(),
    MoreTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          body: _tabs[provider.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: provider.currentIndex,
            onTap: provider.setIndex,
            selectedItemColor: Theme.of(context).colorScheme.primary,
            unselectedItemColor: Colors.grey,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
              BottomNavigationBarItem(icon: Icon(Icons.book), label: 'القرآن'),
              BottomNavigationBarItem(icon: Icon(Icons.mosque), label: 'الأذكار'),
              BottomNavigationBarItem(icon: Icon(Icons.access_time), label: 'الصلاة'),
              BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'المزيد'),
            ],
          ),
        );
      },
    );
  }
}
