import 'package:flutter/material.dart';
import '../../../utils/constants/custom_sizes.dart';
import '../../custom_widgets/containers/custom_appbar.dart';
import 'widgets/thread_card.dart';

class ThreadsScreen extends StatelessWidget {
  const ThreadsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'Threads',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Sizes.spaceBtwItems),
        child: Column(
          children: [
            SizedBox(
              width: screenWidth * 0.75,
              child: Text(
                "POSTS ARE EXPRESSIONS OF USERS AND NOT OF THE APP",
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            ),

            // Feed
            const SizedBox(height: Sizes.spaceBtwSections),
            ListView(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              children: const [
                ThreadCard(
                  name: "Chidi O.",
                  title: "Best areas in Yaba?",
                  content:
                      "Looking for a 2-bedroom apartment with consistent power...",
                  comments: 24,
                  time: "1 hour ago",
                ),
                ThreadCard(
                  name: "Amina B.",
                  title: "Rent Trends 2024",
                  content:
                      "Is it just me or are prices in Lekki Phase 1 jumping again?",
                  comments: 86,
                  time: "5 hours ago",
                ),
                ThreadCard(
                  name: "Femi T.",
                  title: "New Estate Development?",
                  content:
                      "Does anyone have info on the new estate near the stadium?",
                  comments: 12,
                  time: "8 hours ago",
                ),
                ThreadCard(
                  name: "Ngozi E.",
                  title: "Moving from Lagos to Enugu",
                  content: "Finally making the move! Any advice on agencies?",
                  comments: 5,
                  time: "1 day ago",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
