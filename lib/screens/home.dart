import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prog_languages/data/dummy_medicines.dart';
import 'package:prog_languages/models/medicine.dart';
import 'package:prog_languages/screens/medicine_details.dart';
import 'package:prog_languages/widgets/medicine_item.dart';
import 'package:prog_languages/widgets/search_bar.dart';
import 'package:prog_languages/widgets/side_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.onLogout});
  final void Function() onLogout;
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

  void _pushDetails(Medicine medicine) async {
    int? _amount = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MedicineDetailsScreen(medicine: medicine),
      ),
    );
    if (_amount == null) {
      print('amogus');
    } else
      print(_amount);
  }

  List<Medicine> get categoryMedicines {
    List<Medicine> l = [];
    for (int i = 0; i < dummyMedicines.length; i++) {
      if (dummyMedicines[i].category == _selectedCategory) {
        l.add(dummyMedicines[i]);
      }
    }
    return l;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          'Home',
          style:
              GoogleFonts.comme(color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
      drawer: SideDrawer(onLogout: widget.onLogout),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(left: 10, right: 10, top: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MySearchBar(
              onSearch: () {},
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
                      _pushDetails(
                        categoryMedicines[index],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
