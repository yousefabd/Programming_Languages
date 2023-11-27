import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prog_languages/models/medicine.dart';
import 'package:prog_languages/screens/home.dart';
import 'package:prog_languages/screens/medicine_details.dart';
import 'package:prog_languages/screens/order.dart';
import 'package:prog_languages/widgets/new_medicine_order.dart';
import 'package:prog_languages/widgets/side_drawer.dart';

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

  void _addMedicineOrder() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) {
          return const NewMedicineOrder();
        });
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
        currentScreen = HomeScreen(onTapMedicine: _pushDetails);
        currentTitle = 'Home';
      case 1:
        currentScreen = const OrderScreen();
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
