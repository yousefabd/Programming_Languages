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
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SvgPicture.asset(
            'assets/images/svborders.svg', // new imge added here, got changed a little bit, but the size now is better, and the quiality ofc.
            fit: BoxFit.fill,
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
                    fontSize: 65,
                  ),
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
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40, vertical: 20),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                    controller: _numberController,
                    decoration: const InputDecoration(
                      label: Row(mainAxisSize: MainAxisSize.min,children: [
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
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40, vertical: 20),
                  child: TextField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      label: Row(mainAxisSize: MainAxisSize.min,children: [
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
                SizedBox(
                  width: 280, 
                  height: 100, 
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        //
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 49, 237, 237), 
                        foregroundColor: Colors.black, 
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: const BorderSide(
                            color: Color.fromARGB(255, 49, 237, 237), 
                          ),
                        ),
                      ),
                      child: Text(
                        'Sign In',
                        style: GoogleFonts.bitter(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
