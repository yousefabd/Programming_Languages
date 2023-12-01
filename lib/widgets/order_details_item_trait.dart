import 'package:flutter/material.dart';

class OrderDetailsItemTrait extends StatelessWidget {
  const OrderDetailsItemTrait(
      {super.key,
      required this.icon,
      required this.title,
      this.containerColor});
  final IconData icon;
  final String title;
  final Color? containerColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: containerColor ?? Theme.of(context).colorScheme.background,
        ),
        const SizedBox(width: 4),
        Container(
          padding: const EdgeInsets.all(6),
          color: containerColor,
          child: SizedBox(
            width: 120,
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: containerColor == null
                    ? Theme.of(context).colorScheme.background
                    : Theme.of(context).colorScheme.onBackground,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        )
      ],
    );
  }
}
