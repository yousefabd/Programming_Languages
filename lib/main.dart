import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prog_languages/screens/pharma_store.dart';

//adding a seed color
final kColorScheme = ColorScheme.fromSeed(
    seedColor: Color.fromARGB(255, 55, 195, 146), brightness: Brightness.light);
void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: kColorScheme.primary),
  );
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorScheme,
      ),
      home: const PharmaStore(),
    ),
  );
}
