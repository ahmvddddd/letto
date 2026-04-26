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



// import 'package:flutter_riverpod/flutter_riverpod.dart';
// // Import your state and model files here

// final agentReviewsProvider = 
//     StateNotifierProvider<AgentReviewsController, AgentReviewsState>((ref) {
//   final service = ref.read(agentReviewsServiceProvider);
//   return AgentReviewsController(service);
// });

// class AgentReviewsController extends StateNotifier<AgentReviewsState> {
//   final AgentReviewsService _service;

//   AgentReviewsController(this._service) : super(const AgentReviewsState()) {
//     // Optionally fetch reviews on initialization
//     fetchReviews();
//   }

//   Future<void> fetchReviews() async {
//     // 1. Set loading state
//     state = state.copyWith(isLoading: true, error: null);

//     try {
//       // 2. Fetch data from service
//       final reviews = await _service.getReviews();
      
//       // 3. Update state with data
//       state = state.copyWith(
//         isLoading: false,
//         reviews: reviews,
//       );
//     } on DioException catch (e) {
//       // 4. Handle Dio-specific errors
//       state = state.copyWith(
//         isLoading: false,
//         error: e.message ?? "An unexpected network error occurred",
//       );
//     } catch (e) {
//       // 5. Handle generic errors
//       state = state.copyWith(
//         isLoading: false,
//         error: e.toString(),
//       );
//     }
//   }
// }