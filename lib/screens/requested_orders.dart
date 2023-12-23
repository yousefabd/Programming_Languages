import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prog_languages/data/url_data/auth_util.dart';
import 'package:prog_languages/data/requested_orders_list.dart';
import 'package:prog_languages/generated/l10n.dart';
import 'package:prog_languages/screens/order_details.dart';
import 'package:prog_languages/widgets/order_item.dart';
import 'package:http/http.dart' as http;

class RequestedOrderScreen extends StatefulWidget {
  const RequestedOrderScreen({super.key});

  @override
  State<RequestedOrderScreen> createState() => _RequestedOrderScreenState();
}

class _RequestedOrderScreenState extends State<RequestedOrderScreen> {
  bool _loading = false;
  int getOrderState(String state) {
    if (state == 'pending') {
      return 0;
    } else if (state == 'sent') {
      return 1;
    } else if (state == 'recieved') {
      return 2;
    }
    return 2;
  }

  void _loadOrders() async {
    setState(() {
      _loading = true;
    });
    requestedOrders.clear();
    final response = await http.get(
      Uri.parse('${url}orders'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${AuthUtility.getToken()}',
      },
    );
    try {
      print('object');
      final listData =
          (json.decode(response.body) as Map)['data']; //array list of maps
      for (final ord in listData) {
        requestedOrders.add({
          'orderState': getOrderState(ord['status']),
          'orderTitle': 'Order-${ord['id']}',
          'medicines': {
            for (final med in ord['items'])
              med['medcine_id'].toString(): med['qtn_requested'],
          }
        });
        print('finished');
      }
    } catch (e) {
      print('failed to fetch data');
      print(e);
    }
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadOrders();
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: CircularProgressIndicator());
    if (!_loading) {
      content = Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: requestedOrders.isNotEmpty
              ? ListView.builder(
                  itemCount: requestedOrders.length,
                  itemBuilder: (ctx, index) {
                    String title = requestedOrders[index]['orderTitle'];
                    int status = requestedOrders[index]['orderState'];
                    return OrderItem(
                      title: title,
                      status: status,
                      onTap: (status) {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (ctx) {
                          return OrderDetailsScreen(index, status);
                        }));
                      },
                    );
                  },
                )
              :  Center(child: Text(S.of(context).NoRequestedOrdersYet)));
    }
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(
            S.of(context).MyOrders,
            style: GoogleFonts.comme(
                color: Theme.of(context).colorScheme.onPrimary),
          ),
        ),
        body: content);
  }
}
