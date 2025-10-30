import 'package:flutter/material.dart';
import '../../../utils/constants/custom_sizes.dart';
import '../../custom_widgets/layout/custom_list_view.dart';
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
                  Text("Location",
                  style: Theme.of(context).textTheme.bodySmall,),
                  Text(
                    "New York, USA",
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(Sizes.spaceBtwItems),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search...",
                      hintStyle: Theme.of(context).textTheme.labelSmall,
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Sizes.md),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                CustomListView(
                  scrollDirection: Axis.vertical,
                  itemCount: 3,
                  scrollPhysics: NeverScrollableScrollPhysics(),
                  seperatorBuilder: (context, index) => const SizedBox(
                    height: Sizes.spaceBtwItems,
                  ),
                  itemBuilder: (context, index) =>
                   HouseCard(
                    imageUrl:
                        "https://cdn.pixabay.com/photo/2024/03/07/15/57/houses-8618837_1280.jpg",
                    title: "Lakeshore Blvd West",
                    price: "\$797,500",
                    address:
                        "70 Washington Square South, New York, NY 10012, United States",
                    beds: 2,
                    baths: 2,
                    area: "2000 sqft",
                  ),
                ),
        
                const SizedBox(height: Sizes.spaceBtwSections,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryChip extends StatelessWidget {
  final String label;
  final bool selected;
  const CategoryChip({super.key, required this.label, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? Colors.yellow : Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Text(
        label,
        style: TextStyle(color: selected ? Colors.black : Colors.grey[600]),
      ),
    );
  }
}

