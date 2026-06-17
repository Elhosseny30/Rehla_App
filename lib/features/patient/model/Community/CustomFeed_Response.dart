import 'package:graduationproject/features/patient/model/Community/Custom_Post_Model.dart';

class FeedResponse {
  final List<PostModel> posts;
  final String? nextCursor;
  final int total;

  FeedResponse({
    required this.posts,
    this.nextCursor,
    required this.total,
  });

  factory FeedResponse.fromJson(Map<String, dynamic> json) {
    return FeedResponse(
      posts: json['posts'] != null
          ? List<PostModel>.from(json['posts'].map((x) => PostModel.fromJson(x)))
          : [],
      // بنحولها لـ String تحسباً لو الباك إند بعتها رقم أو نص
      nextCursor: json['nextCursor']?.toString(), 
      total: json['total'] ?? 0,
    );
  }
}