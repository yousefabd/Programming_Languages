import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prog_languages/data/favorite_medicines.dart';
import 'package:prog_languages/models/medicine.dart';

class FavoriteMedicineItem extends StatelessWidget {
  const FavoriteMedicineItem(
      {super.key, required this.medicine, required this.onRemoved});
  final Medicine medicine;
  final void Function(String, int) onRemoved;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        decoration: BoxDecoration(
          color:
              Theme.of(context).colorScheme.tertiaryContainer.withOpacity(0.6),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
              width: 4, color: Theme.of(context).colorScheme.tertiary),
        ),
        child: Stack(
          children: [
            Center(
              child: Container(
                  constraints:
                      const BoxConstraints(maxHeight: 120, maxWidth: 140),
                  child: medicine.image),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    onRemoved(
                        medicine.id, favoriteMedicines.indexOf(medicine.id));
                  },
                  icon: Icon(
                    Icons.cancel,
                    size: 28,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
                const Spacer(),
                Container(
                  width: double.infinity,
                  color: Theme.of(context).colorScheme.tertiary,
                  child: Text(
                    medicine.sciName,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.aBeeZee(
                      color: Theme.of(context).colorScheme.background,
                      fontSize: 18,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
