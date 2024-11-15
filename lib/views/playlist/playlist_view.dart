import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/playlist_viewmodel.dart';
import '../../models/track.dart';

class PlaylistView extends StatelessWidget {
  final String playlistId;

  const PlaylistView({
    super.key,
    required this.playlistId,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PlaylistViewModel(context.read())..loadPlaylist(playlistId),
      child: const _PlaylistViewContent(),
    );
  }
}

class _PlaylistViewContent extends StatelessWidget {
  const _PlaylistViewContent();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<PlaylistViewModel>();

    if (viewModel.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (viewModel.hasError) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              viewModel.error!,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.error,
                  ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => viewModel.loadPlaylist(viewModel.currentPlaylist?.id ?? ''),
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    final playlist = viewModel.currentPlaylist;
    if (playlist == null) {
      return const Center(child: Text('No playlist found'));
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(playlist.title),
              background: Image.network(
                playlist.thumbnailUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const ColoredBox(
                  color: Colors.grey,
                  child: Icon(Icons.broken_image),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    playlist.description,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${playlist.trackCount} tracks • ${_formatDuration(playlist.totalDuration)}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final track = playlist.tracks[index];
                return TrackListTile(
                  track: track,
                  onTap: () => viewModel.playTrack(track),
                );
              },
              childCount: playlist.tracks.length,
            ),
          ),
        ],
      ),
    );
  }

  String _formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    
    if (hours > 0) {
      return '${hours}h ${minutes}m';
    }
    return '${minutes}m';
  }
}

class TrackListTile extends StatelessWidget {
  final Track track;
  final VoidCallback onTap;

  const TrackListTile({
    super.key,
    required this.track,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Image.network(
          track.albumArt,
          width: 48,
          height: 48,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => const ColoredBox(
            color: Colors.grey,
            child: Icon(Icons.broken_image),
          ),
        ),
      ),
      title: Text(
        track.title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        track.artist,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Text(_formatDuration(track.duration)),
      onTap: onTap,
    );
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds.remainder(60);
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }
} 