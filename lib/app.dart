
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'features/custom_navbar.dart';
import 'features/screens/auth/auth_screen.dart';
import 'features/screens/favorite/favorites_screen.dart';
import 'features/screens/home/home_screen.dart';
import 'utils/theme/theme.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navIndex = ref.watch(navigationProvider);

    final screens = [
      const HomeScreen(),
      const FavoritesScreen(),
      const AuthScreen(),
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: CustomAppTheme.darkTheme,
      darkTheme: CustomAppTheme.darkTheme,
      home: Scaffold(
        extendBody: true,
        body: SafeArea(
          child: Stack(children: [
            Positioned.fill(child: screens[navIndex]),
            const Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: CustomBottomNavBar(),
            ),
            ]),
        ),
        // bottomNavigationBar: const CustomBottomNavBar(),
      ),
    );
  }
}
