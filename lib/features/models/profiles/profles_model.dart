class ProfilesModel {
  final String id;
  final String userId;
  final String fullName;
  final String phoneNumber;
  final String role;
  final bool isActive;

  ProfilesModel({
    required this.id,
    required this.userId,
    required this.fullName,
    required this.phoneNumber,
    required this.role,
    required this.isActive
  });

  factory ProfilesModel.fromJson(Map<String, dynamic> json) {
    return ProfilesModel(
      id: json['id'] ?? '',
      userId: json['user_id'] ?? '',
      fullName: json['full_name'] ?? '',
      phoneNumber: json['phone_number'] ?? '',
      role: json['role'] ?? '',
      isActive: json['is_verified'] ?? false
    );
  }
}
