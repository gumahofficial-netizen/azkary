import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/app_theme.dart';
import 'screens/main_navigation_screen.dart';
import 'providers/app_provider.dart';
import 'providers/quran_provider.dart';
import 'providers/prayer_provider.dart';
import 'providers/adhkar_provider.dart';
import 'providers/sebha_provider.dart';
import 'services/storage_service.dart';
import 'services/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageService.init();
  await NotificationService.init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider()),
        ChangeNotifierProvider(create: (_) => QuranProvider()),
        ChangeNotifierProvider(create: (_) => PrayerProvider()),
        ChangeNotifierProvider(create: (_) => AdhkarProvider()),
        ChangeNotifierProvider(create: (_) => SebhaProvider()),
      ],
      child: const MuslimApp(),
    ),
  );
}

class MuslimApp extends StatelessWidget {
  const MuslimApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, appProvider, child) {
        return MaterialApp(
          title: 'مسلم',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: appProvider.themeMode,
          locale: const Locale('ar', 'SA'),
          home: const MainNavigationScreen(),
        );
      },
    );
  }
}
