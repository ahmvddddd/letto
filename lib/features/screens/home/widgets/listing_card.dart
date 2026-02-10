import 'package:flutter/material.dart';
import '../../../../utils/constants/custom_colors.dart';
import '../../../../utils/constants/custom_sizes.dart';
import '../../../../utils/helper/helper_functions.dart';

class ListingCard extends StatelessWidget {
  final String title;
  final String price;
  final String description;
  final String imageUrl;
  final String houseType;
  final String address;
  final int beds;
  final int baths;
  final Color badgeColor;
  final String areaName;

  const ListingCard({
    super.key,
    required this.title,
    required this.price,
    required this.description,
    required this.imageUrl,
    required this.houseType,
    required this.address,
    required this.beds,
    required this.baths,
    this.badgeColor = CustomColors.accent,
    required this.areaName,
  });

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Container(
      decoration: BoxDecoration(
        color: dark ? CustomColors.dark : CustomColors.light,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 20,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                child: Image.asset(
                  imageUrl,
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 12,
                left: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.sm,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: badgeColor.withValues(alpha: 0.9),
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Text(
                    houseType,
                    style: Theme.of(
                      context,
                    ).textTheme.labelSmall!.copyWith(
                      fontSize: 10),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(Sizes.sm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                    Text(
                      '₦$price',
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: CustomColors.alternate)
                    ),
                  ],
                ),
                const SizedBox(height: Sizes.sm),
                SizedBox(
                  width: 300,
                  child: Text(
                    description,
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: Sizes.sm),
                const Divider(),
                Row(
                  children: [
                    _Detail(icon: Icons.bed, text: '$beds Bed'),
                    _Detail(icon: Icons.bathtub, text: '$baths Bath'),
                  ],
                ),
                const SizedBox(height: Sizes.md),
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 14, color: Colors.red),
                    const SizedBox(width: 4),

                    Expanded(
                      child: RichText(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: address,
                              style: Theme.of(context).textTheme.labelSmall!
                                  .copyWith(color: Colors.grey),
                            ),
                            const TextSpan(text: ' • '),
                            TextSpan(
                              text: areaName,
                              style: Theme.of(context).textTheme.labelLarge!
                                  .copyWith(color: CustomColors.alternate,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Detail extends StatelessWidget {
  final IconData icon;
  final String text;

  const _Detail({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Row(
        children: [
          Icon(icon, size: Sizes.iconSm, color: CustomColors.alternate),
          const SizedBox(width: Sizes.xs),
          Text(
            text,
            style: Theme.of(
              context,
            ).textTheme.labelSmall!.copyWith(color: CustomColors.alternate),
          ),
        ],
      ),
    );
  }
}
