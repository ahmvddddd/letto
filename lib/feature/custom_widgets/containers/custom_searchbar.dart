import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../utils/helper/helper_functions.dart';

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
    final dark = HelperFunctions.isDarkMode(context);
    double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: screenWidth * 0.90,
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
    ),
          prefixIcon: Icon(Iconsax.search_favorite, color: dark ? Colors.white.withValues(alpha: 0.5) : Colors.black.withValues(alpha: 0.5)),
          hintText: 'search for houses',
          hintStyle: Theme.of(context).textTheme.labelSmall
        ),
      ),
    );
  }
}
