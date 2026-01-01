import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  final String label;
  final bool selected;
  const CategoryChip({super.key, required this.label, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? Colors.yellow : Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Text(
        label,
        style: TextStyle(color: selected ? Colors.black : Colors.grey[600]),
      ),
    );
  }
}
