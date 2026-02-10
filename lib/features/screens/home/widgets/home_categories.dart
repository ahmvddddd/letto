import 'package:flutter/material.dart';
import '../../../../utils/constants/custom_sizes.dart';
import '../../../../utils/constants/custom_images.dart';
import '../../../../utils/helper/helper_functions.dart';
import '../../../custom_widgets/containers/custom_container.dart';
import '../../../custom_widgets/layout/custom_list_view.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    double screenHeight = MediaQuery.of(context).size.height;
    final List<String> backgroundImage = [
      CustomImages.apartment,
      CustomImages.condominium,
      CustomImages.duplex,
    ];
    final List<String> categories = ["Apartment", "Condominium", "Duplex"];
    return CustomListView(
      sizedBoxHeight: screenHeight * 0.07,
      scrollDirection: Axis.horizontal,
      itemCount: 3,
      seperatorBuilder: (context, index) {
        return const SizedBox(width: Sizes.sm);
      },
      itemBuilder: (context, index) {
        return CustomContainer(
          height: screenHeight * 0.05,
          backgroundColor: dark
              ? Colors.white.withValues(alpha: 0.1)
              : Colors.black.withValues(alpha: 0.1),
          radius: 50,
          padding: Sizes.xs,
          // boxShadow: [
          //   BoxShadow(
          //     color: CustomColors.darkerGrey,
          //     blurRadius: 2,
          //     spreadRadius: 0.2,
          //     offset: Offset(4, 3),
          //   ),
          // ],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(backgroundImage: AssetImage(backgroundImage[index])),
              const SizedBox(width: Sizes.xs),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Sizes.sm),
                child: Text(
                  categories[index],
                  style: Theme.of(
                    context,
                  ).textTheme.labelSmall!.copyWith(fontSize: 10),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
