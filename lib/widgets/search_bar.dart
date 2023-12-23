import 'package:flutter/material.dart';
import 'package:prog_languages/generated/l10n.dart';
import 'package:prog_languages/models/medicine.dart';

class MySearchBar extends StatefulWidget {
  MySearchBar(
      {super.key, required this.onSearch, required this.onSelectCategory});
  final void Function(String) onSearch;
  final void Function(MedCategory) onSelectCategory;

  @override
  State<MySearchBar> createState() => _MySearchBarState();
}

class _MySearchBarState extends State<MySearchBar> {
  MedCategory _selectedCategory = MedCategory.painReliever;
  String getCategoryName(MedCategory c) {
    switch (c) {
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
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: SearchBar(
            hintText: S.of(context).search,
            onSubmitted: widget.onSearch,
            leading: const Icon(Icons.search),
          ),
        ),
        const SizedBox(width: 8),
        DropdownButton(
            value: _selectedCategory,
            items: MedCategory.values
                .map((category) => DropdownMenuItem(
                    value: category, child: Text(getCategoryName(category))))
                .toList(),
            onChanged: (newCategory) {
              if (newCategory == null) {
                return;
              }
              setState(() {
                _selectedCategory = newCategory;
              });
              widget.onSelectCategory(newCategory);
            })
      ],
    );
  }
}
