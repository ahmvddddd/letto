import 'package:flutter/material.dart';
import '../../../../utils/helper/helper_functions.dart';
import '../../../../utils/constants/custom_sizes.dart';
import '../../../custom_widgets/containers/info_box.dart';

class ApartmentDetails extends StatelessWidget {
  final String address;
  final String price;
  final int beds;
  final int baths;
  final String area;
  final double rating;
  final double reviewCount;
  const ApartmentDetails({
    super.key,
    required this.address,
    required this.price,
    required this.beds,
    required this.baths,
    required this.area,
    required this.rating,
    required this.reviewCount,
  });

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color:
            dark
                ? Colors.white.withValues(alpha: 0.1)
                : Colors.black.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.star, color: Colors.yellow[800], size: Sizes.iconSm),

              const SizedBox(width: Sizes.xs),
              Text(
                rating.toString(),
                style: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 10),
              ),

              const SizedBox(width: Sizes.xs),
              Text(
                '($reviewCount reviews)',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 10),
              ),
            ],
          ),
          // Text(address, style: Theme.of(context).textTheme.bodyMedium),
          // const SizedBox(height: Sizes.sm),
          Row(
            children: [
              Text(
                '₦$price',
                style: Theme.of(
                  context,
                ).textTheme.headlineLarge!.copyWith(fontFamily: 'Inter'),
              ),
              const SizedBox(width: Sizes.xs),
              Text('/ day', style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
          const SizedBox(height: Sizes.spaceBtwItems),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InfoBox(icon: Icons.bed, text: beds.toString()),
              InfoBox(icon: Icons.bathtub, text: baths.toString()),
              InfoBox(icon: Icons.square_foot, text: area),
            ],
          ),
        ],
      ),
    );
  }
}
