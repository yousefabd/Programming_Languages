import 'package:flutter/material.dart';
import 'package:prog_languages/models/medicine.dart';

//Zorprin
var randomDate =
    DateTime(DateTime.now().year + 3, DateTime.now().month, DateTime.now().day);
final dummyMedicines = [
  Medicine(
    sciName: 'paracetamol',
    marketName: 'Panadol',
    category: MedCategory.painReliever,
    company: 'Ultra-Medica',
    quantity: 250,
    expireDate: randomDate,
    price: 2500.0,
    image: Image.asset('assets/images/medicine/paracetamol.png'),
    id: '1',
  ),
  Medicine(
    sciName: 'aspirine',
    marketName: 'Easprin',
    category: MedCategory.painReliever,
    company: 'Ultra-Medica',
    quantity: 300,
    expireDate: randomDate,
    price: 3500.0,
    image: Image.asset(
      'assets/images/medicine/aspirine.png',
    ),
    id: '2',
  ),
  Medicine(
    sciName: 'cetacodaine',
    marketName: 'Cetacaine',
    category: MedCategory.antibiotic,
    company: 'Ultra-Medica',
    quantity: 100,
    expireDate: randomDate,
    price: 4000.0,
    image: Image.asset('assets/images/medicine/cetacodaine.png'),
    id: '3',
  ),
  Medicine(
    sciName: 'cetacodaine',
    marketName: 'Cetacaine',
    category: MedCategory.painReliever,
    company: 'Ultra-Medica',
    quantity: 100,
    expireDate: randomDate,
    price: 4000.0,
    image: Image.asset('assets/images/medicine/cetacodaine.png'),
    id: '4',
  ),
];
