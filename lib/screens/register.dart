import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prog_languages/widgets/submit_button.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _numberController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPassController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Material(
            //used Material to fix black transparent color issue
            child: SvgPicture.asset(
              'assets/images/signup_border.svg', // new imge added here, got changed a little bit, but the size now is better, and the quiality ofc.
              fit: BoxFit.fill,
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            resizeToAvoidBottomInset: false,
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 120),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Create Account',
                    style: GoogleFonts.acme(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 24),
                  //start of TextFields --------------------
                  Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 36),
                          child: TextField(
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.person),
                              labelText: ('First Name'),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            controller: _firstNameController,
                          ),
                        ), //first name
                        const SizedBox(height: 18),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 36),
                          child: TextField(
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.person),
                              labelText: ('Last Name'),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            controller: _lastNameController,
                          ),
                        ), //last name
                        const SizedBox(height: 18),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 36),
                          child: TextField(
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.phone_android),
                              labelText: ('Phone Number'),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            controller: _numberController,
                          ),
                        ), //phone number
                        const SizedBox(height: 18),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 36),
                          child: TextField(
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.lock),
                              labelText: ('Password'),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            controller: _passwordController,
                          ),
                        ), //password
                        const SizedBox(height: 18),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 36),
                          child: TextField(
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.lock),
                              labelText: ('Confirm Password'),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            controller: _confirmPassController,
                          ),
                        ), //confirm Password
                        const SizedBox(height: 200),
                      ],
                    ),
                  ),
                  //End of TextFields --------------------
                  SubmitButton(
                    label: 'Sign Up',
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
