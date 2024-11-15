import 'package:flutter_test/flutter_test.dart';
import 'package:music_player/viewmodels/player_viewmodel.dart';
import 'package:music_player/services/audio_state_manager.dart';

void main() {
  group('PlayerViewModel Tests', () {
    late PlayerViewModel viewModel;

    setUp(() {
      viewModel = PlayerViewModel(audioStateManager: AudioStateManager());
    });

    test('initial state should be correct', () {
      expect(viewModel.currentTrack, isNull);
      expect(viewModel.isPlaying, isFalse);
      expect(viewModel.isShuffleOn, isFalse);
      expect(viewModel.isRepeatOn, isFalse);
      expect(viewModel.currentPosition, Duration.zero);
      expect(viewModel.totalDuration, Duration.zero);
    });

    test('toggleShuffle should toggle shuffle state', () {
      expect(viewModel.isShuffleOn, isFalse);
      viewModel.toggleShuffle();
      expect(viewModel.isShuffleOn, isTrue);
      viewModel.toggleShuffle();
      expect(viewModel.isShuffleOn, isFalse);
    });

    // Add more tests...
  });
} 