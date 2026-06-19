
  class ProfileCommentModel {
  final String id;
  final String postAuthorName; // اسم صاحب البوست اللي اليوزر علق عليه
  final String commentContent; // الكومنت نفسه
  final String timeAgo;

  ProfileCommentModel({
    required this.id,
    required this.postAuthorName,
    required this.commentContent,
    required this.timeAgo,
  });
}
