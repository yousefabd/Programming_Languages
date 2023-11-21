import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prog_languages/data/dummy_medicines.dart';
import 'package:prog_languages/widgets/medicine_item.dart';
import 'package:prog_languages/widgets/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void changeCategory(Category c) {}
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          'Home',
          style:
              GoogleFonts.comme(color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
      drawer: Drawer(),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.only(left: 10, right: 10, top: 40),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary.withOpacity(0.2),
              Theme.of(context).colorScheme.primary.withOpacity(0.05),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MySearchBar(
              onSearch: () {},
              onSelectCategory: () {
                print('category selected');
              },
            ),
            const SizedBox(height: 18),
            Expanded(
              child: ListView.builder(
                itemCount: dummyMedicines.length,
                itemBuilder: (BuildContext context, int index) {
                  return MedicineItem(dummyMedicines[index]);
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
