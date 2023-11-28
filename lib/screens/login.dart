import 'dart:convert';

import 'package:http/http.dart' as http;
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
  final _formKey = GlobalKey<FormState>();
  String? _number;
  String? _password;
  bool _loading = false;
  int responseCode = 200;
  void _validateLogin() async {
    responseCode = 200;
    if (_formKey.currentState!.validate()) {
      final tempUrl = Uri.parse('http://10.0.2.2:8000/api/login');
      _formKey.currentState!.save();
      setState(() {
        _loading = true;
      });
      final response = await http.post(
        tempUrl,
        body: {'phoneNumber': _number, 'password': _password},
      );
      setState(() {
        _loading = false;
      });
      print(json.decode(response.body));
      responseCode = response.statusCode;
      if (_formKey.currentState!.validate()) {
        final infoList = json.decode(response.body) as Map;
        widget.onLoginAccount(_number!, infoList['name']);
        _formKey.currentState!.reset();
      }
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
                child: Form(
                  key: _formKey,
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
                        child: TextFormField(
                          style: const TextStyle(fontSize: 20),
                          textAlign: TextAlign.start,
                          keyboardType: TextInputType.number,
                          maxLength: 10,
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: Icon(Icons.phone_android),
                            label: Text('Phone Number'),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return 'This field is required';
                            } else if (value.contains('.') ||
                                value.contains(',') ||
                                value.trim().length < 10 ||
                                value[0] != '0' ||
                                value[1] != '9') {
                              return 'Please enter a valid phone number';
                            } else if (responseCode == 401) {
                              return '';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _number = value;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 15),
                        child: TextFormField(
                          style: const TextStyle(fontSize: 20),
                          obscureText: true,
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: Icon(Icons.lock),
                            label: Text('Password'),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return 'This field is requireed';
                            }
                            if (responseCode == 401) {
                              return 'Wrong phone number or password';
                            }
                            return null;
                          },
                          onSaved: (value) => _password = value,
                        ),
                      ),
                      const SizedBox(height: 14),
                      SubmitButton(
                        label: "Sign In",
                        onPressed: () {
                          //_validateLogin();
                          widget.onLoginAccount('number', 'Yousef');
                        },
                      ),
                      (_loading == false
                          ? const SizedBox(height: 80)
                          : const Column(
                              children: [
                                SizedBox(height: 20),
                                CircularProgressIndicator(),
                                SizedBox(height: 20)
                              ],
                            )),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Don\'t have an account?',
                            style: TextStyle(
                                fontSize: 14,
                                color:
                                    Theme.of(context).colorScheme.onBackground,
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
            ),
          ],
        ),
      ),
    );
  }
}
