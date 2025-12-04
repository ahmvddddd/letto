import 'package:flutter/material.dart';
import 'price_row.dart';

class BookingInfo extends StatelessWidget {
  const BookingInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Lasik Braga Villa",
            style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          const Text("330 East 5th Street, Long Beach, CA"),
          const SizedBox(height: 6),
          Row(
            children: const [
              Icon(Icons.star, color: Colors.amber, size: 18),
              SizedBox(width: 4),
              Text("4.4"),
            ],
          ),
          const SizedBox(height: 16),
    
          PriceRow(title: "Price", amount: "\$375.00"),
          PriceRow(title: "A-night", amount: "\$90.00"),
          PriceRow(title: "Tax", amount:"\$15.00"),
          const Divider(),
          PriceRow(title: "Total", amount: "\$375.00", bold: true),
        ],
      ),
    );
  }
}