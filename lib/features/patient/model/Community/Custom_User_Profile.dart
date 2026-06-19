class UserProfileModel {
  final String id;
  final String username;
  final String fullName;
  final String? profileImageUrl;
  final int followersCount;
  final int followingCount;

  UserProfileModel({
    required this.id,
    required this.username,
    required this.fullName,
    this.profileImageUrl,
    required this.followersCount,
    required this.followingCount,
  });


  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      id: json['id'] ?? '',
      username: json['username'] ?? '',
      fullName: json['full_name'] ?? '',
      profileImageUrl: json['profile_image_url'],
      followersCount: json['followers_count'] ?? 0,
      followingCount: json['following_count'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'full_name': fullName,
      'profile_image_url': profileImageUrl,
      'followers_count': followersCount,
      'following_count': followingCount,
    };
  }
}