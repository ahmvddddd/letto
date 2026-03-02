import 'package:flutter/material.dart';

import '../../../utils/constants/custom_colors.dart';
import '../../../utils/constants/custom_sizes.dart';
import '../../../utils/helper/helper_functions.dart';
import '../../custom_widgets/containers/custom_appbar.dart';
import '../../custom_widgets/containers/custom_container.dart';
import 'widgets/report_thread_option.dart';

class ReportThreadScreen extends StatefulWidget {
  const ReportThreadScreen({super.key});

  @override
  State<ReportThreadScreen> createState() => _ReportThreadScreenState();
}

class _ReportThreadScreenState extends State<ReportThreadScreen> {
  final TextEditingController detailsController = TextEditingController();

  final List<String> reasons = [
    "Spam",
    "Harassment",
    "Inappropriate Content",
    "Misinformation",
    "Other",
  ];

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'Report Thread',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        centerTitle: true,
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Sizes.spaceBtwItems),
        child: Column(
          children: [
            Column(
              children: [
                // CONTENT
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: Sizes.sm),
                    Text(
                      "Please select a reason for reporting this post to our moderation team.",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: Sizes.spaceBtwItems),

                    // RADIO OPTIONS
                    ...reasons.map(
                      (reason) => ReportThreadOption(reason: reason),
                    ),

                    const SizedBox(height: 24),

                    // ADDITIONAL DETAILS
                    Text(
                      "Additional details (optional)",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: Sizes.sm),
                    CustomContainer(
                      backgroundColor: dark
                          ? CustomColors.dark
                          : CustomColors.light,
                      child: TextField(
                        controller: detailsController,
                        maxLines: 4,
                        decoration: InputDecoration(
                          hintText:
                              "Tell us more about why you are reporting this...",
                          hintStyle: Theme.of(context).textTheme.labelMedium,
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(Sizes.md),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
