import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:prog_languages/generated/l10n.dart';
import 'package:prog_languages/screens/pharma_store.dart';


//adding a seed color
final kColorScheme = ColorScheme.fromSeed(
    // seedColor: Color.fromARGB(255, 0, 101, 141), brightness: Brightness.light);
        // seedColor: Color.fromARGB(255, 0, 141, 141), brightness: Brightness.light);
                // seedColor: Color.fromARGB(255, 8, 171, 171), brightness: Brightness.light);
                seedColor: Color.fromARGB(255, 59, 225, 225), brightness: Brightness.light);


void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: kColorScheme.primary),
  );
  runApp(
    MaterialApp(
      locale: const Locale('ar'),
      //locale: const Locale('en'),
      localizationsDelegates:const  [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorScheme,
      ),
      home: const PharmaStore(),
    ),
  );
}
bool isArabic() {
              return Intl.getCurrentLocale() == 'ar';
            }