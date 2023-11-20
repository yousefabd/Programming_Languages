import 'package:flutter/material.dart';

enum Category { painReliever, tranqualizer, stimulant, sadative }

class Medicine {
  final String id;
  final String sciName;
  final String marketName;
  final Category category;
  final String company;
  final int quantity;
  final DateTime expireDate;
  final double price;
  final NetworkImage image;

  const Medicine(
      {required this.sciName,
      required this.marketName,
      required this.category,
      required this.company,
      required this.quantity,
      required this.expireDate,
      required this.price,
      required this.image,
      required this.id}); //initializing id is temporary,we'll be getting id from backend eventually
}
