import 'package:flutter/material.dart';
import '../../../utils/constants/custom_colors.dart';
import '../../../utils/constants/custom_sizes.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final Color backgroundColor;
  final bool showBorder;
  final Color borderColor;
  final Widget child;
  const CustomButton({
    super.key,
    required this.onTap,
    this.backgroundColor = CustomColors.primary,
    this.showBorder = false,
    this.borderColor =  CustomColors.primary,
    required this.child
    });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(Sizes.spaceBtwItems),
        decoration: BoxDecoration(
          color: showBorder ? Colors.transparent : backgroundColor,
          borderRadius: BorderRadius.circular(Sizes.md),
          border: Border.all(
            color: showBorder ? borderColor : Colors.transparent,
          ),
        ),
        child: Center(
          child: child,
          ),
      ),
    );
  }
}