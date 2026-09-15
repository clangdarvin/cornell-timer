import 'package:cornell_timer/screens/timer.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await windowManager.ensureInitialized();

  const windowSize = Size(320, 320);

  const windowOptions = WindowOptions(
    size: windowSize,
    minimumSize: windowSize,
    maximumSize: windowSize,
    center: true,
    skipTaskbar: false,
    alwaysOnTop: true,
  );

  await windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.setSize(windowSize);
    await windowManager.show();
    await windowManager.focus();
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cornell Timer',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const SafeArea(child: CornellTimer()),
    );
  }
}
