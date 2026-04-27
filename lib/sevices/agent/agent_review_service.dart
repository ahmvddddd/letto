import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/models/agent/agent_reviews_model.dart';

// Provider for Dio instance
final dioProvider = Provider<Dio>((ref) {
  return Dio(BaseOptions(
    baseUrl: 'https://your-api-endpoint.com', // Replace with your URL
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 3),
  ));
});

// Service class for network calls
final agentReviewsServiceProvider = Provider<AgentReviewsService>((ref) {
  final dio = ref.read(dioProvider);
  return AgentReviewsService(dio);
});

class AgentReviewsService {
  final Dio _dio;
  AgentReviewsService(this._dio);

  Future<List<AgentReviewsModel>> getReviews() async {
    try {
      final response = await _dio.get('/agent-reviews'); // Your endpoint
      
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => AgentReviewsModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load reviews');
      }
    } catch (e) {
      rethrow;
    }
  }
}