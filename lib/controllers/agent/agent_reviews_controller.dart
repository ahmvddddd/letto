import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/models/agent/agent_reviews_model.dart';
import '../../view_models/agent/agent_reviews_state.dart';

final agentReviewsProvider =
    StateNotifierProvider<AgentReviewsController, AgentReviewsState>(
  (ref) => AgentReviewsController(),
);

class AgentReviewsController extends StateNotifier<AgentReviewsState> {
  AgentReviewsController() : super(const AgentReviewsState());

  /// Fetch reviews (mock example)
  Future<void> fetchReviews() async {
    try {
      state = state.copyWith(isLoading: true, error: null);

      await Future.delayed(const Duration(seconds: 1));

      // Replace with real API call
      final response = [
        {
          "id": "1",
          "agent_id": "A1",
          "reviewer_id": "U1",
          "rating": 5,
          "comment": "Great agent!"
        },
        {
          "id": "2",
          "agent_id": "A1",
          "reviewer_id": "U2",
          "rating": 4,
          "comment": "Good service"
        }
      ];

      final reviews = response
          .map((e) => AgentReviewsModel.fromJson(e))
          .toList();

      state = state.copyWith(
        isLoading: false,
        reviews: reviews,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  /// Add a review
  void addReview(AgentReviewsModel review) {
    state = state.copyWith(
      reviews: [...state.reviews, review],
    );
  }

  /// Remove a review
  void removeReview(String id) {
    state = state.copyWith(
      reviews: state.reviews.where((r) => r.id != id).toList(),
    );
  }

  /// Clear error
  void clearError() {
    state = state.copyWith(error: null);
  }
}