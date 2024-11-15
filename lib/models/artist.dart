import 'track.dart';

class Artist {
  final String id;
  final String name;
  final String imageUrl;
  final List<Track> tracks;
  final List<String> genres;
  final int monthlyListeners;

  const Artist({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.tracks,
    required this.genres,
    required this.monthlyListeners,
  });

  int get trackCount => tracks.length;
} 