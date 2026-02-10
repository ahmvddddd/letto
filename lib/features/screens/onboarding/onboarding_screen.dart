import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../navigation_menu.dart';
import '../../../utils/constants/custom_colors.dart';
import '../../../utils/constants/custom_sizes.dart';
import '../../../utils/constants/custom_images.dart';
import '../../../utils/helper/helper_functions.dart';

// Riverpod state provider for current index
final currentIndexProvider = StateProvider<int>((ref) => 0);

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final PageController _pageController = PageController();

  final List<Map<String, String>> _pages = [
    {
      'image': CustomImages.onboarding1,
      'text': 'The best of apartments in your location',
    },
    {
      'image': CustomImages.onboarding2,
      'text': 'Luxiriously furnished interior',
    },
    {
      'image': CustomImages.onboarding3,
      'text': 'Enjoy the comfort you deserve',
    },
  ];

  void _nextPage() {
    final currentIndex = ref.read(currentIndexProvider);
    if (currentIndex < _pages.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      ref.read(currentIndexProvider.notifier).state++;
    } else {
      HelperFunctions.navigateScreen(context, NavigationMenu());
    }
  }

  Widget _buildIndicator(int index, int currentIndex) {
    bool isActive = index == currentIndex;
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      height: 8.0,
      width: isActive ? 24.0 : 8.0,
      decoration: BoxDecoration(
        color: isActive ? CustomColors.primary : Colors.grey,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = ref.watch(currentIndexProvider);
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _pages.length,
              onPageChanged: (index) =>
                  ref.read(currentIndexProvider.notifier).state = index,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: screenWidth,
                      height: screenHeight * 0.70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(Sizes.xl),
                          bottomRight: Radius.circular(Sizes.xl),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadiusGeometry.only(
                          bottomLeft: Radius.circular(Sizes.xl),
                          bottomRight: Radius.circular(Sizes.xl),
                        ),
                        child: Image.asset(
                          _pages[index]['image']!,
                          height: screenHeight * 0.70,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: Sizes.spaceBtwItems),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: Sizes.sm),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _pages[index]['text']!,
                            style: Theme.of(context).textTheme.headlineSmall!
                                .copyWith(color: CustomColors.primary),
                            textAlign: TextAlign.center,
                          ),

                          const SizedBox(height: Sizes.sm),
                          SizedBox(
                            width: screenWidth * 0.80,
                            child: Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                              style: Theme.of(context).textTheme.labelLarge!
                                  .copyWith(fontWeight: FontWeight.bold),
                              softWrap: true,
                              maxLines: 3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: List.generate(
                    _pages.length,
                    (index) => _buildIndicator(index, currentIndex),
                  ),
                ),
                TextButton(
                  onPressed: _nextPage,
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(Sizes.xs),
                    backgroundColor: CustomColors.primary,
                  ),
                  child: Text(
                    currentIndex == _pages.length - 1 ? 'Finish' : 'Next',
                    style: Theme.of(
                      context,
                    ).textTheme.labelMedium!.copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
