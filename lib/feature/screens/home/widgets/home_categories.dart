import 'package:flutter/material.dart';

import '../../../../utils/constants/custom_sizes.dart';
import '../../../../utils/helper/helper_functions.dart';
import '../../../custom_widgets/containers/custom_container.dart';
import '../../../custom_widgets/layout/custom_list_view.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return CustomListView(
      sizedBoxHeight: screenHeight * 0.06,
      scrollDirection: Axis.horizontal,
      itemCount: 3,
      seperatorBuilder: (context, index) {
        return const SizedBox(width: Sizes.sm);
      },
      itemBuilder: (context, index) {
        return CustomContainer(
          width: screenWidth * 0.23,
          backgroundColor: dark ? Colors.black : Colors.white,
          radius: 50,
          padding: Sizes.sm,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              spreadRadius: 0.5,
              offset: Offset(4, 6),
            ),
          ],
          child: Center(
            child: Text(
              'Category',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: dark ? Colors.white : Colors.black,
              ),
            ),
          ),
        );
      },
    );
  }
}
