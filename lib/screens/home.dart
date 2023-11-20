import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prog_languages/data/dummy_medicines.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
//Image(image: dummyMedicines[0].image)
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(
            'Home',
            style: GoogleFonts.comme(
                color: Theme.of(context).colorScheme.onPrimary),
          ),
        ),
        drawer: Drawer(),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
          height: double.infinity,
          width: double.infinity,
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
          child: GridView.builder(
            itemCount: dummyMedicines.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                color: Colors.amber,
                foregroundDecoration: BoxDecoration(
                    image: DecorationImage(
                        image: dummyMedicines[index].image, fit: BoxFit.fill)),
              );
            },
          ),
        ),
      ),
    );
  }
}
