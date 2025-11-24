import 'package:flutter/material.dart';
import '../../../../utils/constants/custom_sizes.dart';
import '../../../../utils/helper/helper_functions.dart';

class ApartmentInfo extends StatelessWidget {
  const ApartmentInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(Sizes.spaceBtwItems),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: 
            dark
                ? Colors.white.withValues(alpha: 0.1)
                : Colors.black.withValues(alpha: 0.1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "About this home",
            style: Theme.of(context).textTheme.bodyMedium
          ),
          SizedBox(height: 8),
          Text(
            "Perfectly nestled in a serene setting, this charming unit features 2 spacious bedrooms and modern amenities…",
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}