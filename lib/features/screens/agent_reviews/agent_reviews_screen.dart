import 'package:flutter/material.dart';

import '../../../utils/constants/custom_colors.dart';
import '../../../utils/constants/custom_sizes.dart';
import '../../../utils/helper/helper_functions.dart';
import '../../custom_widgets/containers/custom_appbar.dart';
import '../../custom_widgets/containers/custom_container.dart';
import 'widgets/agent_profile_card.dart';

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AgentProfileCard(
              name: 'Babatunde Olawale',
              userType: 'Agent',
              phoneNumber: '+23480123456789',
              onPressed: () {},
            ),
            const SizedBox(height: 20),
            const ReviewsHeader(),
            const SizedBox(height: 12),
            const ReviewCard(
              name: "Chidinma Nwosu",
              time: "2 days ago",
              rating: 5,
              review:
                  "Babatunde was incredibly helpful throughout our search in Lekki. Highly recommended!",
            ),
            const SizedBox(height: 12),
            const ReviewCard(
              name: "Femi Adebayo",
              time: "1 week ago",
              rating: 4,
              review:
                  "Professional service and transparent communication. Helped me find a secure apartment within my budget.",
            ),
            const SizedBox(height: 12),
            const ReviewCard(
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

class ReviewsHeader extends StatelessWidget {
  const ReviewsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Text(
              "Reviews",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFF5143EA).withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                "24",
                style: TextStyle(
                  color: Color(0xFF5143EA),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const Text(
          "Write Review",
          style: TextStyle(
            color: Color(0xFF5143EA),
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class ReviewCard extends StatelessWidget {
  final String name;
  final String time;
  final int rating;
  final String review;

  const ReviewCard({
    required this.name,
    required this.time,
    required this.rating,
    required this.review,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      padding: Sizes.spaceBtwItems,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(
                time,
                style: const TextStyle(fontSize: 10, color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: List.generate(
              5,
              (index) => Icon(
                Icons.star,
                size: 16,
                color: index < rating ? Colors.teal : Colors.grey.shade300,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            review,
            style: const TextStyle(color: Colors.black54, fontSize: 13),
          ),
        ],
      ),
    );
  }
}
