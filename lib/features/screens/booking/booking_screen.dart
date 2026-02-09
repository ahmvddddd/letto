import 'package:flutter/material.dart';
import '../../../utils/constants/custom_sizes.dart';
import '../../../utils/helper/helper_functions.dart';
import '../../custom_widgets/containers/custom_appbar.dart';
import '../../custom_widgets/containers/custom_bottom_bar.dart';
import 'widgets/booking_details.dart';
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
    final dark = HelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          "Book now",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
        centerTitle: true,
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

                  // Order Details
                  Container(
                    padding: const EdgeInsets.all(Sizes.spaceBtwItems),
                    decoration: BoxDecoration(
                      color:
                          dark
                              ? Colors.white.withValues(alpha: 0.1)
                              : Colors.black.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(Sizes.sm),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BookingDetails(),

                        const SizedBox(height: Sizes.spaceBtwItems),

                        // Guest Dropdown
                        BookingDropdown(),
                      ],
                    ),
                  ),

                  const SizedBox(height: Sizes.spaceBtwSections),

                  //Payment Method
                  Container(
                    padding: const EdgeInsets.all(Sizes.spaceBtwItems),
                    decoration: BoxDecoration(
                      color:
                          dark
                              ? Colors.white.withValues(alpha: 0.1)
                              : Colors.black.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(Sizes.sm),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PaymentMethod(),

                        const SizedBox(height: Sizes.spaceBtwItems),

                        // Card selection
                        CardSelection(),

                        const SizedBox(height: Sizes.spaceBtwItems),

                        BookingMessage(),
                      ],
                    ),
                  ),

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
                  MaterialPageRoute(
                    builder: (context) => const BookingScreen(),
                  ),
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
