import 'package:flutter/material.dart';
import '../../../utils/constants/custom_colors.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    this.child,
    this.width,
    this.height,
    this.radius = 400,
    this.padding = 0,
    this.margin,
    this.backgroundColor = CustomColors.primary,
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
        color: backgroundColor,
        boxShadow: boxShadow,
        gradient: gradient,
      ),
      child: child,
    );
  }
}
