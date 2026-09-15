import 'package:flutter/material.dart';

class TimerButton extends StatelessWidget {
  const TimerButton({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.backgroundColor,
  });

  final IconData icon;
  final VoidCallback onPressed;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon),
      iconSize: 32,
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(backgroundColor),
        foregroundColor: const WidgetStatePropertyAll(Colors.white),
        fixedSize: const WidgetStatePropertyAll(Size(64, 64)),
        mouseCursor: const WidgetStatePropertyAll(SystemMouseCursors.click),
      ),
    );
  }
}
