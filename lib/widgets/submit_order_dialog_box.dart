import 'package:flutter/material.dart';

class SubmitOrderDialogBox extends StatefulWidget {
  SubmitOrderDialogBox({super.key});

  @override
  State<SubmitOrderDialogBox> createState() => _SubmitOrderDialogBoxState();
}

class _SubmitOrderDialogBoxState extends State<SubmitOrderDialogBox> {
  final _formKey = GlobalKey<FormState>();

  String? orderName;

  void _submitOrder() {
    if (_formKey.currentState!.validate()) {
      Navigator.of(context).pop(orderName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration:
                    const InputDecoration(hintText: 'Enter Order Name..'),
                maxLength: 10,
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return 'Empty name';
                  }
                  orderName = value;
                  return null;
                },
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('cancel')),
                  ElevatedButton(
                      onPressed: _submitOrder, child: const Text('submit')),
                ],
              )
            ],
          )),
    );
  }
}
