import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prog_languages/data/url_data/auth_util.dart';
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
  bool _loading = false;
  int responseCode = 200;
  void _validateLogin() async {
    responseCode = 200;
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _loading = true;
      });
      final response = await http.post(
        Uri.parse('${url}login'),
        body: {'phoneNumber': _number, 'password': _password},
      );
      setState(() {
        _loading = false;
      });
      final Map listData = json.decode(response.body);
      if (response.statusCode == 200) {
        print(listData['access_token']);
        AuthUtility.setToken(listData['access_token']);
      }
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
      backgroundColor: Theme.of(context).colorScheme.background,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            SvgPicture.asset(
              'assets/images/login_border.png', // new imge added here, got changed a little bit, but the size now is better, and the quiality ofc.
              fit: BoxFit.fill,
            ),
            Center(
              child: Material(
                /*When we used a stack with background image, some Material features were gone, like splash effect
                in InkWell when it's tapped, so we wrapped the Column with Material with an invisible color just 
                to get those features back!*/
                color:
                    Theme.of(context).colorScheme.background.withOpacity(0.5),
                child: Form(
                  key: _formKey,
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const SizedBox(
                        height: 130,
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
                        S.of(context).signIn,
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
                          decoration: InputDecoration(
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
                          decoration: InputDecoration(
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
                            if (responseCode == 401) {
                              return S.of(context).WrongPhoneOrPass;
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
                          //widget.onLoginAccount('number', 'Yousef');
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
                            S.of(context).dontHaveAccount,
                            style: TextStyle(
                                fontSize: 14,
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                                fontWeight: FontWeight.w500),
                          ),
                          TextButton(
                            onPressed: widget.onRegisterAccount,
                            child: Text(
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
