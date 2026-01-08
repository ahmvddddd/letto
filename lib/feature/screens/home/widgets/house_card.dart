import 'package:flutter/material.dart';

import '../../../../utils/constants/custom_sizes.dart';
import '../../../../utils/helper/helper_functions.dart';
import '../../../custom_widgets/containers/custom_container.dart';
import 'house_info.dart';

class HouseCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;
  final String address;
  final int beds;
  final int baths;
  final String area;

  const HouseCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.address,
    required this.beds,
    required this.baths,
    required this.area,
  });

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return CustomContainer(
      radius: Sizes.md,
      backgroundColor: dark ? Colors.white.withValues(alpha: 0.1) : Colors.black.withValues(alpha: 0.1),
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
                  height: 140,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.6),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    "Apartment",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white),
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.favorite_border, color: Colors.grey[700], size: Sizes.iconM,),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.location_on, size: Sizes.iconSm, color: Colors.red),
                    const SizedBox(width: Sizes.xs),
                    SizedBox(
                      width: 200,
                      child: Text(
                        title,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(overflow: TextOverflow.ellipsis)
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: Sizes.xs),
                Text(
                  address,
                  style: Theme.of(context).textTheme.labelMedium
                ),
                const SizedBox(height: Sizes.spaceBtwItems),
                Row(
                  children: [
                    Text(
                      '₦$price',
                      style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontFamily: 'Inter'),
                    ),

                    const SizedBox(width: Sizes.xs),
                    Text('/ day', style : Theme.of(context).textTheme.bodyMedium)
                  ],
                ),
                const SizedBox(height: Sizes.spaceBtwItems),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HouseInfo(icon: Icons.bed, text: "$beds Beds"),
                    HouseInfo(icon: Icons.bathtub, text: "$baths Baths"),
                    HouseInfo(icon: Icons.square_foot, text: area),
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
