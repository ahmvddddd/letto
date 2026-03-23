import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../features/models/listing/listing_cursor_model.dart';
import '../../features/models/listing/listing_response_model.dart';
class ListingsController {
  final String baseUrl;

  ListingsController({required this.baseUrl});

  Future<ListingsResponse> fetchListings({
    ListingCursorModel? cursor,
  }) async {
    final uri = Uri.parse('$baseUrl/listings').replace(
      queryParameters: {
        if (cursor?.id != null) 'cursor_id': cursor!.id!,
        if (cursor?.rentAmount != null)
          'cursor_rent': cursor!.rentAmount.toString(),
        if (cursor?.createdAt != null)
          'cursor_created_at': cursor!.createdAt!.toIso8601String(),
      },
    );

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return ListingsResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to fetch listings');
    }
  }
}