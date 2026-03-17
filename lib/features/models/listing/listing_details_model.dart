import 'listing_media_model.dart';

class ListingDetailsModel {
  final String id;
  final String? title;
  final String? description;
  final int rentAmount;
  final int? bedrooms;
  final int? bathrooms;

  final String? areaName;
  final String? state;
  final String? lga;
  final String? streetName;
  final String? landmark;
  final String? addressDescription;

  final double? latitude;
  final double? longitude;

  final String? housingType;
  final String? rentDuration;

  final int? trustScore;

  final DateTime? createdAt;

  final List<ListingMediaModel> media;

  ListingDetailsModel({
    required this.id,
    required this.rentAmount,
    this.title,
    this.description,
    this.bedrooms,
    this.bathrooms,
    this.areaName,
    this.state,
    this.lga,
    this.streetName,
    this.landmark,
    this.addressDescription,
    this.latitude,
    this.longitude,
    this.housingType,
    this.rentDuration,
    this.trustScore,
    this.createdAt,
    this.media = const [],
  });

  factory ListingDetailsModel.fromJson(Map<String, dynamic> json) {
    return ListingDetailsModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      rentAmount: json['rent_amount'] ?? 0,
      bedrooms: json['bedrooms'],
      bathrooms: json['bathrooms'],
      areaName: json['area_name'],
      state: json['state'],
      lga: json['lga'],
      streetName: json['street_name'],
      landmark: json['landmark'],
      addressDescription: json['address_description'],
      latitude: json['latitude'] != null
          ? (json['latitude'] as num).toDouble()
          : null,
      longitude: json['longitude'] != null
          ? (json['longitude'] as num).toDouble()
          : null,
      housingType: json['housing_type'],
      rentDuration: json['rent_duration'],
      trustScore: json['trust_score'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      media: (json['media'] as List<dynamic>? ?? [])
          .map((e) => ListingMediaModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'rent_amount': rentAmount,
      'bedrooms': bedrooms,
      'bathrooms': bathrooms,
      'area_name': areaName,
      'state': state,
      'lga': lga,
      'street_name': streetName,
      'landmark': landmark,
      'address_description': addressDescription,
      'latitude': latitude,
      'longitude': longitude,
      'housing_type': housingType,
      'rent_duration': rentDuration,
      'trust_score': trustScore,
      'created_at': createdAt?.toIso8601String(),
      'media': media.map((e) => e.toJson()).toList(),
    };
  }
}