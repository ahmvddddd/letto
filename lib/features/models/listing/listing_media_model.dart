class ListingMediaModel {
  final String mediaType;
  final String mediaUrl;

  ListingMediaModel({
    required this.mediaType,
    required this.mediaUrl,
  });

  factory ListingMediaModel.fromJson(Map<String, dynamic> json) {
    return ListingMediaModel(
      mediaType: json['media_type'] ?? '',
      mediaUrl: json['media_url'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'media_type': mediaType,
      'media_url': mediaUrl,
    };
  }
}