import 'package:flutter/material.dart';
import 'package:prog_languages/models/medicine.dart';
import 'package:prog_languages/widgets/order_details_item_trait.dart';

class OrderDetailsItem extends StatelessWidget {
  const OrderDetailsItem(
      {super.key, required this.medicine, required this.amount});
  final Medicine medicine;
  final int amount;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
              color: Theme.of(context).colorScheme.inverseSurface, width: 6),
          borderRadius: BorderRadius.circular(15),
          color: Theme.of(context).colorScheme.primary.withOpacity(0.7),
        ),
        child: Row(children: [
          Container(
            constraints: const BoxConstraints(maxHeight: 150, maxWidth: 130),
            child: Image(image: medicine.image.image),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                child: Column(
                  children: [
                    OrderDetailsItemTrait(
                      icon: Icons.science,
                      title: medicine.sciName,
                      //containerColor: Theme.of(context).colorScheme.background,
                    ),
                    const SizedBox(height: 6),
                    OrderDetailsItemTrait(
                      icon: Icons.format_list_numbered_rounded,
                      title: '${amount.toString()}        ',
                      containerColor: const Color.fromARGB(255, 255, 212, 147),
                    ),
                    const SizedBox(height: 6),
                    OrderDetailsItemTrait(
                      icon: Icons.calculate,
                      title: '${medicine.price * amount}  S.P',
                      containerColor: Theme.of(context).colorScheme.background,
                    ),
                  ],
                )),
          ),
        ]),
      ),
    );
  }
}
