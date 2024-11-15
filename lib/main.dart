import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'services/audio_service.dart';
import 'services/audio_state_manager.dart';
import 'viewmodels/home_viewmodel.dart';
import 'views/home/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AudioStateManager(),
        ),
        ProxyProvider<AudioStateManager, AudioService>(
          create: (context) => AudioService(context.read<AudioStateManager>()),
          update: (context, stateManager, previous) =>
              previous ?? AudioService(stateManager),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeViewModel(),
        ),
      ],
      child: const CupertinoApp(
        title: 'Music Player',
        theme: CupertinoThemeData(
          brightness: Brightness.dark,
          primaryColor: CupertinoColors.systemRed,
        ),
        home: HomeView(),
      ),
    );
  }
}
