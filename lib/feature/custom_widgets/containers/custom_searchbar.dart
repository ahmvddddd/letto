import 'package:flutter/material.dart';
import '../../../utils/helper/helper_functions.dart';
import 'custom_container.dart';

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
    double screenHeight = MediaQuery.of(context).size.height;
    return CustomContainer(
      width: screenWidth * 0.85,
      height: screenHeight * 0.06,
      padding: 0.5,
      backgroundColor: Colors.transparent,
      showBorder: true,
      borderColor: dark ? Colors.white.withValues(alpha: 0.3) : Colors.black.withValues(alpha: 0.3),
      radius: 50,
      child: Center(
        child: TextField(
          controller: controller,
          onChanged: onChanged,
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search, color: dark ? Colors.white.withValues(alpha: 0.5) : Colors.black.withValues(alpha: 0.5)),
          ),
        ),
      ),
    );
  }
}
