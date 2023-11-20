import 'package:flutter/material.dart';
import 'package:prog_languages/data/dummy_medicines.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Image(image: dummyMedicines[0].image);
  }
}
