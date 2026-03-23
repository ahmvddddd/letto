import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../controllers/listing/listing_controller.dart';
import 'listing_state.dart';

class ListingsViewModel extends StateNotifier<ListingsState> {
  final ListingsController controller;

  ListingsViewModel(this.controller) : super(ListingsState());

  /// Initial fetch
  Future<void> fetchInitial() async {
    try {
      state = state.copyWith(isLoading: true, error: null);

      final response = await controller.fetchListings();

      state = state.copyWith(
        listings: response.data,
        nextCursor: response.nextCursor,
        hasMore: response.nextCursor != null,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  /// Pagination
  Future<void> fetchMore() async {
    if (state.isLoadingMore || !state.hasMore) return;

    try {
      state = state.copyWith(isLoadingMore: true);

      final response = await controller.fetchListings(
        cursor: state.nextCursor,
      );

      state = state.copyWith(
        listings: [...state.listings, ...response.data],
        nextCursor: response.nextCursor,
        hasMore: response.nextCursor != null,
        isLoadingMore: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoadingMore: false,
        error: e.toString(),
      );
    }
  }

  /// Pull-to-refresh
  Future<void> refresh() async {
    try {
      final response = await controller.fetchListings();

      state = state.copyWith(
        listings: response.data,
        nextCursor: response.nextCursor,
        hasMore: response.nextCursor != null,
        error: null,
      );
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }
}

final listingsControllerProvider = Provider<ListingsController>((ref) {
  return ListingsController(
    baseUrl: 'https://your-api.com',
  );
});

final listingsViewModelProvider =
    StateNotifierProvider<ListingsViewModel, ListingsState>((ref) {
  final controller = ref.watch(listingsControllerProvider);
  return ListingsViewModel(controller);
});


//example
class ListingsPage extends ConsumerWidget {
  const ListingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(listingsViewModelProvider);
    final notifier = ref.read(listingsViewModelProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Listings')),
      body: RefreshIndicator(
        onRefresh: notifier.refresh,
        child: ListView.builder(
          itemCount: state.listings.length + 1,
          itemBuilder: (context, index) {
            if (index < state.listings.length) {
              final listing = state.listings[index];

              return ListTile(
                title: Text('₦${listing.rentAmount}'),
                subtitle: Text(listing.areaName ?? ''),
              );
            } else {
              if (state.hasMore) {
                notifier.fetchMore();
                return const Center(child: CircularProgressIndicator());
              } else {
                return const SizedBox.shrink();
              }
            }
          },
        ),
      ),
    );
  }
}