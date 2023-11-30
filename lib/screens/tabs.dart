import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:prog_languages/data/medicine_order_list.dart';
import 'package:prog_languages/data/requested_orders_list.dart';
import 'package:prog_languages/models/medicine.dart';
import 'package:prog_languages/screens/home.dart';
import 'package:prog_languages/screens/medicine_details.dart';
import 'package:prog_languages/screens/order.dart';
import 'package:prog_languages/widgets/new_medicine_order.dart';
import 'package:prog_languages/widgets/side_drawer.dart';
import 'package:prog_languages/widgets/submit_order_dialog_box.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen(
      {super.key,
      required this.onLogout,
      required this.number,
      required this.name});
  final void Function() onLogout;
  final String number;
  final String name;
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _currentScreenIndex = 0;
  void _switchScreen(int index) {
    setState(() {
      _currentScreenIndex = index;
    });
  }

  void _pushDetails(Medicine medicine) async {
    int? _amount = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MedicineDetailsScreen(medicine: medicine),
      ),
    );
    if (_amount == null) {
    } else
      print(_amount);
  }

  void _searchMedicine(String searched) async {
    final tempUrl =
        Uri.parse('http://10.0.2.2:8000/api/medcines?useName[like]=$searched');
    final response = await http.get(
      tempUrl,
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer 1|LFrrMB7opUx6hvvQRhwu1vXwB4fGFq2xqp0x9mAkb9b2b4ca',
      },
    );
    final searchResult = json.decode(response.body);
    final data = searchResult['data'] as List;
    print(data);
  }

  void _addMedicineOrder() async {
    final MapEntry<Medicine, int>? chosenMedicineEntry =
        await showModalBottomSheet(
            useSafeArea: true,
            isScrollControlled: true,
            context: context,
            builder: (ctx) {
              return const NewMedicineOrder();
            });

    if (chosenMedicineEntry != null) {
      setState(() {
        /* if the ordered medicine is already in the medicines order list we just edit the medicine order amount*/
        if (currentOrder.containsKey(chosenMedicineEntry.key.id)) {
          /*if old order of the medicine amount + new order amount doesn't exceed maximum amount of the medicine */
          if (currentOrder[chosenMedicineEntry.key.id] +
                  chosenMedicineEntry.value <=
              chosenMedicineEntry.key.quantity) {
            currentOrder[chosenMedicineEntry.key.id] =
                currentOrder[chosenMedicineEntry.key.id] +
                    chosenMedicineEntry.value;
          } else {
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor:
                    Theme.of(context).colorScheme.secondaryContainer,
                content: Text(
                  'Couldn\'nt submit because wanted amount exceeded maximum quantity',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
              ),
            );
          }
        } else {
          currentOrder.addEntries({
            MapEntry(chosenMedicineEntry.key.id, chosenMedicineEntry.value)
          });
        }
      });
    }
  }

  void _editMedicineOrder(String name, int amount) async {
    final MapEntry<Medicine, int>? chosenMedicineEntry =
        await showModalBottomSheet(
            useSafeArea: true,
            isScrollControlled: true,
            context: context,
            builder: (ctx) {
              return NewMedicineOrder(
                name: name,
                amount: amount,
              );
            });

    if (chosenMedicineEntry != null) {
      setState(() {
        if (currentOrder.containsKey(chosenMedicineEntry.key.id)) {
          currentOrder[chosenMedicineEntry.key.id] = chosenMedicineEntry.value;
        } else {
          currentOrder.addEntries({
            MapEntry(chosenMedicineEntry.key.id, chosenMedicineEntry.value)
          });
        }
      });
    }
  }

  void _cancelMedicineOrder(String key, int amount) {
    setState(() {
      currentOrder.remove(key);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
          content: Text(
            'Removed order from the list',
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
          action: SnackBarAction(
            label: 'undo',
            onPressed: () {
              setState(() {
                currentOrder.addEntries({MapEntry(key, amount)});
              });
            },
          )),
    );
  }

  void _clearMedicineOrder() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: const Text(
            'Are you sure you want to clear order list?',
            style: TextStyle(fontSize: 22),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  currentOrder.clear();
                });
              },
              child: const Text('Clear'),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'))
          ],
        );
      },
    );
  }

  void _submitMedicineOrder() async {
    final String? orderTitle = await showDialog(
      context: context,
      builder: (ctx) {
        return SubmitOrderDialogBox();
      },
    );
    if (orderTitle != null) {
      requestedOrders.add({
        "orderState": 0,
        "orderTitle": orderTitle,
        "medicines": currentOrder
      });
      setState(() {
        currentOrder.clear();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
            content: Text(
              'Submitted order successfully',
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget currentScreen = const SizedBox();
    final addToOrderButton = [
      IconButton(
          onPressed: _addMedicineOrder,
          icon: Icon(
            Icons.add,
            size: 40,
            color: Theme.of(context).colorScheme.background,
          ))
    ];
    String currentTitle = '';
    switch (_currentScreenIndex) {
      case 0:
        currentScreen = HomeScreen(
          onTapMedicine: _pushDetails,
          onSearch: _searchMedicine,
        );
        currentTitle = 'Home';
      case 1:
        currentScreen = OrderScreen(
          orderList: currentOrder,
          onCancelOrder: _cancelMedicineOrder,
          onClearList: _clearMedicineOrder,
          onEditOrder: _editMedicineOrder,
          onSubmitOrder: _submitMedicineOrder,
        );
        currentTitle = 'Add an order';
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          currentTitle,
          style:
              GoogleFonts.comme(color: Theme.of(context).colorScheme.onPrimary),
        ),
        actions: (currentTitle == 'Add an order' ? addToOrderButton : []),
      ),
      drawer: SideDrawer(onLogout: widget.onLogout, name: widget.name),
      body: currentScreen,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        fixedColor: Theme.of(context).colorScheme.secondaryContainer,
        currentIndex: _currentScreenIndex,
        onTap: _switchScreen,
        iconSize: 32,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.menu_book_outlined), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_shopping_cart_sharp), label: ''),
        ],
      ),
    );
  }
}
