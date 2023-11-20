import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key, required this.label, required this.onPressed});

  //text label that will differ when button widget is created
  final String label;
  //button action passed dynamically
  final void Function() onPressed;
//Color.fromARGB(255, 49, 237, 237)
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      //this border will be shown when InkWell is tapped
      borderRadius: BorderRadius.circular(30),
      child: Ink(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Text(
            label,
            style: GoogleFonts.bitter(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
          ),
          const SizedBox(width: 17),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(colors: [
                Color.fromARGB(255, 13, 200, 147),
                Color.fromRGBO(36, 135, 135, 1)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: const Icon(
              Icons.arrow_forward,
              color: Colors.white,
              size: 35,
            ),
          )
        ]),
      ),
    );
  }
}
