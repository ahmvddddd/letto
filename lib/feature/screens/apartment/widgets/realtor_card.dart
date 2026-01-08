import 'package:flutter/material.dart';
import '../../../../utils/constants/custom_sizes.dart';
import '../../../../utils/helper/helper_functions.dart';
import '../../../custom_widgets/containers/custom_container.dart';

class RealtorCard extends StatelessWidget {
  final String name;
  final String role;
  const RealtorCard({
    super.key,
    required this.name,
    required this.role,
    });

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.spaceBtwItems),
      child: CustomContainer(
        padding: Sizes.md,
        backgroundColor:
            dark
                ? Colors.white.withValues(alpha: 0.1)
                : Colors.black.withValues(alpha: 0.1),
        child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
      
            Row(
              children: [
                
            CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 20,
              child: Icon(Icons.person, size: Sizes.iconMd, color: Colors.white),
            ),
      
            const SizedBox(width: Sizes.md),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          name,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const SizedBox(width: 2),
                        Icon(Icons.verified, color: Colors.blue, size: 12),
                      ],
                    ),
                    Text(role, style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
      
                
              ],
            ),
            Icon(Icons.keyboard_arrow_down, size: Sizes.iconM),
          ],
        ),
      ),
    );
  }
}
