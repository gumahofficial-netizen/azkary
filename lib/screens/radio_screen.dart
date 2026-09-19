import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/radio_station.dart';
import '../services/audio_service.dart';

class RadioScreen extends StatefulWidget {
  const RadioScreen({super.key});

  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  List<RadioStation> _stations = [];
  bool _isLoading = true;
  String? _playingUrl;

  @override
  void initState() {
    super.initState();
    _loadStations();
  }

  Future<void> _loadStations() async {
    try {
      final String data = await rootBundle.loadString('assets/radio/stations.json');
      final List decoded = json.decode(data);
      setState(() {
        _stations = decoded.map((s) => RadioStation.fromJson(s)).toList();
        _isLoading = false;
      });
    } catch (e) {
      print('Error loading radio stations: $e');
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الراديو الإسلامي')),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _stations.length,
              itemBuilder: (context, index) {
                final station = _stations[index];
                final isPlaying = _playingUrl == station.url;

                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: isPlaying ? Colors.amber : null,
                      child: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                    ),
                    title: Text(station.name),
                    subtitle: Text(station.category),
                    onTap: () async {
                      if (isPlaying) {
                        await AudioServiceManager.stop();
                        setState(() => _playingUrl = null);
                      } else {
                        setState(() => _playingUrl = station.url);
                        await AudioServiceManager.playAudio(station.url);
                      }
                    },
                  ),
                );
              },
            ),
    );
  }
}
