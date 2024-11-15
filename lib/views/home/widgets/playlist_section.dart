import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../models/playlist.dart';
import '../../../core/constants/app_typography.dart';
import '../../../core/constants/app_colors.dart';

class PlaylistSection extends StatelessWidget {
  final String title;
  final List<Playlist> playlists;
  final VoidCallback? onSeeAllPressed;

  const PlaylistSection({
    super.key,
    required this.title,
    required this.playlists,
    this.onSeeAllPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: AppTypography.headline2),
              const _SeeAllButton(),
            ],
          ),
        ),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1,
            ),
            itemCount: playlists.length,
            itemBuilder: (context, index) {
              final playlist = playlists[index];
              return _PlaylistCard(playlist: playlist);
            },
          ),
        ),
      ],
    );
  }
}

class _PlaylistCard extends StatelessWidget {
  final Playlist playlist;

  const _PlaylistCard({required this.playlist});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Album Cover
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: CachedNetworkImage(
            imageUrl: playlist.thumbnailUrl,
            fit: BoxFit.cover,
            placeholder: (context, url) => Container(
              color: AppColors.secondaryBackground,
              child: const CupertinoActivityIndicator(),
            ),
          ),
        ),
        // Overlay
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                CupertinoColors.black.withOpacity(0.3),
                CupertinoColors.black.withOpacity(0.7),
              ],
            ),
          ),
        ),
        // Text Content
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                playlist.title,
                style: AppTypography.body.copyWith(
                  color: CupertinoColors.white,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 2),
              Text(
                '${playlist.trackCount} tracks',
                style: AppTypography.caption.copyWith(
                  color: CupertinoColors.white.withOpacity(0.8),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SeeAllButton extends StatelessWidget {
  const _SeeAllButton();

  @override
  Widget build(BuildContext context) {
    return const CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: null,
      child: Text('모두 보기'),
    );
  }
} 