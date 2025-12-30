import 'package:flutter/material.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  String paymentType = "Full payment";
  String selectedCard = "VISA •••• 7282";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Payment method",
                      style: Theme.of(context).textTheme.bodyMedium),
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
      ],
    );
  }
}