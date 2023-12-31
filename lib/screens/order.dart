import 'package:flutter/material.dart';
import 'package:prog_languages/data/medicines_list.dart';
import 'package:prog_languages/generated/l10n.dart';
import 'package:prog_languages/models/medicine.dart';
import 'package:prog_languages/widgets/medicine_order_item.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen(
      {super.key,
      required this.orderList,
      required this.onCancelOrder,
      required this.onEditOrder,
      required this.onClearList,
      required this.onSubmitOrder,
      required this.onTapOrder});
  final orderList;
  final void Function() onSubmitOrder;
  final void Function(String, int) onCancelOrder;
  final void Function() onClearList;
  final void Function(String, int) onEditOrder;
  final void Function(Medicine) onTapOrder;
  Medicine getMedicine(String id) {
    final m = medicinesList.where((medicine) {
      if (medicine.id == id) {
        return true;
      }
      return false;
    }).toList();
    return m[0];
  }

  double get _totalCost {
    double cost = 0;
    for (final medicine in (orderList.entries)) {
      cost += getMedicine(medicine.key).price * medicine.value;
    }
    return cost;
  }

  @override
  Widget build(BuildContext context) {
    Widget content =  Center(
      child: Text(S.of(context).havenotPlacedAnOrder),
    );
    if (orderList.isNotEmpty) {
      return Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                for (final medicine in orderList.entries)
                  MedicineOrderItem(
                      medicine: getMedicine(medicine.key),
                      amount: medicine.value,
                      onCancelOrder: onCancelOrder,
                      onEditOrder: onEditOrder,
                      onTapOrder: onTapOrder),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 52),
              Icon(
                Icons.price_change,
                size: 38,
                // color: Theme.of(context).colorScheme.onTertiaryContainer.withOpacity(0.6),
                color: Theme.of(context).colorScheme.primary.withOpacity(0.6),
              ),
              const SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                decoration: BoxDecoration(
                  // color: Theme.of(context).colorScheme.onTertiaryContainer.withOpacity(0.8),
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.6),

                  // color: Theme.of(context).colorScheme.primary.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  S.of(context).TotalCost,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.background,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 6),
              Container(
                width: 140,
                padding: const EdgeInsets.all(4),
                color: Theme.of(context)
                    .colorScheme
                    //.onTertiaryContainer
                    .background
                    .withOpacity(0.6),
                child: Text(
                  '${_totalCost.toString()}  ${S.of(context).SP}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.shadow),
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.delete_outline,
                // color: Colors.red.shade300,
                color: Theme.of(context)
                    .colorScheme
                    .onTertiaryContainer
                    .withOpacity(0.8),
                size: 30,
              ),
              const SizedBox(width: 4),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Theme.of(context).colorScheme.onError.withOpacity(0.7)),

                // backgroundColor: Theme.of(context).colorScheme.onBackground.withOpacity(0.7)),
                onPressed: onClearList,
                child: Text(
                  S.of(context).Clear,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context)
                          .colorScheme
                          .onTertiaryContainer
                          .withOpacity(0.6)),
                ),
              ),
              const SizedBox(width: 42),
              Icon(
                Icons.send_outlined,
                color: Theme.of(context)
                    .colorScheme
                    .onTertiaryContainer
                    .withOpacity(0.8),
                size: 30,
              ),
              ElevatedButton(
                onPressed: onSubmitOrder,
                style: ElevatedButton.styleFrom(
                    // backgroundColor: Colors.red.shade300),
                    backgroundColor:
                        Theme.of(context).colorScheme.onTertiaryContainer),
                child: Text(
                  S.of(context).Submit,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.background),
                ),
              ),
            ],
          )
        ],
      );
    }
    return content;
  }
}
