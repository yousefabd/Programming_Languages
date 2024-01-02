import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:prog_languages/data/url_data/auth_util.dart';
import 'package:prog_languages/data/favorite_medicines.dart';
import 'package:prog_languages/data/medicine_order_list.dart';
import 'package:prog_languages/generated/l10n.dart';
import 'package:prog_languages/models/medicine.dart';
import 'package:prog_languages/screens/favorites.dart';
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

  Future<int> _pushDetails(Medicine medicine) async {
    int? _amount = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MedicineDetailsScreen(medicine: medicine),
      ),
    );
    if (_amount == null) {
      return 0;
    } else {
      return _amount;
    }
  }

  void _addMedicineOrder() async {
    final MapEntry<Medicine, int>? chosenMedicineEntry = await showDialog(
        useSafeArea: true,
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
                  S.of(context).CouldnotSubmit,
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
    final MapEntry<Medicine, int>? chosenMedicineEntry = await showDialog(
        useSafeArea: true,
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
            S.of(context).RemovedOrderFromList,
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
          action: SnackBarAction(
            label: S.of(context).undo,
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
          content: Text(
            S.of(context).sureToClear,
            style: const TextStyle(fontSize: 22),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  currentOrder.clear();
                });
              },
              child: Text(S.of(context).Clear),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(S.of(context).Cancel))
          ],
        );
      },
    );
  }

  void _awaitSubmit() async {
    final response = await http.post(
      Uri.parse('${url}placeOrder'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${AuthUtility.getToken()}',
      },
      body: json.encode({
        'items': [
          for (final medicine in currentOrder.entries)
            {'medcine_id': int.parse(medicine.key), 'qtn': medicine.value},
        ]
      }),
    );
    if (response.statusCode == 200) {
      setState(() {
        currentOrder.clear();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
            content: Text(
              S.of(context).SubmitSuccess,
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
          ),
        );
      });
    } else {
      print(S.of(context).httpSubmitError);
    }
  }

  void _submitMedicineOrder() {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          content: Text(
            S.of(context).sureToSubmitOrder,
            style: const TextStyle(fontSize: 22),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                _awaitSubmit();
                Navigator.pop(context);
              },
              child: Text(S.of(context).Submit),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(S.of(context).Cancel))
          ],
        );
      },
    );
  }

  void _toggleFavoritesList(String id) async {
    bool check = favoriteMedicines.contains(id);
    if (check) {
      setState(() {
        favoriteMedicines.remove(id);
      });
      var response =
          await http.delete(Uri.parse('${url}favourites/$id'), headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${AuthUtility.getToken()}',
      });
      if (response.statusCode >= 300) {
        favoriteMedicines.add(id);
      }
    } else {
      setState(() {
        favoriteMedicines.add(id);
      });
      final response = await http
          .post(Uri.parse('${url}medcines/$id/add-to-favorites'), headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${AuthUtility.getToken()}',
      });
      if (response.statusCode >= 300) {
        favoriteMedicines.remove(id);
      }
    }
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        content: Text(
          check
              ? S.of(context).MedicineRemovedFromFavorites
              : S.of(context).MedicineAddedToFavorites,
          style:
              TextStyle(color: Theme.of(context).colorScheme.primaryContainer),
        ),
      ),
    );
  }

  void _loadFavorites() async {
    favoriteMedicines.clear();
    final response = await http.get(Uri.parse('${url}favourites'), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${AuthUtility.getToken()}',
    });
    final listData = json.decode(response.body);
    for (final favItem in listData) {
      favoriteMedicines.add(favItem['medcine_id'].toString());
    }
  }

  void _removeMedicineFromFavorites(String id, int index) async {
    var response =
        await http.delete(Uri.parse('${url}favourites/$id'), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${AuthUtility.getToken()}',
    });
    print(response.statusCode);
    if (response.statusCode < 300) {
      favoriteMedicines.remove(id);
      setState(() {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Theme.of(context).colorScheme.tertiary,
            content: Text(
              S.of(context).MedicineRemovedFromFavorites,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
            ),
            action: SnackBarAction(
              textColor: Theme.of(context).colorScheme.background,
              label: S.of(context).undo,
              onPressed: () async {
                response = await http.post(
                    Uri.parse('${url}medcines/$id/add-to-favorites'),
                    headers: {
                      'Content-Type': 'application/json',
                      'Authorization': 'Bearer ${AuthUtility.getToken()}',
                    });
                if (response.statusCode == 200) {
                  setState(() {
                    favoriteMedicines.insert(index, id);
                  });
                }
              },
            ),
          ),
        );
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _loadFavorites();
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
          onToggleFavorites: _toggleFavoritesList,
        );
        currentTitle = S.of(context).home;
      case 1:
        currentScreen = OrderScreen(
          orderList: currentOrder,
          onCancelOrder: _cancelMedicineOrder,
          onClearList: _clearMedicineOrder,
          onEditOrder: _editMedicineOrder,
          onSubmitOrder: _submitMedicineOrder,
          onTapOrder: (m) async {
            await _pushDetails(m);
            setState(() {});
          },
        );
        currentTitle = S.of(context).AddAnOrder;
      case 2:
        currentScreen = FavoritesScreen(
          onRemoved: _removeMedicineFromFavorites,
        );
        currentTitle = S.of(context).MyFavoriteMedicines;
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          currentTitle,
          style: GoogleFonts.comme(
              color: Theme.of(context).colorScheme.onPrimary,
              fontWeight: FontWeight.bold),
        ),
        actions:
            (currentTitle == S.of(context).AddAnOrder ? addToOrderButton : []),
      ),
      drawer: SideDrawer(onLogout: widget.onLogout, name: widget.name),
      body: currentScreen,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.onTertiary,
        fixedColor: Theme.of(context).colorScheme.tertiary,
        currentIndex: _currentScreenIndex,
        onTap: _switchScreen,
        iconSize: 28,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_rounded),
            label: S.of(context).home,
          ),
          BottomNavigationBarItem(
              icon: const Icon(Icons.add_shopping_cart_sharp),
              label: S.of(context).Order),
          BottomNavigationBarItem(
              icon: const Icon(Icons.star), label: S.of(context).Favorites),
        ],
      ),
    );
  }
}
