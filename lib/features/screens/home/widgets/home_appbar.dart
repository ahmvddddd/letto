import 'package:flutter/material.dart';
import '../../../../utils/constants/custom_sizes.dart';
import '../../../../utils/constants/custom_images.dart';
import '../../../../utils/helper/helper_functions.dart';
import '../../../custom_widgets/containers/custom_container.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    final dark = HelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //avatar and greetings
        Row(
          children: [
            CustomContainer(
              width: screenHeight * 0.06,
              height: screenHeight * 0.06,
              radius: 100,
              backgroundColor: dark
                  ? Colors.white.withValues(alpha: 0.2)
                  : Colors.black.withValues(alpha: 0.2),
              padding: Sizes.xs,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Center(
                  child: Image.asset(
                    CustomImages.avatarM1,
                    fit: BoxFit.contain,
                    height: screenHeight * 0.06,
                  ),
                ),
              ),
            ),

            const SizedBox(width: Sizes.sm),
            Column(
              children: [
                Text('Hi, Ahmad', style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ],
        ),

        //notifications
        CustomContainer(
          backgroundColor: dark
              ? Colors.white.withValues(alpha: 0.2)
              : Colors.black.withValues(alpha: 0.2),
          radius: 100,
          padding: Sizes.xs,
          child: Center(
            child: GestureDetector(
              onTap: () {},
              child: Stack(
                children: [
                  const Icon(Icons.notifications, size: Sizes.iconLg - 4),
                  Positioned(
                    right: -0.3,
                    child: Container(
                      width: 15,
                      height: 15,
                      padding: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.red[900],
                      ),
                      child: Center(
                        child: Text(
                          '3',
                          style: Theme.of(context).textTheme.labelSmall!
                              .copyWith(color: Colors.white, fontSize: 8),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
