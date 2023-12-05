import 'package:flutter/material.dart';
import 'package:prog_languages/data/medicines_list.dart';
import 'package:prog_languages/models/medicine.dart';

class NewMedicineOrder extends StatefulWidget {
  const NewMedicineOrder({super.key, this.name, this.amount});
  final String? name;
  final int? amount;
  @override
  State<NewMedicineOrder> createState() => _NewMedicineOrderState();
}

class _NewMedicineOrderState extends State<NewMedicineOrder> {
  final _formKey = GlobalKey<FormState>();

  int? _enteredAmount;

  Medicine? chosenMedicine;

  void _submitOrder() {
    if (_formKey.currentState!.validate()) {
      print(chosenMedicine!.sciName);
      Navigator.of(context).pop(MapEntry(chosenMedicine!, _enteredAmount!));
    }
  }

  bool foundMedicine(String name) {
    final m = medicinesList.where((medicine) {
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
    return AlertDialog(
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              widget.name != null ? Icons.edit_calendar : Icons.add_box,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 8),
            TextFormField(
              initialValue: widget.name,
              enabled: (widget.name == null),
              decoration: const InputDecoration(
                hintText: 'Enter Medicine Name',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value!.trim().isEmpty) {
                  return 'This field is required';
                } else if (!foundMedicine(value)) {
                  return 'Couldn\'t find medicine, make sure to\nenter the scientific name correctly!';
                }
                return null;
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              initialValue: widget.amount?.toString(),
              decoration: const InputDecoration(
                hintText: 'Enter Amount',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value!.trim().isEmpty) {
                  return 'This field is required';
                } else if (int.tryParse(value) == null) {
                  return 'Please enter a valid amount';
                } else if (chosenMedicine == null) {
                  return 'Enter medicine name first';
                } else if (int.parse(value) > chosenMedicine!.quantity) {
                  return 'Entered value exceeded available \nquantity';
                }
                _enteredAmount = int.parse(value);
                return null;
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'Cancel',
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
        ),
        ElevatedButton(
          onPressed: _submitOrder,
          style: ElevatedButton.styleFrom(
              backgroundColor:
                  Theme.of(context).colorScheme.secondaryContainer),
          child: Text(
            'Submit',
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
        )
      ],
    );
  }
}
