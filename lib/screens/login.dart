import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({super.key});
  final _numberController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medical Bay',
            style: GoogleFonts.croissantOne(color: Colors.white)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 60),
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
            Container(
              padding: const EdgeInsets.only(left: 180),
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Forgot Password?',
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Container(
                height: 60,
                width: 120,
                child: ElevatedButton(
                    onPressed: () {
                      print(_numberController.text);
                      print(_passwordController.text);
                    },
                    child: Text(
                      'Sign in',
                      style: TextStyle(fontSize: 25),
                    )))
          ],
        ),
      ),
    );
  }
}
