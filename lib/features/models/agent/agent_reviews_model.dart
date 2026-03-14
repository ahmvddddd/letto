class AgentReviewsModel {
  final String id;
  final String agentId;
  final String reviewerId;
  final int rating;
  final String comment;

  const AgentReviewsModel({
    required this.id,
    required this.agentId,
    required this.reviewerId,
    required this.rating,
    required this.comment,
  });

  factory AgentReviewsModel.fromJson(Map<String, dynamic> json) {
    return AgentReviewsModel(
      id: json['id'] ?? '',
      agentId: json['agent_id'] ?? '',
      reviewerId: json['reviewer_id'] ?? '',
      rating: json['rating'] ?? 0,
      comment: json['comment'] ?? '',
    );
  }
}