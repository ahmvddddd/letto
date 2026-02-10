import 'package:flutter/material.dart';
import '../../../../utils/constants/custom_sizes.dart';

class HouseInfo extends StatelessWidget {
  final IconData icon;
  final String text;

  const HouseInfo({super.key,
  required this.icon,
  required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: Sizes.md, color: Colors.grey[600]),
        const SizedBox(width: Sizes.xs),
        Text(
          text,
          style: Theme.of(
            context,
          ).textTheme.labelMedium!.copyWith(fontSize: 14),
        ),
      ],
    );
  }
}
