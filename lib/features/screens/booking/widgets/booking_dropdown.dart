import 'package:flutter/material.dart';

class BookingDropdown extends StatefulWidget {
  const BookingDropdown({super.key});

  @override
  State<BookingDropdown> createState() => _BookingDropdownState();
}

class _BookingDropdownState extends State<BookingDropdown> {
  String guestCount = "1";
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
                        value: guestCount,
                        items: ["1", "2", "3", "4"]
                            .map((e) => DropdownMenuItem(
                                value: e, child: Text("$e Guest(s)")))
                            .toList(),
                        onChanged: (val) => setState(() => guestCount = val!),
                      ),
                    ),
                  );
  }
}