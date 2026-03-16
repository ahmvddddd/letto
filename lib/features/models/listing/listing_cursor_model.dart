class ListingCursorModel {
  final String? id;
  final int? rentAmount;
  final DateTime? createdAt;

  ListingCursorModel({
    this.id,
    this.rentAmount,
    this.createdAt,
  });

  factory ListingCursorModel.fromJson(Map<String, dynamic> json) {
    return ListingCursorModel(
      id: json['id'],
      rentAmount: json['rent_amount'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'rent_amount': rentAmount,
      'created_at': createdAt?.toIso8601String(),
    };
  }
}