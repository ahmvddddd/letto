import 'package:flutter/material.dart';
import '../../../../utils/constants/custom_sizes.dart';
import '../../../custom_widgets/layout/custom_list_view.dart';
import 'recent_card.dart';

class HistoryList extends StatelessWidget {
  const HistoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: Sizes.spaceBtwItems),
        Text(
          'Recently viewed properties',
          style: Theme.of(context).textTheme.bodySmall,
        ),

        const SizedBox(height: Sizes.spaceBtwItems),
        CustomListView(
          scrollDirection: Axis.vertical,
          itemCount: 3,
          scrollPhysics: const NeverScrollableScrollPhysics(),
          seperatorBuilder: (context, index) =>
              const SizedBox(height: Sizes.sm),
          itemBuilder: (context, index) {
            return RecentCard();
          },
        ),
      ],
    );
  }
}
