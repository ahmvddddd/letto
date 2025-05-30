import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'feature/screens/home/home_screen.dart';
import 'utils/constants/custom_colors.dart';
import 'utils/helper/helper_functions.dart';

final selectedIndexProvider = StateProvider<int>((ref) => 0);

class NavigationMenu extends ConsumerStatefulWidget {
  const NavigationMenu({super.key});

  @override
  ConsumerState<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends ConsumerState<NavigationMenu> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final darkMode = HelperFunctions.isDarkMode(context);
    final selectedIndex = ref.watch(selectedIndexProvider);
    Widget currentScreen() {
      switch (selectedIndex) {
        case 0:
          return const HomeScreen();
        case 1:
          return const HomeScreen();
        case 2:
          return const HomeScreen();
        default:
          return const HomeScreen();
      }
    }

    return Scaffold(
      body: currentScreen(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          ref.read(selectedIndexProvider.notifier).state = index;
        },
        backgroundColor: darkMode ? CustomColors.dark : Colors.white,
        selectedItemColor: CustomColors.primary,
        unselectedItemColor: Colors.grey,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: 'Map',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.cases_rounded),
            label: 'Jobs',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
         