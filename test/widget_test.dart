// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:music_player/app.dart';
import 'package:provider/provider.dart';
import 'package:music_player/services/audio_state_manager.dart';
import 'package:music_player/viewmodels/home_viewmodel.dart';
import 'package:music_player/viewmodels/player_viewmodel.dart';

void main() {
  testWidgets('App should build without errors', (WidgetTester tester) async {
    final audioStateManager = AudioStateManager();

    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<AudioStateManager>.value(value: audioStateManager),
          ChangeNotifierProvider(
            create: (_) => HomeViewModel(audioStateManager: audioStateManager),
          ),
          ChangeNotifierProvider(
            create: (_) => PlayerViewModel(audioStateManager: audioStateManager),
          ),
        ],
        child: const MusicPlayerApp(),
      ),
    );

    // Verify that the app builds successfully
    expect(find.byType(CupertinoApp), findsOneWidget);
  });
}
