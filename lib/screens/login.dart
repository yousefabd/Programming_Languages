import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prog_languages/generated/l10n.dart';
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
  void _validateLogin() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final tempUrl = Uri.https(
          'flutter-prep-675a4-default-rtdb.firebaseio.com', 'login.json');
      await http.post(
        tempUrl,
        headers: {
          'Content_Type': 'application/json',
        },
        body: json.encode(
          {'phone-number': _number, 'password': _password},
        ),
      );
      widget.onLoginAccount(_number!, _password!);
      _formKey.currentState!.reset();
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
                        S.of(context).hello,
                        style: GoogleFonts.bitter(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontWeight: FontWeight.bold,
                          fontSize: 65,
                        ),
                      ),
                      Text(
                        S.of(context).login,
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
                          decoration:  InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: const Icon(Icons.phone_android),
                            label: Text(S.of(context).phoneNumber),
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return S.of(context).requiredField;
                            } else if (value.contains('.') ||
                                value.contains(',') ||
                                value.trim().length < 10 ||
                                value[0] != '0' ||
                                value[1] != '9') {
                              return S.of(context).enterValidPhoneNumber;
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
                          decoration:  InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: const Icon(Icons.lock),
                            label: Text(S.of(context).password),
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return S.of(context).requiredField;
                            }
                            return null;
                          },
                          onSaved: (value) => _password = value,
                        ),
                      ),
                      const SizedBox(height: 14),
                      SubmitButton(
                        label: S.of(context).logIn,
                        onPressed: () {
                          _validateLogin();
                        },
                      ),
                      const SizedBox(height: 80),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            S.of(context).dontHaveAccount,
                            style: TextStyle(
                                fontSize: 14,
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                                fontWeight: FontWeight.w500),
                          ),
                          TextButton(
                            onPressed: widget.onRegisterAccount,
                            child:  Text(
                              S.of(context).create,
                              style: const TextStyle(
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
