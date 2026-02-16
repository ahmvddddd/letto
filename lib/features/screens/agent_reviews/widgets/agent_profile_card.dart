import 'package:flutter/material.dart';
import '../../../../utils/constants/custom_colors.dart';
import '../../../../utils/constants/custom_sizes.dart';

class AgentProfileCard extends StatelessWidget {
  final String name;
  final String userType;
  final String phoneNumber;
  final VoidCallback onPressed;

  const AgentProfileCard({super.key,
  required this.name,
  required this.userType,
  required this.phoneNumber,
  required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 45,
                backgroundColor: Colors.grey,
                child: Center(
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: Sizes.iconLg,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Icon(
                  Icons.verified,
                  color: CustomColors.success,
                  size: Sizes.iconMd,
                ),
              ),
            ],
          ),
          const SizedBox(height: Sizes.sm),
          Text(name, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: Sizes.xs),
          Text(userType, style: TextStyle(color: Colors.grey)),
          const SizedBox(height: Sizes.sm),
          TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero
            ),
            onPressed: onPressed,
            child: Text(
              phoneNumber,
              style: Theme.of(
                context,
              ).textTheme.headlineSmall!.copyWith(
                color: CustomColors.primary),
            ),
          ),
        ],
      ),
    );
  }
}
