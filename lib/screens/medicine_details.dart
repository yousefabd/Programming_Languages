import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:prog_languages/data/medicine_order_list.dart';
import 'package:prog_languages/generated/l10n.dart';
import 'package:prog_languages/main.dart';
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
  bool _amountFieldVisible = false;
  final _formKey = GlobalKey<FormState>();
  int? _enteredAmount;
  bool _exceeded = false;
  String get _medicineCategory {
    switch (widget.medicine.category) {
      case MedCategory.antibiotic:
        return S.of(context).Antibiotic;
      case MedCategory.painReliever:
        return S.of(context).painReliever;
      case MedCategory.stimulant:
        return S.of(context).stimulant;
      case MedCategory.sadative:
        return S.of(context).sedative;
      case MedCategory.all:
        return S.of(context).All;
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
      if (currentOrder.containsKey(widget.medicine.id)) {
        if (currentOrder[widget.medicine.id] + _enteredAmount >
            widget.medicine.quantity) {
          setState(() {
            _exceeded = true;
          });
        } else {
          currentOrder.addEntries({
            MapEntry(widget.medicine.id,
                _enteredAmount! + currentOrder[widget.medicine.id])
          });
          Navigator.pop(context);
        }
      } else {
        currentOrder.addEntries({
          MapEntry(widget.medicine.id, _enteredAmount),
        });
        Navigator.pop(context);
      }
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
            constraints: const BoxConstraints(maxHeight: 250),
            child: Hero(
              tag: widget.medicine.id,
              child: Image(
                image: widget.medicine.image.image,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              //reverse: _amountFieldVisible,
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
                        S.of(context).medicineDetails,
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
                    padding:  EdgeInsets.only(
                      left: isArabic() ? 0:50,
                      right: isArabic() ? 50:0,
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
                            label: S.of(context).scientificName,
                            content: widget.medicine.sciName,
                          ),
                          MedicineDetailTile(
                            icon: Icons.store,
                            label: S.of(context).commercialName,
                            content: widget.medicine.marketName,
                          ),
                          MedicineDetailTile(
                            icon: Icons.menu_book,
                            label: S.of(context).category,
                            content: _medicineCategory,
                          ),
                          MedicineDetailTile(
                            icon: Icons.business,
                            label: S.of(context).company,
                            content: widget.medicine.company,
                          ),
                          MedicineDetailTile(
                            icon: Icons.format_list_bulleted_add,
                            label: S.of(context).quantity,
                            content: widget.medicine.quantity.toString(),
                          ),
                          MedicineDetailTile(
                              icon: Icons.schedule,
                              label: S.of(context).expirationDate,
                              content: widget.medicine.expireDate),
                          MedicineDetailTile(
                            icon: Icons.price_change_outlined,
                          label: S.of(context).price,
                          content: '${widget.medicine.price}    ${S.of(context).SP}',
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
                          S.of(context).AddtoCart,
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
                                const EdgeInsets.only(left: 120, right: 90),
                            child: TextFormField(
                              style: const TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              decoration:  InputDecoration(
                                contentPadding: const EdgeInsets.all(5),
                                border: const OutlineInputBorder(),
                                hintText: S.of(context).EnterAmount,
                              ),
                              validator: (value) {
                                if (value!.trim().isEmpty) {
                                  return '';
                                }
                                if (int.tryParse(value) == null) {
                                  return S.of(context).InvalidAmount;
                                }
                                if (int.parse(value) >
                                        widget.medicine.quantity ||
                                    _exceeded) {
                                  _exceeded = false;
                                  return S.of(context).AmountExceededAvailableQuantity;
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
