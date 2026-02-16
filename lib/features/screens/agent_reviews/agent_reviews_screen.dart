import 'package:flutter/material.dart';
import '../../../utils/constants/custom_sizes.dart';
import '../../custom_widgets/containers/custom_appbar.dart';
import 'widgets/agent_profile_card.dart';
import 'widgets/agent_review_card.dart';

class AgentReviewsScreen extends StatelessWidget {
  const AgentReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'Agent Name',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        centerTitle: true,
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Sizes.spaceBtwItems),
        child: Column(
          children: [
            AgentProfileCard(
              name: 'Babatunde Olawale',
              userType: 'Agent',
              phoneNumber: '+23480123456789',
              onPressed: () {},
            ),
            const SizedBox(height: Sizes.sm),
          AgentReviewCard(
              name: "Chidinma Nwosu",
              time: "2 days ago",
              rating: 5,
              review:
                  "Babatunde was incredibly helpful throughout our search in Lekki. Highly recommended!",
            ),
            const SizedBox(height: 12),
          AgentReviewCard(
              name: "Femi Adebayo",
              time: "1 week ago",
              rating: 4,
              review:
                  "Professional service and transparent communication. Helped me find a secure apartment within my budget.",
            ),
            const SizedBox(height: 12),
            AgentReviewCard(
              name: "Emeka Obi",
              time: "2 weeks ago",
              rating: 5,
              review:
                  "Top-notch service! He knows exactly which properties are legitimate.",
            ),
          ],
        ),
      ),
    );
  }
}


