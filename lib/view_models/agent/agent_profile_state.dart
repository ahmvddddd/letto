import '../../features/models/agent/agent_profiles_model.dart';

class AgentProfilesState {
  final bool isLoading;
  final List<AgentProfilesModel> agents;
  final String? error;

  AgentProfilesState({
    this.isLoading = false,
    this.agents = const [],
    this.error,
  });

  AgentProfilesState copyWith({
    bool? isLoading,
    List<AgentProfilesModel>? agents,
    String? error,
  }) {
    return AgentProfilesState(
      isLoading: isLoading ?? this.isLoading,
      agents: agents ?? this.agents,
      error: error,
    );
  }
}