import 'package:flutter/material.dart';
import '../../../utils/constants/custom_sizes.dart';
import '../../custom_widgets/containers/custom_appbar.dart';
import 'widgets/review_card.dart';

class ListingReviewsScreen extends StatelessWidget {
  const ListingReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text(
          'Reviews',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Sizes.spaceBtwItems),
        child: Column(
          children: [
            Column(
            children: [
              ReviewCard(
                name: "Chidi Okoro",
                date: "2 days ago • Verified Resident",
                rating: 5,
                text:
                    "The apartment is exactly as pictured. Great water supply and the landlord is very responsive. Highly recommended!",
              ),
              ReviewCard(
                name: "Amina Bello",
                date: "1 week ago • Verified Resident",
                rating: 4,
                text:
                    "Lovely space, very quiet neighborhood. Parking is a bit tight but overall wonderful.",
              ),
              ReviewCard(
                name: "Emeka Nwosu",
                date: "2 weeks ago",
                rating: 5,
                text:
                    "Been living here for 3 months now. The solar inverter system is a life saver!",
              ),
              ReviewCard(
                name: "Fatima Yusuf",
                date: "1 month ago",
                rating: 3,
                text:
                    "Decent place for the price. The gym is smaller than expected.",
              ),
              const SizedBox(height: 120),
            ],
                          ),],
        ),
      ),
    );
  } 
}
