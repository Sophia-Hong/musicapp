import 'package:flutter/foundation.dart';
import '../models/track.dart';

class HomeViewModel extends ChangeNotifier {
  List<Track> _tracks = [];
  Track? _currentTrack;
  bool _isPlaying = false;

  List<Track> get tracks => _tracks;
  Track? get currentTrack => _currentTrack;
  bool get isPlaying => _isPlaying;

  void loadTracks() {
    // TODO: Implement track loading
    notifyListeners();
  }

  void playTrack(Track track) {
    _currentTrack = track;
    _isPlaying = true;
    notifyListeners();
  }

  void togglePlayPause() {
    if (_currentTrack != null) {
      _isPlaying = !_isPlaying;
      notifyListeners();
    }
  }
} 