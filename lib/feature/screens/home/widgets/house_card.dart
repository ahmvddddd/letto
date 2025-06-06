import 'package:flutter/material.dart';

import '../../../../utils/constants/custom_sizes.dart';
import '../../../../utils/constants/images.dart';
import '../../../../utils/helper/helper_functions.dart';
import '../../../custom_widgets/containers/custom_container.dart';

class HouseCard extends StatelessWidget {
  const HouseCard({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final dark = HelperFunctions.isDarkMode(context);
    return CustomContainer(
      width: screenWidth * 0.90,
      radius: 50,
      padding: Sizes.xs,
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Center(
                  child: Image.asset(
                    Images.apartment,
                    height: screenHeight * 0.25,
                    width: screenWidth * 0.90,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              Positioned(
                top: 10,
                left: 5,
                right: 5,
                child: Row(
                  children: [
                    CustomContainer(
                      padding: Sizes.sm,
                      radius: 50,
                      backgroundColor:
                          dark
                              ? Colors.white.withValues(alpha: 0.1)
                              : Colors.black.withValues(alpha: 0.1),
                      child: Text(
                        'Top Listing',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),

                    CustomContainer(
                      padding: Sizes.sm,
                      radius: 100,
                      backgroundColor:
                          dark
                              ? Colors.white.withValues(alpha: 0.1)
                              : Colors.black.withValues(alpha: 0.1),
                      child: Icon(Icons.favorite),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
