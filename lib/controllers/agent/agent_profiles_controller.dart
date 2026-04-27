// import 'package:flutter/material.dart';

// import '../../features/models/agent/agent_profiles_model.dart';
// import '../../view_models/agent/agent_profile_state.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class AgentProfilesController extends Notifier<AgentProfilesState> {

//   @override
//   AgentProfilesState build() {
//     return AgentProfilesState();
//   }

//   /// Fetch agents (replace with API call)
//   Future<void> fetchAgents() async {
//     state = state.copyWith(isLoading: true, error: null);

//     try {
//       // Simulated API delay
//       await Future.delayed(const Duration(seconds: 2));

//       // Mock JSON response
//       final response = [
//         {
//           "id": "1",
//           "profile_id": "p1",
//           "display_name": "John Doe",
//           "verified": true,
//           "trust_score": 85,
//           "areas_of_operation": ["Lagos", "Abuja"],
//           "display_image": "https://example.com/image.jpg"
//         }
//       ];

//       final agents = response
//           .map((json) => AgentProfilesModel.fromJson(json))
//           .toList();

//       state = state.copyWith(
//         isLoading: false,
//         agents: agents,
//       );
//     } catch (e) {
//       state = state.copyWith(
//         isLoading: false,
//         error: e.toString(),
//       );
//     }
//   }

//   /// Example: Add new agent
//   void addAgent(AgentProfilesModel agent) {
//     state = state.copyWith(
//       agents: [...state.agents, agent],
//     );
//   }

//   /// Example: Clear agents
//   void clearAgents() {
//     state = state.copyWith(agents: []);
//   }
// }

// final agentProfilesProvider =
//     NotifierProvider<AgentProfilesController, AgentProfilesState>(
//   AgentProfilesController.new,
// );

// // example
// class AgentsScreen extends ConsumerWidget {
//   const AgentsScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final state = ref.watch(agentProfilesProvider);
//     final controller = ref.read(agentProfilesProvider.notifier);

//     return Scaffold(
//       appBar: AppBar(title: const Text("Agents")),
//       body: Builder(
//         builder: (_) {
//           if (state.isLoading) {
//             return const Center(child: CircularProgressIndicator());
//           }

//           if (state.error != null) {
//             return Center(child: Text(state.error!));
//           }

//           return ListView.builder(
//             itemCount: state.agents.length,
//             itemBuilder: (_, index) {
//               final agent = state.agents[index];
//               return ListTile(
//                 title: Text(agent.displayName),
//                 subtitle: Text(agent.areasOfOperation.join(", ")),
//                 trailing: agent.verified
//                     ? const Icon(Icons.verified, color: Colors.green)
//                     : null,
//               );
//             },
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: controller.fetchAgents,
//         child: const Icon(Icons.refresh),
//       ),
//     );
//   }
// }

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../sevices/agent/agent_profile_service.dart';
import '../../view_models/agent/agent_profile_state.dart';

// The StateNotifierProvider that the UI will listen to
final agentProfilesProvider = 
    StateNotifierProvider<AgentProfilesController, AgentProfilesState>((ref) {
  final service = ref.watch(agentServiceProvider);
  return AgentProfilesController(service);
});

class AgentProfilesController extends StateNotifier<AgentProfilesState> {
  final AgentService _service;

  AgentProfilesController(this._service) : super(AgentProfilesState()) {
    // Automatically fetch agents when the controller is initialized
    getAgents();
  }

  Future<void> getAgents() async {
    // Set loading state and clear previous errors
    state = state.copyWith(isLoading: true, error: null);

    try {
      final agents = await _service.fetchAgents();
      
      // Update state with the fetched list
      state = state.copyWith(
        isLoading: false, 
        agents: agents
      );
    } on DioException catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.response?.data['message'] ?? e.message,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }
}

//Example
// class AgentListScreen extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final state = ref.watch(agentProfilesProvider);

//     if (state.isLoading) return CircularProgressIndicator();
//     if (state.error != null) return Text('Error: ${state.error}');

//     return ListView.builder(
//       itemCount: state.agents.length,
//       itemBuilder: (context, index) {
//         final agent = state.agents[index];
//         return ListTile(
//           leading: CircleAvatar(backgroundImage: NetworkImage(agent.displayImage)),
//           title: Text(agent.displayName),
//           subtitle: Text(agent.areasOfOperation.join(', ')),
//           trailing: agent.verified ? Icon(Icons.verified, color: Colors.blue) : null,
//         );
//       },
//     );
//   }
// }