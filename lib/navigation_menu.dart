import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'feature/screens/home/home_screen.dart';
import 'utils/constants/custom_colors.dart';
import 'utils/constants/custom_sizes.dart';
import 'utils/helper/helper_functions.dart';

final selectedIndexProvider = StateProvider<int>((ref) => 0);

class NavigationMenu extends ConsumerStatefulWidget {
  const NavigationMenu({super.key});

  @override
  ConsumerState<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends ConsumerState<NavigationMenu> {
  final List<Widget> _screens = const [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final darkMode = HelperFunctions.isDarkMode(context);
    final selectedIndex = ref.watch(selectedIndexProvider);

    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        switchInCurve: Curves.easeIn,
        switchOutCurve: Curves.easeOut,
        transitionBuilder: (child, animation) {
          return FadeTransition(opacity: animation, child: child);
        },
        child: KeyedSubtree(
          key: ValueKey<int>(selectedIndex),
          child: _screens[selectedIndex],
        ),
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          ref.read(selectedIndexProvider.notifier).state = index;
        },
        backgroundColor: darkMode ? CustomColors.dark : Colors.white,
        selectedItemColor: CustomColors.primary,
        unselectedItemColor: darkMode ? Colors.white : Colors.black,
        items: [
          SalomonBottomBarItem(
            icon: const Icon(Iconsax.home, size: Sizes.iconM),
            title: const Text("Home"),
            selectedColor: CustomColors.primary,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Iconsax.map, size: Sizes.iconM),
            title: const Text("Map"),
            selectedColor: CustomColors.primary,
          ),
          SalomonBottomBarItem(
            icon: const Icon(FontAwesomeIcons.briefcase, size: Sizes.iconM),
            title: const Text("Jobs"),
            selectedColor: CustomColors.primary,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Iconsax.user, size: Sizes.iconM,),
            title: const Text("Profile"),
            selectedColor: CustomColors.primary,
          ),
        ],
      ),
    );
  }
}
