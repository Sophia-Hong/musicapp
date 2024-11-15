import 'package:flutter/foundation.dart';
import '../models/playlist.dart';
import '../models/track.dart';
import '../services/audio_service.dart';

class PlaylistViewModel extends ChangeNotifier {
  final AudioService _audioService;
  Playlist? _currentPlaylist;
  bool _isLoading = false;
  String? _error;

  PlaylistViewModel(this._audioService);

  // Getters
  Playlist? get currentPlaylist => _currentPlaylist;
  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get hasError => _error != null;

  Future<void> loadPlaylist(String playlistId) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      _currentPlaylist = await _audioService.getPlaylist(playlistId);
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = 'Failed to load playlist: ${e.toString()}';
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> playTrack(Track track) async {
    try {
      await _audioService.playTrack(track);
    } catch (e) {
      _error = 'Failed to play track: ${e.toString()}';
      notifyListeners();
    }
  }
} 