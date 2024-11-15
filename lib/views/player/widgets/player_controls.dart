import 'package:flutter/cupertino.dart';
import '../../../core/constants/app_colors.dart';

class PlayerControls extends StatelessWidget {
  final bool isPlaying;
  final VoidCallback onPlayPause;
  final Stream<Duration> positionStream;
  final Stream<Duration?> durationStream;
  final Function(Duration) onSeek;

  const PlayerControls({
    super.key,
    required this.isPlaying,
    required this.onPlayPause,
    required this.positionStream,
    required this.durationStream,
    required this.onSeek,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Progress Bar
        StreamBuilder<Duration>(
          stream: positionStream,
          builder: (context, snapshot) {
            return StreamBuilder<Duration?>(
              stream: durationStream,
              builder: (context, durationSnapshot) {
                final position = snapshot.data ?? Duration.zero;
                final duration = durationSnapshot.data ?? Duration.zero;
                
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: SizedBox(
                        height: 32,
                        child: CupertinoSlider(
                          value: position.inMilliseconds.toDouble(),
                          min: 0,
                          max: duration.inMilliseconds.toDouble(),
                          onChanged: (value) {
                            onSeek(Duration(milliseconds: value.toInt()));
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _formatDuration(position),
                            style: TextStyle(
                              color: AppColors.secondaryText,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            _formatDuration(duration),
                            style: TextStyle(
                              color: AppColors.secondaryText,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
        const SizedBox(height: 8),
        // Play/Pause Button
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoButton(
              padding: const EdgeInsets.all(16),
              onPressed: onPlayPause,
              child: Icon(
                isPlaying
                    ? CupertinoIcons.pause_circle_fill
                    : CupertinoIcons.play_circle_fill,
                color: AppColors.primary,
                size: 64,
              ),
            ),
          ],
        ),
      ],
    );
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds.remainder(60);
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }
} 