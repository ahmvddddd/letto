import 'package:flutter/material.dart';
import '../../../../utils/constants/custom_colors.dart';
import '../../../../utils/constants/custom_sizes.dart';
import '../../../../utils/helper/helper_functions.dart';

class ThreadCard extends StatelessWidget {
  final String name;
  final String title;
  final String content;
  final int comments;
  final String time;

  const ThreadCard({
    super.key,
    required this.name,
    required this.title,
    required this.content,
    required this.comments,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(Sizes.sm),
      decoration: BoxDecoration(
        color: dark ? CustomColors.dark : CustomColors.light,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: Sizes.sm),
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.labelLarge!.copyWith(color: CustomColors.alternate),
          ),
          const SizedBox(height: Sizes.sm),
          Text(content, style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: Sizes.xs),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(width: Sizes.xs),
              Text(time, style: Theme.of(context).textTheme.labelSmall),
            ],
          ),
        ],
      ),
    );
  }
}
