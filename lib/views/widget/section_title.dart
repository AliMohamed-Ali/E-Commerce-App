import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle(
      {super.key,
      required this.title,
      this.action,
      this.onPressed,
      this.subtitle});
  final String title;
  final String? action;
  final String? subtitle;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    // return Row(
    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //   children: [
    //     Text(
    //       title,
    //       style: textTheme.bodyLarge!.copyWith(
    //         fontWeight: FontWeight.bold,
    //         fontSize: 30,
    //       ),
    //     ),
    //     if (action != null)
    //       TextButton(
    //         onPressed: onPressed,
    //         child: Text(
    //           action!,
    //           style: textTheme.bodyMedium,
    //         ),
    //       ),
    //   ],
    // );

    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: textTheme.bodyLarge!.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
      ),
      trailing: action != null
          ? TextButton(
              onPressed: onPressed,
              child: Text(
                action!,
                style: textTheme.bodyMedium,
              ),
            )
          : null,
      subtitle: Text(
        subtitle ?? "",
        style: textTheme.bodySmall!.copyWith(color: colorScheme.outline),
      ),
    );
  }
}
