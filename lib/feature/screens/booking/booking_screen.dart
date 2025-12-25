import 'package:flutter/material.dart';

import '../../../utils/constants/custom_sizes.dart';
import '../../custom_widgets/containers/custom_bottom_bar.dart';
import 'widgets/booking_info.dart';
import 'widgets/booking_message.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  

  String guestCount = "1";
  String paymentType = "Full payment";
  String selectedCard = "VISA •••• 7282";

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
                  
            
                  const SizedBox(height: 12),
            
                  // Guest Dropdown
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: guestCount,
                        items: ["1", "2", "3", "4"]
                            .map((e) => DropdownMenuItem(
                                value: e, child: Text("$e Guest(s)")))
                            .toList(),
                        onChanged: (val) => setState(() => guestCount = val!),
                      ),
                    ),
                  ),
            
                  const SizedBox(height: 24),
            
                  // ---- Payment Method ----
                  Text("Payment method",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
            
                  // Payment type dropdown
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: paymentType,
                        items: [
                          "Full payment",
                          "Pay later",
                        ]
                            .map((e) =>
                                DropdownMenuItem(value: e, child: Text(e)))
                            .toList(),
                        onChanged: (val) =>
                            setState(() => paymentType = val!),
                      ),
                    ),
                  ),
            
                  const SizedBox(height: 12),
            
                  // Card selection
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedCard,
                        items: [
                          "VISA •••• 7282",
                          "MasterCard •••• 5521"
                        ]
                            .map((e) =>
                                DropdownMenuItem(value: e, child: Text(e)))
                            .toList(),
                        onChanged: (val) =>
                            setState(() => selectedCard = val!),
                      ),
                    ),
                  ),
            
                  const SizedBox(height: 16),
            
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


