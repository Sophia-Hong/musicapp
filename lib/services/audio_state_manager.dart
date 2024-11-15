import 'package:flutter/foundation.dart';
import '../models/track.dart';

class AudioStateManager extends ChangeNotifier {
  Track? _currentTrack;
  bool _isPlaying = false;

  Track? get currentTrack => _currentTrack;
  bool get isPlaying => _isPlaying;

  void setCurrentTrack(Track track) {
    _currentTrack = track;
    notifyListeners();
  }

  void setIsPlaying(bool playing) {
    _isPlaying = playing;
    notifyListeners();
  }
} 