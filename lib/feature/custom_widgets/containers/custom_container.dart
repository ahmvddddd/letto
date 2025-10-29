import 'package:flutter/material.dart';
import '../../../utils/constants/custom_colors.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    this.child,
    this.width,
    this.height,
    this.radius = 16,
    this.padding = 0,
    this.margin,
    this.backgroundColor = CustomColors.primary,
  this.showBorder = false,
  this.borderColor = CustomColors.borderPrimary,
    this.boxShadow,
    this.gradient,
  });

  final double? width;
  final double? height;
  final double radius;
  final double padding;
  final EdgeInsets? margin;
  final Widget? child;
  final Color backgroundColor;
  final bool showBorder;
  final Color borderColor;
  final List<BoxShadow>? boxShadow;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        border: showBorder ? Border.all(color: borderColor) : null,
        color: backgroundColor,
        boxShadow: boxShadow,
        gradient: gradient,
      ),
      child: child,
    );
  }
}
