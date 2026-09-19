import 'package:audioplayers/audioplayers.dart';

class AudioServiceManager {
  static final AudioPlayer _player = AudioPlayer();
  static bool _isPlaying = false;
  static String? _currentUrl;

  static AudioPlayer get player => _player;
  static bool get isPlaying => _isPlaying;

  static Future<void> playAudio(String url) async {
    try {
      if (_currentUrl == url && _isPlaying) {
        await _player.pause();
        _isPlaying = false;
      } else {
        await _player.stop();
        await _player.play(UrlSource(url));
        _currentUrl = url;
        _isPlaying = true;
      }
    } catch (e) {
      print('Audio playback error: $e');
      _isPlaying = false;
    }
  }

  static Future<void> stop() async {
    await _player.stop();
    _isPlaying = false;
    _currentUrl = null;
  }

  static Future<void> setPlaybackRate(double rate) async {
    await _player.setPlaybackRate(rate);
  }
}
