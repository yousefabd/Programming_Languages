import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MedicineDetailTile extends StatelessWidget {
  const MedicineDetailTile(
      {super.key,
      required this.icon,
      required this.label,
      required this.content});
  final IconData icon;
  final String label;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 36,
          color: Theme.of(context).colorScheme.tertiary,
        ),
        const SizedBox(width: 6),
        Container(
          padding: const EdgeInsets.all(4),
          color: Theme.of(context).colorScheme.tertiary.withOpacity(0.25),
          child: Text(
            label,
            style:
                GoogleFonts.bitter(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(width: 7),
        SizedBox(
          width: 150,
          child: Text(
            content,
            style: GoogleFonts.bitter(fontSize: 14),
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
