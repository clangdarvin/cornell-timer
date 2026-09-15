import 'package:cornell_timer/widgets/timer_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/home.dart';

class CornellTimer extends StatefulWidget {
  const CornellTimer({super.key});

  @override
  State<CornellTimer> createState() => _CornellTimerState();
}

class _CornellTimerState extends State<CornellTimer> {
  bool isStarted = false;
  bool isActive = false;

  final List<String> activities = ["SIT", "STAND", "STRETCH"];
  final List<int> durations = [20, 8, 2];

  int currentActivity = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: isStarted
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      activities[currentActivity],
                      style: const TextStyle(
                        fontSize: 30,
                        fontFamily: 'Cantarell',
                      ),
                    ),

                    Text(
                      "${durations[currentActivity].toString().padLeft(2, '0')}:00",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Inter',
                        fontSize: 65,
                        fontFeatures: [FontFeature.tabularFigures()],
                      ),
                    ),

                    const SizedBox(height: 10),

                    TimerButton(
                      icon: isActive
                          ? Icons.pause_rounded
                          : Icons.play_arrow_rounded,
                      backgroundColor: isActive
                          ? Colors.red.shade400
                          : Colors.blue.shade400,
                      onPressed: () {
                        SystemSound.play(SystemSoundType.alert);
                        setState(() {
                          isActive = !isActive;
                        });
                      },
                    ),
                  ],
                )
              : Home(
                  onStart: () {
                    setState(() {
                      isStarted = true;
                      isActive = true;
                    });
                  },
                ),
        ),
      ),
    );
  }
}
