import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../utils/constants/custom_colors.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onFilterPressed;
  final ValueChanged<String>? onChanged;

  const CustomSearchBar({
    super.key,
    required this.controller,
    required this.onFilterPressed,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: CustomColors.primary),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: const Icon(FontAwesomeIcons.searchengin, color: CustomColors.primary),
          hintText: 'Search',
          suffixIcon: IconButton(
            icon: const Icon(FontAwesomeIcons.filter, color: CustomColors.primary),
            onPressed: onFilterPressed,
          ),
        ),
      ),
    );
  }
}
