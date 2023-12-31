import 'package:flutter/material.dart';

enum MedCategory {
  all,
  painReliever,
  stimulant,
  sadative,
  antibiotic,
}

class Medicine {
  final String id;
  final String sciName;
  final String marketName;
  final MedCategory category;
  final String company;
  final int quantity;
  final String expireDate;
  final double price;
  Image image = Image.asset('assets/images/medicine/cmedicon.png');

  Medicine(
      {required this.sciName,
      required this.marketName,
      required this.category,
      required this.company,
      required this.quantity,
      required this.expireDate,
      required this.price,
      required this.id}); //initializing id is temporary,we'll be getting id from backend eventually
}
