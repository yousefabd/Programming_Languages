import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prog_languages/models/medicine.dart';
import 'package:prog_languages/widgets/medicine_item_trait.dart';

class MedicineItem extends StatelessWidget {
  const MedicineItem(this.medicine, {super.key});
  final Medicine medicine;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 224, 255, 245),
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
      child: Stack(
        children: [
          Center(child: medicine.image),
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
