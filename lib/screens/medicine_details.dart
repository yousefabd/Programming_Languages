import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:prog_languages/models/medicine.dart';
import 'package:prog_languages/widgets/medicine_detail_tile.dart';

class MedicineDetailsScreen extends StatefulWidget {
  const MedicineDetailsScreen({super.key, required this.medicine});
  final Medicine medicine;

  @override
  State<MedicineDetailsScreen> createState() => _MedicineDetailsScreenState();
}

class _MedicineDetailsScreenState extends State<MedicineDetailsScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final _formatter = DateFormat.yMd();
  bool _amountFieldVisible = false;
  final _formKey = GlobalKey<FormState>();
  int? _enteredAmount;
  String get _medicineCategory {
    switch (widget.medicine.category) {
      case MedCategory.antibiotic:
        return 'Anti-Biotic';
      case MedCategory.painReliever:
        return 'Pain Reliever';
      case MedCategory.stimulant:
        return 'Stimulant';
      case MedCategory.sadative:
        return 'Sedative';
    }
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _enterAmount() {
    setState(() {
      _amountFieldVisible = true;
    });
  }

  void _submitAmount() {
    if (_formKey.currentState!.validate()) {
      Navigator.of(context).pop(_enteredAmount);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      appBar: AppBar(
        title: Text(widget.medicine.sciName),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 24),
          Container(
            color: Theme.of(context).colorScheme.background,
            child: Hero(
              tag: widget.medicine.id,
              child: Image(
                image: widget.medicine.image.image,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //const SizedBox(height: 20),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.assignment_rounded,
                        color: Theme.of(context).colorScheme.tertiary,
                        size: 32,
                      ),
                      Text(
                        'Medicine Details',
                        style: GoogleFonts.bitter(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(
                      left: 50,
                      top: 10,
                    ),
                    child: SlideTransition(
                      position: Tween(
                        begin: const Offset(-1, 0),
                        end: const Offset(0, 0),
                      ).animate(
                        CurvedAnimation(
                          parent: _animationController,
                          curve: Curves.easeInOut,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          MedicineDetailTile(
                            icon: Icons.science,
                            label: 'Scientific Name:  ',
                            content: widget.medicine.sciName,
                          ),
                          MedicineDetailTile(
                            icon: Icons.store,
                            label: 'Commercial Name: ',
                            content: widget.medicine.marketName,
                          ),
                          MedicineDetailTile(
                            icon: Icons.menu_book,
                            label: 'Category',
                            content: _medicineCategory,
                          ),
                          MedicineDetailTile(
                            icon: Icons.business,
                            label: 'Company: ',
                            content: widget.medicine.company,
                          ),
                          MedicineDetailTile(
                            icon: Icons.format_list_bulleted_add,
                            label: 'Quantity',
                            content: widget.medicine.quantity.toString(),
                          ),
                          MedicineDetailTile(
                            icon: Icons.schedule,
                            label: 'Expiration Date: ',
                            content:
                                _formatter.format(widget.medicine.expireDate),
                          ),
                          MedicineDetailTile(
                            icon: Icons.price_change_outlined,
                            label: 'Price: ',
                            content: '${widget.medicine.price}   S.P',
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.add_shopping_cart,
                        color: Theme.of(context).colorScheme.tertiary,
                        size: 50,
                      ),
                      const SizedBox(width: 6),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                        ),
                        onPressed: () {
                          if (_amountFieldVisible) {
                            _submitAmount();
                          } else {
                            _enterAmount();
                          }
                        },
                        child: Text(
                          'Add to Cart',
                          style: TextStyle(
                              fontSize: 18,
                              color: Theme.of(context).colorScheme.background),
                        ),
                      ),
                      const SizedBox(width: 22),
                    ],
                  ),
                  Form(
                    key: _formKey,
                    child: (_amountFieldVisible
                        ? Padding(
                            padding:
                                const EdgeInsets.only(left: 150, right: 110),
                            child: TextFormField(
                              style: const TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(5),
                                border: OutlineInputBorder(),
                                hintText: 'Enter Amount',
                              ),
                              validator: (value) {
                                if (value!.trim().isEmpty) {
                                  return '';
                                }
                                if (int.tryParse(value!) == null) {
                                  return 'Invalid amount';
                                }
                                _enteredAmount = int.parse(value);
                                return null;
                              },
                            ),
                          )
                        : const SizedBox(height: 3)),
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
