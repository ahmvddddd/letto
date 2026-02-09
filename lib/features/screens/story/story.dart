import 'package:flutter/material.dart';
import '../../../utils/constants/custom_sizes.dart';
import '../../../utils/helper/helper_functions.dart';
import '../../custom_widgets/containers/custom_container.dart';
import 'widgets/story_view.dart';

class StoryScreen extends StatelessWidget {
  const StoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Stories',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 48, 30, 30),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.spaceBtwItems),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const StoryView(),
          
              SizedBox(height: Sizes.spaceBtwItems),
              CustomContainer(
                backgroundColor:
                    dark
                        ? Colors.white.withValues(alpha: 0.1)
                        : Colors.black.withValues(alpha: 0.1),
                padding: Sizes.md,
                radius: Sizes.cardRadiusLg, 
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Bookings:',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text('5',
                    style: Theme.of(context).textTheme.labelMedium,)
                  ],
                ),     
              ),
            ],
          ),
        ),
      ),
    );
  }
}
