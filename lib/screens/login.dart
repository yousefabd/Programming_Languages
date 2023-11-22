import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prog_languages/widgets/submit_button.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({
    super.key,
    required this.onRegisterAccount,
    required this.onLoginAccount,
  });
  final void Function() onRegisterAccount;
  final void Function(String, String) onLoginAccount;

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _numberController = TextEditingController();
  final _passwordController = TextEditingController();
  String? errorNumber;
  String? errorPassword;
  void _validateLogin() {
    String number = _numberController.text;
    bool success = true;
    if (number.length < 10 ||
        number.contains(',') ||
        number.contains('.') ||
        number[0] != '0' ||
        number[1] != '9') {
      errorNumber = 'Please enter a valid phone number';
      success = false;
    } else {
      errorNumber = null;
    }
    if (_passwordController.text != '12345678' && success) {
      errorPassword = 'Incorrect Password';
      success = false;
    } else {
      errorPassword = null;
    }

    setState(() {});
    if (success) {
      widget.onLoginAccount(_numberController.text, _passwordController.text);
    }
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
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: const Icon(Icons.phone_android),
                          errorText: errorNumber,
                          label: const Text('Phone Number'),
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
                        obscureText: true,
                        controller: _passwordController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: const Icon(Icons.lock),
                          label: const Text('Password'),
                          errorText: errorPassword,
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),
                    SubmitButton(
                      label: "Sign In",
                      onPressed: () {
                        _validateLogin();
                      },
                    ),
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
                          onPressed: widget.onRegisterAccount,
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
