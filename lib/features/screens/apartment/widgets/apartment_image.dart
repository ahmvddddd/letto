import 'package:flutter/material.dart';

class ApartmentImage extends StatelessWidget {
  final String imageUrl;
  const ApartmentImage({super.key,
  required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: AspectRatio(
          aspectRatio: 16 / 10,
          child: Image.asset(imageUrl, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
