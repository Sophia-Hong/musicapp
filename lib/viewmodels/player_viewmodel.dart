import 'package:flutter/foundation.dart';
import '../models/track.dart';
import '../services/audio_state_manager.dart';
import '../services/audio_service.dart';

class PlayerViewModel extends ChangeNotifier {
  final AudioStateManager _audioStateManager;
  final AudioService _audioService;

  PlayerViewModel({
    required AudioStateManager audioStateManager,
    required AudioService audioService,
  })  : _audioStateManager = audioStateManager,
        _audioService = audioService;

  // Getters
  Track? get currentTrack => _audioStateManager.currentTrack;
  bool get isPlaying => _audioStateManager.isPlaying;

  // Position and duration from AudioService streams
  Stream<Duration> get positionStream => _audioService.positionStream;
  Stream<Duration?> get durationStream => _audioService.durationStream;

  Future<void> togglePlayPause() async {
    if (_audioStateManager.isPlaying) {
      await _audioService.pause();
    } else if (_audioStateManager.currentTrack != null) {
      await _audioService.playTrack(_audioStateManager.currentTrack!);
    }
    notifyListeners();
  }

  Future<void> seek(Duration position) async {
    await _audioService.seek(position);
    notifyListeners();
  }

  Future<void> playTrack(Track track) async {
    await _audioService.playTrack(track);
    notifyListeners();
  }
} 