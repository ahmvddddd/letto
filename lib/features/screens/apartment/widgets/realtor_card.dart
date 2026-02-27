import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../utils/constants/custom_colors.dart';
import '../../../../utils/constants/custom_sizes.dart';

class RealtorCard extends ConsumerWidget {
  final VoidCallback onTap;
  final String displayName;
  final String role;
  final String details;
  const RealtorCard({
    super.key,
    required this.onTap,
    required this.displayName,
    required this.role,
    required this.details,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: onTap,
      child: Container(
        width: screenWidth * 0.50,
        height: screenHeight * 0.08,
        padding: const EdgeInsets.all(Sizes.xs),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.cardRadiusLg),
          color: CustomColors.primary,
          // border: Border.all(
          //   color: CustomColors.primary,
          //   width: 2
          // )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: Sizes.xs),
                      child: CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: Sizes.md,
                        child: Icon(
                          Icons.person,
                          size: Sizes.iconM,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    const SizedBox(width: Sizes.md),
                    SizedBox(
                      width: screenWidth * 0.25,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                displayName,
                                style: Theme.of(context).textTheme.labelLarge!
                                    .copyWith(
                                      overflow: TextOverflow.ellipsis,
                                      color: Colors.white,
                                    ),
                              ),
                              const SizedBox(width: Sizes.xs),
                              Icon(
                                Icons.verified,
                                size: Sizes.iconSm,
                                color: CustomColors.success,
                              ),
                            ],
                          ),
                          Text(
                            role,
                            style: Theme.of(context).textTheme.labelMedium!
                                .copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../../../../utils/constants/custom_colors.dart';
// import '../../../../utils/constants/custom_sizes.dart';
// import '../../../../utils/helper/helper_functions.dart';
// import '../../../custom_widgets/containers/custom_container.dart';

// class RealtorCard extends ConsumerWidget {
//   final VoidCallback onTap;
//   final String displayName;
//   final String role;
//   final String details;
//   const RealtorCard({
//     super.key,
//     required this.onTap,
//     required this.displayName,
//     required this.role,
//     required this.details,
//   });

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final dark = HelperFunctions.isDarkMode(context);
//     return InkWell(
//       onTap: onTap,
//       highlightColor: CustomColors.primary,
//       child: CustomContainer(
//           padding: Sizes.spaceBtwItems,
//         backgroundColor: dark
//             ? CustomColors.dark
//             : CustomColors.light,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     CircleAvatar(
//                       backgroundColor: Colors.grey,
//                       radius: Sizes.md,
//                       child: Icon(
//                         Icons.person,
//                         size: Sizes.iconMd,
//                         color: Colors.white,
//                       ),
//                     ),
        
//                     const SizedBox(width: Sizes.md),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           children: [
//                             Text(
//                               displayName,
//                               style: Theme.of(context).textTheme.titleSmall,
//                             ),
//                             const SizedBox(width: Sizes.xs),
//                             Icon(
//                               Icons.verified,
//                               size: Sizes.iconSm,
//                               color: CustomColors.success,
//                             ),
//                           ],
//                         ),
//                         Text(
//                           role,
//                           style: Theme.of(context).textTheme.labelMedium,
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 Icon(Icons.arrow_forward_ios, size: Sizes.iconSm),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
