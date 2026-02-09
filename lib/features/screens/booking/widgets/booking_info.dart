import 'package:flutter/material.dart';
import '../../../../utils/constants/custom_sizes.dart';
import '../../../../utils/helper/helper_functions.dart';
import 'price_row.dart';

class BookingInfo extends StatelessWidget {
  const BookingInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return Container(
      padding: const EdgeInsets.all(Sizes.spaceBtwItems),
      decoration: BoxDecoration(
        color:
            dark
                ? Colors.white.withValues(alpha: 0.1)
                : Colors.black.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(Sizes.sm),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Lasik Braga Villa", 
          style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 6),
          Text("330 East 5th Street, Long Beach, CA", 
          style: Theme.of(context).textTheme.bodyMedium,),
          const SizedBox(height: 6),
          Row(
            children: [
              Icon(Icons.star, color: Colors.amber, size: 18),
              SizedBox(width: 4),
              Text("4.4", style: Theme.of(context).textTheme.labelLarge,),
            ],
          ),
          const SizedBox(height: 16),
    
          PriceRow(title: "Price", amount: "\$375.00"),
          PriceRow(title: "A-night", amount: "\$90.00"),
          PriceRow(title: "Tax", amount:"\$15.00"),
          const Divider(),
          PriceRow(title: "Total", amount: "\$375.00", bold: true),
        ],
      ),
    );
  }
}