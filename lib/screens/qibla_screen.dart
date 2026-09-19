import 'package:flutter/material.dart';
import '../services/prayer_service.dart';
import 'dart:math';

class QiblaScreen extends StatefulWidget {
  const QiblaScreen({super.key});

  @override
  State<QiblaScreen> createState() => _QiblaScreenState();
}

class _QiblaScreenState extends State<QiblaScreen> {
  double? _qiblaAngle;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _calculateQibla();
  }

  Future<void> _calculateQibla() async {
    final PrayerService service = PrayerService();
    final position = await service.getCurrentLocation();
    if (position != null) {
      // Mecca Coordinates: Lat 21.4225, Lon 39.8262
      final latMecca = 21.4225 * pi / 180.0;
      final lonMecca = 39.8262 * pi / 180.0;
      final latUser = position.latitude * pi / 180.0;
      final lonUser = position.longitude * pi / 180.0;

      final dLon = lonMecca - lonUser;
      final y = sin(dLon) * cos(latMecca);
      final x = cos(latUser) * sin(latMecca) - sin(latUser) * cos(latMecca) * cos(dLon);
      
      setState(() {
        _qiblaAngle = atan2(y, x) * 180.0 / pi;
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('اتجاه القبلة')),
      body: Center(
        child: _isLoading
            ? const CircularProgressIndicator()
            : _qiblaAngle == null
                ? const Text('فشل تحديد الموقع لحساب القبلة')
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('اتجاه الكعبة المشرفة بالنسبة للشمال:', style: TextStyle(fontSize: 18)),
                      const SizedBox(height: 10),
                      Text('${_qiblaAngle!.toStringAsFixed(1)}°', style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 40),
                      Transform.rotate(
                        angle: _qiblaAngle! * pi / 180.0,
                        child: const Icon(Icons.navigation, size: 200, color: Colors.green),
                      ),
                      const SizedBox(height: 20),
                      const Text('يرجى وضع الهاتف بوضع أفقي موازي للأرض', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
      ),
    );
  }
}
