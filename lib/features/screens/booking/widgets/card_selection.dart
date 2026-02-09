import 'package:flutter/material.dart';

class CardSelection extends StatefulWidget {
  const CardSelection({super.key});

  @override
  State<CardSelection> createState() => _CardSelectionState();
}

class _CardSelectionState extends State<CardSelection> {String paymentType = "Full payment";
  String selectedCard = "VISA •••• 7282";
  @override
  Widget build(BuildContext context) {
    return Container(
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
                  );
  }
}