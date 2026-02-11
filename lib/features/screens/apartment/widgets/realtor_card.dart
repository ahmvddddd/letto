import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../utils/constants/custom_sizes.dart';
import '../../../../utils/helper/helper_functions.dart';
import '../../../custom_widgets/containers/custom_container.dart';

final realtorDeatailsProvider = StateProvider<bool>((ref) => false);

class RealtorCard extends ConsumerWidget {
  final String displayName;
  final String role;
  final String details;
  const RealtorCard({
    super.key,
    required this.displayName,
    required this.role,
    required this.details,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dark = HelperFunctions.isDarkMode(context);
    final isExpanded = ref.read(realtorDeatailsProvider);
    return CustomContainer(
      padding: Sizes.sm,
      backgroundColor:
          dark
              ? Colors.white.withValues(alpha: 0.1)
              : Colors.black.withValues(alpha: 0.1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 20,
                    child: Icon(
                      Icons.person,
                      size: Sizes.iconMd,
                      color: Colors.white,
                    ),
                  ),
    
                  const SizedBox(width: Sizes.md),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            displayName,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const SizedBox(width: 2),
                          Icon(Icons.verified, color: Colors.blue, size: 12),
                        ],
                      ),
                      Text(
                        role,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ],
              ),
              IconButton(
                icon: Icon(
                  isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  size: Sizes.iconMd,
                ),
                onPressed: () {
                  ref.read(realtorDeatailsProvider.notifier).state =
                      !isExpanded;
                },
              ),
            ],
          ),
          
          if (isExpanded) ...[
            Column(
              children: [
                const SizedBox(height: Sizes.sm),
                Text(details, style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
