class ProfileSavedModel {
  final String id;
  final String authorName; // اسم صاحب البوست اللي انت حفظته
  final String content; // محتوى البوست
  final String timeAgo; // وقت نشر البوست
  final int likes; // عدد اللايكات
  final int comments; // عدد الكومنتات

  ProfileSavedModel({
    required this.id,
    required this.authorName,
    required this.content,
    required this.timeAgo,
    required this.likes,
    required this.comments,
  });
}