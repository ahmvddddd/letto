import 'package:flutter/material.dart';
import '../../../utils/constants/custom_sizes.dart';
import '../../custom_widgets/containers/custom_appbar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text('Profile',
        style: Theme.of(context).textTheme.headlineSmall,),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Sizes.spaceBtwItems),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: Sizes.spaceBtwSections,),
          
              CircleAvatar(
                radius: 40,
                child: Center(
                  child: Icon(Icons.person, color: Colors.grey, size: 50,),
                ),
              ),

              const SizedBox(height: Sizes.xs,),
              Text('johndoe@email.com',
              style: Theme.of(context).textTheme.labelMedium,),
          
              const SizedBox(height: Sizes.spaceBtwItems,),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('History',
                style: Theme.of(context).textTheme.bodySmall,),
              )
            ],
          ),
        ),
      ),
    );
  }
}