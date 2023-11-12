import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({super.key});
  final _numberController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          foregroundDecoration: BoxDecoration(
            image: DecorationImage(
                image: Image.asset('assets/images/logs.png').image,
                fit: BoxFit.fill),
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Hello!",
                style: GoogleFonts.bitter(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontWeight: FontWeight.bold,
                    fontSize: 65),
              ),
              Text(
                "Sign in to your account",
                style: GoogleFonts.bitter(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: TextField(
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  controller: _numberController,
                  decoration: const InputDecoration(
                    label: Row(children: [
                      Icon(Icons.phone_android),
                      SizedBox(width: 8),
                      Text('Phone Number')
                    ]),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    label: Row(children: [
                      Icon(Icons.lock),
                      SizedBox(width: 8),
                      Text('Password')
                    ]),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
