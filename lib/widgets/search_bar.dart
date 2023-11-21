import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:prog_languages/models/medicine.dart';

class MySearchBar extends StatefulWidget {
  MySearchBar(
      {super.key, required this.onSearch, required this.onSelectCategory});
  final void Function() onSearch;
  final void Function(MedCategory) onSelectCategory;

  @override
  State<MySearchBar> createState() => _MySearchBarState();
}

class _MySearchBarState extends State<MySearchBar> {
  final _searchController = TextEditingController();
  MedCategory _selectedCategory = MedCategory.painReliever;
  String getCategoryName(MedCategory c) {
    switch (c) {
      case MedCategory.antibiotic:
        return 'Antibiotic';
      case MedCategory.painReliever:
        return 'Pain Reliever';
      case MedCategory.stimulant:
        return 'Stimulant';
      case MedCategory.sadative:
        return 'Sedative';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: SearchBar(
            controller: _searchController,
            hintText: 'Search...',
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