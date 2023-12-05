import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prog_languages/data/medicines_list.dart';
import 'package:prog_languages/data/requested_orders_list.dart';
import 'package:prog_languages/models/medicine.dart';
import 'package:prog_languages/widgets/order_details_item.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen(this.index, this.status, {super.key});
  final int index;
  final Widget status;
  Medicine getMedicine(String id) {
    final m = medicinesList.where((medicine) {
      print(id);
      if (medicine.id == id) {
        return true;
      }
      return false;
    }).toList();
    return m[0];
  }

  double get _totalCost {
    double cost = 0;
    for (final medicine
        in (requestedOrders[index]['medicines'] as Map).entries) {
      cost += getMedicine(medicine.key).price * medicine.value;
    }
    return cost;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          requestedOrders[index]['orderTitle'],
          style: GoogleFonts.bitter(
              color: Theme.of(context).colorScheme.background),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 28),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  for (final medicine
                      in (requestedOrders[index]['medicines'] as Map).entries)
                    OrderDetailsItem(
                      medicine: getMedicine(medicine.key),
                      amount: medicine.value,
                    )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 44),
                Icon(
                  Icons.pending_outlined,
                  size: 40,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                  decoration: BoxDecoration(
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    'Status:',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.background,
                      fontSize: 24,
                    ),
                  ),
                ),
                const SizedBox(width: 24),
                Transform.scale(scale: 1.3, child: status),
                const SizedBox(width: 64),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 44),
                Icon(
                  Icons.price_change,
                  size: 40,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                  decoration: BoxDecoration(
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    'Total Cost:',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.background,
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                Container(
                  width: 140,
                  padding: const EdgeInsets.all(4),
                  color: Theme.of(context)
                      .colorScheme
                      .onSurfaceVariant
                      .withOpacity(0.6),
                  child: Text(
                    '${_totalCost.toString()}  S.P',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.w900),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
