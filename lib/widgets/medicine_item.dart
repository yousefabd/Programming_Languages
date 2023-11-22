import 'package:flutter/material.dart';
import 'package:prog_languages/models/medicine.dart';
import 'package:prog_languages/widgets/medicine_item_trait.dart';

class MedicineItem extends StatelessWidget {
  const MedicineItem(this.medicine, {super.key});
  final Medicine medicine;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.secondaryContainer,
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
      child: Stack(
        children: [
          Image(
            image: medicine.image.image,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: MedicineItemTrait(medicine: medicine),
          )
        ],
      ),
    );
  }
}
