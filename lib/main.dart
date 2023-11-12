import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prog_languages/screens/login.dart';

//adding a seed color
final kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 27, 127, 72));
void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorScheme,
      ),
      home: LogInScreen(),
    ),
  );
}
