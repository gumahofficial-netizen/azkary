import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الإعدادات')),
      body: Consumer<AppProvider>(
        builder: (context, provider, child) {
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              const Text('المظهر', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              ListTile(
                title: const Text('الوضع الفاتح'),
                leading: const Icon(Icons.light_mode),
                trailing: Radio<ThemeMode>(
                  value: ThemeMode.light,
                  groupValue: provider.themeMode,
                  onChanged: (val) => provider.toggleTheme(val!),
                ),
              ),
              ListTile(
                title: const Text('الوضع الداكن'),
                leading: const Icon(Icons.dark_mode),
                trailing: Radio<ThemeMode>(
                  value: ThemeMode.dark,
                  groupValue: provider.themeMode,
                  onChanged: (val) => provider.toggleTheme(val!),
                ),
              ),
              ListTile(
                title: const Text('حسب النظام'),
                leading: const Icon(Icons.settings_brightness),
                trailing: Radio<ThemeMode>(
                  value: ThemeMode.system,
                  groupValue: provider.themeMode,
                  onChanged: (val) => provider.toggleTheme(val!),
                ),
              ),
              const Divider(),
              const Text('الخط', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  children: [
                    Text('حجم الخط: ${provider.fontSize.toInt()}'),
                    Slider(
                      value: provider.fontSize,
                      min: 14,
                      max: 32,
                      divisions: 9,
                      onChanged: (val) => provider.setFontSize(val),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
