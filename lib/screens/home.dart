import 'package:flutter/material.dart';
import 'package:prog_languages/data/medicines_list.dart';
import 'package:prog_languages/models/medicine.dart';
import 'package:prog_languages/widgets/medicine_item.dart';
import 'package:prog_languages/widgets/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen(
      {super.key, required this.onTapMedicine, required this.onSearch});
  final void Function(Medicine) onTapMedicine;
  final void Function(String) onSearch;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MedCategory _selectedCategory = MedCategory.painReliever;
  void changeCategory(MedCategory c) {
    setState(() {
      _selectedCategory = c;
    });
  }

  List<Medicine> get categoryMedicines {
    List<Medicine> l = [];
    for (int i = 0; i < medicinesList.length; i++) {
      if (medicinesList[i].category == _selectedCategory) {
        l.add(medicinesList[i]);
      }
    }
    return l;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 10, right: 10, top: 40),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MySearchBar(
            onSearch: widget.onSearch,
            onSelectCategory: (category) {
              changeCategory(category);
            },
          ),
          const SizedBox(height: 18),
          Expanded(
            child: ListView.builder(
              itemCount: categoryMedicines.length,
              itemBuilder: (BuildContext context, int index) {
                return MedicineItem(
                  medicine: categoryMedicines[index],
                  onPushDetails: () {
                    widget.onTapMedicine(
                      categoryMedicines[index],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
