import 'package:flutter/material.dart';
import '../../../utils/constants/custom_colors.dart';
import '../../../utils/constants/custom_sizes.dart';

class CustomButton extends StatelessWidget {
  final bool disabled;
  final VoidCallback? onTap;
  final Color backgroundColor;
  final bool showBorder;
  final Color borderColor;
  final Widget child;
  const CustomButton({
    super.key,
    this.disabled = false,
    this.onTap,
    this.backgroundColor = CustomColors.primary,
    this.showBorder = false,
    this.borderColor = CustomColors.primary,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(Sizes.spaceBtwItems),
      child: SizedBox(
        height: screenHeight * 0.06,
        width: double.infinity,
        child: InkWell(
          onTap: disabled ? null : onTap,
          highlightColor: CustomColors.primary,
          child: Container(
            padding: const EdgeInsets.all(Sizes.sm),
            decoration: BoxDecoration(
              color: disabled
                  ? CustomColors.primary.withValues(alpha: 0.3)
                  : showBorder
                  ? Colors.transparent
                  : backgroundColor,
              borderRadius: BorderRadius.circular(Sizes.md),
              border: Border.all(
                color: disabled
                    ? CustomColors.primary.withValues(alpha: 0.3)
                    : showBorder
                    ? borderColor
                    : Colors.transparent,
              ),
            ),
            child: Center(child: child),
          ),
        ),
      ),
    );
  }
}
