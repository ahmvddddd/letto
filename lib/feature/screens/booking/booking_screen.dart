import 'package:flutter/material.dart';
import '../../../utils/constants/custom_sizes.dart';
import '../../custom_widgets/containers/custom_bottom_bar.dart';
import 'widgets/booking_dropdown.dart';
import 'widgets/booking_info.dart';
import 'widgets/booking_message.dart';
import 'widgets/card_selection.dart';
import 'widgets/payment_method.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text("Book now"),
        elevation: 0,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(Sizes.spaceBtwItems),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
            
                  // ---- Hotel Info ----
                  BookingInfo(),
            
                  const SizedBox(height: Sizes.spaceBtwSections),
            
                  // ---- Order Details ----
                  
            
                  const SizedBox(height: Sizes.spaceBtwItems),
            
                  // Guest Dropdown
                  BookingDropdown(),
            
                  const SizedBox(height: Sizes.spaceBtwSections),
            
                  // ---- Payment Method ----
                  PaymentMethod(),
            
                  const SizedBox(height: Sizes.spaceBtwItems),
            
                  // Card selection
                  CardSelection(),
            
                  const SizedBox(height: Sizes.spaceBtwItems),
            
                  BookingMessage(),
            
                  const SizedBox(height: Sizes.spaceBtwSections * 4),
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
                'Confirm Booking',
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


