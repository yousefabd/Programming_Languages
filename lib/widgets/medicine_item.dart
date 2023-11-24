import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:prog_languages/models/medicine.dart';
import 'package:prog_languages/widgets/medicine_item_trait.dart';

class MedicineItem extends StatefulWidget {
  const MedicineItem(
      {required this.medicine, required this.onPushDetails, super.key});
  final Medicine medicine;
  final void Function() onPushDetails;

  @override
  State<MedicineItem> createState() => _MedicineItemState();
}

class _MedicineItemState extends State<MedicineItem> {
  bool _favorite = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.secondaryContainer,
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
      child: Stack(
        children: [
          InkWell(
            onTap: widget.onPushDetails,
            onDoubleTap: () {
              setState(() {
                _favorite = !_favorite;
              });
            },
            child: Hero(
              tag: widget.medicine.id,
              child: Image(
                image: widget.medicine.image.image,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: MedicineItemTrait(medicine: widget.medicine),
          ),
          Positioned(
            left: 10,
            top: 10,
            child: IconButton(
              icon: Icon(
                MaterialCommunityIcons.heart,
                size: 42,
                color: (!_favorite
                    ? const Color.fromARGB(255, 105, 105, 105)
                    : Colors.pink.shade400),
              ),
              onPressed: () {
                setState(() {
                  _favorite = !_favorite;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
