class ListingModel {
  final String id;
  final int rentAmount;
  final int? bedrooms;
  final int? bathrooms;
  final String? areaName;
  final String? state;
  final DateTime? createdAt;
  final String? coverImage;

  ListingModel({
    required this.id,
    required this.rentAmount,
    this.bedrooms,
    this.bathrooms,
    this.areaName,
    this.state,
    this.createdAt,
    this.coverImage,
  });

  factory ListingModel.fromJson(Map<String, dynamic> json) {
    return ListingModel(
      id: json['id'],
      rentAmount: json['rent_amount'] ?? 0,
      bedrooms: json['bedrooms'],
      bathrooms: json['bathrooms'],
      areaName: json['area_name'],
      state: json['state'],
      coverImage: json['cover_image'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'rent_amount': rentAmount,
      'bedrooms': bedrooms,
      'bathrooms': bathrooms,
      'area_name': areaName,
      'state': state,
      'cover_image': coverImage,
      'created_at': createdAt?.toIso8601String(),
    };
  }
}