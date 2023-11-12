import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                image: Image.asset('assets/images/login_border.png').image,
                fit: BoxFit.fill),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _numberController,
                keyboardType: TextInputType.number,
                maxLength: 10,
                decoration: const InputDecoration(
                    label: Text('Phone Number'), border: OutlineInputBorder()),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                    label: Text('Password'), border: OutlineInputBorder()),
              ),
              SizedBox(
                  height: 60,
                  width: 120,
                  child: ElevatedButton(
                      onPressed: () {
                        print(_numberController.text);
                        print(_passwordController.text);
                      },
                      child: const Text(
                        'LOG IN',
                        style: TextStyle(fontSize: 25),
                      )))
            ],
          ),
        ),
      ]),
    );
  }
}
