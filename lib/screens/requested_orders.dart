import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prog_languages/data/requested_orders_list.dart';
import 'package:prog_languages/widgets/order_item.dart';

class RequestedOrderScreen extends StatelessWidget {
  const RequestedOrderScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          'My Previous Orders',
          style:
              GoogleFonts.comme(color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.builder(
            itemCount: requestedOrders.length,
            itemBuilder: (ctx, index) {
              print(requestedOrders.length);
              String title = requestedOrders[index]['orderTitle'];
              int status = requestedOrders[index]['orderState'];
              return OrderItem(title: title, status: status);
            }),
      ),
    );
  }
}
