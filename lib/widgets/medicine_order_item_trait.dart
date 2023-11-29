import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MedicineOrderItemTrait extends StatelessWidget {
  const MedicineOrderItemTrait(
      {super.key, required this.label, required this.content});
  final String label;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 70,
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.4),
              borderRadius: BorderRadius.circular(5)),
          child: Text(
            '$label:',
            style: GoogleFonts.bitter(
                color: Theme.of(context).colorScheme.background),
          ),
        ),
        SizedBox(
          width: 110,
          child: Text(
            '  $content',
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.croissantOne(
                color: Theme.of(context).colorScheme.tertiary, fontSize: 12),
          ),
        )
      ],
    );
  }
}
