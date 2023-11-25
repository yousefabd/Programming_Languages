import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:prog_languages/generated/l10n.dart';
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
      locale: const Locale('ar'),
      localizationsDelegates:const  [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorScheme,
      ),
      home: const PharmaStore(),
    ),
  );
}
