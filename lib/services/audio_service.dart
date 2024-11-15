import 'package:just_audio/just_audio.dart';
import '../models/track.dart';
import '../models/playlist.dart';
import '../core/constants/dummy_data.dart';
import 'audio_state_manager.dart';

class AudioService {
  final AudioPlayer _player = AudioPlayer();
  final AudioStateManager _stateManager;

  AudioService(this._stateManager);

  // Player streams
  Stream<Duration> get positionStream => _player.positionStream;
  Stream<Duration?> get durationStream => _player.durationStream;
  Stream<PlayerState> get playerStateStream => _player.playerStateStream;

  Future<Playlist> getPlaylist(String playlistId) async {
    try {
      return DummyData.playlists.firstWhere(
        (playlist) => playlist.id == playlistId,
        orElse: () => throw Exception('Playlist not found'),
      );
    } catch (e) {
      throw Exception('Failed to load playlist: $e');
    }
  }

  Future<void> playTrack(Track track) async {
    try {
      await _player.setUrl(track.url);
      await _player.play();
      _stateManager.setCurrentTrack(track);
      _stateManager.setIsPlaying(true);
    } catch (e) {
      throw Exception('Failed to play track: $e');
    }
  }

  Future<void> pause() async {
    await _player.pause();
    _stateManager.setIsPlaying(false);
  }

  Future<void> seek(Duration position) async {
    await _player.seek(position);
  }

  void dispose() {
    _player.dispose();
  }
} 