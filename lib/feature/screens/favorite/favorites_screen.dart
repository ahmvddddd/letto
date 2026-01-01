import 'package:flutter/material.dart';
import '../../../utils/constants/custom_sizes.dart';
import '../../custom_widgets/layout/custom_list_view.dart';
import '../../models/house/house_model.dart';
import '../home/widgets/house_card.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites",
                  style: Theme.of(context).textTheme.headlineSmall,),
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
                      imageUrl: houseList[index].imageUrl,
                      title: houseList[index].title,
                      price: houseList[index].price,
                      address: houseList[index].address,
                      beds: houseList[index].beds,
                      baths: houseList[index].baths,
                      area: houseList[index].area,
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


