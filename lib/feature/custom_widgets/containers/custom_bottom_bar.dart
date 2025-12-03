import 'package:flutter/material.dart';
import '../../../utils/helper/helper_functions.dart';
import '../../../utils/constants/custom_colors.dart';

class CustomBottomBar extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;
  const CustomBottomBar({
    super.key, 
    required this.child,
    required this.onTap
    });

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: CustomColors.primary,
            boxShadow: [
              BoxShadow(
                color:
                    dark
                        ? Colors.black.withValues(alpha: 0.5)
                        : Colors.white.withValues(alpha: 0.5),
                spreadRadius: 2,
                blurRadius: 10,
                offset: Offset(4, 4),
              ),
            ],
          ),
          child: Center(child: child),
        ),
      ),
    );
  }
}
