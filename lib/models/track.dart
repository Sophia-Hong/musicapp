class Track {
  final String id;
  final String title;
  final String artist;
  final String albumName;
  final String albumArt;
  final String url;
  final bool isLiked;
  final Duration duration;

  Track({
    required this.id,
    required this.title,
    required this.artist,
    required this.albumName,
    required this.albumArt,
    required this.url,
    this.isLiked = false,
    required this.duration,
  });

  Track copyWith({
    String? id,
    String? title,
    String? artist,
    String? albumName,
    String? albumArt,
    String? url,
    bool? isLiked,
    Duration? duration,
  }) {
    return Track(
      id: id ?? this.id,
      title: title ?? this.title,
      artist: artist ?? this.artist,
      albumName: albumName ?? this.albumName,
      albumArt: albumArt ?? this.albumArt,
      url: url ?? this.url,
      isLiked: isLiked ?? this.isLiked,
      duration: duration ?? this.duration,
    );
  }
} 