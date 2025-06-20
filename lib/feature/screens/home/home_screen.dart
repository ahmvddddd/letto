import 'package:flutter/material.dart';
import '../../../utils/constants/custom_colors.dart';
import '../../../utils/constants/custom_sizes.dart';
import '../../../utils/helper/helper_functions.dart';
import '../../custom_widgets/containers/custom_searchbar.dart';
import '../../custom_widgets/layout/custom_list_view.dart';
import 'widgets/home_appbar.dart';
import 'widgets/house_card.dart';
import 'widgets/home_categories.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    double screenHeight = MediaQuery.of(context).size.height;
    final TextEditingController searchController = TextEditingController();

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (_, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              floating: true,
              expandedHeight: screenHeight * 0.09,
              backgroundColor: dark ? Colors.black : Colors.white,
              flexibleSpace: Padding(
                padding: const EdgeInsets.all(Sizes.sm),
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [HomeAppBar()],
                ),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(Sizes.spaceBtwItems),
            child: Column(
              children: [
                const SizedBox(height: Sizes.spaceBtwItems),
                CustomSearchBar(
                  controller: searchController,
                  onFilterPressed: () {},
                ),

                const SizedBox(height: Sizes.spaceBtwSections),
                const HomeCategories(),

                const SizedBox(height: Sizes.spaceBtwSections),
                CustomListView(
                  scrollDirection: Axis.vertical,
                  scrollPhysics: NeverScrollableScrollPhysics(),
                  seperatorBuilder: (context, index) {
                    return  SizedBox(height: Sizes.spaceBtwItems);
                  },
                  itemCount: 4,
                  itemBuilder: (context, index) { 
                    return HouseCard();
                    },
                ),

                const SizedBox(height: Sizes.spaceBtwItems),
                Container(
                  width: 250,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: CustomColors.linearGradient2,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        spreadRadius: 2,
                        offset: Offset(4, 6),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'Gradient Box',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
