import 'package:flutter/material.dart';
import '../../../../utils/constants/custom_colors.dart';
import '../../../../utils/constants/custom_sizes.dart';

class ReviewsContainer extends StatelessWidget {
  const ReviewsContainer({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: onTap,
      child: Container(
        width: screenWidth * 0.38,
        height: screenHeight * 0.08,
        padding: const EdgeInsets.all(Sizes.sm),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: CustomColors.primary,
            width: 2
          )
        ),
        child: Row(
          children: [
            const Icon(Icons.star, size: Sizes.iconM,),
            const SizedBox(width: 12),
            Text("View Reviews", style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
      ),
    );
  }
}
