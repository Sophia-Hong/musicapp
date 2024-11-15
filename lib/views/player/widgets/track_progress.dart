import 'package:flutter/cupertino.dart';

class TrackProgress extends StatelessWidget {
  final Duration currentPosition;
  final Duration totalDuration;
  final Function(Duration) onSeek;

  const TrackProgress({
    super.key,
    required this.currentPosition,
    required this.totalDuration,
    required this.onSeek,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CupertinoSlider(
          value: currentPosition.inSeconds.toDouble(),
          max: totalDuration.inSeconds.toDouble(),
          onChanged: (value) {
            onSeek(Duration(seconds: value.toInt()));
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _formatDuration(currentPosition),
                style: const TextStyle(color: CupertinoColors.systemGrey),
              ),
              Text(
                _formatDuration(totalDuration),
                style: const TextStyle(color: CupertinoColors.systemGrey),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }
} 