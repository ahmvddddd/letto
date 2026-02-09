import 'package:flutter/material.dart';

class BookingMessage extends StatelessWidget {
  const BookingMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
                  );
  }
}