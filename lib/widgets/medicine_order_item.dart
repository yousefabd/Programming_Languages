import 'package:flutter/material.dart';
import 'package:prog_languages/models/medicine.dart';
import 'package:prog_languages/widgets/order_details_item_trait.dart';

class MedicineOrderItem extends StatelessWidget {
  const MedicineOrderItem(
      {super.key,
      required this.medicine,
      required this.amount,
      required this.onCancelOrder,
      required this.onEditOrder});
  final Medicine medicine;
  final int amount;
  final void Function(String, int) onCancelOrder;
  final void Function(String, int) onEditOrder;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
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
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).colorScheme.tertiary),
              child: Row(
                children: [
                  Column(
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
                        containerColor:
                            const Color.fromARGB(255, 255, 212, 147),
                      ),
                      const SizedBox(height: 6),
                      OrderDetailsItemTrait(
                        icon: Icons.calculate,
                        title: '${medicine.price * amount}  S.P',
                        containerColor:
                            Theme.of(context).colorScheme.background,
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          onCancelOrder(medicine.id, amount);
                        },
                        icon: Icon(
                          Icons.cancel_rounded,
                          color: Colors.red[400],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          onEditOrder(medicine.sciName, amount);
                        },
                        icon: Icon(
                          Icons.edit_calendar,
                          color: Colors.yellow[400],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
