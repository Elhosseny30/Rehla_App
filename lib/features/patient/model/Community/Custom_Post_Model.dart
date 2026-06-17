class PostModel {
  final int id;
  final String content;
  final String postType;
  final List<String> imageUrl; // 👈 الحقل الجديد للصور
  final String authorId;
  final String? authorName;
  final String? authorAvatarUrl;
  final String? authorRole; // 👈 دور المستخدم (دكتور أو مريض)
  final int reactionsCount; // 👈 اتغيرت للجمع في الـ GET
  final int commentsCount;
  final bool isLikedByCurrentUser;
  final String postVisibility;
  final List<String> mediaUrls;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final bool isEdited;
  final Map<String, dynamic> reactionCounts; // 👈 الماب الجديدة لتفاصيل الريأكتس

  PostModel({
    required this.id,
    required this.content,
    required this.postType,
    required this.imageUrl,
    required this.authorId,
    this.authorName,
    this.authorAvatarUrl,
    this.authorRole,
    required this.reactionsCount,
    required this.commentsCount,
    required this.isLikedByCurrentUser,
    required this.postVisibility,
    required this.mediaUrls,
    required this.createdAt,
    this.updatedAt,
    required this.isEdited,
    required this.reactionCounts,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'] ?? 0,
      content: json['content'] ?? '',
      postType: json['postType'] ?? json['type'] ?? 'Story',
      
      // هندلة مصفوفة الـ imageUrl الجديدة
      imageUrl: json['imageUrl'] != null 
          ? List<String>.from(json['imageUrl']) 
          : [],

      authorId: json['authorId'] ?? '',
      authorName: json['authorName'],
      authorAvatarUrl: json['authorAvatarUrl'],
      authorRole: json['authorRole'], // الحقل الجديد
      
      // بنشيك على المفرد والجمع عشان لو الباك إند لخبط في إندبوينت تانية
      reactionsCount: json['reactionsCount'] ?? json['reactionCount'] ?? 0,
      
      commentsCount: json['commentsCount'] ?? 0,
      isLikedByCurrentUser: json['isLikedByCurrentUser'] ?? false,
      postVisibility: json['postVisibility'] ?? 'Public',
      
      mediaUrls: json['mediaUrls'] != null 
          ? List<String>.from(json['mediaUrls']) 
          : [],
          
      createdAt: json['createdAt'] != null 
          ? DateTime.parse(json['createdAt']) 
          : DateTime.now(),
          
      updatedAt: (json['updatedAt'] != null && json['updatedAt'] != "0001-01-01T00:00:00") 
          ? DateTime.parse(json['updatedAt']) 
          : null,
          
      isEdited: json['isEdited'] ?? false,
      
      // هندلة الماب الجديدة
      reactionCounts: json['reactionCounts'] ?? {},
    );
  }
}