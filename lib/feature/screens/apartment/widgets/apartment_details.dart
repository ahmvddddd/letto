import 'package:flutter/material.dart';
import '../../../../utils/constants/custom_sizes.dart';
import '../../../custom_widgets/containers/info_box.dart';

class ApartmentDetails extends StatelessWidget {
  const ApartmentDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Lakeshore Blvd West",
            style: TextStyle(
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: Sizes.xs),
          Text(
            "\$797,500",
            style: Theme.of(context).textTheme.headlineLarge
          ),
          const SizedBox(height: Sizes.sm),
    
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InfoBox(icon: Icons.bed, text: "2 Beds"),
              InfoBox(icon: Icons.bathtub, text: "2 Baths"),
              InfoBox(icon: Icons.square_foot,text: "2000 Sqft"),
            ],
          ),
        ],
      ),
    );
  }
}