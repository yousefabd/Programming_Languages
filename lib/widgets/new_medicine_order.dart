import 'package:flutter/material.dart';
import 'package:prog_languages/data/dummy_medicines.dart';
import 'package:prog_languages/data/medicine_order_list.dart';
import 'package:prog_languages/models/medicine.dart';

class NewMedicineOrder extends StatefulWidget {
  const NewMedicineOrder({super.key});

  @override
  State<NewMedicineOrder> createState() => _NewMedicineOrderState();
}

class _NewMedicineOrderState extends State<NewMedicineOrder> {
  final _formKey = GlobalKey<FormState>();

  int? _enteredAmount;

  Medicine? chosenMedicine;

  void _submitOrder() {
    if (_formKey.currentState!.validate()) {
      currentOrder.addEntries([MapEntry(chosenMedicine!.id, _enteredAmount!)]);
    }
  }

  bool foundMedicine(String name) {
    final m = dummyMedicines.where((medicine) {
      if (medicine.sciName == name) {
        chosenMedicine = medicine;
        return true;
      }
      return false;
    }).toList();
    if (m.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            TextFormField(
              decoration:
                  const InputDecoration(hintText: 'Enter Medicine Name'),
              validator: (value) {
                if (value!.trim().isEmpty) {
                  return 'This field is required';
                } else if (!foundMedicine(value)) {
                  return 'Couldn\'t find medicine, make sure to enter the scientific name!';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: 'Enter Amount'),
              validator: (value) {
                if (value!.trim().isEmpty) {
                  return 'This field is required';
                } else if (int.tryParse(value) == null) {
                  return 'Please enter a valid amount';
                } else if (chosenMedicine == null) {
                  return 'Enter medicine name first';
                } else if (int.parse(value) > chosenMedicine!.quantity) {
                  return 'Entered value exceeded available quantity';
                }
                _enteredAmount = int.parse(value);
                return null;
              },
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'cancel',
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                ),
                ElevatedButton(
                  onPressed: _submitOrder,
                  style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Theme.of(context).colorScheme.secondaryContainer),
                  child: Text(
                    'submit',
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
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
