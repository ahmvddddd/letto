import 'package:flutter/material.dart';
import '../../../utils/constants/custom_sizes.dart';
import '../../custom_widgets/layout/custom_list_view.dart';
import '../../models/house/house_model.dart';
import '../story/widgets/story_view.dart';
import 'widgets/house_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Location", style: Theme.of(context).textTheme.bodySmall),
            Text("New York, USA",
                style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(Sizes.spaceBtwItems),
            child: Column(
              children: [
                // Search bar
                SizedBox(
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search...",
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      hintStyle: Theme.of(context).textTheme.labelSmall,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Sizes.md),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                CustomListView(
                  itemCount: 6,  // 6 total items
                  scrollDirection: Axis.vertical,
                  scrollPhysics: const NeverScrollableScrollPhysics(),
                  seperatorBuilder: (context, index) =>
                      const SizedBox(height: Sizes.spaceBtwItems),

                  itemBuilder: (context, index) {
                    if (index == 2) {
                      
                      return const StoryView();
                    }

                    int houseIndex = index > 2 ? index - 1 : index;

                    return HouseCard(
                      imageUrl: houseList[houseIndex].imageUrl,
                      title: houseList[houseIndex].title,
                      price: houseList[houseIndex].price,
                      address: houseList[houseIndex].address,
                      beds: houseList[houseIndex].beds,
                      baths: houseList[houseIndex].baths,
                      area: houseList[houseIndex].area,
                    );
                  },
                ),

                const SizedBox(height: Sizes.spaceBtwSections),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
