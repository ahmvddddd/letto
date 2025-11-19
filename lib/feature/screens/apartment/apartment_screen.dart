import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import '../../../feature/custom_widgets/containers/custom_bottom_bar.dart';
import '../../../utils/helper/helper_functions.dart';
import '../../../utils/constants/custom_sizes.dart';
import 'widgets/apartment_details.dart';
import 'widgets/apartment_image.dart';
import 'widgets/apartment_info.dart';
import 'widgets/apartment_map.dart';

class ApartmentScreen extends StatefulWidget {
  const ApartmentScreen({super.key});

  @override
  State<ApartmentScreen> createState() => _ApartmentScreenState();
}

class _ApartmentScreenState extends State<ApartmentScreen> {
  LatLng currentLatLng = LatLng(9.0117, 7.5080);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Scaffold(
      backgroundColor: dark ? Colors.grey[400] : Colors.grey[200],
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back, size: Sizes.iconSm),
        ),
        title: Text(
          'Apartment Name',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        centerTitle: true,
        actions: [const Icon(Icons.favorite_border)],
      ),
      bottomNavigationBar: CustomBottomBar(
        child: Text(
          'Book',
          style: Theme.of(
            context,
          ).textTheme.labelMedium!.copyWith(color: Colors.white),
        ),
      ),

      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ApartmentImage(),

                    const SizedBox(height: Sizes.spaceBtwItems),

                    ApartmentDetails(),

                    const SizedBox(height: Sizes.spaceBtwItems),

                    ApartmentInfo(),

                    const SizedBox(height: Sizes.spaceBtwItems),
                    ApartmentMap(currentLatLng: currentLatLng),

                    const SizedBox(height: Sizes.spaceBtwItems),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 16),
                    //   child: SizedBox(
                    //     width: double.infinity,
                    //     child: ElevatedButton(
                    //       style: ElevatedButton.styleFrom(
                    //         backgroundColor: Colors.yellow[600],
                    //         foregroundColor: Colors.black,
                    //         padding: const EdgeInsets.symmetric(vertical: 16),
                    //         shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(50),
                    //         ),
                    //       ),
                    //       onPressed: () {},
                    //       child: const Text(
                    //         "Book Schedule",
                    //         style: TextStyle(fontSize: 16),
                    //       ),
                    //     ),
                    //   ),
                    // ),

                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
