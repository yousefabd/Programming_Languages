import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prog_languages/data/medicines_list.dart';
import 'package:prog_languages/models/medicine.dart';
import 'package:prog_languages/widgets/medicine_order_item.dart';
import 'package:prog_languages/widgets/submit_button.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen(
      {super.key,
      required this.orderList,
      required this.onCancelOrder,
      required this.onClearList});
  final orderList;
  final void Function(String, int) onCancelOrder;
  final void Function() onClearList;
  Medicine getMedicine(String id) {
    final m = medicinesList.where((medicine) {
      if (medicine.id == id) {
        return true;
      }
      return false;
    }).toList();
    return m[0];
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Text('You haven\'t placed an order yet!'),
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
                  ),
              ],
            ),
          ),
          Container(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.6),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.greenAccent),
                    onPressed: () {},
                    child: const Text(
                      'Submit ',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: ElevatedButton(
                    onPressed: onClearList,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red.shade200),
                    child: const Text(
                      'Clear List',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      );
    }
    return content;
  }
}
