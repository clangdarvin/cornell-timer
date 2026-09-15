import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key, required this.onStart});

  final VoidCallback onStart;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Move more, sit less",
          style: TextStyle(fontSize: 20, fontFamily: 'Cantarell'),
        ),

        const SizedBox(height: 30),

        SizedBox(
          width: 250,
          height: 50,
          child: ElevatedButton.icon(
            onPressed: onStart,
            label: const Text(
              "START SESSION",
              style: TextStyle(fontSize: 18, fontFamily: 'Inter'),
            ),
            icon: const Icon(Icons.timer, size: 25),
            style: const ButtonStyle(
              mouseCursor: WidgetStatePropertyAll(SystemMouseCursors.click),
            ),
          ),
        ),
      ],
    );
  }
}
