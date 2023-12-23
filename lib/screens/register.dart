import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prog_languages/data/url_data/auth_util.dart';
import 'package:prog_languages/generated/l10n.dart';
import 'package:prog_languages/widgets/submit_button.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String? firstName;

  String? lastName;

  String? number;

  String? password;

  String? email;

  String? address;

  bool _loading = false;

  List<String> errorList = ['', ''];
  void _validateRegister() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _loading = true;
      });
      final response = await http.post(
        Uri.parse('${url}register'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: json.encode(
          {
            'name': '${firstName!} ${lastName!}',
            'phoneNumber': number,
            'password': password,
            'address': address,
            'email': email,
            'isStoreOwner': false
          },
        ),
      );
      setState(() {
        _loading = false;
      });
      final Map<String, dynamic> listData = json.decode(response.body);
      try {
        final errorMap = listData['errors'] as Map;
        print(errorMap);
        for (final error in errorMap.entries) {
          if (error.key == 'email') {
            errorList[1] = error.value[0];
            print("error:${error.value[0]}\n");
          } else if (error.key == 'phoneNumber') {
            errorList[0] = error.value[0];
            print("error:${error.value[0]}\n");
          }
        }
        print(errorList);
        // ignore: empty_catches
      } catch (e) {}
      if (!context.mounted) {
        return;
      }
      if (_formKey.currentState!.validate()) {
        Navigator.of(context).pop();
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    _passwordController.dispose();
  }

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
            //resizeToAvoidBottomInset: false,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 50),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    S.of(context).createAccount,
                    style: GoogleFonts.acme(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                  ),

                  //start of TextFields --------------------
                  Expanded(
                    child: Form(
                      key: _formKey,
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          const SizedBox(height: 24),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 36),
                            child: TextFormField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                //  fillColor: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 246, 244, 244)),
                                prefixIcon: const Icon(Icons.person),
                                labelText: (S.of(context).FirstName),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              validator: (value) {
                                if (value!.trim().isEmpty) {
                                  return S.of(context).requiredField;
                                }
                                return null;
                              },
                              onSaved: (value) {
                                firstName = value;
                              },
                            ),
                          ), //first name
                          const SizedBox(height: 18),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 36),
                            child: TextFormField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                prefixIcon: const Icon(Icons.person),
                                labelText: (S.of(context).lastName),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              validator: (value) {
                                if (value!.trim().isEmpty) {
                                  return S.of(context).requiredField;
                                }
                                return null;
                              },
                              onSaved: (value) {
                                lastName = value;
                              },
                            ),
                          ), //last name
                          const SizedBox(height: 18),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 36),
                            child: TextFormField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                prefixIcon: const Icon(Icons.phone_android),
                                labelText: (S.of(context).phoneNumber),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value!.trim().isEmpty) {
                                  return S.of(context).requiredField;
                                } else if (value.contains('.') ||
                                    value.contains(',') ||
                                    value.trim().length != 10 ||
                                    value[0] != '0' ||
                                    value[1] != '9') {
                                  return S.of(context).enterValidPhoneNumber;
                                } else if (errorList[0] != '') {
                                  var a = errorList[0];
                                  errorList[0] = '';
                                  return a;
                                }
                                return null;
                              },
                              onSaved: (value) {
                                number = value;
                              },
                            ),
                          ), //phone number
                          const SizedBox(height: 18),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 36),
                            child: TextFormField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                prefixIcon:
                                    const Icon(Icons.alternate_email_rounded),
                                labelText: (S.of(context).Email),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value!.trim().isEmpty) {
                                  return S.of(context).requiredField;
                                } else if (!value.contains('@') ||
                                    !value.contains('.')) {
                                  return S.of(context).InvalidEmail;
                                } else if (errorList[1] != '') {
                                  var a = errorList[1];
                                  errorList[1] = '';
                                  return a;
                                }
                                return null;
                              },
                              onSaved: (value) {
                                email = value;
                              },
                            ),
                          ), //Email
                          const SizedBox(height: 18),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 36),
                            child: TextFormField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                prefixIcon: const Icon(Icons.house),
                                labelText: (S.of(context).Address),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              validator: (value) {
                                if (value!.trim().isEmpty) {
                                  return S.of(context).requiredField;
                                }
                                return null;
                              },
                              onSaved: (value) {
                                address = value;
                              },
                            ),
                          ), //address
                          const SizedBox(height: 18),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 36),
                            child: TextFormField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                prefixIcon: const Icon(Icons.lock),
                                labelText: (S.of(context).password),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              controller: _passwordController,
                              obscureText: true,
                              validator: (value) {
                                if (value!.trim().isEmpty) {
                                  return S.of(context).requiredField;
                                }
                                if (value.trim().length < 8) {
                                  return S.of(context).atLeastEight;
                                }
                                return null;
                              },
                              onSaved: (value) {
                                password = value;
                              },
                            ),
                          ), //password
                          const SizedBox(height: 18),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 36),
                            child: TextFormField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                prefixIcon: const Icon(Icons.lock),
                                labelText: (S.of(context).confirmPassword),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              obscureText: true,
                              validator: (value) {
                                if (value != _passwordController.text) {
                                  return S.of(context).PasswordsDoesnotMatch;
                                }
                                return null;
                              },
                            ),
                          ), //confirm Password
                          const SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ),
                  //End of TextFields --------------------
                  Center(
                    child: Column(
                      children: [
                        SubmitButton(
                          label: S.of(context).signup,
                          onPressed: _validateRegister,
                        ),
                        _loading == true
                            ? const CircularProgressIndicator()
                            : const SizedBox(),
                      ],
                    ),
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
