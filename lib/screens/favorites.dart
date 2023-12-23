import 'package:flutter/material.dart';
import 'package:prog_languages/data/favorite_medicines.dart';
import 'package:prog_languages/data/medicines_list.dart';
import 'package:prog_languages/generated/l10n.dart';
import 'package:prog_languages/models/medicine.dart';
import 'package:prog_languages/widgets/favorite_medicine_item.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key, required this.onRemoved});
  final void Function(String, int) onRemoved;

  Medicine getMedicine(String id) {
    final m = medicinesList.where((medicine) {
      if (medicine.id == id) {
        return true;
      }
      return false;
    }).toList();
    return m[0];
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Text(
        S.of(context).DontHaveFavoriteMedicines,
        style: TextStyle(
          color: Theme.of(context).colorScheme.tertiary,
        ),
      ),
    );
    if (favoriteMedicines.isNotEmpty) {
      content = GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: favoriteMedicines.length,
        itemBuilder: (ctx, index) {
          return FavoriteMedicineItem(
            medicine: getMedicine(favoriteMedicines[index]),
            onRemoved: onRemoved,
          );
        },
      );
    }
    return content;
  }
}
