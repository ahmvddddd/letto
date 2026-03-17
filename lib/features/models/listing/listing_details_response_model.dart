import 'listing_details_model.dart';

class ListingDetailsResponse {
  final bool success;
  final ListingDetailsModel? data;

  ListingDetailsResponse({
    required this.success,
    this.data,
  });

  factory ListingDetailsResponse.fromJson(Map<String, dynamic> json) {
    return ListingDetailsResponse(
      success: json['success'] ?? false,
      data: json['data'] != null
          ? ListingDetailsModel.fromJson(json['data'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'data': data?.toJson(),
    };
  }
}