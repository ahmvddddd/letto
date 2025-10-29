import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

import '../utils/constants/custom_colors.dart';
import '../utils/helper/helper_functions.dart';

final navigationProvider = StateProvider<int>((ref) => 0);

class CustomBottomNavBar extends ConsumerWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navIndex = ref.watch(navigationProvider);
    final dark = HelperFunctions.isDarkMode(context);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: BottomNavigationBar(
            backgroundColor:CustomColors.darkGrey,
              currentIndex: navIndex,
              onTap: (index) => ref.read(navigationProvider.notifier).state = index,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: dark ? Colors.white : Colors.black,
              unselectedItemColor: CustomColors.darkerGrey,
              elevation: 0,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined, color: dark ? CustomColors.darkGrey : CustomColors.darkerGrey,),
                  activeIcon: Icon(Icons.home, color: dark ? Colors.white : Colors.black,),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_border, color: dark ? CustomColors.darkGrey : CustomColors.darkerGrey,),
                  activeIcon: Icon(Icons.favorite, color: dark ? Colors.white : Colors.black),
                  label: 'Favorites',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Iconsax.user, color: dark ? CustomColors.darkGrey : CustomColors.darkerGrey,),
                  activeIcon: Icon(Iconsax.user1, color: dark ? Colors.white : Colors.black),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
