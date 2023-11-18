import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prog_languages/widgets/submit_button.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({super.key});
  final _numberController = TextEditingController();
  final _passwordController = TextEditingController();

  //function to Sign in and switch to User's account
  void _logInAccount() {
    //Handling login logic will be added here later

    print('Log in account button pressed');
  }

  void _registerAccount() {
    print('Create Account button pressed');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            SvgPicture.asset(
              'assets/images/svborders.svg', // new imge added here, got changed a little bit, but the size now is better, and the quiality ofc.
              fit: BoxFit.fill,
            ),
            Center(
              child: Material(
                /*When we used a stack with background image, some Material features were gone, like splash effect
                in InkWell when it's tapped, so we wrapped the Column with Material with an invisible color just 
                to get those features back!*/
                color: Colors.transparent,
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const SizedBox(
                      height: 150,
                    ),
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
                          horizontal: 40, vertical: 15),
                      child: TextField(
                        style: const TextStyle(fontSize: 20),
                        textAlign: TextAlign.start,
                        keyboardType: TextInputType.number,
                        maxLength: 10,
                        controller: _numberController,
                        decoration: const InputDecoration(
                          label: Row(mainAxisSize: MainAxisSize.min, children: [
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
                          horizontal: 40, vertical: 15),
                      child: TextField(
                        style: const TextStyle(fontSize: 20),
                        controller: _passwordController,
                        decoration: const InputDecoration(
                          label: Row(mainAxisSize: MainAxisSize.min, children: [
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
                    const SizedBox(height: 14),
                    SubmitButton(label: "Sign In", onPressed: _logInAccount),
                    const SizedBox(height: 80),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Don\'t have an account?',
                          style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).colorScheme.onBackground,
                              fontWeight: FontWeight.w500),
                        ),
                        TextButton(
                          onPressed: _registerAccount,
                          child: const Text(
                            'Create',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
