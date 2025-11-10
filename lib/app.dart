
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'feature/custom_navbar.dart';
import 'feature/screens/favorite/favorites_screen.dart';
import 'feature/screens/home/home_screen.dart';
import 'utils/theme/theme.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navIndex = ref.watch(navigationProvider);

    final screens = [
      const HomeScreen(),
      const FavoritesScreen(),
      const HomeScreen(),
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: CustomAppTheme.lightTheme,
      darkTheme: CustomAppTheme.darkTheme,
      home: Scaffold(
        extendBody: true,
        body: Stack(children: [
          Positioned.fill(child: screens[navIndex]),
          const Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: CustomBottomNavBar(),
          ),
          ]),
        // bottomNavigationBar: const CustomBottomNavBar(),
      ),
    );
  }
}
