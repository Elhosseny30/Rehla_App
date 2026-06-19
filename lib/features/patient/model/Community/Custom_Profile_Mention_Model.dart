class ProfileMentionModel {
  final String id;
  final String authorName; // اللي عملك منشن
  final String? authorAvatarUrl; // صورته لو موجودة
  final String content; // الكلام اللي اتكتب وفيه المنشن
  final String timeAgo;
  final bool isNew; // عشان لو حابب تميز المنشنات الجديدة بلون مختلف

  ProfileMentionModel({
    required this.id,
    required this.authorName,
    this.authorAvatarUrl,
    required this.content,
    required this.timeAgo,
    this.isNew = false,
  });
}