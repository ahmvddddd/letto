import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:letto/feature/models/house/house_model.dart';
import '../../../feature/custom_widgets/containers/custom_bottom_bar.dart';
import '../../../utils/constants/custom_sizes.dart';
import '../../custom_widgets/containers/custom_appbar.dart';
import '../booking/booking_screen.dart';
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
    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text(
          'Apartment Name',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        centerTitle: true,
        actions: [const Icon(Icons.favorite_border), const SizedBox(width: 16)],
      ),

      body: Stack(
        children: [
          Positioned.fill(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ApartmentImage(imageUrl: widget.house.imageUrl),

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
                  
                  const SizedBox(height: Sizes.spaceBtwSections * 4)
                ],
              ),
            ),
          ),

          Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: CustomBottomBar(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BookingScreen()),
                );
              },
              child: Text(
                'Book',
                style: Theme.of(
                  context,
                ).textTheme.bodySmall!.copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
