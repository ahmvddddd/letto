import 'package:flutter/material.dart';

class ViewedListingRepository {
  final String id;
  final String coverImage;
  final String title;
  final String description;
  final String address;
  final double amount;
  final int duration;

  const ViewedListingRepository({
    required this.id,
    required this.coverImage,
    required this.title,
    required this.description,
    required this.address,
    required this.amount,
    required this.duration,
  });
}

