import 'package:flutter/material.dart';

import '../../../utils/constants/custom_colors.dart';
import '../../../utils/constants/custom_sizes.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(Sizes.spaceBtwItems),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.15),
              Text('Letto',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: CustomColors.primary,)),

              
              SizedBox(height: screenHeight * 0.30),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(Sizes.spaceBtwItems),
                    decoration: BoxDecoration(
                      color: CustomColors.primary,
                      borderRadius: BorderRadius.circular(Sizes.sm),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.android, size: Sizes.iconSm,),
                        const SizedBox(width: Sizes.sm,),
                        Text('Sign In with Google',
                        style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Colors.white),)
                      ],
                    ),
                  ),

                  const SizedBox(height: Sizes.sm,),
                  Container(
                    padding: const EdgeInsets.all(Sizes.spaceBtwItems),
                    decoration: BoxDecoration(
                      color: CustomColors.primary,
                      borderRadius: BorderRadius.circular(Sizes.sm),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.android, size: Sizes.iconSm,),
                        const SizedBox(width: Sizes.sm,),
                        Text('Sign In with Apple',
                        style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Colors.white),)
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        )),
    );
  }
}