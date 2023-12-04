import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:prog_languages/auth/auth_util.dart';
import 'package:prog_languages/data/medicines_list.dart';
import 'package:prog_languages/models/medicine.dart';
import 'package:prog_languages/widgets/medicine_item.dart';
import 'package:prog_languages/widgets/search_bar.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen(
      {super.key,
      required this.onTapMedicine,
      required this.onToggleFavorites});
  final void Function(Medicine) onTapMedicine;
  final void Function(String) onToggleFavorites;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _loading = false;
  List<Medicine> filteredMedicines = [...medicinesList];
  void changeCategory(MedCategory c) {
    setState(() {
      filteredMedicines.clear();
      for (int i = 0; i < medicinesList.length; i++) {
        if (medicinesList[i].category == c || c == MedCategory.all) {
          filteredMedicines.add(medicinesList[i]);
        }
      }
    });
  }

  void searchMedicine(String searched) async {
    setState(() {
      _loading = true;
      filteredMedicines.clear();
    });
    final tempUrl =
        Uri.parse('http://10.0.2.2:8000/api/medcines?useName[like]=$searched');
    final response = await http.get(
      tempUrl,
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${AuthUtility.getToken()}',
      },
    );
    if (response.statusCode == 200) {
      final listData = json.decode(response.body);
      final listMedicines = listData['data'];
      for (final medicine in listMedicines) {
        filteredMedicines.add(
          Medicine(
            sciName: medicine['sciName'],
            marketName: medicine['useName'],
            category: getCategory(medicine['category'][0]['id']),
            company: medicine['companyName'],
            quantity: medicine['qtn'],
            expireDate: medicine['expiredDate'],
            price: medicine['price'] * 1.0,
            image: Image.asset(
                'assets/images/medicine/${medicine['useName']}.png'),
            id: medicine['id'].toString(),
          ),
        );
      }
    } else {
      //print('auth failed');
    }
    setState(() {
      _loading = false;
    });
  }

  MedCategory getCategory(int id) {
    switch (id) {
      case 1:
        return MedCategory.painReliever;
      case 2:
        return MedCategory.stimulant;
      case 3:
        return MedCategory.sadative;
      case 4:
        return MedCategory.antibiotic;
      default:
        return MedCategory.antibiotic;
    }
  }

  Future _loadMedicines() async {
    setState(() {
      _loading = true;
      medicinesList.clear();
    });
    final tempUrl = Uri.parse('http://10.0.2.2:8000/api/medcines');
    final response = await http.get(
      tempUrl,
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${AuthUtility.getToken()}',
      },
    );
    if (response.statusCode == 200) {
      final listData = json.decode(response.body);
      final listMedicines = listData['data'];
      for (final medicine in listMedicines) {
        medicinesList.add(
          Medicine(
            sciName: medicine['sciName'],
            marketName: medicine['useName'],
            category: getCategory(medicine['category'][0]['id']),
            company: medicine['companyName'],
            quantity: medicine['qtn'],
            expireDate: medicine['expiredDate'],
            price: medicine['price'] * 1.0,
            image: Image.asset(
                'assets/images/medicine/${medicine['useName']}.png'),
            id: medicine['id'].toString(),
          ),
        );
      }
    } else {
      //print('auth failed');
    }
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadMedicines().then((value) => filteredMedicines = [...medicinesList]);
  }

  @override
  Widget build(BuildContext context) {
    Widget content = (_loading
        ? const Expanded(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : filteredMedicines.isNotEmpty
            ? Expanded(
                child: ListView.builder(
                  itemCount: filteredMedicines.length,
                  itemBuilder: (BuildContext context, int index) {
                    return MedicineItem(
                      medicine: filteredMedicines[index],
                      onPushDetails: () {
                        widget.onTapMedicine(
                          filteredMedicines[index],
                        );
                      },
                      onToggleFavorites: widget.onToggleFavorites,
                    );
                  },
                ),
              )
            : const Expanded(
                child: Center(
                  child: Text('This list is empty!'),
                ),
              ));
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 10, right: 10, top: 40),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MySearchBar(
            onSearch: searchMedicine,
            onSelectCategory: (category) {
              changeCategory(category);
            },
          ),
          const SizedBox(height: 18),
          content
        ],
      ),
    );
  }
}
