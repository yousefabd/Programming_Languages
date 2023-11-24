import 'package:flutter/material.dart';
import 'package:prog_languages/models/medicine.dart';

class MedicineDetailsScreen extends StatelessWidget {
  const MedicineDetailsScreen({super.key, required this.medicine});
  final Medicine medicine;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(medicine.sciName)),
      body: Hero(
        tag: medicine.id,
        child: Image(
          image: medicine.image.image,
        ),
      ),
    );
  }
}
