import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/custom_colors.dart';
import '../../../../utils/constants/custom_sizes.dart';
import '../../../../utils/helper/helper_functions.dart';
import '../../../custom_widgets/containers/custom_container.dart';

class RecentCard extends StatelessWidget {
  const RecentCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return CustomContainer(
      padding: Sizes.md,
      borderColor: Colors.transparent,
      backgroundColor: dark ? CustomColors.dark : CustomColors.light,
      showBorder: true,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Icon(Iconsax.picture_frame, size: 32, color: CustomColors.alternate,),
          ),

          const SizedBox(width: Sizes.xs,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Property Name',
              style: Theme.of(context).textTheme.labelMedium,),
              Text('address',
              style: Theme.of(context).textTheme.labelSmall,)
            ],
          ),

          const Spacer(),
              Text('Price',
              style: Theme.of(context).textTheme.labelMedium,)
        ],
      ),
    );
  }
}