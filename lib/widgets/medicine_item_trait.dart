import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prog_languages/models/medicine.dart';

class MedicineItemTrait extends StatelessWidget {
  const MedicineItemTrait({super.key, required this.medicine});
  final Medicine medicine;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.green.shade300.withOpacity(0.75),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Text(
            medicine.sciName,
            style: GoogleFonts.aDLaMDisplay(
                fontSize: 18, color: Theme.of(context).colorScheme.primary),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(width: 8),
              Icon(
                MaterialCommunityIcons.office_building,
                color: Theme.of(context).colorScheme.primary,
                size: 24,
              ),
              const SizedBox(width: 4),
              Text(
                medicine.company,
                style: GoogleFonts.aDLaMDisplay(
                    fontSize: 12, color: Theme.of(context).colorScheme.primary),
              ),
              const Spacer(),
              const SizedBox(width: 24),
              Icon(
                Icons.format_list_numbered_outlined,
                color: Theme.of(context).colorScheme.primary,
                size: 24,
              ),
              const SizedBox(width: 4),
              Text(
                medicine.quantity.toString(),
                style: GoogleFonts.aDLaMDisplay(
                    fontSize: 12, color: Theme.of(context).colorScheme.primary),
              ),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),
    );
  }
}
