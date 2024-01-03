import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prog_languages/data/url_data/auth_util.dart';
import 'package:prog_languages/generated/l10n.dart';
import 'package:prog_languages/main.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String lang = languages[1];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          S.of(context).Settings,
          style: GoogleFonts.comme(
              color: Theme.of(context).colorScheme.onPrimary,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(children: [
        const SizedBox(height: 18),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(width: 10),
            const Icon(Icons.language),
            const SizedBox(width: 10),
            Text(
              S.of(context).Language,
              style: GoogleFonts.roboto(
                fontSize: 22,
                fontWeight: FontWeight.w400,
                color: Theme.of(context).colorScheme.onTertiaryContainer,
              ),
            ),
            const SizedBox(width: 26),
            DropdownButton(
                value: lang,
                items: languages
                    .map(
                        (lan) => DropdownMenuItem(value: lan, child: Text(lan)))
                    .toList(),
                onChanged: (value) {
                  lang = value!;
                  if (value == languages[0]) {
                    MyApp.setLocale(context, const Locale('en'));
                  } else {
                    MyApp.setLocale(context, const Locale('ar'));
                  }
                }),
          ],
        )
      ]),
    );
  }
}
