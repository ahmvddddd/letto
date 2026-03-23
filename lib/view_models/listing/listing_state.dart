import '../../features/models/listing/listing_cursor_model.dart';
import '../../features/models/listing/listing_model.dart';

class ListingsState {
  final List<ListingModel> listings;
  final bool isLoading;
  final bool isLoadingMore;
  final String? error;
  final ListingCursorModel? nextCursor;
  final bool hasMore;

  ListingsState({
    this.listings = const [],
    this.isLoading = false,
    this.isLoadingMore = false,
    this.error,
    this.nextCursor,
    this.hasMore = true,
  });

  ListingsState copyWith({
    List<ListingModel>? listings,
    bool? isLoading,
    bool? isLoadingMore,
    String? error,
    ListingCursorModel? nextCursor,
    bool? hasMore,
  }) {
    return ListingsState(
      listings: listings ?? this.listings,
      isLoading: isLoading ?? this.isLoading,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      error: error,
      nextCursor: nextCursor ?? this.nextCursor,
      hasMore: hasMore ?? this.hasMore,
    );
  }
}