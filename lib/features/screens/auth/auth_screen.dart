import 'package:flutter/material.dart';

import '../../../utils/constants/custom_colors.dart';
import '../../../utils/constants/custom_images.dart';
import '../../../utils/constants/custom_sizes.dart';
import '../../custom_widgets/buttons/custom_button.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(Sizes.spaceBtwItems),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.15),

              /// Logo
              Text(
                'Letto',
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: CustomColors.primary,
                ),
              ),

              const SizedBox(height: Sizes.spaceBtwSections),

              /// Text Block
              Column(
                children: [
                  Text(
                    'Welcome',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(height: Sizes.sm),
                  Text(
                    'Sign in to your account',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: CustomColors.alternate
                    ),
                  ),
                ],
              ),

              SizedBox(height: screenHeight * 0.10),

              /// OAuth Buttons
              CustomButton(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      CustomImages.google,
                      height: Sizes.iconM,
                      width: Sizes.iconM,
                    ),

                    const SizedBox(width: Sizes.sm),
                    Text(
                      'Continue with Google',
                      style: Theme.of(
                        context,
                      ).textTheme.labelMedium!.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: Sizes.spaceBtwItems),
              CustomButton(
                onTap: () {},
                showBorder: true,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      CustomImages.apple,
                      height: Sizes.iconM,
                      width: Sizes.iconM,
                    ),

                    const SizedBox(width: Sizes.sm),
                    Text(
                      'Continue with Apple',
                      style: Theme.of(
                        context,
                      ).textTheme.labelMedium!.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: Sizes.spaceBtwSections),
            ],
          ),
        ),
      ),
    );
  }
}
