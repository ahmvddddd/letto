import '../../models/listing/listing_cursor_model.dart';
import '../../models/listing/listing_model.dart';

class ListingsResponse {
  final bool success;
  final List<ListingModel> data;
  final ListingCursorModel? nextCursor;

  ListingsResponse({
    required this.success,
    required this.data,
    this.nextCursor,
  });

  factory ListingsResponse.fromJson(Map<String, dynamic> json) {
    return ListingsResponse(
      success: json['success'] ?? false,
      data: (json['data'] as List<dynamic>? ?? [])
          .map((e) => ListingModel.fromJson(e))
          .toList(),
      nextCursor: json['nextCursor'] != null
          ? ListingCursorModel.fromJson(json['nextCursor'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'data': data.map((e) => e.toJson()).toList(),
      'nextCursor': nextCursor?.toJson(),
    };
  }
}