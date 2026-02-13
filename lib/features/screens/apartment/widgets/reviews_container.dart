import 'package:flutter/material.dart';

import '../../../../utils/constants/custom_colors.dart';
import '../../../../utils/constants/custom_sizes.dart';
import '../../../../utils/helper/helper_functions.dart';

class ReviewsContainer extends StatelessWidget {
  const ReviewsContainer({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return InkWell(
      highlightColor: CustomColors.primary,
      onTap: () {
        // navigate to reviews screen
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: dark ? CustomColors.dark : CustomColors.light,
        ),
        child: Row(
          children: [
            const Icon(Icons.rate_review_outlined, size: Sizes.iconMd,),
            const SizedBox(width: 12),
            Text(
              "View Reviews",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios, size: Sizes.iconSm),
          ],
        ),
      ),
    );
  }
}
