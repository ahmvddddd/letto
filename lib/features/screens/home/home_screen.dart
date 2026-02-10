import 'package:flutter/material.dart';
import '../../../utils/constants/custom_sizes.dart';
import '../../custom_widgets/containers/custom_searchbar.dart';
import '../../custom_widgets/layout/custom_list_view.dart';
import '../../models/house/house_model.dart';
import '../apartment/listing_details_screen.dart';
import '../story/widgets/story_view.dart';
import 'widgets/listing_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Location", style: Theme.of(context).textTheme.bodySmall),
            Text(
              "Abuja, Niigeria",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.spaceBtwItems),
          child: Column(
            children: [
              // Search bar
              CustomSearchBar(
                onFilterPressed: () {},
                onChanged: (value) {},
                controller: searchController,
              ),

              const SizedBox(height: 16),

              CustomListView(
                itemCount: 6, // 6 total items
                scrollDirection: Axis.vertical,
                scrollPhysics: const NeverScrollableScrollPhysics(),
                seperatorBuilder: (context, index) =>
                    const SizedBox(height: Sizes.spaceBtwItems),

                itemBuilder: (context, index) {
                  if (index == 2) {
                    return const StoryView();
                  }

                  int houseIndex = index > 2 ? index - 1 : index;

                  return GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          // return ApartmentScreen(house: houseList[houseIndex]);
                          return ListingDetailsScreen();
                        },
                      ),
                    ),
                    child: ListingCard(
                      imageUrl: houseList[houseIndex].imageUrl,
                      title: houseList[houseIndex].title,
                      price: houseList[houseIndex].price,
                      description: houseList[houseIndex].address,
                      beds: houseList[houseIndex].beds,
                      baths: houseList[houseIndex].baths,
                      areaName: houseList[houseIndex].area,
                      houseType: 'FLAT',
                      address: 'Admiralty Way, Lekki Phase 1 ',
                    ),
                  );
                },
              ),

              const SizedBox(height: Sizes.spaceBtwSections),
            ],
          ),
        ),
      ),
    );
  }
}
