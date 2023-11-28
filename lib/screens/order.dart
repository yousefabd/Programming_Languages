import 'package:flutter/material.dart';
import 'package:prog_languages/data/medicine_order_list.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Text('You haven\'t placed an order yet!'),
    );
    if (currentOrder.isNotEmpty) {}
    return content;
  }
}
