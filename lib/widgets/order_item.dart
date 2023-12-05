import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({
    super.key,
    required this.title,
    required this.status,
    required this.onTap,
  });
  final String title;
  final int status;
  final void Function(Widget) onTap;
  Widget _getStatus(int status) {
    switch (status) {
      case 0:
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Preparing',
              style: GoogleFonts.bitter(
                  color: Colors.pinkAccent, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(width: 4),
            const Icon(
              MaterialCommunityIcons.clock,
              color: Colors.pinkAccent,
            ),
          ],
        );
      case 1:
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Delivering',
              style: GoogleFonts.bitter(
                  color: Colors.indigo, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(width: 4),
            const Icon(
              MaterialCommunityIcons.truck_delivery,
              color: Colors.indigo,
              size: 26,
            ),
          ],
        );
      case 2:
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Received',
              style: GoogleFonts.bitter(
                  color: Colors.green, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(width: 4),
            const Icon(
              Icons.check_circle_outline,
              color: Colors.green,
              size: 26,
            ),
          ],
        );
      default:
        return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 28),
      child: InkWell(
        onTap: () {
          onTap(_getStatus(status));
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
          decoration: BoxDecoration(
            border: Border.all(
              style: BorderStyle.solid,
              color: Theme.of(context).colorScheme.tertiary,
              width: 4,
            ),
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).colorScheme.secondaryContainer,
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.sticky_note_2,
                  size: 32,
                  color: Colors.orange,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                  width: 100,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    title,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.background),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(width: 8),
                Icon(
                  Icons.pending_outlined,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(0.9),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    'Status:',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.background),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Spacer(),
                _getStatus(status),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
