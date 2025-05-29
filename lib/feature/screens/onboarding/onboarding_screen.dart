import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/constants/custom_colors.dart';
import '../../../utils/constants/images.dart';

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
      'image': Images.onboarding1,
      'text': 'Find beautiful apartments near you'
    },
    {
      'image': Images.onboarding2,
      'text': 'Rent fully furnished homes hassle-free'
    },
    {
      'image': Images.onboarding3,
      'text': 'Secure and affordable rentals anytime'
    },
  ];

  void _nextPage() {
    final currentIndex = ref.read(currentIndexProvider);
    if (currentIndex < _pages.length - 1) {
      _pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
      ref.read(currentIndexProvider.notifier).state++;
    } else {
      // Done - go to home or login screen
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Onboarding Complete!')));
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

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pages.length,
                onPageChanged: (index) => ref.read(currentIndexProvider.notifier).state = index,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(_pages[index]['image']!, height: 300, fit: BoxFit.cover),
                      SizedBox(height: 24),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Text(
                          _pages[index]['text']!,
                          style: Theme.of(context).textTheme.bodySmall,
                          textAlign: TextAlign.center,
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
                    child: Text(currentIndex == _pages.length - 1 ? 'Finish' : 'Next',
                    style: Theme.of(context).textTheme.labelMedium,),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
