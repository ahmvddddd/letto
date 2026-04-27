import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/models/agent/agent_profiles_model.dart';

// Provider for the Service
final agentServiceProvider = Provider((ref) => AgentService(Dio()));

class AgentService {
  final Dio _dio;
  AgentService(this._dio);

  Future<List<AgentProfilesModel>> fetchAgents() async {
    try {
      // Replace with your actual endpoint
      final response = await _dio.get('https://api.example.com/agents');
      
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => AgentProfilesModel.fromJson(json)).toList();
      }
      throw Exception('Failed to load agents');
    } catch (e) {
      rethrow;
    }
  }
}