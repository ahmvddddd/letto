import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../utils/constants/custom_colors.dart';
import '../../../utils/constants/custom_sizes.dart';
import '../../../utils/helper/helper_functions.dart';
import '../../custom_widgets/containers/custom_container.dart';

class ListingDetailsScreen extends StatelessWidget {
  const ListingDetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 140),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// HERO IMAGE
                Stack(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.45,
                      width: double.infinity,
                      child: Image.network(
                        "https://lh3.googleusercontent.com/aida-public/AB6AXuCrod2HbOF15jDXFTYiPp_aTq1VgpBqt8oz5zn31oZjuheFfUM7x7RThp-E01dIus2B-n8njBmzViyZgdbv5pq6jyvFDqj9nJxkvac2vrZ-ncyqkpThtyxBeWGMotGCTM8rC6GkXtk6HV8MyOdwbI6hD-owaC-YfY5qkUXA7cLtuakcaCAIZ3Wbs4YkwS_mD-7TO7zhMKUCyPdyC0xf-3o-lkzIvN9IFQ16S0iTKWhtVFzzzL5BzZ1XOv_FHAXuVOujpenHIqa0zwc",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.45,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [Colors.black45, Colors.transparent],
                        ),
                      ),
                    ),

                    /// TOP ACTIONS
                    Positioned(
                      top: 50,
                      left: 16,
                      right: 16,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _circleButton(
                            icon: Icons.arrow_back_ios_new,
                            onTap: () => Navigator.pop(context),
                          ),
                          Row(
                            children: [
                              _circleButton(icon: Icons.share),
                              const SizedBox(width: 12),
                              _circleButton(icon: Icons.favorite_border),
                            ],
                          ),
                        ],
                      ),
                    ),

                    /// PAGINATION
                    Positioned(
                      bottom: 24,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [_dot(active: true), _dot(), _dot(), _dot()],
                      ),
                    ),
                  ],
                ),

                /// CONTENT
                Container(
                  transform: Matrix4.translationValues(0, -24, 0),
                  padding: const EdgeInsets.fromLTRB(20, 32, 20, 0),
                  decoration: BoxDecoration(
                    color: dark ? Colors.black : Colors.white,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(32),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// TITLE
                      Text(
                        "Cozy 2-Bedroom Apartment",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),

                      const SizedBox(height: Sizes.sm),

                      /// LOCATION
                      // Row(
                      //   children: const [
                      //     Icon(Icons.location_on,
                      //         size: 16, color: Colors.red),
                      //     SizedBox(width: 4),
                      //     Text(
                      //       "Lekki Phase 1, Lagos",
                      //       style: TextStyle(color: Colors.grey),
                      //     ),
                      //   ],
                      // ),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 14,
                            color: Colors.red,
                          ),
                          const SizedBox(width: 4),

                          Expanded(
                            child: RichText(
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Admiralty Way Lekki Phase 1',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall!
                                        .copyWith(color: Colors.grey),
                                  ),
                                  const TextSpan(text: ' • '),
                                  TextSpan(
                                    text: 'Lekki',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .copyWith(
                                          color: CustomColors.alternate,
                                          fontWeight: FontWeight.w700,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      /// PRICE
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "₦1,500,000",
                              style: Theme.of(context).textTheme.bodySmall!
                                  .copyWith(color: CustomColors.alternate),
                            ),
                            TextSpan(
                              text: " / YEAR",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: Sizes.sm),

                      /// FEATURES
                      GridView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                              mainAxisExtent: 70,
                            ),
                        children: const [
                          _Feature(icon: Icons.bed, label: "2 Beds"),
                          _Feature(icon: Icons.bathtub, label: "2 Baths"),
                          _Feature(icon: Icons.home, label: "Apartment"),
                        ],
                      ),

                      const SizedBox(height: Sizes.spaceBtwItems),

                      /// DESCRIPTION
                      Text(
                        "Description",
                        style: Theme.of(context).textTheme.bodyMedium
                      ),
                      const SizedBox(height: Sizes.sm),
                      Text(
                        "Recently renovated with modern finishings, featuring an open-plan kitchen and premium tiling. This apartment offers a perfect blend of luxury and comfort, situated in the heart of Lekki Phase 1 with 24/7 security and steady power supply.",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Read more",
                          style: TextStyle(color: CustomColors.primary),
                        ),
                      ),

                      const SizedBox(height: 32),

                      // MAP
                    ],
                  ),
                ),
              ],
            ),
          ),

         ],
      ),
    );
  }

  Widget _circleButton({required IconData icon, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.9),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 18),
      ),
    );
  }

  Widget _dot({bool active = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3),
      height: 6,
      width: active ? 24 : 6,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: active ? 1 : 0.5),
        borderRadius: BorderRadius.circular(999),
      ),
    );
  }
}

class _Feature extends StatelessWidget {
  final IconData icon;
  final String label;

  const _Feature({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return CustomContainer(
      padding: Sizes.sm,
      backgroundColor: dark ? CustomColors.dark : CustomColors.light,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: CustomColors.alternate, size: Sizes.iconM),
          const SizedBox(height: Sizes.xs),
          Text(label, style: Theme.of(context).textTheme.labelMedium),
        ],
      ),
    );
  }
}