import 'package:flutter/material.dart';
import 'package:letto/features/custom_widgets/buttons/custom_button.dart';
import '../../../../utils/constants/custom_colors.dart';
import '../../../../utils/constants/custom_sizes.dart';

class ProfileDetails extends StatelessWidget {
  final bool authenticated;
  final String profileImage;
  final String name;
  final String email;
  final String userType;
  const ProfileDetails({
    super.key,
    required this.authenticated,
    required this.profileImage,
    required this.name,
    required this.email,
    required this.userType,
    });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          child: Center(
            child: 
            (authenticated && profileImage.isNotEmpty)
            ? ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(profileImage,
              width: 100,
              height: 100,
              fit: BoxFit.cover,),
            )
            : Icon(Icons.person, color: Colors.grey, size: 50),
          ),
        ),

        const SizedBox(height: Sizes.xs),
        authenticated ?
        Column(
          children: [
            Text(name,
        style: Theme.of(context).textTheme.titleSmall,),
        Text(
          'johndoe@email.com',
          style: Theme.of(context).textTheme.labelMedium,
        ),

        const SizedBox(height: Sizes.sm),
        Text(userType,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: CustomColors.alternate
        ),)
          ],
        )
        : CustomButton(child: Text('Sign in'))
      ],
    );
  }
}
