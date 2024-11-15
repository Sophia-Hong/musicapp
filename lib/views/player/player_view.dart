import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/player_viewmodel.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_typography.dart';
import 'widgets/player_controls.dart';

class PlayerView extends StatelessWidget {
  const PlayerView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<PlayerViewModel>();
    final track = viewModel.currentTrack;

    if (track == null) {
      return const SizedBox.shrink();
    }

    return CupertinoPageScaffold(
      backgroundColor: AppColors.background,
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: AppColors.background,
        border: null,
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 32),
            // Album Art
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: AspectRatio(
                aspectRatio: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    track.albumArt,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: AppColors.secondaryBackground,
                      child: const Icon(CupertinoIcons.music_note),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            // Track Info
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    track.title,
                    style: AppTypography.title2,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    track.artist,
                    style: AppTypography.body.copyWith(
                      color: AppColors.secondaryText,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const Spacer(),
            // Player Controls
            PlayerControls(
              isPlaying: viewModel.isPlaying,
              onPlayPause: viewModel.togglePlayPause,
              positionStream: viewModel.positionStream,
              durationStream: viewModel.durationStream,
              onSeek: viewModel.seek,
            ),
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }
} 