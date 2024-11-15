import 'track.dart';

enum PlaylistType {
  popular,
  recommended,
  workout,
  energy,
  podcast
}

class Playlist {
  final String id;
  final String title;
  final String description;
  final String thumbnailUrl;
  final List<Track> tracks;
  final PlaylistType type;

  const Playlist({
    required this.id,
    required this.title,
    required this.description,
    required this.thumbnailUrl,
    required this.tracks,
    required this.type,
  });

  int get trackCount => tracks.length;
  Duration get totalDuration => 
    tracks.fold(Duration.zero, (total, track) => total + track.duration);
} 