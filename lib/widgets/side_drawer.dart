import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prog_languages/generated/l10n.dart';
import 'package:prog_languages/screens/requested_orders.dart';
import 'package:prog_languages/screens/settings.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key, required this.onLogout, required this.name});
  final String name;
  final void Function() onLogout;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.primary,
      child: Column(
        children: [
          const SizedBox(height: 44),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(70),
              color: Theme.of(context).colorScheme.secondaryContainer,
            ),
            child: Icon(
              Icons.person_outline_rounded,
              color: Theme.of(context).colorScheme.onTertiaryContainer,
              size: 70,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            name,
            style: GoogleFonts.aBeeZee(
              color: Theme.of(context).colorScheme.background,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: Container(
              color: Theme.of(context)
                  .colorScheme
                  .secondaryContainer
                  .withOpacity(0.7),
              child: Material(
                color: Theme.of(context)
                    .colorScheme
                    .background
                    .withOpacity(0.6)
                    .withAlpha(210),
                child: Column(children: [
                  const SizedBox(height: 14),
                  ListTile(
                    leading: Icon(
                      MaterialCommunityIcons.notebook,
                      size: 28,
                      color: Theme.of(context).colorScheme.onTertiaryContainer,
                    ),
                    title: Text(
                      S.of(context).MyOrders,
                      style: GoogleFonts.roboto(
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        color:
                            Theme.of(context).colorScheme.onTertiaryContainer,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) {
                            return const RequestedOrderScreen();
                          },
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.settings,
                      size: 28,
                      color: Theme.of(context).colorScheme.onTertiaryContainer,
                    ),
                    title: Text(
                      S.of(context).Settings,
                      style: GoogleFonts.roboto(
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        color:
                            Theme.of(context).colorScheme.onTertiaryContainer,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => const SettingsScreen()));
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.exit_to_app,
                      size: 28,
                      color: Theme.of(context).colorScheme.onTertiaryContainer,
                    ),
                    title: Text(
                      S.of(context).LogOut,
                      style: GoogleFonts.roboto(
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        color:
                            Theme.of(context).colorScheme.onTertiaryContainer,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      onLogout();
                    },
                  ),
                ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
