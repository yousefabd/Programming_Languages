import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prog_languages/screens/requested_orders.dart';

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
            child: const Icon(
              Icons.person,
              size: 70,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            name,
            style: GoogleFonts.aBeeZee(
              color: Theme.of(context).colorScheme.primaryContainer,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: Container(
              color: Theme.of(context).colorScheme.secondaryContainer,
              child: Material(
                color: Theme.of(context).colorScheme.secondaryContainer,
                child: Column(children: [
                  const SizedBox(height: 14),
                  ListTile(
                    leading: Icon(
                      MaterialCommunityIcons.notebook,
                      size: 28,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    title: Text(
                      'My orders',
                      style: GoogleFonts.bitter(
                        fontSize: 28,
                        color: Theme.of(context).colorScheme.primary,
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
                      Icons.exit_to_app,
                      size: 28,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    title: Text(
                      'Log out',
                      style: GoogleFonts.bitter(
                        fontSize: 28,
                        color: Theme.of(context).colorScheme.primary,
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
