import '../../models/track.dart';
import '../../models/playlist.dart';
import '../../models/artist.dart';

class DummyData {
  static final List<Track> tracks = [
    Track(
      id: '1',
      title: 'Butter',
      artist: 'BTS',
      albumArt: 'https://i.scdn.co/image/ab67616d0000b273561fe8f0f0b58205f8f256ea',
      duration: const Duration(minutes: 2, seconds: 45),
      albumName: 'Butter',
      url: 'assets/audio/butter.mp3',
    ),
    Track(
      id: '2',
      title: 'Dynamite',
      artist: 'BTS',
      albumArt: 'https://i.scdn.co/image/ab67616d0000b273a8b6c2c2d23c0bd6f6eb11f0',
      duration: const Duration(minutes: 3, seconds: 19),
      albumName: 'Dynamite (DayTime Version)',
      url: 'assets/audio/dynamite.mp3',
    ),
    Track(
      id: '3',
      title: 'Boy With Luv',
      artist: 'BTS ft. Halsey',
      albumArt: 'https://i.scdn.co/image/ab67616d0000b273f5e77c6c354a2b9c650375c5',
      duration: const Duration(minutes: 3, seconds: 49),
      albumName: 'Map of the Soul: Persona',
      url: 'assets/audio/boy_with_luv.mp3',
    ),
  ];

  static final List<Playlist> playlists = [
    Playlist(
      id: '1',
      title: '인기 K-POP',
      description: '지금 가장 인기있는 K-POP',
      thumbnailUrl: 'https://i.scdn.co/image/ab67706f00000002a7e0fac47043aae95a121be4',
      tracks: tracks,
      type: PlaylistType.popular,
    ),
    Playlist(
      id: '2',
      title: '신나는 댄스',
      description: '에너지 넘치는 댄스 음악',
      thumbnailUrl: 'https://i.scdn.co/image/ab67706f000000025f0ff9251e3cfe641160dc31',
      tracks: tracks,
      type: PlaylistType.popular,
    ),
    Playlist(
      id: '3',
      title: '추천 플레이리스트',
      description: '당신을 위한 추천',
      thumbnailUrl: 'https://i.scdn.co/image/ab67706f00000002ca5a7517156021292e5663a6',
      tracks: tracks,
      type: PlaylistType.recommended,
    ),
    Playlist(
      id: '4',
      title: '차트 TOP 100',
      description: '실시간 인기 차트',
      thumbnailUrl: 'https://i.scdn.co/image/ab67706f000000025ea54b91b073c2776b966e7b',
      tracks: tracks,
      type: PlaylistType.recommended,
    ),
  ];

  static final List<Artist> artists = [
    Artist(
      id: '1',
      name: 'BTS',
      imageUrl: 'https://i.scdn.co/image/ab6761610000e5eb5704a64f34fe29ff73ab56bb',
      tracks: tracks,
      genres: ['K-Pop', 'Pop'],
      monthlyListeners: 34000000,
    ),
  ];
} 