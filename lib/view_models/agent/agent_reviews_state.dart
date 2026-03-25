import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controllers/agent/agent_reviews_controller.dart';
import '../../features/models/agent/agent_reviews_model.dart';

class AgentReviewsState {
  final bool isLoading;
  final List<AgentReviewsModel> reviews;
  final String? error;

  const AgentReviewsState({
    this.isLoading = false,
    this.reviews = const [],
    this.error,
  });

  AgentReviewsState copyWith({
    bool? isLoading,
    List<AgentReviewsModel>? reviews,
    String? error,
  }) {
    return AgentReviewsState(
      isLoading: isLoading ?? this.isLoading,
      reviews: reviews ?? this.reviews,
      error: error,
    );
  }
}

//example
class ReviewsScreen extends ConsumerWidget {
  const ReviewsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(agentReviewsProvider);
    final controller = ref.read(agentReviewsProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Agent Reviews')),
      body: Builder(
        builder: (_) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.error != null) {
            return Center(child: Text(state.error!));
          }

          return ListView.builder(
            itemCount: state.reviews.length,
            itemBuilder: (_, index) {
              final review = state.reviews[index];
              return ListTile(
                title: Text(review.comment),
                subtitle: Text("Rating: ${review.rating}"),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.fetchReviews,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}