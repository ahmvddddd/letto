import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:letto/feature/models/house/house_model.dart';
import '../../../feature/custom_widgets/containers/custom_bottom_bar.dart';
import '../../../utils/helper/helper_functions.dart';
import '../../../utils/constants/custom_sizes.dart';
import 'widgets/apartment_details.dart';
import 'widgets/apartment_image.dart';
import 'widgets/apartment_info.dart';
import 'widgets/apartment_map.dart';

class ApartmentScreen extends StatefulWidget {
  final HouseModel house;
  const ApartmentScreen({super.key, required this.house});

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
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child:  Icon(Icons.arrow_back, color: dark ? Colors.white : Colors.black),
        ),
        title: Text(
          'Apartment Name',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        centerTitle: true,
        actions: [const Icon(Icons.favorite_border), const SizedBox(width: 16)],
      ),
      bottomNavigationBar: CustomBottomBar(
        child: Text(
          'Book',
          style: Theme.of(
            context,
          ).textTheme.bodySmall!.copyWith(color: Colors.white),
        ),
      ),

      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ApartmentImage(
                      imageUrl: widget.house.imageUrl,
                    ),

                    const SizedBox(height: Sizes.spaceBtwItems),

                    ApartmentDetails(
                      address: widget.house.address,
                      price: widget.house.price,
                      beds: widget.house.beds,
                      baths: widget.house.baths,
                      area: widget.house.area,
                    ),

                    const SizedBox(height: Sizes.spaceBtwItems),

                    ApartmentInfo(),

                    const SizedBox(height: Sizes.spaceBtwItems),
                    ApartmentMap(currentLatLng: currentLatLng),

                    const SizedBox(height: Sizes.spaceBtwItems),
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
