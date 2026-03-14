class AgentProfilesModel {
  final String id;
  final String profileId;
  final String displayName;
  final bool verified;
  final int trustScore;
  final List<String> areasOfOperation;
  final String displayImage;

  AgentProfilesModel({
    required this.id,
    required this.profileId,
    required this.displayName,
    required this.verified,
    required this.trustScore,
    required this.areasOfOperation,
    required this.displayImage
  });

  factory AgentProfilesModel.fromJson(Map<String, dynamic> json) {
    return AgentProfilesModel(
      id: json['id'] ?? '',
      profileId: json['profile_id'] ?? '',
      displayName: json['display_name'] ?? '',
      verified: json['verified'] ?? '',
      trustScore: json['trust_score'] ?? '',
      areasOfOperation: json['areas_of_operation'] ?? '',
      displayImage:  json['display_image'] ?? '',
    );
  }
}
