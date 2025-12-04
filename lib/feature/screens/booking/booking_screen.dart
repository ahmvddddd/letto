import 'package:flutter/material.dart';

import '../../../utils/constants/custom_sizes.dart';
import 'widgets/booking_info.dart';

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
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

            Row(
              children: const [
                Icon(Icons.check_circle, color: Colors.green),
                SizedBox(width: 6),
                Expanded(
                  child: Text(
                    "We’ll call or text you to confirm your number. "
                    "Standard message and data rates apply.",
                    style: TextStyle(fontSize: 13),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Confirm Button
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade800,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "Confirm booking",
                  style: TextStyle(fontSize: 17, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


