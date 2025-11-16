import 'package:flutter/material.dart';
import '../../../../utils/constants/images.dart';

class ApartmentImage extends StatelessWidget {
  const ApartmentImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: AspectRatio(
          aspectRatio: 16 / 10,
          child: Image.asset(Images.duplex, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
