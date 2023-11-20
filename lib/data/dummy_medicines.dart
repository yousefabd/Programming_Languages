import 'package:flutter/material.dart';
import 'package:prog_languages/models/medicine.dart';

//Zorprin
var randomDate =
    DateTime(DateTime.now().year + 3, DateTime.now().month, DateTime.now().day);
final dummyMedicines = [
  Medicine(
    sciName: 'paracetamol',
    marketName: 'Panadol',
    category: Category.painReliever,
    company: 'Ultra-Medica',
    quantity: 250,
    expireDate: randomDate,
    price: 2500.0,
    image: const NetworkImage(
      'https://i-cf65.ch-static.com/content/dam/cf-consumer-healthcare/panadol-reskin/en_AE/adult/Panadol%20ActiFast%20455x455.jpg?auto=format',
    ),
    id: '1',
  ),
  Medicine(
    sciName: 'paracetamol',
    marketName: 'Panadol',
    category: Category.painReliever,
    company: 'Ultra-Medica',
    quantity: 250,
    expireDate: randomDate,
    price: 2500.0,
    image: const NetworkImage(
      'https://i-cf65.ch-static.com/content/dam/cf-consumer-healthcare/panadol-reskin/en_AE/adult/Panadol%20ActiFast%20455x455.jpg?auto=format',
    ),
    id: '1',
  ),
  Medicine(
    sciName: 'paracetamol',
    marketName: 'Panadol',
    category: Category.painReliever,
    company: 'Ultra-Medica',
    quantity: 250,
    expireDate: randomDate,
    price: 2500.0,
    image: const NetworkImage(
      'https://i-cf65.ch-static.com/content/dam/cf-consumer-healthcare/panadol-reskin/en_AE/adult/Panadol%20ActiFast%20455x455.jpg?auto=format',
    ),
    id: '1',
  ),
  Medicine(
    sciName: 'paracetamol',
    marketName: 'Panadol',
    category: Category.painReliever,
    company: 'Ultra-Medica',
    quantity: 250,
    expireDate: randomDate,
    price: 2500.0,
    image: const NetworkImage(
      'https://i-cf65.ch-static.com/content/dam/cf-consumer-healthcare/panadol-reskin/en_AE/adult/Panadol%20ActiFast%20455x455.jpg?auto=format',
    ),
    id: '1',
  ),
  Medicine(
    sciName: 'paracetamol',
    marketName: 'Panadol',
    category: Category.painReliever,
    company: 'Ultra-Medica',
    quantity: 250,
    expireDate: randomDate,
    price: 2500.0,
    image: const NetworkImage(
      'https://i-cf65.ch-static.com/content/dam/cf-consumer-healthcare/panadol-reskin/en_AE/adult/Panadol%20ActiFast%20455x455.jpg?auto=format',
    ),
    id: '1',
  ),
];
