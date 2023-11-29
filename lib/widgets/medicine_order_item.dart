import 'package:flutter/material.dart';
import 'package:prog_languages/models/medicine.dart';
import 'package:prog_languages/widgets/medicine_order_item_trait.dart';

class MedicineOrderItem extends StatelessWidget {
  const MedicineOrderItem(
      {super.key,
      required this.medicine,
      required this.amount,
      required this.onCancelOrder});
  final Medicine medicine;
  final int amount;
  final void Function(String, int) onCancelOrder;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(children: [
        Container(
          constraints: BoxConstraints(maxHeight: 150, maxWidth: 130),
          child: Image(image: medicine.image.image),
        ),
        Container(
          width: 250,
          height: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).colorScheme.secondaryContainer),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    MedicineOrderItemTrait(
                        label: 'Name', content: medicine.sciName),
                    const Spacer(),
                    MedicineOrderItemTrait(
                        label: 'Amount', content: amount.toString())
                  ],
                ),
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    onCancelOrder(medicine.id, amount);
                  },
                  icon: const Icon(Icons.cancel_rounded))
            ],
          ),
        ),
      ]),
    );
  }
}
