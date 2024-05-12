import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key, required this.text, required this.onPressed});
  final String text;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    // final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 48),
        backgroundColor: colorScheme.primary.withOpacity(.75),
        foregroundColor: colorScheme.onPrimary,
        shape: const StadiumBorder(),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
