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
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: dark ? Colors.white.withValues(alpha: 0.1) : Colors.black.withValues(alpha: 0.1),
      ),
      child: CustomContainer(
        width: screenWidth * 0.90,
        radius: 30,
        padding: Sizes.xs,
        backgroundColor: Colors.transparent,
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Sizes.sm),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomContainer(
                          padding: Sizes.sm,
                          radius: 50,
                          backgroundColor:
                              dark
                                  ? Colors.black
                                : Colors.white,
                          child: Text(
                            'Top Listing',
                            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                                  color: dark ? Colors.white : Colors.black,)
                          ),
                        ),
                    
                        CustomContainer(
                          padding: Sizes.sm,
                          radius: 100,
                          backgroundColor:
                              dark
                                  ? Colors.black.withValues(alpha: 0.8)
                                : Colors.white.withValues(alpha: 0.8),
                          child: Icon(Icons.favorite,
                          color: dark ? Colors.white : Colors.black,),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          
                const SizedBox(height: Sizes.sm,),
                Padding(
                  padding: const EdgeInsets.all(Sizes.sm),
                  child: Row(children: [
                    Text('Apartment A1',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold),)
                  ],),
                ),

                const SizedBox(height: Sizes.sm,),
          ],
        ),
      ),
    );
  }
}
