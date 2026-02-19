import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import '../utils/constants/custom_colors.dart';
import '../utils/constants/custom_sizes.dart';
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
            boxShadow: [
              BoxShadow(
                color:
                    dark
                        ? Colors.black.withValues(alpha: 0.5)
                        : Colors.white.withValues(alpha: 0.5),
                spreadRadius: 2,
                blurRadius: 10,
                offset: Offset(4, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: BottomNavigationBar(
              backgroundColor: dark
                        ? Colors.black
                        : Colors.white,
              currentIndex: navIndex,
              onTap:
                  (index) =>
                      ref.read(navigationProvider.notifier).state = index,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: CustomColors.primary,
              unselectedItemColor: dark ? Colors.white : Colors.black,
              elevation: 0,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Iconsax.home_14, size: Sizes.iconM),
                  activeIcon: Icon(
                    Iconsax.home_11,
                    color: CustomColors.primary,
                    size: Sizes.iconM,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_border),
                  activeIcon: Icon(
                    Icons.favorite,
                    color: CustomColors.primary,
                    size: Sizes.iconM,
                  ),
                  label: 'Favorites',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Iconsax.menu_board),
                  activeIcon: Icon(
                    Icons.favorite,
                    color: CustomColors.primary,
                    size: Sizes.iconM,
                  ),
                  label: 'Favorites',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Iconsax.user, size: Sizes.iconM),
                  activeIcon: Icon(
                    Icons.person,
                    color: CustomColors.primary,
                  ),
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
