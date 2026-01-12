class ProfilesModel {
  final String id;
  final String userId;
  final String fullName;
  final String phoneNumber;
  final String role;
  final bool isVerified;
  final List<String> areasOfOperation;
  final int trustScore;

  ProfilesModel({
    required this.id,
    required this.userId,
    required this.fullName,
    required this.phoneNumber,
    required this.role,
    required this.isVerified,
    required this.areasOfOperation,
    required this.trustScore,
  });

  factory ProfilesModel.fromJson(Map<String, dynamic> json) {
    return ProfilesModel(
      id: json['id'],
      userId: json['user_id'],
      fullName: json['full_name'],
      phoneNumber: json['phone_number'],
      role: json['role'],
      isVerified: json['is_verified'],
      areasOfOperation: json['areas_of_operation'],
      trustScore: json['trust_score'],
    );
  }
}
