import 'package:flutter/material.dart';
import '../../../../utils/constants/custom_colors.dart';
import '../../../../utils/constants/custom_sizes.dart';
import '../../../../utils/helper/helper_functions.dart';
import '../../../custom_widgets/containers/custom_container.dart';

class AgentReviewCard extends StatelessWidget {
  final String name;
  final String time;
  final int rating;
  final String review;

  const AgentReviewCard({
    required this.name,
    required this.time,
    required this.rating,
    required this.review,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return CustomContainer(
      backgroundColor: dark ? CustomColors.dark : CustomColors.light,
      padding: Sizes.spaceBtwItems,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name, style: Theme.of(context).textTheme.bodyMedium),
              Text(time, style: Theme.of(context).textTheme.labelMedium),
            ],
          ),
          const SizedBox(height: Sizes.sm),
          Row(
            children: List.generate(
              5,
              (index) => Icon(
                Icons.star,
                size: Sizes.iconSm,
                color: index < rating ? Colors.amber : Colors.grey.shade300,
              ),
            ),
          ),
          const SizedBox(height: Sizes.sm),
          Text(review, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}
